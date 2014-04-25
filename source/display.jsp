<body background="books1.gif">
<TITLE> Confirmation Page</TITLE>
<H2> Thank you for creating an account, you may now log in with your new account! </H2>
This is the information that you entered:
<br>
<br>
<FORM ACTION = "interface2.html" METHOD="POST">
<table border="1">
<tr>
<td>User Name:</td>
<td><%=session.getAttribute("un") %></td>
</tr>
<tr>
<td>Password:</td>
<td><%=session.getAttribute("pw") %></td>
</tr>
<tr>
<td>Date of Birth:</td>
<td><%=session.getAttribute("bday") %>
<%=session.getAttribute("bmth") %>
<%=session.getAttribute("byear") %></td>
</tr>
<tr><td>First Name:</td>
<td><%=session.getAttribute("fName") %></td>
</tr>
<tr><td>Last Name:</td>
<td><%=session.getAttribute("lName") %></td>
</tr><tr>
<td>Gender:</td>
<td><%=session.getAttribute("gend") %></td>
</tr><tr>
<td>Address:</td>
<td><%=session.getAttribute("ad") %></td>
</tr><tr>
<td>Contact Number:</td>
<td><%=session.getAttribute("ct") %></td>
</tr>
</table>


<INPUT TYPE=Submit VALUE="Return">
</FORM>