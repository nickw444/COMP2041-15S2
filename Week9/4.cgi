#!/bin/sh

cat <<EOF
Content-type: text/html

<!DOCTYPE html>
<html>
<head></head>
<body>
<h2>Environment Variables</h2>
<pre>
EOF
env
cat<<EOF
</pre>
</body>
</html>
EOF



