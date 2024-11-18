<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Housing Portal</title>
    <!-- Use Bootswatch Pulse theme -->
    <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding-top: 60px; /* Space for fixed navbar */
            background-color: #f5f5f5;
            text-align: center; /* Center align for elements */
        }

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

        .team-name-div {
            font-size: 2.5rem; /* Increased font size */
            color: #333;
            margin-top: 150px; /* Adjusted margin */
            margin-bottom: 0; /* Reduced bottom margin */
        }

        .logo img {
            max-width: 100%; /* Responsive width */
            height: auto;
            max-height: 600px; /* Increased logo size */
            margin-top: 20px; /* Adjust space between text and logo */
        }

        .company-motto {
            font-size: 1.2rem; /* Stylish font size for motto */
            color: #777; /* Subdued color for the supporting text */
            margin-top: 10px; /* Space between logo and motto */
        }
        .nav-link img {
            width: auto; /* Maintain aspect ratio */
            height: 64px; /* Match your logo height here */
            margin-right: 0.5rem; /* Spacing between logo and text */
        }
    </style>
</head>

<body>
    <!-- Populates top menu with our queries and php pages -->
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
    <div class="team-name-div">
        Cribs for Students
    </div>
    <!-- displays logo -->
    <div class="logo">
        <img id="main-logo" src="Logo.png" alt="Main Logo" class="main-logo">
    </div>
    <div class="company-motto">
        Housing made easier for students
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
