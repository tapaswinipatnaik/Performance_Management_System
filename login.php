<!DOCTYPE html>
<html lang="en">

<?php 
session_start();
include('./db_connect.php');
  ob_start();
  $system = $conn->query("SELECT * from system_settings")->fetch_array();
  foreach($system as $k => $v){
    $_SESSION['system'][$k] = $v;
  }
  ob_end_flush();
?>
<?php 
if(isset($_SESSION['login_id']))
header("location:index.php?page=home");

?>
<?php include 'header.php' ?>
<body class="hold-transition login-page">
  <style>
    body.login-page {
        background-image: url('https://img.freepik.com/free-vector/background-realistic-abstract-technology-particle_23-2148431735.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1725148800&semt=ais_hybrid');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .login-page h2 {
        font-family: 'Courier New', monospace;
        color: #f0f0f0; 
        text-shadow: 2px 2px 4px #000;
        white-space: nowrap;
        overflow: hidden;
        border-right: 0.15em solid #f0f0f0;
        width: 24ch;
        animation: typing 2.5s steps(40, end), blink-caret 0.75s step-end infinite;
    }

    @keyframes typing {
        from { width: 0; }
        to { width: 24ch; }
    }

    @keyframes blink-caret {
        from, to { border-color: transparent; }
        50% { border-color: #f0f0f0; }
    }

    .login-box {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9), 0 6px 20px rgba(0, 0, 0, 0.9);
        border-radius: 10px;
         /* background: linear-gradient(135deg, #2b1055, #7597de);  */
        color: #fff;
        padding: 20px;
    }

    .login-card-body {
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        padding: 20px;
    }

    .btn-primary {
        background-color: #6f42c1;
        border-color: #6f42c1;
    }

    .btn-primary:hover {
        background-color: #563d7c;
        border-color: #563d7c;
    }
  </style>

  <h2><b>Welcome to VTS Portal..!</b></h2>

  <div class="login-box">
    <div class="login-logo">
      <a href="#" class="text-white"></a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <form action="" id="login-form">
          <div class="input-group mb-3">
            <input type="email" class="form-control" name="email" required placeholder="Email">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" name="password" required placeholder="Password">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          <div class="form-group mb-3">
            <label for="">Login As</label>
            <select name="login" id="" class="custom-select custom-select-sm">
              <option value="0">Employee</option>
              <option value="1">Evaluator</option>
              <option value="2">Admin</option>
            </select>
          </div>
          <div class="row">
            <div class="col-8">
              <div class="icheck-primary">
                <input type="checkbox" id="remember">
                <label for="remember">
                  Remember Me
                </label>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-4">
              <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </div>
            <!-- /.col -->
          </div>
        </form>
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->
  <script>
    $(document).ready(function(){
      $('#login-form').submit(function(e){
        e.preventDefault()
        start_load()
        if($(this).find('.alert-danger').length > 0 )
          $(this).find('.alert-danger').remove();
        $.ajax({
          url:'ajax.php?action=login',
          method:'POST',
          data:$(this).serialize(),
          error:err=>{
            console.log(err)
            end_load();
          },
          success:function(resp){
            if(resp == 1){
              location.href ='index.php?page=home';
            }else{
              $('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
              end_load();
            }
          }
        })
      })
    })
  </script>
  <?php include 'footer.php' ?>

</body>
</html>
