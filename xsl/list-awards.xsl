<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />

    <xsl:param name="qs_rows" />
    <xsl:param name="qs_postcategory" />

 <xsl:template match="Posts">
     <div class="container style3">
    <div class="row content-header headerstyle1">
          
      :::block-search-box:::

      <div class="row section-header">
        <div class="col-12 mb1">
          <div>
            <h1>:::title:::</h1>
            <ul class="breadcrumb">
              <a href=":::assetfullpath.shortcutid-756502:::">Health and Care Professionals</a> > <a href=":::assetfullpath.shortcutid-756514:::">Engagement and participation in research</a> > <a href=":::assetfullpath.shortcutid-757178:::">Research awards</a>  
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="row content">
      <div class="col-8">
        <div class="row">
          <div>
            <xsl:value-of select="Introduction" disable-output-escaping="yes"/>
          </div>
        </div> 
        
        <xsl:if test="count(Facets) = 0">
                <xsl:comment>CATEGORY-FILTER</xsl:comment>
            </xsl:if>

              <div class="SKPosts SKPostsType{Post[1]/PostTypeID}">
                <xsl:choose>
                    <xsl:when test="count(Post) &gt; 0">
                        <ul class="no-bullets">
                          <xsl:if test="not($qs_indexList)">
                                <xsl:attribute name="class">sknoindex</xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates select="Post"/>
                        </ul>
                      <xsl:if test="count(//Paging) = 1">
                            <div class="SKPostsPager SKPostsPagerBottom">
                                <xsl:apply-templates select="//Paging"/>
                            </div>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="SKPostsNoResults">No results found.</div>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
 
      </div>
      <div class="col-4 rhs-nav">
        <xsl:if test="count(Facets) &gt; 0">
                <xsl:apply-templates select="Facets"/>
            </xsl:if>
      </div>
      </div>
       </div>
</xsl:template>
      
<xsl:template match="Post">
        <div class="row title-list">
              <h2 class="rounded-header rounded-header-style1 rounded-header-lhs">
                <a href="{RESTURL}">
                  <xsl:choose>
                    <xsl:when test="webinar = 'Yes'">
                     <div class="icon content-box inline-block float-left funding-header">
                       <i class="fas fa-headphones-alt white-text padding-right-1rem funding-header"></i> <xsl:value-of select="Name"/> 
                     </div>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="Name"/>
                    </xsl:otherwise>
                </xsl:choose>
                </a>
              </h2>
              <div class="document-summary-contents">
              
              <xsl:if test="PostKind = '1' or PostKind = '3'">
                <p class="SKPostsListItemDate">
                    <xsl:choose>
                        <xsl:when test="deadline != ''">
                          <strong>Closes: </strong><xsl:value-of select="deadline"/> on <xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <strong>Closes: </strong><xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
              </xsl:if>
                <p><xsl:value-of select="Summary" disable-output-escaping="yes" /></p>
                <div class="padding-top-1rem padding-bottom-1rem">
                </div>
              </div>
            </div>
    </xsl:template>
  
<xsl:template match="Paging">
        <ul class="no-bullets">
            <xsl:apply-templates select="pages/page"/>
        </ul>
    </xsl:template>

    <xsl:template match="page">
        <li>
            <xsl:if test="@current='true'">
                <xsl:attribute name="class">
                    <xsl:text>SKPostsPagerActive</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <a>
                <xsl:attribute name="href">
                    <xsl:text>?start=</xsl:text>
                    <xsl:value-of select="@start" />
                    <xsl:if test="$qs_rows != ''">
                        <xsl:text>&amp;rows=</xsl:text>
                        <xsl:value-of select="$qs_rows"/>
                    </xsl:if>
                    <xsl:if test="$qs_postcategory != ''">
                        <xsl:text>&amp;postcategory=</xsl:text>
                        <xsl:value-of select="$qs_postcategory"/>
                    </xsl:if>
                    <xsl:value-of select="/Posts/Facets/Params"/>
                </xsl:attribute>
                <xsl:attribute name="data-start">
                    <xsl:value-of select="@start"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </a>
        </li>
    </xsl:template>
  
    <xsl:template match="Facets">
        <form id="SKPostFacettedSearch" class="SKPostFacettedSearch sknoindex" method="get"><div class="facetIntroFunding"></div>
            <xsl:apply-templates select="Facet"/>

        </form>
    </xsl:template>

    <xsl:template match="Facet">
        <button type="button" class="accordion rounded-header rounded-header-style1 rounded-header-rhs width100">
           <span class="SKPostFacetLabel">
             <h2 class="rounded-header rounded-header-style1 rounded-header-rhs width100"><xsl:value-of select="Label"/></h2>
           </span>
		</button>

      <div id="foo" class="panel">
      <ul class="parameter-selection">
            <xsl:choose>
                <xsl:when test="Label = 'Month'">
                    <xsl:apply-templates select="Values/Value">
                        <xsl:sort select="Item" order="ascending" data-type="number" />
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="Values/Value"/>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
        <input type="submit" value="Filter" class="parameter-selection SKPostFacettedSearchSubmit btn"/>
      </div>
    </xsl:template>


    <xsl:template match="Values" mode="taglist">
        <xsl:if test="count(Value) &gt; 0">
          <ul class="no-bullets">
            <xsl:apply-templates select="Value" mode="taglist"/>
          </ul>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Value" mode="taglist">
      <xsl:if test="starts-with(translate(Text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), translate(//AlphabetiseBy/Letter, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))">
        <li><xsl:value-of select="Text"/></li>
      </xsl:if>
    </xsl:template>

    <xsl:template match="Value">
        <li>
            <xsl:if test="Count = 0">
                <xsl:attribute name="class">SKPostFacettedSearch0</xsl:attribute>
            </xsl:if>
                <input type="checkbox" class="css-checkbox" id="custom_in_{../../Name}_{Item}" name="custom_in_{../../Name}" value="{Item}">
                    <xsl:if test="Selected = 'true'">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                  <script>
                          <![CDATA[
                            var acc = document.getElementsByClassName("accordion");
                            var i;

                            for (i = 0; i < acc.length; i++) {
                              acc[i].onclick = function() {
                                this.classList.toggle("active");
                                var panel = this.nextElementSibling;
                                if (panel.style.maxHeight){
                                  panel.style.maxHeight = null;
                                } else {
                                  panel.style.maxHeight = panel.scrollHeight + "px";
                                }
                              }
                            }
                          ]]>
                        </script>    
                  </xsl:if>
            </input>
            <label for="custom_in_{../../Name}_{Item}" class="css-label">
                <xsl:value-of select="Name"/>
                <span class="SKPostFacettedSearchCount"> (<xsl:value-of select="Count"/>)</span>
              <script>
                          <![CDATA[
                            var acc = document.getElementsByClassName("accordion");
                            var i;

                            for (i = 0; i < acc.length; i++) {
                              acc[i].onclick = function() {
                                this.classList.toggle("active");
                                var panel = this.nextElementSibling;
                                if (panel.style.maxHeight){
                                  panel.style.maxHeight = null;
                                } else {
                                  panel.style.maxHeight = panel.scrollHeight + "px";
                                }
                              }
                            }
                          ]]>
                        </script>
            </label>
        </li>
    </xsl:template>  
 
</xsl:stylesheet>