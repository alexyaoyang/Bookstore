<%@ page language="java"
import="usingjsp.cart.*,java.net.*,java.text.*" %>
<%!
public static final int ITEMS_PER_PAGE =5;
%>
<html>
<body background="books1.gif">

<a href="ViewShoppingCart.jsp">View Shopping Cart</a>
<p>
<h1>Available Products</h1>
<table border="1">
<tr><th>Description<th>Quantity<th>Price
<%
ProductCatalog catalog = (ProductCatalog application.getAttribute("ProductCatalog");

if(catalog==null)
{synchronized(application)
{catalog= new ProductCatalog();
application.setAttribute("ProductCatalog",catalog);
}
}
String startingPositionStr = (String)request.getParameter("StartingPosition")

int startingPosition=0;

if(startingPositionStr!=null)
{try{
startingPosition=Integer.parseInt(StartingPosition);
}
catch(Exception ignore)
{
}
}
Items[]items= catalog.getItems(startingPosition, ITEMS_PER_PAGE);

NumberFormat currency= NumberFormat.getCurrencyInstance();

for(int i=0;i<items.length;i++)
{
Item item= items[i];
String addItemURL= "/servlet/usingjsp.cart.AddtoShoppingCartServlet?"+
"productCode="+URLEncoder.encode(item.getProductCode())+
"&description="+URLEncoder.encode(item.getDescription())+
"&quantity="+URLEncoder.encode(""+item.getQuantity())+
"&price=+URLEncoder.encode(""+item.getPrice());
%>
<tr><td><%=item.getDescription()%></td><td><%=item.getQuantity()%>
</td><td><%=item.getPrice()%></td>
<td><a href="<%=addItemURL%>">Add to Shopping Cart</a></td></tr>
<%
}
%>
</table>
<table border="0">

<tr>
<%
 if (startingPosition >0)
  {
   int prevPosition=startingPosition-ITEMS_PER_PAGE;
   
   if(prevPosition<0) prevPosition=0;
   
   out.println("<td><a href=\"ShowProductCatalog2.jsp?StartingPosition="+prevPosition+"\">&lt;&lt;Prev</a></td>");}
   
   int nextPosition=startingPosition+ITEMS_PER_PAGE;
   
   if(catalog.itemsAvailable(nextPosition))
   {
    out.println("<td><a href=\"ShowProductCatalog2.jsp?StartingPosition="+nextPosition+"\">Next&gt;Next&gt;</a></td>");}
   
 %>
 </tr>
 </table>
 </body>
 </html>