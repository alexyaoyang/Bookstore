<HTML><HEAD>
<TITLE>Sell Book</TITLE></HEAD>
<font size="12" face="rockwell" color="red">
<body background="books1.gif">
Book Information<br>
<br>
Please enter the information of the book you are selling.
<br><br> 
Then, click on the Submit button.<br></font>	 	
<FORM ACTION = "sell2.jsp" METHOD="POST">
<table border="1" bgcolor="lightyellow">

<%String Novel="Novel";
  String Sports="Sports";
  String Entertainment="Entertainment";
  String Thriller="Thriller";
  String Technology="Technology";
  String Other="Other";
  String Autobiography="Autobiography";
%>

<tr><td>Book Name:</td>
<td><INPUT TYPE=TEXT NAME="bookName" ></td>
<tr><td>Book Quantity:</td>
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
</SELECT></td>
<tr><td>Genre:</td>
<td><SELECT NAME="genre">

<OPTION><%=Novel%>
<OPTION><%=Sports%>
<OPTION><%=Thriller%>
<OPTION><%=Technology%>
<OPTION><%=Autobiography%>
<OPTION><%=Entertainment%>
<OPTION><%=Other%>

</SELECT></td>
<tr><td>Price:</td>
<td><INPUT TYPE=TEXT NAME="price" ></td>



</table>
<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1)">
<td><INPUT TYPE=Submit VALUE="Submit"></td>
</FORM>
</BODY>
</HTML>