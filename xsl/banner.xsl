<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>

	<xsl:template match="Posts">
		<xsl:if test="count(Post) &gt; 0">
			<div class="banner-row">
				<div class="container">
					<div class="banner">
						<xsl:apply-templates select="Post">
							<xsl:sort select="Priority" data-type="number" order="descending" />
						</xsl:apply-templates>
					</div>
					<xsl:text>:::include-cycle2:::</xsl:text>
					<xsl:text>:::include-Modernizr:::</xsl:text>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Post">
		<div class="slide">
			<xsl:if test="PicShortcutID &gt; 0">
				<img src=":::assetfullpath.shortcutid-{PicShortcutID}:::?width=1170" alt="{PicCaption}">
					<xsl:attribute name="srcset">
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=340 340w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=360 360w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=380 380w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=390 390w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=585 585w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=680 680w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=780 780w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=960 960w, </xsl:text>
						
						<xsl:text>:::assetfullpath.shortcutid-</xsl:text>
						<xsl:value-of select="PicShortcutID" />
						<xsl:text>:::?width=1170 1170w</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="sizes">
						<xsl:text>(min-width: 1201px) 1170px, </xsl:text>
						<xsl:text>(min-width: 1001px) 960px, </xsl:text>
						<xsl:text>(min-width: 701px) 680px, </xsl:text>
						<xsl:text>(min-width: 401px) 390px, </xsl:text>
						<xsl:text>95vw</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="Body != ''">
				<div class="banner-comment">
					<xsl:value-of select="Body" disable-output-escaping="yes"/>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

</xsl:stylesheet>