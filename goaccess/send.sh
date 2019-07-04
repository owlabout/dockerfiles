#!/bin/sh

DATE=$(date +'%Y.%m')

#generate report from access.log
/usr/local/bin/goaccess /access.log --log-format='%h %^ %e [%d:%t %^] "%r" %s %b "%R" "%u" %^ "%v" %^ %Lms' \
 --date-format=%d/%b/%Y --time-format=%T \
 > /report-$DATE.html

curl -s --user "api:${API_KEY}" \
  https://${API_DOMAIN:-api.eu.mailgun.net}/v3/${DOMAIN}/messages \
  -F from="GoAccess Report <goaccess@${DOMAIN}>" \
  -F to="${RECIPIENT}" \
  -F subject="GoAccess report ${DATE}" \
  -F text="GoAccess report ${DATE}" \
  -F attachment=@/report-$DATE.html

# clear log file
> /access.log
