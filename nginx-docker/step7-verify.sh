url=https://a2pops3li6.execute-api.us-east-2.amazonaws.com/v1
event_type='basic-docker-step5-ex'
myname=`cat myname`
myid=`cat myid`

[[ $myname != "" ]] && [[ $myid != "" ]]   && curl localhost:20080 --silent |grep "This is server 1" >/dev/null && curl localhost:20081 --silent |grep "This is server 2" >/dev/null && curl localhost:20082 --silent |grep "This is server 3" >/dev/null && echo "done" && curl -s -G --data-urlencode "type=${event_type}" --data-urlencode "myid=${myid}" --data-urlencode "name=${myname}" "$url" >/dev/null

 