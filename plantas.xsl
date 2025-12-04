<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat"/>

     <!-- Plantilla principal -->
    <xsl:template match="/jardinBotanico">
        <html lang="es">
            <head>
                <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
                <meta charset="utf-8"/>
                <title>Zonas - Jardín Botánico</title>
            </head>
            <body>
                <header>
                    <img src="img/logotipo.png" alt="Reservas"/>
                    <a href="zonas.xml">Zonas</a>
                    <a href="plantas.xml">Plantas</a>
                    <a href="actividades.xml">Actividades</a>
                </header>

                <main id="jardinbotanico">
                    <h1>PLANTAS</h1>
                    <!-- Aplicamos plantilla a todas las plantas -->
                    <xsl:apply-templates select="plantas/planta"/>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para cada planta -->
    <xsl:template match="planta">
        <article class="articulo">
            <!-- Imagen de la planta -->
            <img class="imagen" src="/img/{@foto}" alt="{nombreComun}"/>

            <!-- Nombre común con enlace a Wikipedia -->
            <h2>
                <a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank">
                    <xsl:value-of select="nombreComun"/>
                </a>
            </h2>

            <!-- Luminosidad -->
            <h3>
                <xsl:value-of select="luminosidad"/>
            </h3>
            
            <!-- Imagen de luminosidad si es Alta -->
            <xsl:if test="luminosidad='Alta'">
                <img src="/img/Alta.png" class="alta-icono"/>
            </xsl:if>
        </article>
    </xsl:template>


</xsl:stylesheet>
