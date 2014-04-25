<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "myjsp.projectdetails"%>
<jsp:useBean id = "aBean" scope = "session" class="myjsp.projectdetails"/>
<html>
<body onLoad="alert('Remember to take a look at our special offers!')" background="books1.gif">
<h2>Welcome, <%=aBean.getUsername()%> to our B4U online store. Feel free to look around.</h2>

<SCRIPT TYPE="text/javascript">
<!--
function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, 'width=500,height=500,scrollbars=no');
return false;
}
//-->
</SCRIPT>

<a href="contactretrieve.jsp">View/Edit Your Personal Information</a>
<br>
<br>                          
<a href="soffer.xml" onClick="return popup(this, '')">Special Offers!</a>
<br>
<br>
<a href="browsing.jsp">Shop</a>
<br>
<br>
<a href="sell.jsp">Sell A Book</a>
<br>
<br>
<a href="vieworders.jsp">View Ordered Purchases</a>
<br>
<br>
<a href="viewrents.jsp">View Ordered Rents</a>
<br>
<br>
<a href="logout.jsp">Log Out</a>