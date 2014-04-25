<%@ page language="java" import="java.sql.*,java.util.Date,java.text.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html><head><title>Thank you</title><head>
<body background="books1.gif">
<font size="99" face="Bradley Hand ITC" color="green">

Thank you</font><br>

<%

int x=1;
int current = 0;
int currentS = 0;

int userid = 0;
String action="Cancelled";
	
	String username=aBean.getUsername();

	String bDate = new SimpleDateFormat( "dd/MM/yyyy" ).format(new Date());



try{
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		int id = Integer.parseInt(request.getParameter("Id"));
		int orderamt = Integer.parseInt(request.getParameter("qtyO"));
		int minus = Integer.parseInt(request.getParameter("number"));
		int oid = Integer.parseInt(request.getParameter("orderID"));
		ResultSet rs = stmt.executeQuery("SELECT * FROM book where book_id = "+id);
		int balance=0;
		int Sales=0;
		int Buy=0;
		String bookN="";
		int hbalance=0;

while (rs.next()) 

{

 current=rs.getInt("no_of_books");
 balance = current+minus;
 currentS= rs.getInt("Sales");
 Sales= currentS-minus;
 hbalance=orderamt-minus;
 
%>
	<p>You have cancelled <%=minus%> purchase(s). The balance of books in the order is <%=hbalance%></p><%


}
		
		if(hbalance==0){
		stmt.executeUpdate("UPDATE History SET Quantity = '"+hbalance+"',Action='"+action+"' WHERE OrderID = " + oid);
		}
		if(hbalance>=0){
		stmt.executeUpdate("UPDATE History SET Quantity = '"+hbalance+"' WHERE OrderID = " + oid);
		stmt1.executeUpdate("UPDATE book SET no_of_books = '"+balance+"',Cancel='"+minus+"',Sales='"+Sales+"' WHERE book_id = " + id);
		}
		if(hbalance<0)
		{
			response.sendRedirect("error.html");
		}

rs.close();
stmt1.close();
stmt.close();
con.close();
}catch (Exception e){}

%>
 <INPUT TYPE="submit" value="Back to Purchase Removal" onClick="parent.location='vieworders.jsp'">
 <INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'">
 
</body>
</html>


