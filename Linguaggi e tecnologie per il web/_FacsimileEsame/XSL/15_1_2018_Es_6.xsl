<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    <xsl:output method="xml"/>
    <xsl:template match="*[name()!='z'and name()!='p']">
        <xsl:copy>
            <xsl:copy/>
                <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="z">
        <xsl:copy>
            <trasf/>
        </xsl:copy>

    </xsl:template>
    <xsl:template match="/*//y">
        <nuovo>
            <xsl:element name="sottoelem">
                <xsl:attribute name="{name()}">elemY</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </nuovo>
    </xsl:template>

    <xsl:template match="text()">
        <nodotesto>
            <xsl:attribute name="attr">
                <xsl:value-of select="../text()"/>
            </xsl:attribute>
            TESTO TROVATO
        </nodotesto>
    </xsl:template>

</xsl:stylesheet>