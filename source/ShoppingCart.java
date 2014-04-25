package usingjsp.cart;
import java.util.*;
import java.io.*;
public class ShoppingCart implements java.io.Serializable
{
	protected Vector items;
	
	
	public ShoppingCart()
	{
	items=new Vector();
    }

public Vector getItems()
{
	return (Vector)items.clone();
}

public void addItem(Item newItem)
{
	items.addElement(newItem);
}

public void removeItem(int itemIndex)
{
	items.removeElementAt(itemIndex);
}

protected static int nextOrderNumber=1;

public String completeOrder()
throws ShoppingCartException
{
	try
	{
	 int orderNumber=0;
	  synchronized(this)
	  {
	  	orderNumber=nextOrderNumber;
	  	nextOrderNumber=nextOrderNumber+1;
	  }
	  PrintWriter out=new PrintWriter(new FileOutputStream("order"+orderNumber));
	  
	  Enumeration e=items.elements();
	  while (e.hasMoreElements())
	  {
	  	Item item=(Item)e.nextElement();
	  	out.println(item.productCode+","+item.quantity);
	  }
	  	out.close();
	  	
	  	return ""+orderNumber;
	}
	  	catch (Exception exc)
	  	{
	  		throw new ShoppingCartException("Error saving order: "+exc.toString());
	  	}
	  
	}
}