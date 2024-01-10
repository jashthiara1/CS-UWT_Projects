<!-- TCSS 445 : Autumn 2020 -->
<!-- Assignment 4 Template -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Assignment 4 Demo</title>
        <!-- add a reference to the external stylesheet -->
        <link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
        <style>
        .navbar-brand {
        color: white; /* change font to white */
        }
        .nav-link {
            color: white;
        }
        </style>
    </head>
    <body>
        <!-- START -- Add HTML code for the top menu section (navigation bar) -->
        <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">assign4</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.php">Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="employee.php">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="department.php">Department</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="project.php">Project</a>
                        </li>
                        <!--<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li> -->
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-sm-2" type="search" placeholder="Search">
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- END -- Add HTML code for the top menu section (navigation bar) -->

        <div class="jumbotron">
            <h1 class="display-3">Welcome to assign4</h1>
            <p class="lead">You can use this assignment to execute SQL queries on COMPANY database.<p>
            <hr class="my-4">
            <p>It uses MYSQL, DBMS and PHP to retrieve data from the database</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">thank you for visiting!</a>
            </p>
        </div>
    </body>
</html>