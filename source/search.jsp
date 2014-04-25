<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<html>
<head><title>Search</title></head>
<body background="books1.gif">
<font size="6" face="rockwell" color="darkcyan">
<h2> Books Search </h2>
<form action= "search_result.jsp" method="get">
  	<P ALIGN="RIGHT"><font size="3">	Search:<input type="text" name="search"><input type=Submit value="Go"></font> </p>
</form>
<%			
			String sea = request.getParameter("search" );
			out.println("Searching for titles containing '<b>"+sea+"</time></b>' ");
%>
</br>
</br>
<%
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE book Like '%"+sea+"%'");
%>		<P ALIGN="CENTER">
		<table border="1" bgcolor="lightyellow">
		<tr>
		<th>Book Name</th>
		<th>Genre</th>
		<th>Price</th>
		<th>Quantity</th>
		</tr></p>
<%	
	while(rs.next())
    	{
    		
			String bkN = rs.getString("book");
			String genre = rs.getString("genre");
			int qty   = rs.getInt("no_of_books");
			float price = rs.getFloat("price");
			int bkID  = rs.getInt("book_id");
%>
		
		    <form action="transaction.jsp" method="post">
			<tr><td><%=bkN%></td>
			<td><%=genre%></td>
			<td>$<%=price%></td>
			<td><%=qty%></td>
			
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