<?php require_once('config.php'); ?>
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
            <p class="lead">Select a department.<p>
            <hr class="my-4">
            <form method="GET" action="department.php">
                <select name="dep" onchange='this.form.submit()'>
                    <option selected>Select a name</option>
                    <?php
                    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
                    if ( mysqli_connect_errno() )
                    {
                        die( mysqli_connect_error() );
                    }
                    $sql = "select Dname, Dnumber FROM DEPARTMENT";
                    if ($result = mysqli_query($connection, $sql))
                    {
                        // loop through the data
                        while($row = mysqli_fetch_assoc($result))
                        {
                            echo '<option value="' . $row['Dnumber'] . '">';
                            echo $row['Dname'];
                            echo "</option>";
                        }
                        // release the memory used by the result set
                        mysqli_free_result($result);
                    }
                    ?>
                </select>
                <?php
                if ($_SERVER["REQUEST_METHOD"] == "GET")
                {
                    if (isset($_GET['dep']) )
                    {
                ?>
                <p>&nbsp;</p>
                <table class="table table-hover">
                    <thead>
                        <tr class="table-success">
                            <th scope="col">Last Name</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Supervisor's Last Name</th>
                            <th scope="col">Supervisor's First Name</th>
                        </tr>
                    </thead>
                    <?php
                        if ( mysqli_connect_errno() )
                        {
                            die( mysqli_connect_error() );
                        }
                        $dept = $_GET['dep'];
                        $sql = "SELECT E.Lname AS EmployeeLname, E.Fname AS EmployeeFname,
                                S.Lname AS SupervisorLname, S.Fname AS SupervisorFname
                                FROM EMPLOYEE E
                                JOIN EMPLOYEE S ON  S.Ssn = E.Super_ssn
                                WHERE E.Dno = '$dept'";
                        if ($result = mysqli_query($connection, $sql))
                        {
                            while($row = mysqli_fetch_assoc($result))
                            {
                    ?>
                    <tr>
                        <td><?php echo $row['EmployeeLname'] ?></td>
                        <td><?php echo $row['EmployeeFname'] ?></td>
                        <td><?php echo $row['SupervisorLname'] ?></td>
                        <td><?php echo $row['SupervisorFname'] ?></td>
                    </tr>
                    <?php
                            }
                            // release the memory used by the result set
                            mysqli_free_result($result);
                        }
                    } // end if (isset)
                } // end if ($_SERVER)
                    ?>
                </table>
            </form>
        </div>
    </body>
</html>