<%@ page language="java" import="java.sql.*,java.io.*" %>
<html>
<body background="books1.gif">
<head><title>Happy Shopping!</title></head>
<font size="12" face="rockwell" color="darkcyan">
<h2> Happy Shopping! Use the search button for faster access </h2>
<form action= "search.jsp" method="get">
  		<P ALIGN="RIGHT"><font size="3">Search: <input type="text" name="search"><input type=Submit value="Feeling Lucky"></font> </p>
  	</form>

<%
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM book ");
%>
		<table border="1" bgcolor="lightyellow">
		<tr>
		<th>Book Name</th>
		<th>Stock Left</th>
		<th>Price</th>
		<th>Genre</th>
		<th>Quantity</th>
		</tr>
<%
	while(rs.next())
    	{
			int bkID = rs.getInt("book_id");
			String bkN = rs.getString("book");
			int qty = rs.getInt("no_of_books");
			float price = rs.getFloat("price");
			String genre= rs.getString("genre");
%>			
			
			<form action="transaction.jsp" method="post">
			<tr><td><%=bkN%></td>
			<td><%=qty%></td>
			<td>$<%=price%></td>
			<td><%=genre%></td>


			
			
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

			<td><input type=submit value="Order"></td></tr></form>
<%
	}	
rs.close();
stmt.close();
con.close();
}catch (Exception e){out.println(e);}

%>


<tr>
<br>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'"></br>
</table>
</body>
</html>


