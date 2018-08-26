!/bin/sh
IP=$(ifconfig pppoe-wan3 | awk '/inet addr/{print substr($2,6)}')
URL='https://dnsapi.cn/Record.Modify'
LOGIN_TOKEN=''
DOMAIN_ID=''
RECORD_ID=''
SUB_DOMAIN='www'
RECORD_TYPE='A'
RECORD_LINE='%e9%bb%98%e8%ae%a4'
DATA="login_token=${LOGIN_TOKEN}&format=json&\
domain_id=${DOMAIN_ID}&record_id=${RECORD_ID}&\
sub_domain=${SUB_DOMAIN}&value=${IP}&\
record_type=${RECORD_TYPE}&record_line=${RECORD_LINE}"
curl -X POST ${URL} -d ${DATA}
