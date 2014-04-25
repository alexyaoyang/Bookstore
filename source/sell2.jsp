<%@ page language="java" import="java.sql.*,java.util.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html>
<head><title>Stock Management</title></head>
<body background="books1.gif">
	
</tr>
<%		int copy=0;
		String bkN=request.getParameter("bookName");
		int qty = Integer.parseInt(request.getParameter("number"));
		String genre=request.getParameter("genre");
		double price = Double.parseDouble(request.getParameter("price"));

		try{
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:testing","","");
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM book ");
		String bkN2="";
		int balance=0;
		int bkqty=0;

%>

			
			
<%
while(rs.next())
{
bkN2=rs.getString("book");
bkqty=rs.getInt("no_of_books");
if(bkN2.equals(bkN)){
copy=1;}
}
	
	
	if(price>0)
		{
		
		if(copy==1)
	    {	
		balance= bkqty+qty;
	    stmt1.executeUpdate("UPDATE book SET no_of_books = '"+balance+"' WHERE book Like '"+bkN+"'"); 
	    }
	    else{
		stmt.executeUpdate("INSERT INTO book (book, price, no_of_books, genre ) VALUES ('" +bkN+ "','" +price+ "','"+qty+ "','"+genre+ "')");
		}
       
 }
else if(price<0||price==0)
	{response.sendRedirect("error.html");}	


stmt.close();
con.close();
}catch (Exception e){out.println(e);}

%>

<H2>Your book has been updated into our database successfully! Use the buttons below to navigate back</H2>

</table>
</br>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">	
<INPUT TYPE="submit" value="Home" onClick="parent.location='welcome.jsp'">

</body>
</html>