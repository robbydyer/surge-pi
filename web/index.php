<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <title>Surge</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
 
    <body style="background-color: DimGrey;">

<?php
	$val_array = array(0,0,0,0,0,0,0,0);

	for ( $i= 0; $i<8; $i++) {

		system("gpio mode ".$i." out");
		exec ("gpio read ".$i, $val_array[$i], $return );
	}

	for ($i = 0; $i < 8; $i++) {
		//if off
		if ($val_array[$i][0] == 1 ) {
			echo ("<img class='center' id='button_".$i."' src='data/img/red/red_".$i.".png' onclick='change_pin (".$i.");'/><br>");
		}
		//if on
		if ($val_array[$i][0] == 0 ) {
			echo ("<img class='center' id='button_".$i."' src='data/img/green/green_".$i.".png' onclick='change_pin (".$i.");'/>");
		}	 
	}
?>
	 
	<!-- javascript -->
	<script src="script.js"></script>
    </body>
</html>
