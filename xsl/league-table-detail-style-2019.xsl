<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:output method="html" version="5" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="XMLSearch">
		<xsl:apply-templates select="leagueEntry"/>
	</xsl:template>
	<xsl:template match="leagueEntry">
		<headoverride>
			<title>
				<xsl:value-of select="Name"/>
			</title>
			<keywords>
				<xsl:value-of select="Name"/>
                <xsl:text>, </xsl:text>
				<xsl:value-of select="Type"/>
                <xsl:text>, LCRN </xsl:text>
				<xsl:value-of select="LCRN"/>
                <xsl:text>, </xsl:text>
				<xsl:value-of select="ODSCode"/>
			</keywords>
			<description>
                <xsl:text>League table details for </xsl:text>
				<xsl:value-of select="Name"/>
                <xsl:text>, </xsl:text>
				<xsl:value-of select="Type"/>
			</description>
			<canonical/>
		</headoverride>
		<h1>
			<xsl:value-of select="Name"/>
		</h1>
		<p class="league">The annual data cut for the period 2018/19 reflects the data in the NIHR Central Portfolio Management System on 26 April 2019. Please note, commercial data is only available for 2014/15 on.</p>
		<p>Type: 
			<strong>
				<xsl:value-of select="Type"/>
			</strong>
			<br/>
            <xsl:text>Clinical research network area: </xsl:text>
			<strong>
				<xsl:value-of select="LCRN"/>
			</strong>
			<br/>
            <xsl:text>ODS code: </xsl:text>
			<strong>
				<xsl:value-of select="ODSCode"/>
			</strong>
			<br/>
			<a href="javascript:history.go(-1)">Back to 2018-19 league table</a>
		</p>
		<div class="researchStudies">
			<h3>Research studies</h3>
			<table class="detailTable">
				<thead>
					<tr>
						<th class="studies column1">Year</th>
						<th class="studies">Total number of studies recruiting</th>
						<th class="studies">Commercial contract studies</th>
					</tr>
				</thead>
				<xsl:if test="RS1314 != 0">
					<tr>
						<td class="colA">2013/14</td>
						<td>
							<xsl:value-of select="RS1314"/>
						</td>
						<td>- </td>
					</tr>
				</xsl:if>
				<tr>
					<td class="colA">2014/15</td>
					<td>
						<xsl:value-of select="RS1415"/>
					</td>
					<td>
						<xsl:value-of select="CRS1415"/>
					</td>
				</tr>
				<tr>
					<td class="colA">2015/16</td>
					<td>
						<xsl:value-of select="RS1516"/>
					</td>
					<td>
						<xsl:value-of select="CRS1516"/>
					</td>
				</tr>
                <tr>
					<td class="colA">2016/17</td>
					<td>
						<xsl:value-of select="RS1617"/>
					</td>
					<td>
						<xsl:value-of select="CRS1617"/>
					</td>
				</tr>
              <tr>
					<td class="colA">2017/18</td>
					<td>
						<xsl:value-of select="RS1718"/>
					</td>
					<td>
						<xsl:value-of select="CRS1718"/>
					</td>
				</tr>
              <tr>
					<td class="colA">2018/19</td>
					<td>
						<xsl:value-of select="RS1819"/>
					</td>
					<td>
						<xsl:value-of select="CRS1819"/>
					</td>
				</tr>
				<tr>
					<td class="colA">% change from 2017/18</td>
					<td>
                        <xsl:choose>
                            <xsl:when test="percentChange != ''">
                                <xsl:value-of select="format-number(percentChange  * 100,&apos;###,###,##0.0&apos;)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>0.0</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>%</xsl:text>
                    </td>
					<td>
                        <xsl:choose>
                            <xsl:when test="CpercentChange != ''">
                                <xsl:value-of select="format-number(CpercentChange  * 100,&apos;###,###,##0.0&apos;)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>0.0</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>%</xsl:text>
                    </td>
				</tr>
			</table>
		</div>
		<div class="patientStudies">
			<h3>Participant involvement in research studies</h3>
			<table class="detailTable">
				<thead>
					<tr>
						<th class="patients column1">Year </th>
						<th class="patients">Total participants in studies</th>
						<th class="patients">Participants in commercial contract studies</th>
					</tr>
				</thead>
				<xsl:if test="Rec1314!= 0">
					<tr>
						<td class="colA">2013/14</td>
						<td>
							<xsl:value-of select="Rec1314"/>
						</td>
						<td>- </td>
					</tr>
				</xsl:if>
				<tr>
					<td class="colA">2014/15</td>
					<td>
						<xsl:value-of select="Rec1415"/>
					</td>
					<td>
						<xsl:value-of select="CRec1415"/>
					</td>
				</tr>
				<tr>
					<td class="colA">2015/16</td>
					<td>
						<xsl:value-of select="Rec1516"/>
					</td>
					<td>
						<xsl:value-of select="CRec1516"/>
					</td>
				</tr>
              	<tr>
					<td class="colA">2016/17</td>
					<td>
						<xsl:value-of select="Rec1617"/>
					</td>
					<td>
						<xsl:value-of select="CRec1617"/>
					</td>
				</tr>
              	<tr>
					<td class="colA">2017/18</td>
					<td>
						<xsl:value-of select="Rec1718"/>
					</td>
					<td>
						<xsl:value-of select="CRec1718"/>
					</td>
				</tr>
             	<tr>
					<td class="colA">2018/19</td>
					<td>
						<xsl:value-of select="Rec1819"/>
					</td>
					<td>
						<xsl:value-of select="CRec1819"/>
					</td>
				</tr>
				<tr>
					<td class="colA">% change from 2017/18</td>
					<td>
                        <xsl:choose>
                            <xsl:when test="percentRecChange != ''">
                                <xsl:value-of select="format-number(percentRecChange  * 100,&apos;###,###,##0.0&apos;)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>0.0</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>%</xsl:text>
                    </td>
					<td>
                        <xsl:choose>
                            <xsl:when test="CpercentRecChange != ''">
                                <xsl:value-of select="format-number(CpercentRecChange  * 100,&apos;###,###,##0.0&apos;)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>0.0</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>%</xsl:text>
                    </td>
				</tr>
			</table>
		</div>
		<p>
			<xsl:value-of select="Notes"/>
		</p>
	</xsl:template>
</xsl:stylesheet>