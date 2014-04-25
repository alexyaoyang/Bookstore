<%@ page language="java" import="java.sql.*,java.util.*" %>
<html>
<head><title>Stock Management</title></head>
<font size="6" face="Comic" color="maroon">
<body background="books1.gif">
<h2> Product(s) Selected </h2>
<table border="1" bgcolor="lightyellow">
		<tr>
		<th>BookID</th>
		<th>Book Name</th>
		<th>Stock Left</th>
		<th>Price</th>
		<th>Genre</th>
		<th>Quantity to Edit</th>		
</tr>
<%

	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		int id = Integer.parseInt(request.getParameter("Id"));
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE book_id = "+id);
		
	
	while(rs.next())
    	{
			int bkID = rs.getInt("book_id");
			String bkN = rs.getString("book");
			int qty = rs.getInt("no_of_books");
			float price = rs.getFloat("price");
			String genre= rs.getString("genre");
		String quantity = request.getParameter("number"); 
		int qty2 = Integer.parseInt(quantity); 
%>
			<tr><td><%=bkID%></td>
			<td><%=bkN%></td>
			<td><%=qty%></td>
			<td>$<%=price%></td>
			<td><%=genre%></td>
			<td><%=qty2%></td>
			<form action="addstock.jsp" method="post">
			<input type="hidden" name="Id" value=<%=bkID%>>
			<input type="hidden" name="qty" value=<%=qty2%>>
			<td><input type=submit value="Add"></td>
			</form>
			<form action="minusstock.jsp" method="post">
			<input type="hidden" name="Id" value=<%=bkID%>>
			<input type="hidden" name="qty" value=<%=qty2%>>
			<td><input type=submit value="Remove"></td>
			</form> 
			</tr>
			
			
<%
	}	

rs.close();
stmt.close();
con.close();
}catch (Exception e){out.println(e);}

%>
</table>
</br>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">	
<INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'">

</body>
</html>