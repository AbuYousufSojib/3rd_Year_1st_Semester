<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Problem-16</title>
</head>
<body>
	<?php
		$target_days = mktime(0,0,0,2,1,2023);
		$today = time();
		$diff_days = ($target_days - $today);
		$days = (int)($diff_days/86400);
		echo "Days till next birthday: $days days!"."\n";
	?>
</body>
</html>