<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <xsl:output method="html"/>


    <!--1) ogni elemento <t> viene copiato in output come elemento table, e il valore dell’attributo b (se presente) viene copiato
    in output come valore dell’attributo border di table.
    per gli attributi @nome_attributo
    Inoltre, il contenuto di t viene ricorsivamente trasformato;
 -->

    <xsl:template match="t">
        <table>
            <xsl:attribute name="border">
                <xsl:apply-templates select="@b"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </table>

    </xsl:template>


    <!--2) ogni elemento <r> che `e contenuto (a qualsiasi livello di annidamento) in un elemento t viene copiato in output come elemento tr,
    e il suo contenuto viene ricorsivamente trasformato;
    -->
    <xsl:template match="t//r">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <!-- 3) ogni elemento <com> non viene copiato in output, e il suo contenuto
    viene ignorato;-->
    <xsl:template match="com"/>


    <!-- 4) ogni elemento <cel> che `e contenuto (a qualsiasi livello di annidamento) in un elemento r viene copiato
    in output come elemento td, e il suo contenuto viene ricorsivamente trasformato;-->

    <!-- La doppia barra ‘//’ consente di individuare tutti i discendenti di un particolare elemento
     a qualsiasi livello-->
    <xsl:template match="r//cel">
        <xsl:element name="td">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- 5) ogni altro elemento di input non viene
copiato in output, e il suo contenuto viene ricorsivamente trasformato;
    -->
    <xsl:template match="*">
        <xsl:apply-templates/>
    </xsl:template>


    <!--6) ogni nodo di tipo testo che `e figlio di un elemento
    td viene copiato in output, mentre tutti gli altri nodi testuali vanno ignorati.
    -->

    <xsl:template match="text()">
        <xsl:choose>
            <!-- al posto di cel andrebbe td, ma non funziona -->
            <xsl:when test="parent::cel">
                <xsl:copy/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>