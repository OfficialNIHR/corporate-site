<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  <xsl:template match="Posts">
    <xsl:apply-templates select="Post"/>
  </xsl:template>
  <xsl:template match="Post">
    <xsl:if test="PostTypeID = '182'">
     <li class="globe">
       <a href=":::assetfullpath.shortcutid-754744:::" class="homepage-bold">News</a>: 
       <a href="{RESTURL}">
           <xsl:value-of select="Name"/>
       </a>
      </li>
    </xsl:if>
    <xsl:if test="PostTypeID = '185'">
      <li class="pound">
        <a href=":::assetfullpath.shortcutid-757185:::" class="homepage-bold">Funding</a>:
        <a href="{RESTURL}">
          <xsl:value-of select="Name"/>
        </a>
      </li>
    </xsl:if>
    <xsl:if test="PostTypeID = '184'">
      <li class="event">
        <a href=":::assetfullpath.shortcutid-756622:::" class="homepage-bold">Event</a>:   
        <a href="{RESTURL}">
          <xsl:value-of select="Name"/>
        </a>
      </li>
    </xsl:if>
    <xsl:if test="PostTypeID = '183'">
      <li class="comment">
        <a href=":::assetfullpath.shortcutid-756624:::" class="homepage-bold">Blog</a>:  
        <a href="{RESTURL}">
          <xsl:value-of select="Name"/>
        </a>
      </li>
    </xsl:if>
    <xsl:if test="PostTypeID = '187'">
      <li class="case-study">
        <a href=":::assetfullpath.shortcutid-772552:::" class="homepage-bold">Case Study</a>:  
        <a href="{RESTURL}">
          <xsl:value-of select="Name"/>
        </a>
      </li>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>