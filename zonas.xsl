<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />
    
    <!-- Plantilla principal -->
    <xsl:template match="/jardinBotanico">
        <html>
            <head>
                <link href="css/estilo.css" rel="stylesheet"/>
                <title>Zonas - Jardín Botánico</title>
            </head>
            <body>
                <header>
                    <img src="img/logotipo.png" alt="Reservas"/>
                    <a href="zonas.html">Zonas</a>
                    <a href="plantas.html">Plantas</a>
                    <a href="actividades.html">Actividades</a>
                </header>
                
                <main>
                    <h1>ZONAS</h1>
                    <table>
                        <tr>
                            <th>Nombre</th>
                            <th>Ubicación</th>
                            <th>Horario</th>
                        </tr>
                        
                        <!-- Aplicamos plantillas solo a zonas cuya apertura sea antes de las 10:00 -->
                        <xsl:apply-templates select="/jardinBotanico/zonas/zona[
                                number(substring-before(horarioapertura, ':')) &lt;= 10]"/>
                    </table>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para cada zona -->
    <xsl:template match="zona">
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td>
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="contains(ubicacion, 'Exterior')">azul</xsl:when>
                        <xsl:otherwise></xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="ubicacion"/>
            </td>
            <td>
                <xsl:value-of select="horarioapertura"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="horariocierre"/>
            </td>
        </tr>
    </xsl:template>        
</xsl:stylesheet>