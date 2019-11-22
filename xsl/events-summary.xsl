<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>

	<xsl:template match="Posts">
		<ul>
			<xsl:apply-templates select="Post"/>
		</ul>
	</xsl:template>

	<xsl:template match="Post">
		<li>
			<h4><a href="{RESTURL}"><xsl:value-of select="Name" /></a></h4>
			<time datetime="{date:format-date(StartDate, 'yyyy-MM-dd')}"><xsl:value-of select="date:format-date(StartDate, 'dd MMM yyyy')"/></time>
			<xsl:value-of select="CustomFields/CustomField[Name = 'Summary']/Values/Value[1]/Text" disable-output-escaping="yes" />
		</li>
	</xsl:template>
</xsl:stylesheet>