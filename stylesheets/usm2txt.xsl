<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" />

    <xsl:param name="nomusm" select="initialValue" />
    <xsl:param name="newline" select="'&#xD;&#xA;'" />
    <xsl:param name="space" select="'&#160;'" />
    <xsl:variable name="numsol2" select="'&#160;&#160;&#160;&#160;&#160;1&#160;&#160;&#160;'" />

    <xsl:template match="/usms">
        <xsl:apply-templates select="usm[attribute::nom=$nomusm]" />
    </xsl:template>

    <xsl:template match="usm">
        <xsl:text>:codesimul</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:if test="codesimul='0'">culture</xsl:if>
        <xsl:if
            test="codesimul='1'">feuille</xsl:if>
        <xsl:value-of select="$newline" />
        <xsl:text>:codoptim</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:text>0</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:text>:codesuite</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:text>0</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:text>:nbplantes</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of select="concat(nbplantes,$newline)" />
        <xsl:text>:nom</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of select="concat($nomusm,$newline)" /> 
        <xsl:text>:datedebut</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of select="concat(datedebut,$newline)" />
        <xsl:text>:datefin</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of select="concat(datefin,$newline)" />
        <xsl:text>:finit</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of select="concat(finit,$newline)" />
        <xsl:text>:numsol</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:text>1</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:text>:nomsol</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:value-of
            select="concat(nomsol,$newline)" />
        <xsl:text>:fstation</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:value-of
            select="concat(fstation,$newline)" />
        <xsl:text>:fclim1</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of
            select="concat(fclim1,$newline)" />
        <xsl:text>:fclim2</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:value-of
            select="concat(fclim2,$newline)" />
        <xsl:text>:nbans</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:if test="culturean='1'">1</xsl:if>
        <xsl:if test="culturean!='1'">2</xsl:if>
        <xsl:value-of
            select="$newline" />
        <xsl:text>:culturean</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:value-of select="concat(culturean,$newline)" />
        <xsl:apply-templates select="plante[1]" />
        <xsl:apply-templates
            select="plante[2]" />
    </xsl:template>

    <xsl:template match="plante[1]">
        <xsl:text>:fplt1</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:value-of
            select="concat(fplt,$newline)" />
        <xsl:text>:ftec1</xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:value-of
            select="concat(ftec,$newline)" />
        <xsl:text>:flai1</xsl:text>
        <xsl:value-of
            select="$newline" />
        <xsl:value-of
            select="concat(flai,$newline)" />
    </xsl:template>


    <xsl:template match="plante[2]">
        <!-- We first check if the second plant exists -->
        <xsl:if test="fplt != 'null'">
            <xsl:text>:fplt2</xsl:text>
            <xsl:value-of select="$newline" />
            <xsl:value-of
                select="concat(fplt,$newline)" />
            <xsl:text>:ftec2</xsl:text>
            <xsl:value-of
                select="$newline" />
            <xsl:value-of
                select="concat(ftec,$newline)" />
            <xsl:text>:flai2</xsl:text>
            <xsl:value-of
                select="$newline" />
            <xsl:value-of
                select="concat(flai,$newline)" />
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>