[Tobbyland DB]

mysql -uroot -p < tobbyland-schema.sql
mysql -uroot -p < tobbyland < tobbyland-data.sql


[자바의 정석 예제코드]

  o http://www.webhard.co.kr (castello/javachobo)

[Java Exception Tutorial]

  o http://www.tutorialspoint.com/java/java_exceptions.htm
  
[Tomcat]

Tomcat/conf/server.xml 파일

```xml
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" URIEncoding="UTF-8" />
```
