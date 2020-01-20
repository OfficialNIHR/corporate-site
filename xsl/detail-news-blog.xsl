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
                
                <div class="document-news">
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
                               <i class="fas fa-print white-text padding-right-halfrem"></i><a href=":::printthispage:::">Print</a> 
                             </div>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
 				</div>
                
                    <xsl:apply-templates select="Post" mode="Tags"/>
            
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

    <xsl:template match="Post">
       <h1><xsl:value-of select="Name" /></h1>
    </xsl:template>
    
    <xsl:template match="Post" mode="Tags">
        <div class="relative-bottom">
                 <xsl:if test="(contains(Audience, 'NIHR'))">
                   <div class="list-tags" onclick="location.href='http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9433&amp;sitekit_SiteID=3413';">
                     <a href="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9433&amp;sitekit_SiteID=3413">NIHR</a>
                   </div>
                 </xsl:if>
                 <xsl:if test="(contains(Audience, 'Researchers'))">
                   <div class="list-tags" onclick="location.href='http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9430&amp;sitekit_SiteID=3413';">
                     <a href="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9430&amp;sitekit_SiteID=3413">Researchers</a>
                   </div>
                 </xsl:if>
                  <xsl:if test="(contains(Audience, 'Community'))">
                   <div class="list-tags" onclick="location.href='http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=10735&amp;sitekit_SiteID=3413';">
                     <a href="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=10735&amp;sitekit_SiteID=3413">Health and Social Care Community</a>
                   </div>
                 </xsl:if>
                  <xsl:if test="(contains(Audience, 'Partners'))">
                   <div class="list-tags" onclick="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9431&amp;sitekit_SiteID=3413';">
                     <a href="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9431&amp;sitekit_SiteID=3413">Partners and Industry</a>
                   </div>
                 </xsl:if>
                  <xsl:if test="(contains(Audience, 'Patients'))">
                   <div class="list-tags" onclick="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9432&amp;sitekit_SiteID=3413';">
                     <a href="http://dev.nihr.ac.uk/about-us/news.htm?custom_in_Audience=9432&amp;sitekit_SiteID=3413">Patients, Public, and Carers</a>
                   </div>
                 </xsl:if>
              </div>
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
         <div id="contents">
           <xsl:if test="PicShortcutID > 0">
            		<img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{Name}" class="news-blog-hero"/>
            	</xsl:if>
           <xsl:value-of select="Body" disable-output-escaping="yes"/>
           <xsl:if test="PostTypeID = '183'">
           <hr />
           <div class="disclaimer">
             <p>The views and opinions expressed in this blog are those of the authors and do not necessarily reflect those of the NIHR, NHS or the Department of Health and Social Care.</p>
           </div>
          </xsl:if>
        </div>
        <div id="toc">
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs width100" data-aos="fade-left">Top stories</h2>
          :::dataisland-vertical-related-news:::
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs width100" data-aos="fade-left">NIHR blog</h2>
          :::dataisland-vertical-related-blogs:::
          </div>
      </div>
    </xsl:template>
  </xsl:stylesheet>