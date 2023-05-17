<!DOCTYPE html>
<html>
<head>
  <title>Problem-13</title>
</head>
<body>
  <h3>Chess Board</h3>
  <table width="300px" cellspacing="0px" cellpadding="0px" border="2px">
    <?php
      for($r=1; $r<=8; $r++){
        echo "<tr>";
          for($c=1; $c<=8; $c++){
            $t = $r + $c;
            if($t%2==0){
              echo "<td height=30px width=30px bgcolor=#FFFFFF></td>";
            }
            else{
              echo "<td height=30px width=30px bgcolor=#000000></td>";
            }
        }
       echo "</tr>";
      }
    ?>
  </table>
</body>
</html>