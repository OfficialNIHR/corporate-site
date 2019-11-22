<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
  <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  
	<xsl:template match="Posts">
      <xsl:apply-templates select="Post" mode="Document"/>
  </xsl:template>            

	<xsl:template match="Post" mode="Document">
      <h2><xsl:value-of select="Name" disable-output-escaping="yes"/></h2>
      <p><xsl:value-of select="Body" disable-output-escaping="yes"/></p>
      <p>Telephone: <xsl:value-of select="Tel-Number" disable-output-escaping="yes"/></p>
      <p>Email <xsl:value-of select="Email" disable-output-escaping="yes"/></p>
    </xsl:template>
       
  </xsl:stylesheet>