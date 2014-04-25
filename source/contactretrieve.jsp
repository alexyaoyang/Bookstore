<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html>
<title>Edit personal information</title>
<body background="books1.gif">
<FORM ACTION="editinfo.jsp" METHOD="POST">
<%

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:testing");
Statement statement=connection.createStatement();
ResultSet check= statement.executeQuery("SELECT * FROM customer WHERE user_name='"+aBean.getUsername()+"' ");

while(check.next())
{
String name=check.getString("customer_id");
String user=check.getString("user_name");
String password=check.getString("Password");
String fname=check.getString("customer_name");
String lname=check.getString("customer_last_name");
int contactno = Integer.parseInt(check.getString("customer_contact"));
String eadd=check.getString("customer_email");
String add=check.getString("customer_address");
String birthm=check.getString("BirthMonth");
String birthd=check.getString("BirthDay");
String birthy=check.getString("BirthYear");
String ques=check.getString("Question");
String answ=check.getString("Answer");

%>
<table border="1">
<tr>
<tr><td>Customer ID: <INPUT TYPE=TEXT NAME="customer_id" value="<%=name%>" input disabled="disabled" ></td>
<tr><td>User Name:<INPUT TYPE=TEXT NAME="user_name" value="<%=user%>" input disabled="disabled" ></td>
<tr><td>Password: <INPUT TYPE=TEXT NAME="password" value="<%=password%>" input disabled="disabled" ></td>
<tr><td>First Name: <INPUT TYPE=TEXT NAME="firstName" value="<%=fname%>" input disabled="disabled" ></td>
<tr><td>Last Name: <INPUT TYPE=TEXT NAME="lastName" value="<%=lname%>" input disabled="disabled" ></td>
<tr><td>Contact Number: <INPUT TYPE=TEXT NAME="customer_contact" value="<%=contactno%>" input disabled="disabled" ></td>
<tr><td>Email Address: <INPUT TYPE=TEXT NAME="emailAddr" value="<%=eadd%>" input disabled="disabled" ></td>
<tr><td>Address: <INPUT TYPE=TEXT NAME="address" value="<%=add%>" input disabled="disabled" ></td>
<tr><td>Birth Month: <INPUT TYPE=TEXT NAME="BirthMonth" value="<%=birthm%>" input disabled="disabled" ></td>
<tr><td>Birth Day: <INPUT TYPE=TEXT NAME="BirthDay" value="<%=birthd%>" input disabled="disabled" ></td>
<tr><td>Birth Year: <INPUT TYPE=TEXT NAME="BirthYear" value="<%=birthy%>" input disabled="disabled" ></td>
<tr><td>Question: <INPUT TYPE=TEXT NAME="Question" value="<%=ques%>" input disabled="disabled" ></td>
<tr><td>Answer: <INPUT TYPE=TEXT NAME="Answer" value="<%=answ%>" input disabled="disabled" ></td>
</table>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<tr><br><td><INPUT TYPE=Submit VALUE="Edit"></td></br>


<%}
check.close();
statement.close();
connection.close();
%>
</body>
</html>
