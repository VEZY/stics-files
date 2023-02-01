<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" />

    <xsl:template match="/fichiersta">
        <xsl:apply-templates select="nbplantes" />
      <xsl:apply-templates
            select="plante[attribute::dominance='1']" />
      <xsl:apply-templates
            select="plante[attribute::dominance='2']" />
      <xsl:apply-templates select="sol" />
      <xsl:apply-templates
            select="snow" />
    </xsl:template>


</xsl:stylesheet>