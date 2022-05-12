
<?php
include("db_conection.php");
if(isset($_POST['order_save']))
{
$patient_id = $_POST['patient_id'];
$order_name = $_POST['order_name'];
$order_price = $_POST['order_price'];
$order_quantity = $_POST['order_quantity'];
$order_total=$order_price * $order_quantity;
$order_status='Pending';




 
$save_order_details="insert into orderdetails (patient_id,order_name,order_price,order_quantity,order_total,order_status,order_date) VALUE ('$patient_id','$order_name','$order_price','$order_quantity','$order_total','$order_status',CURDATE())";
mysqli_query($dbcon,$save_order_details);
echo "<script>alert('Item successfully added to cart!')</script>";				
echo "<script>window.open('shop.php?id=1','_self')</script>";


				
	
			
		
	
		

}

?>
