<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<HTML><HEAD> <TITLE>Sign Up</TITLE>
</HEAD>
<body background="books1.gif">

<%

String uname = request.getParameter("userName");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:testing");
Statement statement = connection.createStatement();
ResultSet check1 = statement.executeQuery("SELECT * FROM customer where user_name='"+uname+"'");
int status=0;

String pass = request.getParameter("password");
String fname = request.getParameter("firstName");
String lname = request.getParameter("lastName");
String contactno = request.getParameter("contactNo");
String emailaddr = request.getParameter("emailAddr");
String address = request.getParameter("address");
String birthmon = request.getParameter("birthmonth");
String birthday = request.getParameter("birthday");
String birthyear = request.getParameter("birthyear");
String question = request.getParameter("ques");
String answer = request.getParameter("ans");

int cn = 0;

if(pass==null||fname==null||lname==null||emailaddr==null||address==null||question==null||answer==null)
out.println("<H2>Sorry you did not complete the sign up, please try again</H2>");


if(check1.next())
{

String checkusername=check1.getString("user_name");

if(uname.equals(checkusername))
	{
	out.println("<H2>Same User name used.<br>Please change your User name and try again.</H2>"); }
}
else{

try
{
status=statement.executeUpdate("INSERT INTO customer(user_name,Password,customer_name,customer_last_name,customer_contact,customer_email,customer_address,BirthMonth,BirthDay,BirthYear,Question,Answer)VALUES('"+uname+"','"+pass+"','"+fname+"','"+lname+"','"+contactno+"','"+emailaddr+"','"+address+"','"+birthmon+"','"+birthday+"','"+birthyear+"','"+question+"','"+answer+"')");

}
catch(SQLException sqle)
 {
  }

if(status>0)
	out.println("<H2>Signed Up Successfully!</H2></br><H2>You are able to log in with your account</H2>");
	
	else
	out.println("<H2>Sorry you did not complete the sign up, please try again</H2>");
	


}





statement.close();
connection.close();
%>

<FORM ACTION = "interface2.html" METHOD="POST">
<table border="0">
<td><INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)"></td>
<td><INPUT TYPE=Submit VALUE="Log In Page"></td>
</TABLE></BODY></HTML>