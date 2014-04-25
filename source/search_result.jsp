<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<html>
<head><title>Search</title></head>
<body background="books1.gif">
<link rel="stylesheet" type="text/css" href="css.css">
<h2> Books Search </h2>
<form action= "search_result.jsp" method="get">
  		Search:<input type="text" name="search"><input type=Submit value="Go">  
</form>
<%
			String sea = request.getParameter("search" );
			out.println("searching for anything that contains '<b><i>"+sea+"</i></b>' ");
%>
</br>
</br>
<%
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE book Like '%"+sea+"%'");
%>
		<table border="1">
		<tr>
		<th>Book Name</th>
		<th>Genre</th>
		<th>Price</th>
		<th>Quantity</th>
		</tr>
<%	
	while(rs.next())
    	{
    		
			String bn = rs.getString("book");
			String gen = rs.getString("genre");
			int quan   = rs.getInt("no_of_books");
			float pr = rs.getFloat("price");
			int bid   = rs.getInt("book_id");
%>
		
		    <form action="transaction.jsp" method="post">
			<tr><td><%=bn%></td>
			<td><%=gen%></td>
			<td>$<%=pr%></td>
			<td>$<%=quan%></td>
			<input type="hidden" name="Id" value=<%=bid%>>
			<td><input type=submit value="Buy"></td>
			</tr>
			</form>
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