<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>

	<xsl:template match="Posts">
		<xsl:if test="count(Post) &gt; 0">
			<div class="cta-color-boxes-row sknoindex">
				<div class="container">
					<div class="cta-color-boxes">
						<xsl:apply-templates select="Post">
							<xsl:sort select="Priority" data-type="number" order="descending" />
						</xsl:apply-templates>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Post">
		<xsl:choose>
			<xsl:when test="count(AssetListPages/Item) &gt; 0">
				<a class="cta-color-box" href="{AssetListPages/Item/URL}">
					<xsl:if test="Color != ''">
						<xsl:attribute name="class">
							<xsl:text>cta-color-box </xsl:text>
							<xsl:value-of select="Color" />
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="PicShortcutID &gt; 0">
						<img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{PicCaption}"></img>
					</xsl:if>
					<span><xsl:value-of select="Name" /></span>
				</a>
			</xsl:when>
			<xsl:when test="count(AssetListLinks/Item) &gt; 0">
				<a class="cta-color-box" href="{AssetListLinks/Item/URL}">
					<xsl:if test="Color != ''">
						<xsl:attribute name="class">
							<xsl:text>cta-color-box </xsl:text>
							<xsl:value-of select="Color" />
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="PicShortcutID &gt; 0">
						<img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{PicCaption}"></img>
					</xsl:if>
					<span><xsl:value-of select="Name" /></span>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<span class="cta-color-box">
					<xsl:if test="Color != ''">
						<xsl:attribute name="class">
							<xsl:text>cta-color-box </xsl:text>
							<xsl:value-of select="Color" />
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="PicShortcutID &gt; 0">
						<img src=":::assetfullpath.shortcutid-{PicShortcutID}:::" alt="{PicCaption}"></img>
					</xsl:if>
					<span><xsl:value-of select="Name" /></span>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>