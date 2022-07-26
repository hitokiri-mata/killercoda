# Examining the nginx web server log

In terminal T2, execute the following command in the docker host to access the `/test` page (which does not exist):

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> curl localhost:20080/test </span>

What happens if you access a non-existing page?


Switch to terminal T1. You will find that the HTTP access logs are shown in the server output. 
Observe the HTTP status code of the  HTTP requests.

Sample nginx access log:

```
172.18.0.1 - - [03/Aug/2021:08:05:35 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.58.0" "-"
2021/08/03 08:13:45 [error] 30#30: *2 open() "/usr/share/nginx/html/test" failed (2: No such file or directory), client: 172.18.0.1, server: localhost, request: "GET /test HTTP/1.1", host: "localhost:20080"
172.18.0.1 - - [03/Aug/2021:08:13:45 +0000] "GET /test HTTP/1.1" 404 153 "-" "curl/7.58.0" "-"
```

The sample access  log above shows there are two HTTP GET requests being sent to Nginx web server. 
- The first line shows the HTTP 200 OK success status response code indicates that the request to the root path `/` has succeeded. 
- The second line shows an error message when the user request the non-existing endpoint `/test`.
- The third line shows the `HTTP 404 NOT FOUND` status response code when  the non-existing endpoint `/test` is accessed.

<br/>
