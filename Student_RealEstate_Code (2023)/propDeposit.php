<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Assignment 4 Demo</title>
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
                width: 100%;
            }

            .nav-link {
                color: #ffffff;
                transition: color 0.3s ease;
                font-size: 1.1rem;
                display: flex;
                align-items: center;
            }

            .nav-link img {
                width: auto;
                height: 64px;
                margin-right: 0.5rem;
            }

            table.table-hover thead tr.table-success th {
                background-color: #8f65cd;
            }

            .jumbotron {
                margin-top: 150px; /* Increase this value to push the content down */
                padding-top: 2rem; /* Add additional padding at the top */
                padding-bottom: 2rem; /* Padding at the bottom for spacing */
            }

            .centered-form {
                display: flex;
                justify-content: center;
                padding: 1rem;
            }

            /* Add this style to vertically center items in the form */
            .form-inline {
                align-items: center;
            }

            /* This will center the text in the jumbotron */
            .lead {
                text-align: center;
                margin-bottom: 1rem; /* Space below the heading */
            }

        </style>
    </head>
    <body>
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

        <div class="jumbotron">
            <h1 class="lead">Search for properties by deposit amount</h1>
            <div class="centered-form">
                <form method="GET" action="propDeposit.php" class="form-inline">
                    <select name="deposit" id="deposit" class="form-control mx-2">
                    <option value="">Select Deposit</option>
                    <?php
                    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
                    if (mysqli_connect_errno()) {
                        die(mysqli_connect_error());
                    }
                    $sql = "SELECT DISTINCT L_Deposit FROM Leases ORDER BY L_Deposit DESC";
                    if ($result = mysqli_query($connection, $sql)) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<option value=\"" . $row['L_Deposit'] . "\">" . $row['L_Deposit'] . "</option>";
                        }
                        mysqli_free_result($result);
                    }
                    ?>
                </select>
                    <input type="submit" value="Filter" class="btn btn-primary">
            </form>
            </div>
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['deposit'])) {
                $selectedDeposit = mysqli_real_escape_string($connection, $_GET['deposit']);
                $sql = "SELECT P_Name, Locations.L_City, L_Deposit
                        FROM Properties
                        JOIN Leases ON Properties.P_ID = Leases.L_PropertyID
                        JOIN Locations ON Properties.P_AddressID = Locations.L_ID
                        WHERE Leases.L_Deposit = $selectedDeposit
                        ORDER BY Leases.L_Deposit DESC";

                if ($result = mysqli_query($connection, $sql)) {

                    echo '<table class="table table-hover">
                            <thead>
                                <tr class="table-success">
                                    <th scope="col">Property Name</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Deposit</th>
                                </tr>
                            </thead>';
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<tr>
                                <td>' . htmlspecialchars($row['P_Name']) . '</td>
                                <td>' . htmlspecialchars($row['L_City']) . '</td>
                                <td>' . htmlspecialchars($row['L_Deposit']) . '</td>
                              </tr>';
                    }
                    echo '</table>';
                    mysqli_free_result($result);
                }
            }
            ?>
        </div>
    </body>
</html>
