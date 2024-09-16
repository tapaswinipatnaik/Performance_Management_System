<?php include('db_connect.php') ?>
<?php
$twhere = "";
if($_SESSION['login_type'] != 1) {
    $twhere = "  ";
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>

  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <!-- Custom CSS -->
  <style>
  body {
    background-color: #e9ecef;
    /* Light gray background */
    font-family: 'Roboto', sans-serif;
    /* Modern font */
  }

  .container {
    padding-top: 20px;
  }

  .row {
    margin-bottom: 20px;
  }

  .small-box {
    position: relative;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #ffffff;
    /* White background for the box */
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
    transition: transform 0.2s, box-shadow 0.2s;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .small-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }

  .small-box .inner h3 {
    font-size: 2.5rem;
    font-weight: bold;
    margin: 0;
    color: #333;
    /* Darker text color for better contrast */
  }

  .small-box .inner p {
    color: #6c757d;
    font-size: 1.1rem;
  }

  .small-box .icon {
    font-size: 4rem;
    color: #007bff;
    /* Blue color for icons */
  }

  .card {
    border: none;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    background: #ffffff;
    /* White background for the card */
  }

  .card-body {
    font-size: 1.25rem;
    font-weight: bold;
    color: #333;
  }
  </style>
</head>

<body>
  <!-- Info boxes -->
  <div class="container">
    <?php if($_SESSION['login_type'] == 2): ?>
    <div class="row">
      <div class="col-12 col-sm-6 col-md-4">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM department_list")->num_rows; ?></h3>
            <p>Total Departments</p>
          </div>
          <div class="icon">
            <i class="fa fa-th-list"></i>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-4">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM designation_list")->num_rows; ?></h3>
            <p>Total Designations</p>
          </div>
          <div class="icon">
            <i class="fa fa-list-alt"></i>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-4">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM users")->num_rows; ?></h3>
            <p>Total Users</p>
          </div>
          <div class="icon">
            <i class="fa fa-users"></i>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-4">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM employee_list")->num_rows; ?></h3>
            <p>Total Employees</p>
          </div>
          <div class="icon">
            <i class="fa fa-user-friends"></i>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-4">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM evaluator_list")->num_rows; ?></h3>
            <p>Total Evaluators</p>
          </div>
          <div class="icon">
            <i class="fa fa-user-secret"></i>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-4">
        <div class="small-box bg-light shadow-sm border">
          <div class="inner">
            <h3><?php echo $conn->query("SELECT * FROM task_list")->num_rows; ?></h3>
            <p>Total Tasks</p>
          </div>
          <div class="icon">
            <i class="fa fa-tasks"></i>
          </div>
        </div>
      </div>
    </div>
    <?php else: ?>
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          Welcome <?php echo $_SESSION['login_name'] ?>!
        </div>
      </div>
    </div>
    <?php endif; ?>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>