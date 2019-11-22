<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
  <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
  
	<xsl:template match="Posts">
      <script src="/layout/js/html-document-arrow.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
      :::include-glossarizer::: 
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
                          <xsl:apply-templates select="Post" mode="open-date"/>
                          <xsl:apply-templates select="Post" mode="close-date"/>
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
    <xsl:choose>
    <xsl:when test="Status = 'Future'">
    </xsl:when>
    <xsl:otherwise>
    <ul class="breadcrumb">
      <div class="icon content-box inline-block float-left padding-right-1rem">
        <i class="fas fa-upload white-text padding-right-halfrem"></i> Opens: <xsl:value-of select="date:format-date(date:dateTime(StartDate), 'dd MMMMM yyyy')"/>
      </div>
    </ul>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="Post" mode="close-date">
    <xsl:choose>
      <xsl:when test="Status = 'Future'">
      <ul class="breadcrumb">
        <div class="icon content-box inline-block float-left padding-right-1rem">
        <div class="icon content-box inline-block float-left">
          <i class="fas fa-user-clock white-text padding-right-halfrem"></i> Potential advert date: <xsl:value-of select="deadline"/> <xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/> </div>
        </div>
      </ul>
      </xsl:when>
      <xsl:when test="deadline != ''">
      <ul class="breadcrumb">
        <div class="icon content-box inline-block float-left padding-right-1rem">
        <div class="icon content-box inline-block float-left">
          <i class="fas fa-user-clock white-text padding-right-halfrem"></i> Closes: <xsl:value-of select="deadline"/> on <xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/> 
        </div>
        </div>
      </ul>
      </xsl:when>
      <xsl:otherwise>
      <ul class="breadcrumb">
        <div class="icon content-box inline-block float-left padding-right-1rem">
        <div class="icon content-box inline-block float-left">
          <i class="fas fa-user-clock white-text padding-right-halfrem"></i> Closes: <xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/> 
        </div>
        </div>
      </ul>
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
          <xsl:if test="funding-programme = 'Health Services and Delivery Research'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-hsdr:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772174:::">HS<![CDATA[&]]>DR Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Health Technology Assessment'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-hta:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772172:::">HTA Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Invention for Innovation'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-i4i:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772175:::">I4I Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Efficacy and Mechanism Evaluation'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-eme:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772173:::">EME Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Policy Research Programme'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-prp:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772180:::">PRP Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Programme Development Grants'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-pdg:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772522:::">PDG Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Programme Grants for Applied Research'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-pgfar:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772176:::">PGfAR Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Public Health Research'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-phr:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772177:::">PHR Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Research and Innovation for Global Health Transformation'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-right:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772232:::">Global Health Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Global Health Research'">
            <ul>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772232:::">Global Health Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Research for Patient Benefit'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-rfpb:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772178:::">RfPB Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Systematic Reviews'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-sr:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772179:::">SR Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="funding-programme = 'Technology Assessment Review'">
            <ul>
              <li>For help with your application contact :::dataisland-funding-contact-tar:::</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772523:::">TAR Page</a></li>
            </ul>
          </xsl:if>
          <xsl:if test="Academy = 'Development and Skills Enhancement Award'">
            <ul>
              <li>For help with your application contact <a href="mailto:academy-awards@nihr.ac.uk">academy-awards@nihr.ac.uk</a> or call 0113 532 8410</li>
              <li>For more information about the funding Programme, visit the <a href=":::assetfullpath.shortcutid-772259:::">Fellowship Programme Page</a></li>
            </ul>
          </xsl:if>
           <xsl:if test="documents != ''"> 
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Supporting Information</h2>
          <xsl:value-of select="documents" disable-output-escaping="yes"/>
          </xsl:if>
          <xsl:if test="funding-options = 'Study within a trial (SWAT)'"> 
          <h2 class="rounded-header rounded-header-style1 rounded-header-rhs-two width100">Study Within A Trial</h2>
          <ul>
            <li>This funding opportunity is eligible for a pilot, allowing researchers to embed a <a href="/documents/studies-within-a-trial-swat/21512">study within a trial</a>. These studies should evaluate alternative ways of undertaking a trial process.</li>  
          </ul>
          </xsl:if>
          </div>
         <div id="contents">
           <xsl:value-of select="Body" disable-output-escaping="yes"/>
           <div class="padding-top-1rem">
             <xsl:if test="Status = 'Open'">
             <a class="btn" id="funding-apply" href="{apply-link}">Apply Now</a>
             </xsl:if>
           </div>
           </div>
      </div>
      <button onclick="topFunction()" id="myBtn"><i class="arr-up"></i></button>
      <script src="/layout/js/back-to-top.js"></script>
    </xsl:template>
  </xsl:stylesheet>