<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<html>
<Title></Title>
<body background="books1.gif">

<%
String ans = request.getParameter("answer");
String qn= request.getParameter("question");
String user= request.getParameter("username");
int status =0;


Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:testing","","");
Statement statement=connection.createStatement();
ResultSet check= statement.executeQuery("SELECT * FROM customer WHERE user_name= '"+user+"' and Question= '"+qn+"'   and Answer= '"+ans+"'");

if(check.next())
{

String checkans=check.getString("Answer");
String checkqn=check.getString("Question");
String checkuser=check.getString("user_name");

if( (ans.equals(checkans)) &&  (qn.equals(checkqn))   &&  (user.equals(checkuser)))
{
try{
status=statement.executeUpdate("UPDATE customer set Password=123 where user_name = '"+user+"'");
}
catch(SQLException sqle)
 {out.println("<H2>Sorry something went wrong</H2>");
  }}

else
{
response.sendRedirect("ansnotmatch.jsp");
}

if(status>0){
out.println("<H2>Your password is now '123'.</H2>");}
else{
out.println("<H2>Sorry something went wrong</H2>");}}

%>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<FORM ACTION = "interface2.html" METHOD="POST">
<INPUT TYPE=Submit VALUE="Log In"></td>
</body>
</html>