<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html>
<font size="6" face="times new roman" color="lightgreen">
<body background="books1.gif">
<head><title>Ordered Rentals</title></head>

<h2> Rentals Confirmed </h2>


<%
String username = aBean.getUsername();
String rent= "Rent";
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM History WHERE UserID Like '"+username+"' AND Action Like '"+rent+"'");

%>
		<table border="1" bgcolor="lightyellow">
		<tr>
		<th>Order ID</th>
		<th>Book Name</th>
		<th>Date of Order</th>
		<th>Ordered to buy</th>
		</tr>
<%
	while(rs.next())
    	{
			int bkID = rs.getInt("BookID");
			String bkN = rs.getString("BookName");
			String date= rs.getString("ActionDate");
			String act= rs.getString("Action");
			int ordered= rs.getInt("Quantity");
			int orderID= rs.getInt("OrderID");
%>
			<form action="cancelR.jsp" method="post">
			<tr><td><%=orderID%></td>
			<td><%=bkN%></td>
			<td><%=date%></td>
			<td><%=ordered%></td>
			<td><%=act%></td>


			
			
<td><SELECT NAME="number">

<OPTION><%=1%>
<OPTION><%=2%>
<OPTION><%=3%>
<OPTION><%=4%>
<OPTION><%=5%>
<OPTION><%=6%>
<OPTION><%=7%>
<OPTION><%=8%>
<OPTION><%=9%>
<OPTION><%=10%>

</SELECT></td>
<input type="hidden" name="Id" value=<%=bkID%>>
<input type="hidden" name="qtyO" value=<%=ordered%>>
<input type="hidden" name="orderID" value=<%=orderID%>>
			<td><input type=submit value="Cancel"></td></tr></form>
			
			
<%
	}	

rs.close();
stmt.close();
con.close();
}catch (Exception e){out.println(e);}

%>

</table>

<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'">

</body>
</html>


