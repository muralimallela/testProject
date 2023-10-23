#student-review page

com.mysql.cj.jdbc.ClientPreparedStatement: SELECT s.studentID,s.firstname,s.lastname,s.batchyear,pr.projecttitle,pr.description,f.firstname,f.lastname FROM participants pt JOIN students s ON s.studentID = pt.studentID JOIN projects pr ON pr.projectID = pt.projectID JOIN faculty f ON f.facultyID = pr.facultyAdvisorID WHERE s.StudentID='21C51A0521';

[]


com.mysql.cj.jdbc.ClientPreparedStatement: select * from reviews where studentID = '21C51A0521' ;

[]


#sql connection

com.mysql.cj.jdbc.exceptions.CommunicationsException: Communications link failure


Caused by: java.net.ConnectException: Connection refused: connect



java.lang.NullPointerException: Cannot invoke "java.sql.Connection.prepareStatement(String)" because "connection" is null