<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!--	Transformation for EAMP extended metadata, swapping datestamp from date to datetime format to keep data.gov.uk happy
-->

<xsl:stylesheet version="1.0" exclude-result-prefixes="#all" xmlns:geonet="http://www.fao.org/geonetwork" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:eamp="http://environment.data.gov.uk/eamp" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
	        
	<!-- change date element to datetime -->        
	 <xsl:template match="gmd:dateStamp">
         <xsl:choose>
			<xsl:when test="/root/env/changeDate">
				<xsl:copy>
					<gco:DateTime><xsl:value-of select="/root/env/changeDate"/></gco:DateTime>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
        </xsl:template>

	<!-- copy All -->
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<!-- Remove geonet:* elements. -->
    <xsl:template match="geonet:*" priority="2"/>
	
</xsl:stylesheet>
