<%@ page language="java" import="java.sql.*,java.util.Date,java.text.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html><head><title>Thank you</title><head>
<body background="books1.gif">

<font size="6" face="Comic" color="maroon">
<h2>Thank you</font></h2>

<%


int current = 0;
int currentS = 0;
String action="Remove";

	


	String bDate = new SimpleDateFormat( "dd/MM/yyyy" ).format(new Date());
	String username= "Admin";


try{
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		int id = Integer.parseInt(request.getParameter("Id"));
		int used = Integer.parseInt(request.getParameter("qty"));
		ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE book_id = "+id);
		int balance=0;
		int Remove=0;



while (rs.next()) 

{

 current = rs.getInt("no_of_books");
 currentS = rs.getInt("Remove");
 balance = current-used;
 Remove=currentS+used;
%>
	<p>You have removed	<%=Remove%> books. The current balance is <%=balance%></p> <%
}

		stmt.executeUpdate("INSERT INTO History (UserID, ActionDate, Action, BookID,Quantity ) VALUES ('" +username+ "','" +bDate+ "','"+action+ "','"+id+ "','"+used+ "')");
		stmt1.executeUpdate("UPDATE book SET no_of_books = '"+balance+"',Remove='"+Remove+"' WHERE book_id = " + id);
		
		if(balance<0)
		{
			response.sendRedirect("error.html");
		}
rs.close();
stmt1.close();
stmt.close();
con.close();
}catch (Exception e){}

%><INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
 <INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'">
 
</body>
</html>


