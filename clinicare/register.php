<?php
session_start();

?>
<?php
include("db_conection.php");
if(isset($_POST['register']))
{
$email = $_POST['ruser_email'];
$pasword = $_POST['ruser_password'];
$first_name = $_POST['ruser_firstname'];
$last_name = $_POST['ruser_lastname'];
$address = $_POST['ruser_address'];



$check_user="select * from users WHERE user_email='$email'";
    $run_query=mysqli_query($dbcon,$check_user);

    if(mysqli_num_rows($run_query)>0)
    {
echo "<script>alert('Customer is already exist, Please try another one!')</script>";
 echo"<script>window.open('index.php','_self')</script>";
exit();
    }
 
$saveaccount="insert into patient (email,pasword,first_name,last_name,address) VALUE ('$email','$pasword','$first_name','$last_name','$address')";
mysqli_query($dbcon,$saveaccount);
echo "<script>alert('Data successfully saved, You may now login!')</script>";				
echo "<script>window.open('index.php','_self')</script>";


				
	
			
		
	
		

}

?>
