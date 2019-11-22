<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
  <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  
  
	<xsl:template match="Posts">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <headoverride>
            <title>
                <xsl:value-of select="Post[1]/Name"/>
            </title>
        </headoverride>
        <body lang="en">
          <article>
              
              <div class="container style3">
      <div class="row content-header headerstyle1">
          
      :::block-search-box:::

      <div class="row section-header">
        <div class="col-12 mb1">
          <div>
            <h1>:::title:::</h1>
            <ul class="breadcrumb">
              <a href=":::assetfullpath.shortcutid-756604:::">About Us</a> > <a href=":::assetfullpath.shortcutid-756739:::">Join Us</a>
            </ul>
          </div>
        </div>
      </div>
    </div>
            
                <div class="html-document-body-contents">
                    <xsl:apply-templates select="Post" mode="Document"/>
                </div>
                </div>
             </article>
          <script src="/layout/js/html-document.js"></script>
          <script src="/layout/js/read-time.js"></script>
        </body>
	</xsl:template>

    <xsl:template match="Post">
       <h1><xsl:value-of select="Name" /></h1>
    </xsl:template>

    <xsl:template match="Post" mode="Summary">
       <xsl:value-of select="Summary" disable-output-escaping="yes"/>
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
      <div class="html-document-text padding-left-1rem">
        <div id="console"> </div>
          <div id="toc">
            <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Vacancy details</h2>
            <div class="vacancy-summary-information padding-left-2rem">
                <div class="inline-block width-100">
                   <div class="close-icon"></div><strong>Closing date: </strong><xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/>
                </div>
                <xsl:if test="Interview != ''">
                  <div class="inline-block width-100">
                 <div class="interview-icon"></div><strong>Interview date: </strong> <xsl:value-of select="date:format-date(date:dateTime(Interview), 'dd MMMMM yyyy')"/>
                  </div>
                  </xsl:if>
                  <xsl:if test="Location != ''">
                    <div class="inline-block width-100">
                  <div class="location-icon"></div><strong>Location: </strong> <a href="https://www.google.co.uk/maps/search/{Location}" target="blank"><xsl:value-of select="Location" /></a>
                    </div>
                  </xsl:if>
                  <xsl:if test="Salary != ''">
                     <div class="inline-block width-100">
                <div class="money-icon"></div><strong>Salary: </strong> £<xsl:value-of select="format-number(Salary, '##,###')"/>
                    </div>
                  <p><xsl:value-of select="Summary" disable-output-escaping="yes" /></p>
              </xsl:if>
                </div>
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Other vacancies</h2>
          :::dataisland-vertical-related-vacancies:::
          </div>
         <div  id="contents">
           <xsl:if test="PicShortcutID > 0">
            		<img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{Name}" class="news-blog-hero"/>
            	</xsl:if>
           
           <div class="row title-list">
              <h2 class="rounded-header rounded-header-style1 rounded-header-lhs post-heading-white">
                  <xsl:value-of select="Name"/>
              </h2>
              <div class="document-summary-contents">
                <p><xsl:value-of select="Body" disable-output-escaping="yes"/></p>
              </div>
            </div>
           
           </div>
      </div>
    </xsl:template>
  </xsl:stylesheet>