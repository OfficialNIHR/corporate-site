<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
    <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />

    <xsl:param name="qs_rows" />
    <xsl:param name="qs_postcategory" />
 
<xsl:key name="funding-calendar" match="Post" use="EndDate" />
<xsl:key name="funding-calendar-2" match="Post" use="funding-programme" />
<xsl:template match="Posts">
  
  <div class="container style1">
      <div class="row content-header headerstyle1">  
      :::block-search-box:::
      <div class="row section-header">
        <div class="col-12 mb1">
          <div>
            <h1>:::title:::</h1>
            <ul class="breadcrumb">
              <a href=":::assetfullpath.shortcutid-756501:::">Researchers</a> > <a href=":::assetfullpath.shortcutid-757185:::">Funding opportunities</a> > <a href=":::assetfullpath.shortcutid-790142:::">Funding calendar</a>
            </ul>
          </div>
        </div>
      </div>
    </div>   
    
  <div class="row content accordion-container">
    <div class="col-8">
       <div class="row">
          <div>
            <xsl:value-of select="Introduction" disable-output-escaping="yes"/>
          </div>
        </div>
      
    <h3>Open Calls by Funding Programme</h3>
           
    <xsl:for-each select="Post[count(. | key('funding-calendar-2', funding-programme)[1]) = 1]">
    <xsl:sort select="funding-programme" />
      <xsl:if test="Status = 'Open' and type = 'Programme'">
      <div class="tab">
        <input name="tabs" type="checkbox"><xsl:attribute name="id">tab-fp-<xsl:number/></xsl:attribute></input>
        <label class="accordion-body-tab">    
          <xsl:attribute name="for">tab-fp-<xsl:number/></xsl:attribute>
          
          <xsl:choose>
            <xsl:when test="funding-programme = 'Efficacy and Mechanism Evaluation,Health Services and Delivery Research,Health Technology Assessment,Public Health Research'">
              <h2>Cross Programme</h2>
            </xsl:when>
            <xsl:when test="funding-programme = 'Health Services and Delivery Research,Health Technology Assessment,Public Health Research'">
              <h2>Cross Programme</h2>
            </xsl:when>
            <xsl:otherwise>
              <h2><xsl:value-of select="funding-programme"/></h2>
            </xsl:otherwise>
          </xsl:choose>
          
        </label>            
        <div class="tab-content aos-init aos-animate" data-aos="fade-up">
          <xsl:for-each select="key('funding-calendar-2', funding-programme)">
          <xsl:sort select="Name" />
            <p>
              <strong>Call: </strong><a href="{RESTURL}"><xsl:value-of select="Name" /></a><br />
              <strong>Closing Date: </strong><xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy - HH:mm')"/><br />
              <strong>Programme: </strong>              
                <xsl:if test="funding-programme = 'Global Health Research'">
                    <a href=":::assetfullpath.shortcutid-772232:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Health Services and Delivery Research'">
                    <a href=":::assetfullpath.shortcutid-772174:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Health Technology Assessment'">
                    <a href=":::assetfullpath.shortcutid-772172:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Invention for Innovation'">
                    <a href=":::assetfullpath.shortcutid-772175:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Efficacy and Mechanism Evaluation'">
                    <a href=":::assetfullpath.shortcutid-772173:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Policy Research Programme'">
                    <a href=":::assetfullpath.shortcutid-772180:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Programme Development Grants'">
                    <a href=":::assetfullpath.shortcutid-772522:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Programme Grants for Applied Research'">
                    <a href=":::assetfullpath.shortcutid-772176:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Public Health Research'">
                    <a href=":::assetfullpath.shortcutid-772177:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Research and Innovation for Global Health Transformation'">
                    <a href=":::assetfullpath.shortcutid-772232:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Research for Patient Benefit'">
                    <a href=":::assetfullpath.shortcutid-772178:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Systematic Reviews'">
                    <a href=":::assetfullpath.shortcutid-772179:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Technology Assessment Review'">
                    <a href=":::assetfullpath.shortcutid-772523:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Efficacy and Mechanism Evaluation,Health Services and Delivery Research,Health Technology Assessment,Public Health Research'">
                    <a href=":::assetfullpath.shortcutid-772173:::">Efficacy and Mechanism Evaluation</a>, <a href=":::assetfullpath.shortcutid-772174:::">Health Services and Delivery Research</a>, <a href=":::assetfullpath.shortcutid-772172:::">Health Technology Assessment</a>, <a href=":::assetfullpath.shortcutid-772177:::">Public Health Research</a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Health Services and Delivery Research,Health Technology Assessment,Public Health Research'">
                    <a href=":::assetfullpath.shortcutid-772174:::">Health Services and Delivery Research</a>, <a href=":::assetfullpath.shortcutid-772172:::">Health Technology Assessment</a>, <a href=":::assetfullpath.shortcutid-772177:::">Public Health Research</a>
                </xsl:if>
                <br />
              <strong>Workstream: </strong><xsl:value-of select="Workstream" /><br />
            </p>
          </xsl:for-each>
        </div>
      </div>
      </xsl:if>
    </xsl:for-each>
      
      <h3>Open Calls by Date</h3>
           
    <xsl:for-each select="Post[count(. | key('funding-calendar', EndDate)[1]) = 1]">
    <xsl:sort select="EndDate" />
      <xsl:if test="Status = 'Open'">
      <div class="tab">
        <input name="tabs" type="checkbox"><xsl:attribute name="id">tab-<xsl:number/></xsl:attribute></input>
        <label class="accordion-body-tab">    
          <xsl:attribute name="for">tab-<xsl:number/></xsl:attribute>
          <h2><xsl:value-of select="date:format-date(date:dateTime(EndDate), 'dd MMMMM yyyy - HH:mm')"/></h2>
        </label>            
        <div class="tab-content aos-init aos-animate" data-aos="fade-up">
          <xsl:for-each select="key('funding-calendar', EndDate)">
          <xsl:sort select="Name" />
            <p>
              <strong>Call: </strong><a href="{RESTURL}"><xsl:value-of select="Name" /></a><br />
              <xsl:if test="funding-programme != ''">
              <strong>Programme: </strong>              
                <xsl:if test="funding-programme = 'Global Health Research'">
                    <a href=":::assetfullpath.shortcutid-772232:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Health Services and Delivery Research'">
                    <a href=":::assetfullpath.shortcutid-772174:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Health Technology Assessment'">
                    <a href=":::assetfullpath.shortcutid-772172:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Invention for Innovation'">
                    <a href=":::assetfullpath.shortcutid-772175:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Efficacy and Mechanism Evaluation'">
                    <a href=":::assetfullpath.shortcutid-772173:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Policy Research Programme'">
                    <a href=":::assetfullpath.shortcutid-772180:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Programme Development Grants'">
                    <a href=":::assetfullpath.shortcutid-772522:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Programme Grants for Applied Research'">
                    <a href=":::assetfullpath.shortcutid-772176:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Public Health Research'">
                    <a href=":::assetfullpath.shortcutid-772177:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Research and Innovation for Global Health Transformation'">
                    <a href=":::assetfullpath.shortcutid-772232:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Research for Patient Benefit'">
                    <a href=":::assetfullpath.shortcutid-772178:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Systematic Reviews'">
                    <a href=":::assetfullpath.shortcutid-772179:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Technology Assessment Review'">
                    <a href=":::assetfullpath.shortcutid-772523:::"><xsl:value-of select="funding-programme" /></a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Efficacy and Mechanism Evaluation,Health Services and Delivery Research,Health Technology Assessment,Public Health Research'">
                    <a href=":::assetfullpath.shortcutid-772173:::">Efficacy and Mechanism Evaluation</a>, <a href=":::assetfullpath.shortcutid-772174:::">Health Services and Delivery Research</a>, <a href=":::assetfullpath.shortcutid-772172:::">Health Technology Assessment</a>, <a href=":::assetfullpath.shortcutid-772177:::">Public Health Research</a>
                </xsl:if>
                <xsl:if test="funding-programme = 'Health Services and Delivery Research,Health Technology Assessment,Public Health Research'">
                    <a href=":::assetfullpath.shortcutid-772174:::">Health Services and Delivery Research</a>, <a href=":::assetfullpath.shortcutid-772172:::">Health Technology Assessment</a>, <a href=":::assetfullpath.shortcutid-772177:::">Public Health Research</a>
                </xsl:if>
                <br />
                </xsl:if>
                <xsl:if test="Workstream != ''">
                <strong>Workstream: </strong><xsl:value-of select="Workstream" /><br />
              </xsl:if>
            </p>
          </xsl:for-each>
        </div>
      </div>
      </xsl:if>
    </xsl:for-each>
      
      
    </div>
     <div class="col-4 rhs-nav">
        <xsl:if test="count(Facets) &gt; 0">
                <xsl:apply-templates select="Facets"/>
            </xsl:if>
     </div>
  </div>
    
  </div>
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