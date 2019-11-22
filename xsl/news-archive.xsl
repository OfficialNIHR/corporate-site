<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
	
	<xsl:variable name="lcletters">abcdefghijklmnopqrstuvwxyz-</xsl:variable>
	<xsl:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ /:'\.,</xsl:variable>
	<xsl:param name="qs_restLinks" select="false" />
	<xsl:param name="qs_showCurrent" select="false" />
	<xsl:param name="qs_rows" />
	<xsl:param name="qs_start" />
	
	<xsl:param name="qs_year" />
	<xsl:param name="qs_month" />
	<xsl:variable name="current_date" select="date:format-date(date:dateTime(), 'yyyy-MM')" />
	
	<xsl:template match="Posts">
		<div class="SKPostList" id="SKPostList">
			<xsl:choose>
				<xsl:when test="$qs_year != '' and $qs_month != ''">
					<xsl:variable name="title">
						<xsl:text>:::title::: </xsl:text>
						<xsl:value-of select="date:format-date(concat($qs_year,'-',$qs_month,'-01T00:00:00+00:00'), 'MMMMM yyyy')" />
					</xsl:variable>
					<headoverride>
						<title><xsl:value-of select="$title"/></title>
						<keywords><xsl:text>:::metadata.keywords:::, </xsl:text><xsl:value-of select="date:format-date(concat($qs_year,'-',$qs_month,'-01T00:00:00+00:00'), 'MMMMM yyyy')" /></keywords>
						<description><xsl:text>:::metadata.description::: </xsl:text><xsl:value-of select="date:format-date(concat($qs_year,'-',$qs_month,'-01T00:00:00+00:00'), 'MMMMM yyyy')" /></description>
					</headoverride>
					<h1><xsl:value-of select="$title"/></h1>
					<xsl:if test="Introduction != ''">
						<div class="SKPostsIntroduction">
							<xsl:value-of select="Introduction" disable-output-escaping="yes"/>
						</div>
					</xsl:if>
					
					<div class="SKPosts SKPostsType{Post[1]/PostTypeID}">
						<xsl:choose>
							<xsl:when test="count(Post[substring(StartDate,1,7) = concat($qs_year,'-',$qs_month)]) &gt; 0">
								<xsl:if test="count(//Paging) = 1">
									<div class="SKPostsPager SKPostsPagerTop">
										<xsl:apply-templates select="//Paging"/>
									</div>
								</xsl:if>
								<ul>
									<xsl:apply-templates select="Post[substring(StartDate,1,7) = concat($qs_year,'-',$qs_month)]" mode="list">
										<xsl:sort select="StartDate" order="ascending" />
									</xsl:apply-templates>
								</ul>
							</xsl:when>
							<xsl:otherwise>
								<div class="SKPostsNoResults">No results found.</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="Introduction != ''">
						<div class="SKPostsIntroduction">
							<xsl:value-of select="Introduction" disable-output-escaping="yes"/>
						</div>
					</xsl:if>
					
					<div class="SKPosts SKPostsType{Post[1]/PostTypeID}">
						<h1>
							<xsl:text>:::title:::</xsl:text>
							<xsl:if test="$qs_year != ''">
								<xsl:value-of select="date:format-date(concat($qs_year,'-01-01T00:00:00+00:00'), ' yyyy')" />
								<headoverride>
									<title>:::title::: <xsl:value-of select="date:format-date(concat($qs_year,'-01-01T00:00:00+00:00'), ' yyyy')" /></title>
									<keywords><xsl:text>:::metadata.keywords:::, </xsl:text><xsl:value-of select="date:format-date(concat($qs_year,'-01-01T00:00:00+00:00'), ' yyyy')" /></keywords>
									<description><xsl:text>:::metadata.description::: </xsl:text><xsl:value-of select="date:format-date(concat($qs_year,'-01-01T00:00:00+00:00'), ' yyyy')" /></description>
								</headoverride>
							</xsl:if>
						</h1>
						<xsl:if test="count(Post) &gt; 0">
							<ul>
								<xsl:apply-templates select="Post" mode="months" />
							</ul>
						</xsl:if>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<xsl:template match="Post" mode="months">
		<xsl:if test="substring(preceding-sibling::*[1]/StartDate,1,7) != substring(StartDate,1,7) and (substring(StartDate,1,7) != $current_date or ($qs_showCurrent and substring(StartDate,1,7) = $current_date))">
			<li>
				<h2>
					<a href="?year={substring(StartDate,1,4)}&amp;month={substring(StartDate,6,2)}">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="$qs_restLinks">
									<xsl:text>:::thispageinfo.relurl:::</xsl:text>
									<xsl:value-of select="substring(StartDate,1,4)" />
									<xsl:text>/</xsl:text>
									<xsl:value-of select="substring(StartDate,6,2)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>?year=</xsl:text>
									<xsl:value-of select="substring(StartDate,1,4)" />
									<xsl:text>&amp;month=</xsl:text>
									<xsl:value-of select="substring(StartDate,6,2)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:value-of select="date:format-date(date:dateTime(StartDate), 'MMMMM yyyy')" />
					</a>
				</h2>
			</li>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="Post" mode="list">
		<li>
			<h2>
				<a href="{RESTURL}">
					<xsl:value-of select="Name"/>
				</a>
			</h2>
			<xsl:if test="PostKind = '1' or PostKind = '3'">
				<p class="SKPostsListItemDate">
					<xsl:choose>
						<xsl:when test="RepeatPattern = '0'">
							<xsl:value-of select="date:format-date(date:dateTime(StartDate), 'dd MMMMM yyyy')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="RepeatText"/>
						</xsl:otherwise>
					</xsl:choose>
				</p>
			</xsl:if>
			<xsl:if test="Summary != ''">
				<div class="SKPostsListItemSummary">
					<xsl:value-of select="CustomFields/CustomField[Name = 'Summary']/Values/Value[1]/Text" disable-output-escaping="yes"/>
				</div>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>