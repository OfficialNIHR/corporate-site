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
                    		 <i class="fas fa-upload white-text padding-right-halfrem"></i> Published: <xsl:apply-templates select="Post" mode="StartDate"/>
                  		    </div>
                
                            <div class="icon content-box inline-block float-left">
                               <i class="fas fa-book white-text padding-right-halfrem"></i> Read Time: <span id="insert-time"></span> minutes
                            </div>
               
                             <div class="icon content-box inline-block float-left">
                               <i class="fas fa-print white-text padding-right-halfrem"></i><a href=":::printthispage:::">Print this document</a> 
                             </div>
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
  
  <xsl:template match="Post" mode="Version">
    <xsl:value-of select="version" />
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
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Contents</h2>
          </div>
         <div id="contents">
           <xsl:if test="(contains(funding-programme, 'Efficacy and Mechanism Evaluation'))">
             <div class="img-fluid">
                <a href="https://mrc.ukri.org/"><img src=":::assetfullpath.shortcutid-772915:::" /></a>
              </div>
            </xsl:if>  
           <xsl:value-of select="Body" disable-output-escaping="yes"/>
           </div>
      </div>
      <button onclick="topFunction()" id="myBtn" aria-label="Back to top"><i class="arr-up"></i></button>
      <script src="/layout/js/contents.js"></script>
      <script src="/layout/js/back-to-top.js"></script>
    </xsl:template>
  </xsl:stylesheet>