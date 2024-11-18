<?php
require_once('config.php');

if ($_SERVER["REQUEST_METHOD"] == "GET" && !empty($_GET['amenities'])) {
    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
    if (mysqli_connect_errno()) {
        die(mysqli_connect_error());
    }

    $amenities = $_GET['amenities'];
    $amenityConditions = array();
    foreach ($amenities as $amenity) {
        $amenityConditions[] = "{$amenity} = 1";
    }

    $conditions = implode(' AND ', $amenityConditions);

    $sql = "SELECT P_Name, L_Address, L_City, L_State, L_ZipCode, L_Deposit
            FROM Properties
            JOIN Leases ON L_PropertyID = P_ID
            JOIN Amenities ON A_PropertyID = P_ID
            JOIN Locations ON L_ID = P_AddressID
            WHERE $conditions;";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cribs for Students</title>
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

        .table.table-hover thead tr.table-success th {
            background-color: #ab8bda; /* Light purple color */
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

<!-- Code populates top menu with our queries and links to php files-->
<header class="header">
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

<!-- code populates page with options of amentities for the user to choose from -->
<div class="jumbotron">
    <p class="lead text-center">Find properties with the amenities you would prefer</p>
    <hr class="my-4">
    <div class="form-inline justify-content-center ">
        <form method="GET" action="amenities.php">
            <!-- Checkboxes for amenities -->
            <div class="form-group">
                <input class="form-check-input" type="checkbox" name="amenities[]" value="A_WasherDryer" id="washerdryer">
                <label class="form-check-label" for="washerdryer">Washer/Dryer</label>
            </div>

            <div class="form-group">
                <input class="form-check-input" type="checkbox" name="amenities[]" value="A_Pool" id="pool">
                <label class="form-check-label" for="pool">Pool</label>
            </div>

            <div class="form-group">
                <input class="form-check-input" type="checkbox" name="amenities[]" value="A_Parking" id="parking">
                <label class="form-check-label" for="parking">Parking</label>
            </div>

            <div class="form-group">
                <input class="form-check-input" type="checkbox" name="amenities[]" value="A_Balcony" id="balcony">
                <label class="form-check-label" for="balcony">Balcony</label>
            </div>

            <div class="form-group">
                <input class="form-check-input" type="checkbox" name="amenities[]" value="A_HotTub" id="hottub">
                <label class="form-check-label" for="hottub">Hot Tub</label>
            </div>

            <div class="form-group">
                <input class="form-check-input" type="checkbox" name="amenities[]" value="A_Backyard" id="backyard">
                <label class="form-check-label" for="backyard">Backyard</label>
            </div>

            <input type="submit" value="Filter" class="btn btn-primary">
        </form>
    </div>

    <!-- set up table to display results -->
    <?php if (isset($sql)): ?>
    <table class="table table-hover">
        <thead>
            <tr class="table-success">
                <th scope="col">Property Name</th>
                <th scope="col">Address</th>
                <th scope="col">City</th>
                <th scope="col">State</th>
                <th scope="col">Zipcode</th>
                <th scope="col">Deposit</th>
            </tr>
        </thead>
        <?php
        if ($result = mysqli_query($connection, $sql)) {
            while ($row = mysqli_fetch_assoc($result)) {
        ?>
        <tr>
            <td><?php echo $row['P_Name']; ?></td>
            <td><?php echo $row['L_Address']; ?></td>
            <td><?php echo $row['L_City']; ?></td>
            <td><?php echo $row['L_State']; ?></td>
            <td><?php echo $row['L_ZipCode']; ?></td>
            <td><?php echo $row['L_Deposit']; ?></td>
        </tr>
        <?php }
            mysqli_free_result($result);
        }
        mysqli_close($connection);
        ?>
    </table>
    <?php endif; ?>
    </div>

    </body>
</html>
