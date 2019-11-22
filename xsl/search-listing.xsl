<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />
    <xsl:param name="qs_rows" />
    <xsl:param name="qs_postcategory" />

<xsl:template match="Posts">
  <ul>
  <xsl:apply-templates select="Post"/>
  </ul>
</xsl:template>
  
<xsl:template match="Post">
  <li>
    <a href="{RESTURL}">
        <xsl:value-of select="Name"/>
      </a> 
  </li>
</xsl:template>

</xsl:stylesheet>