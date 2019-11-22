<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
  <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  
	<xsl:template match="Posts">
      <script src="/layout/js/html-document-arrow.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
       <headoverride>
            <title>
               <xsl:value-of select="Post[1]/Name"/>
            </title>
            <description>
               <xsl:value-of select="Post[1]/Summary" />
            </description>
        </headoverride> 
      
      <body lang="en">
          <article>
              
              <div class="container style3">
                  <div class="row content-header headerstyle1">

                     :::block-search-box:::

                    <div class="row section-header">
                      <div class="col-12 mb1">
                        <div>
                          <xsl:apply-templates select="Post"/>
                          <ul class="breadcrumb">
                          	<div class="icon content-box inline-block float-left padding-right-1rem">
                    		 <i class="fas fa-upload padding-right-halfrem"></i> Opens: <xsl:apply-templates select="Post" mode="open-date"/>
                  		    </div>
                            
                            <xsl:apply-templates select="Post" mode="close-date"/>

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
  
  <xsl:template match="Post" mode="open-date">
        <xsl:value-of select="date:format-date(date:dateTime(StartDate), 'dd MMMMM yyyy')"/>
  </xsl:template>
  
  <xsl:template match="Post" mode="close-date">
    <xsl:choose>
      <xsl:when test="deadline != ''">
        <div class="icon content-box inline-block float-left">
          <i class="fas fa-user-clock padding-right-halfrem"></i> Closes: <xsl:value-of select="deadline"/> on <xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/> 
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div class="icon content-box inline-block float-left">
          <i class="fas fa-user-clock padding-right-halfrem"></i> Closes: <xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/> 
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <xsl:template match="Post" mode="Summary">
       <xsl:value-of select="Summary" disable-output-escaping="yes"/>
    </xsl:template>

	<xsl:template match="Post" mode="Document">
      <div class="html-document-text funding-text padding-left-1rem">
        <div id="console"> </div>
          <div id="toc">
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Contact</h2>
          <xsl:value-of select="contact" disable-output-escaping="yes"/>
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Supporting Information</h2>
          <xsl:value-of select="documents" disable-output-escaping="yes"/>
          </div>
         <div id="contents">
           <xsl:value-of select="Body" disable-output-escaping="yes"/>
         </div>
      </div>
      <button onclick="topFunction()" id="myBtn"><i class="arr-up"></i></button>
      <script src="/layout/js/back-to-top.js"></script>
    </xsl:template>
  </xsl:stylesheet>