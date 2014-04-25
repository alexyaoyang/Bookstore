<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<html>
<head><title>Orders and books details</title></head>
<body background="books1.gif">
<H2>Data retrieved: </H2>
<table border = 1 width = "300" cellpadding = 0 cellspacing = 2>
<tr>
<td>Book ID</td>
<td>Book Name</td>
<td>Book Price</td>

<tr>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn = DriverManager.getConnection("jdbc:odbc:Example");
Statement statement = conn.createStatement();
ResultSet columns = statement.executeQuery("SELECT BookID,BookName,BookPrice FROM Books");
while(columns.next())
  {
	int bkid = columns.getInt("BookID");
	String name = columns.getString("BookName");
	double price = columns.getDouble("BookPrice");
	%>
	<tr>
	<td><%=bkid%></td>
	<td><%=name%></td>
	<td><%=price%></td>
	</tr>
 <%}
  columns.close();
 %>

 	<table border = 1 width = "500" cellpadding = 0 cellspacing = 2>
	<tr>
	<td>Order ID</td>
	<td>Customer ID</td>
	<td>Order Date</td>
	<td>Status</td>
	<tr>
	<%
	 ResultSet column = statement.executeQuery("SELECT OrderID,CustomerID,OrderDate,Status FROM Orders");
	 while(column.next())
	 {
	 int ordid = column.getInt("OrderID");
	 int custid = column.getInt("CustomerID");
	 String date = column.getString("OrderDate");
	 String status = column.getString("Status");
	 %>
	  <tr>
		<td><%=ordid%></td>
		<td><%=custid%></td>
		<td><%=date%></td>
		<td><%=status%></td>
	  </tr>
  <%}
	  column.close();
	  statement.close();
	  conn.close();
	  %>
</body>
</html>