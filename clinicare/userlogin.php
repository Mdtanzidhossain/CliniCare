<?php
session_start();

?>
<?php

include("db_conection.php");



if(isset($_POST['user_login']))
{
    $email=$_POST['email'];
    $pasword=$_POST['pasword'];
	

    $check_user="select * from patient WHERE email='$email' AND pasword='$pasword'";

 
    $run=mysqli_query($dbcon,$check_user);

    if(mysqli_num_rows($run))
    {
            echo "<script>alert('You're successfully login!')</script>";
            
            echo "<script>window.open('Patient/index.php','_self')</script>";
            
            $_SESSION['email']=$email;
    }
    else
    {
        echo "<script>alert('Email or pasword is incorrect!')</script>";
		  echo "<script>window.open('index.php','_self')</script>";
		
		 exit();
		
    }
}
?>