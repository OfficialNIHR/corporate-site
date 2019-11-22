<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />
    <xsl:param name="qs_rows" />
    <xsl:param name="qs_postcategory" />

<xsl:template match="Posts">
  <div class="container style2">
    <div class="grid ">
       <xsl:apply-templates select="Post"/>
     </div>
   </div>
</xsl:template>
  
<xsl:template match="Post">
  <div class="item">
    <div class="box" style="background:url(:::assetfullpath.shortcutid-{PicShortcutID}:::)" onclick="location.href='{RESTURL}';"> 
       <div class="grid-title">
       <h3>
        <a href="{RESTURL}">
         <xsl:value-of select="Name"/>
        </a>
      </h3>
      </div>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>