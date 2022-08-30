#!/bin/bash

file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}

file_env BODY

cat > /var/www/html/index.html <<EOF
<html>
<head>
<meta charset="UTF-8">
</head>
<body bgcolor=${COLOR} >
  <h2>${TITLE}</h2>
  ${BODY}
	<hr/>
  HOSTNAME: ${HOSTNAME}
	<hr/>
	version: v7 start date: $(date)
</body>
</html>
EOF

exec nginx -g "daemon off;"