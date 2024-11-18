<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About us</title>
        <!-- add a reference to the external stylesheet -->
        <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                background-color:#ebeaea;
                text-align: center; /* Center align for elements */
            }

            header {
                width: 100%;
                position: fixed;
                top: 0;
                z-index: 1000;
                background-color: rgba(255, 255, 255, 0.95);
                margin-bottom: 50px;
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

            .nav-link:hover {
                color: #21e3a7;
            }

            .nav-link img {
                width: auto; /* Maintain aspect ratio */
                height: 64px; /* Match your logo height here */
                margin-right: 0.5rem; /* Spacing between logo and text */
            }
            .textdiv {
                display: flex;

                Justify-content: center; /* Center horizontally */
                align-items: center;
                height: 100vh; /* Adjust 60px if your navbar's height is different */
                margin-top: 60px; /* Same as navbar's fixed height to push content down */
            }

            .text-block {
                max-width: 900px; /* Maximum width of the text block */
                padding: 20px;
                /*margin: auto;  Center the block horizontally */
                background-color: #fff; /* Background color for the text block */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: adds a subtle shadow */
                border-radius: 4px; /* Optional: rounds the corners */
            }

            p {
                font-size: 20px;
            }
            .desc {
                font-size:30px;
            }

        </style>
        <!-- Code to populate our menu with the query pages -->
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
    </head>
    <body>
        <!-- Code displays paragraphs of what our goals are within this project. -->
        <div class="textdiv">

            <div class="text-block">
                <p class = "desc"><u>Goal for our Project/About Us</u></p>
            <p>
                The developers of this application are Jasharn Thiara, Kevin Truong, Koji Yoshiyama, and Prabhjeet Tumber. Together we are the group Cribs for Students. We created a web application for our database design class, TCSS 445
            </p>
            <hr>
             <p>
                 This project aims to help university students find housing information for properties that are near the school they attend." We hope you find this information useful, thank you for visiting our website!
             </p>
                </p>
                </P>
            </div>
        </div>


    </body>
</html>