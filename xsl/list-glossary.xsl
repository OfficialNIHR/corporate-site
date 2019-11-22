<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
   
 <xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="qs_indexList" select="false" />

    <xsl:template match="Posts">
        <div class="container style3">
          
            <div class="SKPosts SKPostsType{Post[1]/PostTypeID}">
                <xsl:choose>
                    <xsl:when test="count(Post) &gt; 0">
                        <xsl:if test="count(//Paging) = 1">
                           
                        </xsl:if>
                        <ul>
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
                        <div class="SKPostsNoResults">No results found for this letter</div>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="Post">
        <li>
            <h2 class="rounded-header rounded-header-style1 rounded-header-lhs">
                <xsl:choose>
                    <xsl:when test="RESTURL != ''">
                            <xsl:value-of select="Name"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="Body"/>
                    </xsl:otherwise>
                </xsl:choose>
            </h2>
            
            <xsl:if test="Summary != ''">
                <div class="SKPostsListItemSummary">
                    <xsl:value-of select="CustomFields/CustomField[Name = 'Summary']/Values/Value[1]/Text" disable-output-escaping="yes"/>
                </div>
            </xsl:if>
            <xsl:if test="count(//AlphabetiseBy) != 0">
              <div class="SKPostsListItemTags">
                <xsl:apply-templates select="CustomFields/CustomField[Name = //AlphabetiseBy/Name]/Values" mode="taglist"/>
              </div>
                  
           </xsl:if>
    </li>
  </xsl:template>


    <xsl:template match="Values" mode="taglist">
        <xsl:if test="count(Value) &gt; 0">
          <ul>
            <xsl:apply-templates select="Value" mode="taglist"/>
          </ul>
        </xsl:if>
    </xsl:template>
  
    <xsl:template match="Value" mode="taglist">
      <xsl:if test="starts-with(translate(Text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), translate(//AlphabetiseBy/Letter, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))">
        <li><xsl:value-of select="Text"/></li>
      </xsl:if>
    </xsl:template>
  
    
</xsl:stylesheet>