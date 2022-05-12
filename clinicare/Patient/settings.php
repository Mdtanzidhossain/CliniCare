<?php
session_start();

if(!$_SESSION['email'])
{

    header("Location: ../index.php");
}

?>
<?php
include("db_conection.php");
if(isset($_POST['user_save']))
{

 $first_name=$_POST['first-name'];
 $last_name=$_POST['last_name'];
 $user_address=$_POST['location_id'];
 $pasword=$_POST['pasword'];
 $patient_id=$_POST['patient_id'];
 
 
$update_profile="update patient set pasword='$pasword', first_name='$first_name', last_name='$last_name', user_address='$location_id' where patient_id='$patient_id'";
    if(mysqli_query($dbcon,$update_profile))
    {
	echo "<script>alert('Account successfully updated!')</script>";
        echo"<script>window.open('index.php','_self')</script>";
    }else{
	echo "<script>alert('Error Found!')</script>";
	
	}

}

?>









