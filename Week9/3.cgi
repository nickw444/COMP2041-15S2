#!/bin/sh

cat <<EOF
Content-type: text/html

<!DOCTYPE html>
<html>
<head></head>
<body>
<h2>Execution Environment</h2>
<pre>
EOF

for command in pwd id hostname 'uname -a'
do
   echo "$command: `$command`"
done

cat<<EOF
</pre>
</body>
</html>
EOF



