<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html>
<title>Edit personal information</title>
<head><font size="14" color="black"> Click on confirm button to update.</head>
<body background="books1.gif">
<FORM ACTION="updateinfo.jsp" METHOD="POST">
<%

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:testing");
Statement statement=connection.createStatement();
ResultSet check= statement.executeQuery("SELECT * FROM customer WHERE user_name='"+aBean.getUsername()+"' ");

while(check.next())
{

String user=check.getString("user_name");
String password=check.getString("Password");
String fname=check.getString("customer_name");
String lname=check.getString("customer_last_name");
int contactno = Integer.parseInt(check.getString("customer_contact"));
String eadd=check.getString("customer_email");
String add=check.getString("customer_address");
int birthmon = Integer.parseInt(check.getString("birthmonth"));
int birthday = Integer.parseInt(check.getString("birthday"));
int birthyear = Integer.parseInt(check.getString("birthyear"));
String ques=check.getString("Question");
String answ=check.getString("Answer");

%>
<table border="1">
<tr>


<tr><td>Password: <INPUT TYPE=TEXT NAME="password" value="<%=password%>"  ></td>
<tr><td>First Name: <INPUT TYPE=TEXT NAME="firstName" value="<%=fname%>"  ></td>
<tr><td>Last Name: <INPUT TYPE=TEXT NAME="lastName" value="<%=lname%>" ></td>
<tr><td>Contact Number: <INPUT TYPE=TEXT NAME="contactno" value="<%=contactno%>"  ></td>
<tr><td>Email Address: <INPUT TYPE=TEXT NAME="emailAddr" value="<%=eadd%>"  ></td>
<tr><td>Address: <INPUT TYPE=TEXT NAME="address" value="<%=add%>"></td>
<tr><td>Birth Month: <INPUT TYPE=TEXT NAME="BirthMonth" value="<%=birthmon%>"  ></td>
<tr><td>Birth Day: <INPUT TYPE=TEXT NAME="BirthDay" value="<%=birthday%>"  ></td>
<tr><td>Birth Year: <INPUT TYPE=TEXT NAME="BirthYear" value="<%=birthyear%>"  ></td>
<tr><td>Question: <INPUT TYPE=TEXT NAME="Question" value="<%=ques%>"input disabled="disabled" ></td>
<tr><td>Answer: <INPUT TYPE=TEXT NAME="Answer" value="<%=answ%>"  ></td>
</table>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<tr><br><td><INPUT TYPE=Submit VALUE="Confirm"></td></br>


<%}
check.close();
statement.close();
connection.close();
%>
</body>
</html>