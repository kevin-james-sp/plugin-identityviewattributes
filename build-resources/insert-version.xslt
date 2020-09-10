<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="version"/>
    <xsl:param name="build"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//Plugin/@version">
        <xsl:attribute name="version">
            <xsl:value-of select="$version"/><xsl:text>.</xsl:text><xsl:value-of select="$build"/>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>