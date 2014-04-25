<%@ page language="java" import="java.sql.*,java.util.Date,java.text.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html><head><title>Thank you</title><head>
<body background="books1.gif">


<h2><font color="blue">Thank you for shopping with us!</font></h2>

<%


int current = 0;
int currentS = 0;
String action="Buy";
int userid = 0;
	
	String username=aBean.getUsername();

	String bDate = new SimpleDateFormat( "dd/MM/yyyy" ).format(new Date());



try{
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		int id = Integer.parseInt(request.getParameter("Id"));
		int used = Integer.parseInt(request.getParameter("qty"));
		ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE book_id = "+id);
		int balance=0;
		int Sales=0;
		String bookN="";


while (rs.next()) 

{

 current = rs.getInt("no_of_books");
 currentS = rs.getInt("Sales");
 bookN=rs.getString("book");
 balance = current-used;
 Sales=currentS+used;
%>
	<p>You have purchased <%=Sales%> book(s) of <%=bookN%>. There are <%=balance%> remaining books of this title left</p><%
}
		if(current>0)
		{
		if(balance>0){
		stmt.executeUpdate("INSERT INTO History (UserID, ActionDate, Action, BookID,Quantity,BookName ) VALUES ('" +username+ "','" +bDate+ "','"+action+ "','"+id+ "','"+used+ "','"+bookN+ "')");
		stmt1.executeUpdate("UPDATE book SET no_of_books = '"+balance+"',Sales='"+Sales+"' WHERE book_id = " + id);
		}
		if(balance<0)
		{
			response.sendRedirect("error.html");
		}}
rs.close();
stmt1.close();
stmt.close();
con.close();
}catch (Exception e){}

%>
 <INPUT TYPE="submit" value="Back to Cart" onClick="parent.location='browsing.jsp'">	
 <INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'">
 
</body>
</html>


