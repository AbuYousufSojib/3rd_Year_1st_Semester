<!DOCTYPE html>
<html>
<head>
	<title>Problem-14</title>
	<meta charset="utf-8">
</head>
<body>
	<form method='POST'>
		<h3>Input your name: </h3>
		<input type="text" name="name">
		<input type="submit" name="submit">
	</form>
	<?php
		$name = $_POST['name'];
		echo "<h3> User name: $name </h3>";
	?>
</body>
</html>