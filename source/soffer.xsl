<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<html>
  <body bgcolor = 'pink'>
    <h2><font color="red">Special Offers!</font></h2>
    <table border="1" bordercolor='#F6358A'>
    <tr>
      <th align="left"><FONT COLOR='red'>Title</FONT></th>
      <th align="left"><FONT COLOR='red'>Price($)</FONT></th>
	<th align="left"><FONT COLOR='red'>Quantity Left</FONT></th>
	<th align="left"><FONT COLOR='red'>Description</FONT></th>	
    </tr>
    <xsl:for-each select="Book/Item">
    <tr>
      <td><xsl:value-of select="Title"/></td>
      <td><xsl:value-of select="Price"/></td>
	<td><xsl:value-of select="Quantity"/></td>
	<td><xsl:value-of select="Description"/></td>
    </tr>
    </xsl:for-each>
    </table>


	<h3><font color ="blue">Grab them fast only at your nearest B4U outlets!</font></h3>
  </body>
  </html>

</xsl:template>
</xsl:stylesheet>

bookCatalog.dtd
<?xml version = "1.0"?>
<!ELEMENT Book (Item*)>
<!ELEMENT Item (BookID,Title,Quantity,Price)>
<!ELEMENT BookID (#PCDATA)>
<!ELEMENT Title (#PCDATA)>
<!ELEMENT Quantity (#PCDATA)>
<!ELEMENT Price (#PCDATA)>