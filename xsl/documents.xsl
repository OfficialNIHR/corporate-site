<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />

    <xsl:param name="qs_rows" />
    <xsl:param name="qs_postcategory" />

 <xsl:template match="Posts">
   <div class="main-container">
   
            <xsl:if test="count(Facets) = 0">
                <xsl:comment>CATEGORY-FILTER</xsl:comment>
            </xsl:if>

            <xsl:if test="count(Facets) &gt; 0">
                <xsl:apply-templates select="Facets"/>
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
    </xsl:template>

    <xsl:template match="Post">
      <div class="individual-document-background nihr-blue-border margin-bottom-1em">
        <li class="no-bullets">
            <h2>
                <xsl:choose>
                    <xsl:when test="RESTURL != ''">
                        <a href="{RESTURL}">
                            <xsl:value-of select="Name"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="Name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </h2>          
            <xsl:if test="Body != ''">
                    <xsl:value-of select="Body" disable-output-escaping="yes"/>
            </xsl:if>
            <div><div class="small-icon content-box"><i class="fas fa-upload coral-text"></i></div><p class="inline-block">Published: <xsl:apply-templates select="StartDate"/></p></div>
      <div><div class="small-icon content-box"><i class="fas fa-upload coral-text"></i></div><div class="inline-block" id="{position()}"></div></div>
          <xsl:if test="(contains(type, 'Case Study'))">
      	 <div class="document-list-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9697&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9697&amp;sitekit_SiteID=3413">Case Study</a>
         </div>
       </xsl:if>
       <xsl:if test="(contains(type, 'Guidance'))">
      	 <div class="document-list-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413">Guidance</a>
         </div>
       </xsl:if>
          <xsl:if test="(contains(type, 'Marketing'))">
      	 <div class="document-list-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9730&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413">Marketing</a>
         </div>
       </xsl:if>
       <xsl:if test="(contains(type, 'Supporting Info'))">
      	 <div class="document-list-tags" onclick="location.href='http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9729&amp;sitekit_SiteID=3413';">
           <a href="http://dev.nihr.ac.uk/documents/?id=197&amp;custom_in_type=9696&amp;sitekit_SiteID=3413">Supporting Information</a>
         </div>
       </xsl:if>
        </li>
      </div>
             <script src="/layout/js/read-time-remote.js"></script>
             <script>
               <![CDATA[
                 var step;
                 for (step = 1; step < 6; step++) {
                 var post = ']]><xsl:value-of select="body-1"/><xsl:value-of select="body-2"/><xsl:value-of select="body-3"/><xsl:value-of select="body-4"/><xsl:value-of select="body-5"/><![CDATA['
                 document.getElementById(step).innerHTML = (readingTime(post));
                 }
                ]]>
             </script>
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
      <button type="button" class="accordion nihr-blue-background nihr-blue-gradient">
        <span class="SKPostFacetLabel">
            <h2 class="inline-block margin-bottom-0 padding-left-1em"><xsl:value-of select="Label"/></h2>
        </span>
	  </button>
      <div id="foo" class="panel">
      <ul class="no-bullets">
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
        <input type="submit" value="Search" class="SKPostFacettedSearchSubmit"/>
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
                <span class="SKPostFacettedSearchCount"><xsl:value-of select="Count"/></span>
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