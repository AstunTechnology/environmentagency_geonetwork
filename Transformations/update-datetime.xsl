<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.isotc211.org/2005/gmd"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:gml="http://www.opengis.net/gml"
                xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:eamp="http://environment.data.gov.uk/eamp"
                xmlns:geonet="http://www.fao.org/geonetwork"
                xsi:schemaLocation="http://www.isotc211.org/2005/gmd
                                                http://www.isotc211.org/2005/gmd/gmd.xsd
                                                http://www.isotc211.org/2005/gmx 
                                                http://eden.ign.fr/xsd/isotc211/isofull/20090316/gmx/gmx.xsd"
                exclude-result-prefixes="geonet">
                
   
	<xsl:template match="gmd:MD_Metadata" priority="100">
		<MD_Metadata xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://www.isotc211.org/2005/gmd/gmd.xsd http://www.isotc211.org/2005/gmx http://eden.ign.fr/xsd/isotc211/isofull/20090316/gmx/gmx.xsd">
			<xsl:apply-templates select="node()" />
		</MD_Metadata>
	</xsl:template>
	
	<xsl:template match="*" priority="0">
		<xsl:element name="{name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{name()}">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:for-each>	
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>	
	
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

</xsl:stylesheet>
