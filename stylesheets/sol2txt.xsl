<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="text" />

   <xsl:param name="nomsol" select="initialValue" />
   <xsl:param name="newline" select="'&#xD;&#xA;'" />
   <xsl:param name="space" select="'&#32;'" />
   <xsl:variable name="numsol2" select="'&#32;&#32;&#32;&#32;&#32;1&#32;&#32;&#32;'" />

   <xsl:template match="/sols">
      <xsl:apply-templates select="sol[attribute::nom=$nomsol]" />
   </xsl:template>

   <xsl:template match="sol">
      <xsl:value-of select="$numsol2" /> 
      <xsl:value-of select="concat(@nom,$space)" /> 
      <xsl:apply-templates
         select="param" />
      <xsl:value-of select="concat($newline,$numsol2)" /> 
      <xsl:apply-templates
         select="option" />
      <xsl:value-of select="concat($newline,$numsol2)" /> 
      <xsl:apply-templates
         select="option//choix" />
      <!-- <xsl:value-of select="concat($newline,$numsol2)" />  -->
      <xsl:apply-templates select="tableau_entete" />
      <!-- <xsl:value-of select="concat($newline,$numsol2)" />  -->
      <xsl:apply-templates
         select="tableau" />
   </xsl:template>

   <xsl:template match="param">
      <xsl:value-of select="concat(.,$space)" /></xsl:template>

   <xsl:template match="option">
      <xsl:value-of select="concat(@choix,$space)" /></xsl:template>

   <xsl:template match="choix">
      <xsl:apply-templates select="param" />
   </xsl:template>

   <xsl:template match="tableau_entete"></xsl:template>

   <xsl:template match="tableau">
      <xsl:value-of select="concat($newline,$numsol2)" /> 
      <xsl:apply-templates select="colonne" />
   </xsl:template>

   <xsl:template match="colonne">
      <xsl:value-of select="concat(.,$space)" /></xsl:template>

</xsl:stylesheet>