#!/bin/sh

if test "$REQUEST_METHOD" = POST
then
   params=`cat`
else
   params=$QUERY_STRING
fi
cat <<EOF
Content-type: text/html

<!DOCTYPE html>
<html>
<head></head>
<body>
<h2>$REQUEST_METHOD Request - Input Param</h2>
<pre>
EOF
echo $params;

cat<<EOF
</pre>
</body>
</html>
EOF



