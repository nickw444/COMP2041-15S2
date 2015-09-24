#!/bin/sh
# x=2&y=1
x=`echo $QUERY_STRING | sed s/x=//g | sed s/\&y=.*//`;
y=`echo $QUERY_STRING | sed s/.*y=//`;
result=`expr $x + $y`;


cat <<EOF
Content-type: text/html

<!DOCTYPE html>
<html>
<head></head>
<body>
<form>
<pre>$QUERY_STRING</pre>
<p>$x, $y</p>
<input name="x" value="$x"/> + <input name="y" value="$y" /> = $result <input type="submit" /> 
</form>
</body>
</html>
EOF



