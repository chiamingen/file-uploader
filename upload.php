<?php
$target_path = "uploads/";

$target_path = $target_path . basename( $_FILES['Filedata']['name']); 

if(move_uploaded_file($_FILES['Filedata']['tmp_name'], $target_path)) {
    echo "The file ".  basename( $_FILES['Filename']['name']). 
    " has been uploaded";
} else{
    echo "There was an error uploading the file, please try again!";
}
?>