<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
   
 <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />

    <xsl:template match="Posts">
      <xsl:apply-templates select="Post"/>
    </xsl:template>

    <xsl:template match="Post">
          <a href="mailto:{Email}"><xsl:value-of select="Email"/></a>
  </xsl:template>
</xsl:stylesheet>