<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="XMLSearch">
		<div class="SKPosts">
			<table id="ocsList" class="ocsTable">
				<thead>
					<tr>
						<th class="league col1">Trust or CCG name</th>
						<th class="league">Type</th>
						<th class="league">Local network</th>
						<th class="studies">Number of studies recruiting 2017/18</th>
						<th class="studies">Number of studies recruiting 2018/19</th>
						<th class="studies">Percentage change</th>
						<th class="patients">Participants in studies 2017/18</th>
						<th class="patients">Participants in studies 2018/19</th>
						<th class="patients">Percentage change</th>
					</tr>
				</thead>
				<tbody>
					<xsl:apply-templates select="leagueEntry"/>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="leagueEntry">
		<tr class="ocsRow">
			<td>
				<a href="league-table-details.htm?ODSCode={ODSCode}">
					<strong>
						<xsl:value-of select="Name"/>
					</strong>
				</a>
			</td>
			<td>
				<xsl:value-of select="Type"/>
			</td>
			<td>
				<xsl:value-of select="LCRN"/>
			</td>
			<td>
				<xsl:value-of select="RS1718"/>
			</td>
			<td>
				<xsl:value-of select="RS1819"/>
			</td>
			<xsl:choose>
				<xsl:when test="percentChange!='-'">
					<td data-sort="{percentChange}">
						<xsl:value-of select="format-number(percentChange, &apos;###,###,##0.0%&apos;)"/>
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td data-sort="100000"> -</td>
				</xsl:otherwise>
			</xsl:choose>
			<td>
				<xsl:value-of select="Rec1718"/>
			</td>
			<td>
				<xsl:value-of select="Rec1819"/>
			</td>
			<xsl:choose>
				<xsl:when test="count(percentRecChange)!=0">
					<td data-sort="{percentRecChange}">
						<xsl:value-of select="format-number(percentRecChange, &apos;###,###,##0.0%&apos;)"/>
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td data-sort="100000"> -</td>
				</xsl:otherwise>
			</xsl:choose>			
		</tr>
	</xsl:template>
</xsl:stylesheet>