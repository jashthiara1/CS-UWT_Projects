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
        <p class="lead text-center">Search for properties near your university.</p>
    <hr class="my-4">
    <div class="form-inline justify-content-center">
        <form method="GET" action="properties.php" class="form-inline">
            <div class="form-group">
            <label for="university" class="mr-2">Enter University Name:</label>
            <input type="text" name="university" id="university" class="form-control mr-2">
            <input type="submit" value="Submit" class="btn btn-primary">
            </div>
        </form>
        </div>  
        <?php 
        if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["university"])) { 
            $connection = mysqli_connect(
                DBHOST,
                DBUSER,
                DBPASS,
                DBNAME
            );
            if (mysqli_connect_errno()) {
                die(mysqli_connect_error());
            }

            $university = mysqli_real_escape_string($connection, $_GET["university"]);
        ?>
            <p>&nbsp;</p>
            <table class="table table-hover">
                <thead>
                    <tr class="table-success">
                        <th scope="col">Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">Square Feet</th>
                    </tr>
                </thead>
                <?php
                $query = "SELECT P.P_Name AS Name, Locations.L_Address AS Address, P.P_SqFeet AS SquareFeet
                          FROM Properties P
                          JOIN Distance D ON P.P_ID = D.P_ID
                          JOIN Universities U ON D.U_ID = U.UN_UniversityID
                          JOIN Locations ON L_ID = P_AddressID
                          WHERE U.UN_Name LIKE '%{$university}%'";

                if ($result = mysqli_query($connection, $query)) {
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo $row["Name"]; ?></td>
                            <td><?php echo $row["Address"]; ?></td>
                            <td><?php echo $row["SquareFeet"]; ?></td>
                        </tr>
                    <?php }
                    // release the memory used by the result set
                    mysqli_free_result($result);
                }
                mysqli_close($connection); // Close the connection
                ?>
            </table>
        <?php } // end if (isset) ?>
    </div>
</body>
</html>
