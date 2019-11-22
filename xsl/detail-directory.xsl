<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>

<xsl:template match="Posts">
    
<xsl:if test="count(Post) &gt; 0">
	<div class="container style3">
	<xsl:apply-templates select="Post" />
    </div>
</xsl:if>
</xsl:template>
  
<xsl:template match="Post">
   <h2 class="rounded-header rounded-header-style1 rounded-header-lhs">
     <xsl:value-of select="Full-Name" disable-output-escaping="yes"/>
   </h2>
 <div>    
   <div class="SKPost188Body"> 
     <xsl:if test="PicShortcutID &gt; 0">
        <div><img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{Name}">
        <xsl:if test="PicCaption != ''">
        <xsl:attribute name="alt"><xsl:value-of  select="PicCaption" /></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of  select="PicCaption" /></xsl:attribute>
         </xsl:if>
              </img>
         </div>
         </xsl:if>
        <p><xsl:value-of select="Body" disable-output-escaping="yes"/></p>
     </div> 
     </div>
</xsl:template>
</xsl:stylesheet>  