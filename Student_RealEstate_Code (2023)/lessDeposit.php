<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cribs for Students</title>
        <!-- Add a reference to the external stylesheet -->
        <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css">
        <style>
            header {
                width: 100%;
                position: fixed;
                top: 0;
                z-index: 1000;
                background-color: rgba(255, 255, 255, 0.95);
            }

            .navbar {
                background-color: transparent;

            }

            .navbar-nav {
                display: flex;
                justify-content: space-around;
                width: 100%; /* Full width */
            }

            .nav-link {
                color: #ffffff;
                transition: color 0.3s ease;
                font-size: 1.1rem; /* Slightly larger font size */
                display: flex; /* Align items in a row */
                align-items: center; /* Vertical alignment */
            }

            .nav-link img {
                width: auto; /* Maintain aspect ratio */
                height: 64px; /* Match your logo height here */
                margin-right: 0.5rem; /* Spacing between logo and text */
            }
            table.table-hover thead tr.table-success th {
                background-color: #8f65cd; /* Light purple color */
            }


            .jumbotron {
                margin-top: 150px; /* Adjust this value if necessary */
                padding-top: 2rem;
                padding-bottom: 2rem;
            }
            .form-inline {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 1rem;
            }
            .form-inline label[type=submit] {
                margin: 0 5px;
            }

        </style>
    </head>
    <body>
        <!-- START -- Add HTML code for the top menu section (navigation bar) -->
        <header>
            <nav class="navbar navbar-expand-lg bg-primary">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="index.php">
                        <img src="Logo.png" alt="Logo" class="d-inline-block align-text-top">
                    </a>
                    <a class="nav-item nav-link" href="properties.php">Search by University</a>
                    <a class="nav-item nav-link" href="amenities.php">Filter by Amenities</a>
                    <a class="nav-item nav-link" href="propDeposit.php">Properties with Lease Deposit Prices</a>
                    <a class="nav-item nav-link" href="lessDeposit.php">Below Average Lease Deposit by City</a>
                    <a class="nav-item nav-link" href="aboutus.php">About Us</a>
                </div>
            </nav>
        </header>
        <!-- END -- Add HTML code for the top menu section (navigation bar) -->

        <div class="jumbotron">
            <p class="lead text-center">Search for properties with deposits less than the average lease deposit in a city.</p>
        <hr class="my-4">
            <form method="GET" action="lessDeposit.php" class="form-inline justify-content-center">
            <select name="city" id="city" class="form-control mx-2">
                <option value="">Select City</option>
                <?php
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
                if (mysqli_connect_errno()) {
                    die(mysqli_connect_error());
                }
                // Modified query to only show cities with a property
                $sql = "SELECT DISTINCT Locations.L_City FROM Properties
                        JOIN Locations ON Locations.L_ID = Properties.P_AddressID
                        WHERE EXISTS (
                         SELECT 1 FROM Leases WHERE Leases.L_PropertyID = Properties.P_ID
                             )";
                if ($result = mysqli_query($connection, $sql)) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<option value=\"" . $row['L_City'] . "\">" . $row['L_City'] . "</option>";
                    }
                    mysqli_free_result($result);
                }
                ?>
            </select>
            <input type="submit" value="Search" class="btn btn-primary">
        </form>
            <?php 
            if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["city"])) {
                $selectedCity = mysqli_real_escape_string($connection, $_GET["city"]);
                $query = "
                SELECT Locations.L_Address, Locations.L_City, Locations.L_State, Locations.L_ZipCode, Leases.L_Deposit 
                FROM Properties p1 
                JOIN Leases ON p1.P_ID = Leases.L_PropertyID 
                JOIN Locations ON Locations.L_ID = p1.P_AddressID
                WHERE Leases.L_Deposit < ( 
                    SELECT AVG(l2.L_Deposit) FROM Leases l2 
                ) AND Locations.L_City = '{$selectedCity}'
            ";
                if ($result = mysqli_query($connection, $query)) {
                    echo '<table class="table table-hover">
                        <thead>
                            <tr class="table-success">
                                <th scope="col">Address</th>
                                <th scope="col">City</th>
                                <th scope="col">State</th>
                                <th scope="col">Zip Code</th>
                                <th scope="col">Deposit</th> <!-- Added Deposit column -->
                            </tr>
                        </thead>
                        <tbody>';
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<tr>
                            <td>' . htmlspecialchars($row['L_Address']) . '</td>
                            <td>' . htmlspecialchars($row['L_City']) . '</td>
                            <td>' . htmlspecialchars($row['L_State']) . '</td>
                            <td>' . htmlspecialchars($row['L_ZipCode']) . '</td>
                            <td>' . htmlspecialchars($row['L_Deposit']) . '</td> <!-- Display Deposit -->
                          </tr>';
                    }
                    echo '</tbody></table>';
                    mysqli_free_result($result);
                }
                mysqli_close($connection);
            }
            ?>
        </div>
    </body>
</html>