<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
<xsl:template match="*">
<div class="counter">Pledges: <xsl:value-of select="count(submission)" /></div>
</xsl:template>
</xsl:stylesheet> 