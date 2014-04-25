<%@ page language="java" import="java.sql.*,java.io.*" %>
<html>
<head><title>Adding</title></head>
<font size="6" face="Arial" color="maroon">
<body background="books1.gif">
<h2> Items </h2>


<%
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM book ");
%>
		<table border="1">
		<tr>
		<th>Book Name</th>
		<th>Stock Left</th>
		<th>Price</th>
		<th>Genre</th>
		<th>Current Sales</th>
		<th>Current Rents</th>
		</tr>
<%
	while(rs.next())
    	{
			int bkID = rs.getInt("book_id");
			String bkN = rs.getString("book");
			int qty = rs.getInt("no_of_books");
			float price = rs.getFloat("price");
			String genre= rs.getString("genre");
			int sale= rs.getInt("Sales");
			int rent= rs.getInt("Rent");
%>			
			 
			<form action="editstock.jsp" method="post" >
			<tr><td><%=bkN%></td>
			<td><%=qty%></td>
			<td>$<%=price%></td>
			<td><%=genre%></td>
			<td><%=sale%></td>
			<td><%=rent%></td>


			
			
<td>
<SELECT NAME="number">

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
<OPTION><%=11%>
<OPTION><%=12%>
<OPTION><%=13%>
<OPTION><%=14%>
<OPTION><%=15%>
<OPTION><%=16%>
<OPTION><%=17%>
<OPTION><%=18%>
<OPTION><%=19%>
<OPTION><%=20%>
<OPTION><%=21%>
<OPTION><%=22%>
<OPTION><%=23%>
<OPTION><%=24%>
<OPTION><%=25%>
<OPTION><%=26%>
<OPTION><%=27%>
<OPTION><%=28%>
<OPTION><%=29%>
<OPTION><%=30%>
</SELECT>
</td>
<input type="hidden" name="Id" value=<%=bkID%>>

			<td><input type=submit value="Change Stock"></td></tr></form>
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


