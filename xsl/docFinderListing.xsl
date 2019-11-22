<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
	<xsl:template match="FolderInfo">
		<xsl:for-each select="Files">
			<div class="fileItem">
				<div class="fileItemLeft">
					<xsl:choose>
						<xsl:when test="contains(FileURL,'.pdf')"><img src="/images/fileicons/pdf.gif" alt="PDF: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.doc') or contains(FileURL,'.docx')"><img src="/images/fileicons/doc.gif" alt="Word Document: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.xls') or contains(FileURL,'.xlsx')"><img src="/images/fileicons/xls.gif" alt="Spreadsheet: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.ppt') or contains(FileURL,'.pptx')"><img src="/images/fileicons/ppt.gif" alt="PowerPoint: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.txt')"><img src="/images/fileicons/txt.gif" alt="Text File: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.zip')"><img src="/images/fileicons/zip.gif" alt="Zip File: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.xml')"><img src="/images/fileicons/xml.gif" alt="XML File: {DisplayName}" /></xsl:when>
						<xsl:when test="contains(FileURL,'.htm') or contains(FileURL,'.html')"><img src="/images/fileicons/htm.gif" alt="HTML File: {DisplayName}" /></xsl:when>
						<xsl:otherwise>
							<img src="/images/fileicons/unknown.gif" alt="Unknown File: {DisplayName}" />
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="fileItemRight">
					<h3><a href="{Folder}/{FileURL}"><xsl:value-of select="DisplayName" /></a></h3>	
					<p class="fileItemSummary"><xsl:value-of select="FileSummary" /></p>
					<p class="fileItemDate"><strong>Last updated: </strong><xsl:value-of select="concat(substring(FileCreated,9,2),'/',substring(FileCreated,6,2),'/',substring(FileCreated,1,4))" /></p>
					<p class="fileItemName"><strong>File name: </strong><xsl:value-of select="FileURL" /></p>
				</div>
			</div>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>