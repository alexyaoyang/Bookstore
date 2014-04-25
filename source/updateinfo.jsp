<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<HTML><HEAD> <TITLE>Sign Up</TITLE>
</HEAD><body background="books1.gif">
<P><H2></H2>

<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:testing");
Statement statement = connection.createStatement(); 
int status=0;

String pass1 = request.getParameter("password");
String fname = request.getParameter("firstName");
String lname = request.getParameter("lastName");
int contactno = Integer.parseInt(request.getParameter("contactno"));
String eadd = request.getParameter("emailAddr");
String add = request.getParameter("address");
int birthm = Integer.parseInt(request.getParameter("BirthMonth"));
int birthd = Integer.parseInt(request.getParameter("BirthDay"));
int birthy = Integer.parseInt(request.getParameter("BirthYear"));
String answ = request.getParameter("Answer");



if(birthm>12||birthd>31||birthy<1900||birthy>1993||birthd<1||birthm<1){
out.println("<H2>Sorry you entered an invalid number</H2>");}
else{

try{
status=statement.executeUpdate("UPDATE customer set Password='"+pass1+"', customer_name='"+fname +"', customer_last_name='"+lname+"', customer_contact='"+contactno+"', customer_email='"+eadd+"', customer_address='"+add+"', birthmonth='"+birthm+"', birthday='"+birthd+"', birthyear='"+birthy+"', Answer='"+answ+"' where user_name ='"+aBean.getUsername()+"'");
}
catch(SQLException sqle)
 {
  }
if(status>0){
out.println("<H2>You Have Update Successfully</H2>");}
else{
out.println("<H2>Sorry you did not complete the update, please try again</H2>");}}



statement.close();
connection.close();
%>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<FORM ACTION = "welcome.jsp" METHOD="POST">
<INPUT TYPE=Submit VALUE="Welcome Page">
</BODY></HTML>