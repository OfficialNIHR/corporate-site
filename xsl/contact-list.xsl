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
                       <dt class="nihr-blue-background nihr-blue-gradient white-text"><div class="icon"><i class="fas fa-pound-sign"></i></div><h2 class="inline-block padding-left-1em margin-bottom-0">Funding</h2></dt> 
                      <dl class="nihr-blue-border margin-bottom-1em">
                         <xsl:apply-templates select="Post" mode="Funding"/>
                      </dl>
                      <dl class="nihr-blue-border margin-bottom-1em">
                        <dt class="nihr-blue-background nihr-blue-gradient white-text"><div class="icon"><i class="fas fa-hands-helping"></i></div><h2 class="inline-block padding-left-1em margin-bottom-0">Monitoring</h2></dt>
                         <xsl:apply-templates select="Post" mode="Monitoring"/>
                      </dl>
                      
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
      <p>:::lorem25000:::</p>
  </xsl:template>    

    <xsl:template match="Post" mode="Funding">
      <xsl:if test="(contains(Name, 'Funding'))">
      <div class="individual-contact padding-left-1em">
        <dd><h3 class="underline"><xsl:value-of select="Name" disable-output-escaping="yes"/></h3></dd>
        <p><xsl:value-of select="Summary" disable-output-escaping="yes"/></p>
            <div class="mobile-only">
              <p><div class="small-icon black-text content-box"><i class="fas fa-phone coral-text"></i></div><strong>Telephone: </strong><a href="tel:+{Tel-Number}"><xsl:value-of select="Tel-Number" disable-output-escaping="yes"/></a></p>
            </div>
            <div class="desktop">
              <p><div class="small-icon black-text content-box"><i class="fas fa-phone coral-text"></i></div><strong>Telephone: </strong><xsl:value-of select="Tel-Number" disable-output-escaping="yes"/></p>
            </div>
        <p><div class="small-icon black-text content-box"><i class="fas fa-at coral-text"></i></div><strong>Email: </strong><a href="mailto:{Email}"><xsl:value-of select="Email" disable-output-escaping="yes"/></a></p>
      <p><div class="small-icon black-text content-box"><i class="fas fa-at coral-text"></i></div>
        
        <xsl:element name="a">
    <xsl:attribute name="href">
      <xsl:value-of select="Link"/>
    </xsl:attribute>
    Weblink
  </xsl:element>
        
      </p>
        </div>
      </xsl:if>
    </xsl:template>
  
  <xsl:template match="Post" mode="Monitoring">
      <xsl:if test="(contains(Name, 'Monitoring'))">
        <div class="individual-contact padding-left-1em">
        <dd><h3 class="underline"><xsl:value-of select="Name" disable-output-escaping="yes"/></h3></dd>
        <p><xsl:value-of select="Summary" disable-output-escaping="yes"/></p>
            <div class="mobile-only">
              <p><div class="small-icon black-text"><i class="fas fa-phone coral-text"></i></div><strong>Telephone: </strong><a href="tel:+{Tel-Number}"><xsl:value-of select="Tel-Number" disable-output-escaping="yes"/></a></p>
            </div>
            <div class="desktop">
              <p><div class="small-icon black-text"><i class="fas fa-phone coral-text"></i></div><strong>Telephone: </strong><xsl:value-of select="Tel-Number" disable-output-escaping="yes"/></p>
            </div>
        <p><div class="small-icon black-text"><i class="fas fa-at coral-text"></i></div><strong>Email: </strong><a href="mailto:{Email}"><xsl:value-of select="Email" disable-output-escaping="yes"/></a></p>
      </div>
      </xsl:if>
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
            <h2 class="inline-block margin-bottom-0 padding-left-1em">NIHR Directory</h2>
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