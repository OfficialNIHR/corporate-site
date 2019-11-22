<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
  <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  
	<xsl:template match="Posts">
      <script src="/layout/js/html-document-arrow.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
      <script src="http://dev.nihr.ac.uk/layout/js/progress-bar.js"></script>
        <body lang="en">
          <article>
            <div class="html-document-header nihr-blue-background nihr-blue-gradient white-text">
                <xsl:apply-templates select="Post"/>
           		   <xsl:apply-templates select="Post" mode="Summary"/>
                   <div class="icon content-box inline-block padding-right-1rem"><i class="fas fa-upload white-text"></i></div><div class="super-text inline-block"><p>Published: <xsl:apply-templates select="Post" mode="StartDate"/></p></div>
              <p class="margin-0"><div class="icon content-box inline-block padding-right-1rem"><i class="fas fa-book white-text"></i></div><div class="super-text inline-block">Read Time: <span id="insert-time"></span> minutes</div></p>
              <div class="html-document-hero-icons">
                   <xsl:apply-templates select="Post" mode="Tags"/>
                   <div class="print-icon"><i class="fas fa-print default-icon"></i><a href=":::printthispage:::" class="white-text">Print this document</a></div>
                    </div>
              </div>
                <div class="html-document-body-contents">
                    <xsl:apply-templates select="Post" mode="Document"/>
                </div>
             </article>
          <script src="/layout/js/html-document.js"></script>
          <script src="/layout/js/read-time.js"></script>
        </body>
	</xsl:template>

    <xsl:template match="Post">
       <h1><xsl:value-of select="Name" /></h1>
    </xsl:template>
    
    <xsl:template match="Post" mode="Tags">
        <xsl:if test="(contains(type, 'Case Study'))">
      	 <div class="reverse-document-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9697&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9697&amp;sitekit_SiteID=3413">Case Study</a>
         </div>
       </xsl:if>
       <xsl:if test="(contains(type, 'Guidance'))">
      	 <div class="reverse-document-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413">Guidance</a>
         </div>
       </xsl:if>
       <xsl:if test="(contains(type, 'Marketing'))">
      	 <div class="reverse-document-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9730&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413">Marketing</a>
         </div>
       </xsl:if>
       <xsl:if test="(contains(type, 'Supporting Info'))">
      	 <div class="reverse-document-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9729&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413">Supporting Information</a>
         </div>
       </xsl:if>
       <div class="document-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/'">
           <a href="http://dev.nihr.ac.uk/documents/">All Documents</a>
       </div>
    </xsl:template>

    <xsl:template match="Post" mode="Summary">
       <xsl:value-of select="Body" disable-output-escaping="yes"/>
    </xsl:template>
  
  <xsl:template match="Post" mode="StartDate">
    <xsl:apply-templates select="StartDate"/>
       </xsl:template>
  
    <xsl:template match="StartDate">
  <xsl:copy>
        <xsl:value-of select="substring(., 9, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring(., 6, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring(., 1, 4)"/>
    </xsl:copy>
</xsl:template>

	<xsl:template match="Post" mode="Document">
      <div class="html-document-text">
      <xsl:if test="heading-1 != ''">
      <div class="html-document-title-and-text">
        <h2 class="blue-text"><xsl:value-of select="heading-1" /></h2>
        <xsl:value-of select="body-1" disable-output-escaping="yes"/>
        </div>
      </xsl:if>
      <xsl:if test="heading-2 != ''">
        <div class="html-document-title-and-text">
          <h2 class="blue-text"><xsl:value-of select="heading-2" /></h2>
          <xsl:value-of select="body-2" disable-output-escaping="yes"/>
        </div>
      </xsl:if>
      <xsl:if test="heading-3 != ''">
        <div class="html-document-title-and-text">
          <h2 class="blue-text"><xsl:value-of select="heading-3" /></h2>
          <xsl:value-of select="body-3" disable-output-escaping="yes"/>
        </div>
      </xsl:if>
      <xsl:if test="heading-4 != ''">
        <div class="html-document-title-and-text">
          <h2 class="blue-text"><xsl:value-of select="heading-4" /></h2>
          <xsl:value-of select="body-5" disable-output-escaping="yes"/>
        </div>
      </xsl:if>
      <xsl:if test="heading-5 != ''">
        <div class="html-document-title-and-text">
          <h2 class="blue-text"><xsl:value-of select="heading-5" /></h2>
          <xsl:value-of select="body-5" disable-output-escaping="yes"/>
        </div>
      </xsl:if>
      <div class="version">
        <p>Version: <xsl:value-of select="version" disable-output-escaping="yes"/></p>
      </div>
      </div>
    </xsl:template> 
  </xsl:stylesheet>