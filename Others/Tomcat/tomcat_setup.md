## Tomcat :

What is Tomcat ?
- Tomcat is an application server. It is Java Based application.
- It provides a platform to the Java applications

Difference between web and application server ?
- WebServer :
    Apache
    80
    httpd, apache2
    /etc/httpd/conf/httpd.conf
    /var/www/html
    .html/.php
    
- Application Server:
    Apache tomcat
    8080
    tomcat
    /opt/apache-tomcat-xxx/conf
    /opt/apache-tomcat-xxx/webapps
    .java
    
### Installation of Tomcat :

#### Step 1 : Install Java and Java Compiler

    ```
    # Install
    $ yum -y install java-1.8.0-openjdk
	$ yum -y install java-1.7.0-openjdk-devel

    # Verify
    $ java -version
    $ javac -version
    ```

#### Step 2 : Download and Extract Tomcat tar file (URL : https://tomcat.apache.org/download-80.cgi)

    ```
    $ wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.60/bin/apache-tomcat-8.5.60.tar.gz
    $ tar -xvf apache-tomcat-8.5.60.tar.gz -C /opt/
    $ cd /opt
    $ mv apache-tomcat-8.5.60 tomcat
    $ ll tomcat

    # Start the tomcat
    $ cd tomcat/bin
    $ ./startup.sh

    # Modify the Security Group (Allow port 8080)
    - Inbound port (Custom TCP : 8080)
    ```

#### Step 3 : Configuration Changes required to access Manager App

    > Add role in conf/tomcat-users.xml

    ```xml
    <!--
        <role rolename="tomcat"/>
        <role rolename="role1"/>
        <user username="tomcat" password="<must-be-changed>" roles="tomcat"/>
        <user username="both" password="<must-be-changed>" roles="tomcat,role1"/>
        <user username="role1" password="<must-be-changed>" roles="role1"/>
    -->
        <role rolename="manager-gui"/>
        <user username="tomcat" password="s3cret" roles="manager-gui"/>
    </tomcat-users>
    ```

    > Modify the context files

    ```
    $ find / -name context.xml
    /opt/tomcat/webapps/host-manager/META-INF/context.xml
    /opt/tomcat/webapps/manager/META-INF/context.xml

    # Comment the below section in both the above files
    $ vi /opt/tomcat/webapps/host-manager/META-INF/context.xml

        <!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->

    # Restart the tomcat :
     $ bin/shutdown.sh
     $ bin/startup.sh
    ```

#### Step 4 : Deploy sample.war file

    ```
    $ bin/shutdown.sh
    $ cd webapps/
    $ wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
    $ bin/startup.sh
    ```
#### Step 5 : Open URL : <ip>:8080/sample

### Contact me :

Contact | Link
------------- | -------------
LinkedIn:  |https://www.linkedin.com/in/ashif-eqbal-4ba85278/
Email:  | ashif8984@gmail.com
