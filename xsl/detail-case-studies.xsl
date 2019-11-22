<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
  <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  
  
	<xsl:template match="Posts">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <headoverride>
            <title>
               <xsl:value-of select="Post[1]/Name"/>
            </title>
            <description>
               <xsl:value-of select="Post[1]/Summary" />
            </description>
        </headoverride>
      
        <addtohead>
          <xsl:call-template name="social-meta" /> 
        </addtohead>
      
        <body lang="en">
          <article>
              
              <div class="container style3">
                
                <div class="row content-header">
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
                               <i class="fas fa-print white-text padding-right-halfrem"></i><a href=":::printthispage:::">Print</a> 
                             </div>
                          </ul>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row banner banner-flip subpage-intro">
                <xsl:apply-templates select="Post" mode="header-image"/>
                  
                  <div class="col-6 intro-block">
                    <xsl:apply-templates select="Post" mode="Summary"/>
                  </div>
                </div>
            
                <div class="html-document-body-contents position-relative">
                    <xsl:apply-templates select="Post" mode="Document"/>
                </div>
                </div>
             </article>
          <script src="/layout/js/html-document.js"></script>
          <script src="/layout/js/read-time.js"></script>
        </body>
	</xsl:template>
  
  <xsl:template name="social-meta">
    <!-- Twitter start -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="{Post[1]/Name}" />
    <meta name="twitter:description" content="{Post[1]/Summary}" />
    <meta name="twitter:image" content=":::protocol:::://:::domain::::::assetfullpath.shortcutid-{Post[1]/PicShortcutID}:::" />
    <!-- twitter end -->
  </xsl:template> 
  
  <xsl:template match="Post" mode="header-image">
    <img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{Name}" class="case-study-hero"/>
  </xsl:template>

    <xsl:template match="Post">
       <h1>Case study: <xsl:value-of select="Name" /></h1>
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
         <div class="case-study-head">
           <xsl:if test="author != ''">
           <div class="case-study-item case-study-70">
             <div class="case-study-call-out">
              <xsl:value-of select="callout" disable-output-escaping="yes"/>
              <a class="btn" href="{callout-link}">Find out more</a>
             </div>
           </div>
           <div class="case-study-item case-study-30">
                <div class="case-study-author">
                 <div class="case-study-author-image">
                     <img src=":::assetfullpath.shortcutid-{author-image}:::" alt="{Name}"/>
                     <h3>Author: <xsl:value-of select="author" disable-output-escaping="yes"/></h3>
                 </div>
                </div>
              </div>
           </xsl:if>
           <xsl:if test="author = ''">
           <div class="case-study-item case-study-100">
             <div class="case-study-call-out">
              <xsl:value-of select="callout" disable-output-escaping="yes"/>
              <a class="btn" href="{callout-link}">Find out more</a>
             </div>
           </div>
           </xsl:if>
           </div>
          <div class="width-100">
           <xsl:if test="heading-1 != ''">
             <h2 class="rounded-header rounded-header-style1 rounded-header-lhs mt2 mb0"><xsl:value-of select="heading-1"/></h2>
           </xsl:if>  
           <xsl:if test="Body != ''">
             <div class="mt2 mb2 ml1 mr1 html-document-text"><xsl:value-of select="Body" disable-output-escaping="yes"/></div>
           </xsl:if>
           <xsl:if test="image-1 != ''">
             <div class="case-study-parallax" style="background:url(:::assetfullpath.shortcutid-{image-1}:::)"></div>
           </xsl:if>
           <xsl:if test="heading-2 != ''">
             <h2 class="rounded-header rounded-header-style1 rounded-header-lhs mt2 mb0"><xsl:value-of select="heading-2"/></h2>
           </xsl:if>
           <xsl:if test="text-2 != ''">
             <div class="mt2 mb2 ml1 mr1 html-document-text"><xsl:value-of select="text-2" disable-output-escaping="yes"/></div>
           </xsl:if>
           <xsl:if test="image-2 != ''">
             <div class="case-study-parallax" style="background:url(:::assetfullpath.shortcutid-{image-2}:::)"></div>
           </xsl:if>
           <xsl:if test="heading-3 != ''">
             <h2 class="rounded-header rounded-header-style1 rounded-header-lhs mt2 mb0"><xsl:value-of select="heading-3"/></h2>
            </xsl:if>
           <xsl:if test="text-3 != ''">
             <div class="mt2 mb2 ml1 mr1 html-document-text"><xsl:value-of select="text-3" disable-output-escaping="yes"/></div>
           </xsl:if>
           <xsl:if test="image-3 != ''">
             <div class="case-study-parallax" style="background:url(:::assetfullpath.shortcutid-{image-3}:::)"></div>
           </xsl:if>
           <div class="mb2"></div>
         </div>
    </xsl:template>
  </xsl:stylesheet>