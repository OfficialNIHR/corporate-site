<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  <xsl:template match="Posts">
    <xsl:apply-templates select="Post"/>
  </xsl:template>
  
  <xsl:template match="Post">
       <div class="col-4 news-block news-block-style1">
        <div class="readmore-text">
          <span class="globe"></span>
          <p class="inline-fix"><strong>News: </strong> 
             <xsl:value-of select="Name"/>
          </p>
        </div>
        <div class="img-hover-zoom">
        <a href="{RESTURL}"><img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{PicCaption}" class="img-fluid"/></a>
      </div>
     <a href="{RESTURL}" class="readmore">Read more</a>
</div> 
    
  </xsl:template>
</xsl:stylesheet>