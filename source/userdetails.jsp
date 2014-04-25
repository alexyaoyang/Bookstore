<body background="books1.gif">
<P>
<%@ page import= "java.util.*,java.text.*"%>
<%

String user = request.getParameter("userName");
String pass = request.getParameter("password");
String bm = request.getParameter("birthmonth");
String bd = request.getParameter("birthday");
String by = request.getParameter("birthyear");
String sex = request.getParameter("gender");
String add = request.getParameter("address");
String c = request.getParameter("contactNo");
String fn = request.getParameter("firstName");
String ln = request.getParameter("lastName");

if (user != "" && pass != "" && bm != ""&&bd!=""&&by!=""&&sex!=""&&add!=""&&c!=""&&fn!=""&&ln!="")
{
String usern = user;
String passw = pass;
String birthm= bm;
String birthd= bd;
String birthy= by;
String gen= sex;
String addr= add;
String con=c;
String first=fn;
String last=ln;

session.setAttribute("un", user);
session.setAttribute("pw", passw);
session.setAttribute("bmth", birthm);
session.setAttribute("bday", birthd);
session.setAttribute("byear", birthy);
session.setAttribute("gend", gen);
session.setAttribute("ad", addr);
session.setAttribute("ct", con);
session.setAttribute("fName", first);
session.setAttribute("lName", last);

response.sendRedirect("display.jsp");

}


else {
response.sendRedirect("contact.html");
}

%>
</body>