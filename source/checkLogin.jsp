<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<HTML> <HEAD> <TITLE></TITLE>
</HEAD> 
<body background="books1.gif">

<%
String name = request.getParameter("userName");
String password = request.getParameter("password");

   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection connection = DriverManager.getConnection("jdbc:odbc:testing");
   Statement statement=connection.createStatement();
   ResultSet check;
   check = statement.executeQuery("SELECT * FROM customer WHERE user_name = '"+name+"'");

if(check.next())
{
	String checkpw = check.getString("Password");
	String checkuser = check.getString("user_name");
	
 
	if (password.equals(checkpw)&& name.equals(checkuser))
	{	
	if(checkuser.equals("Admin"))
	{
	response.sendRedirect("admindisplay.jsp");%>
	<%
	}
else{	aBean.setUsername(name);
	aBean.setPassword(password);
	response.sendRedirect("welcome.jsp");
	
	
	
	}
	}
	else
	{
		response.sendRedirect("invalidLogin.html");
	}
}

check.close();
statement.close();
connection.close();
%>
</body>
</html>
