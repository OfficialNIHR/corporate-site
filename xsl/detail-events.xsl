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
                                <a href=":::assetfullpath.shortcutid-756604:::">About Us</a> > <a href=":::assetfullpath.shortcutid-756622:::">Events</a>
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
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Top stories</h2>
          :::dataisland-vertical-related-news:::
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">NIHR blog</h2>
          :::dataisland-vertical-related-blogs:::
          </div>
         <div id="contents">
                    
           <h2 class="rounded-header rounded-header-style1 rounded-header-lhs rounded-header-margin-top-1">
                <a href="{RESTURL}" class="post-heading-white">
                  <xsl:value-of select="Name"/>
                </a>
              </h2>
              <div class="document-summary-contents">
               <xsl:if test="PostKind = '1' or PostKind = '3'">
                    <xsl:choose>
                        <xsl:when test="RepeatPattern = '0'">
                          <div class="inline-block width-100">
                            <div class="calendar-icon"></div>
                            <strong>
                              Date: 
                            </strong>
                              <xsl:value-of select="date:format-date(date:dateTime(StartDate), 'dd MMMMM yyyy')"/>
                          </div>
                          <div class="inline-block width-100">
                            <div class="time-icon"></div>
                              <xsl:variable name="StartTime" select="date:format-date(date:dateTime(StartDate), 'HH:mm')"/>
                              <xsl:variable name="EndTime" select="date:format-date(date:dateTime(EndDate), 'HH:mm')"/>
                                  <strong>
                                    Time:
                                  </strong>
                                    <xsl:choose>
                                    <xsl:when test="$StartTime = $EndTime">
                                      <xsl:if test="$StartTime = '00:00'">
                                        <xsl:text>all day event</xsl:text>
                                      </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:choose>
                                        <xsl:when test="$StartTime != '00:00' and $EndTime != '00:00'">
                                          <xsl:value-of select="$StartTime"/> to <xsl:value-of select="$EndTime"/>
                                        </xsl:when>
                                        <xsl:when test="$StartTime != '00:00'">
                                          <xsl:value-of select="$StartTime"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:text> until </xsl:text>
                                          <xsl:value-of select="$EndTime"/>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </xsl:otherwise>
                                  </xsl:choose>
                               </div>
                            </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="RepeatText"/>
                        </xsl:otherwise>
                    </xsl:choose>
              </xsl:if>
                <xsl:if test="Location != ''">
                  <div class="inline-block width-100">
                    <div class="location-icon"></div>
                    <strong>Location: </strong>
                    <xsl:choose>
                      <xsl:when test="contains(Location,'Webinar') or contains(Location,'webinar')"><xsl:value-of select="Location" /></xsl:when>
                      <xsl:otherwise><a href="https://www.google.co.uk/maps/search/{Location}" target="blank"><xsl:value-of select="Location" /></a></xsl:otherwise>
                      </xsl:choose>
                  </div>
                </xsl:if>
                <p><xsl:value-of select="Body" disable-output-escaping="yes" /></p>
              </div>
           
           </div>
      </div>
    </xsl:template>
  </xsl:stylesheet>