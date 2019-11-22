<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  <xsl:template match="Posts">
    <div class="dynamic-block" data-aos="fade-up">
          <div class="dynamic-block-inner">
          <xsl:apply-templates select="Post"/>
        </div>
    </div>
  </xsl:template>
  
  <xsl:template match="Post">
    <div class="dynamic-block-item">
      <span class="globe"></span>
      <a href="{RESTURL}">
        <xsl:value-of select="Name"/>
      </a>
      <p><xsl:value-of select="Summary"/></p>
    </div>
  </xsl:template>
</xsl:stylesheet>