<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />

    <xsl:param name="qs_rows" />
    <xsl:param name="qs_postcategory" />

 <xsl:template match="Posts">
   <xsl:apply-templates select="Post"/>
</xsl:template>
      
<xsl:template match="Post">      
        <div class="row">
          <article class="img-article padding-left-2rem">
            <div class="vertical-latest-text">
              <h3>
                <a href="{RESTURL}">
                  <xsl:value-of select="Name"/>
                </a>
              </h3>
                <p>
                  <xsl:value-of select="Summary"/>
                </p>
              </div>
          </article>
        </div>
 </xsl:template>
  
</xsl:stylesheet>