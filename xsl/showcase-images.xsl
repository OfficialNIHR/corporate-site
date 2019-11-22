<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  <xsl:template match="Posts">
    <xsl:apply-templates select="Post"/>
  </xsl:template>
  
  <xsl:template match="Post">
       <div class="col-4 news-block news-block-style1" data-aos="fade-up">
        <div class="readmore-text">
          <span class="globe"></span>
          <xsl:if test="PostTypeID = '182'">
          <p class="inline-fix"><strong>News: </strong>
             <xsl:value-of select="Name"/>
          </p>
          </xsl:if>
          <xsl:if test="PostTypeID = '183'">
          <p class="inline-fix"><strong>Blog: </strong>
             <xsl:value-of select="Name"/>
          </p>
          </xsl:if>
          <xsl:if test="PostTypeID = '187'">
          <p class="inline-fix"><strong>Case study: </strong>
             <xsl:value-of select="Name"/>
          </p>
          </xsl:if>
        </div>
        <div class="img-hover-zoom">
        <a href="{RESTURL}"><img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{PicCaption}" class="img-fluid"/></a>
      </div>
     <a href="{RESTURL}" class="readmore">Read more</a>
</div> 
    
  </xsl:template>
</xsl:stylesheet>