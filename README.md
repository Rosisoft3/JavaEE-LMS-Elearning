## LMS - Learning Management System
LMS is a project Learning Management System for developing and realising web-based e-learning. The software allows learners to develop their skills, while making the learning process independent of time and place.

### Requirements
* **JAVA**: 1.8.0.
* **ECLIPSE EE IDE**: 2020-06 or other.
* **SERVER**: Apache Tomcat 7.0.0.
* **For MySQL users**: 5.7.23 or higher.

### Features
* Technology JavaEE
* Database MySQL.
* Chat.
* LMS
* PDF
* QCM

### Libraries Used
  * [JSTL](https://repo1.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar) - JavaServer Pages Standard Tag Library
  * [Apache Commons FileUpload](https://repo1.maven.org/maven2/commons-fileupload/commons-fileupload/1.3/commons-fileupload-1.3.jar) - For uploading files
  * [Apache Commons](https://repo1.maven.org/maven2/commons-io/commons-io/2.4/commons-io-2.4.jar)
  * [JSON](http://www.java2s.com/Code/JarDownload/javax.json/javax.json-1.0.2.jar.zip) - JSON Library. Used for storing configuration
  * [Mysql Connector](https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.6/mysql-connector-java-5.1.6.jar) - for connceting to database
  * [Apache Tomcat](https://downloads.apache.org/tomcat/tomcat-7/v7.0.106/bin/apache-tomcat-7.0.106.zip) 
  
### How to execute LMS project.

**1. Download zip from the link below:.**

[Download LMSproject.zip](https://github.com/Rosisoft3/LMS)

**2. Extract the contents of zip, open Eclipse EE IDE and import the project .**

**3. Configuration database.**

Import [lms.sql](https://github.com/Rosisoft3/LMS) file and open the ../src/lms/dao/dao.properties and ../../WEB-INF/taglibs.jsp files using editors and set your configs variable.
 
**4. Run the project on server Tomcat 7.**

*You can directly login as Admin .*
~~~
> *http://localhost:8080/LMSprojet/login.jsp*
~~~

### Default Login Credentials
| Username  | Password |
| ------------- | ------------- |
| Admin  | Admin  |
| Etudiant  | Etudiant  |
| Tuteur  | Tuteur  |
| Auteur  | Auteur  |
| Responsable  | Responsable  |

### Screenshots
<p align="center">
  <img src=.png>
</p>

### License
LMS is a truly opensource E-Learning  which will always be free under the [MIT License](LICENSE).

### Contact US
Email : productivityrosisoft@gmail.com
