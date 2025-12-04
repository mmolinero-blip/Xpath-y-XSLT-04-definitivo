<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!-- Variable con el mes a mostrar (11 = noviembre) -->
    <xsl:variable name="mes">11</xsl:variable>
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />
    
    <!-- PLANTILLA RAÍZ -->
    <xsl:template match="/">
        <html>
            <head>
                <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
                <meta charset="utf-8"/>
                <title>Actividades</title>
            </head>
            
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas"/>
                    <a href="zonas.html">Zonas</a>
                    <a href="plantas.html">Plantas</a>
                    <a href="actividades.html">Actividades</a>
                </header>
                
                <main>
                    <h1>Actividades del mes <xsl:value-of select="$mes"/></h1>
                    
                    <!-- Aplicamos plantillas SOLO a actividades cuyo mes coincide -->
                    <xsl:apply-templates 
                        select="jardinBotanico/actividades/actividad
                            [substring(fechaHora,6,2) = $mes]">
                        <!-- Ordenadas por fecha -->
                        <xsl:sort select="fechaHora" data-type="text" order="descending"/>
                    </xsl:apply-templates>
                    
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    
    <!-- PLANTILLA PARA CADA ACTIVIDAD -->
    <xsl:template match="actividad">
        <article class="actividades">
            
            <!-- Título + total responsables -->
            <h4>
                <xsl:value-of select="titulo"/> -
                <xsl:value-of select="count(responsables/responsable)"/>
                <xsl:text> Responsable</xsl:text>
                <xsl:if test="count(responsables/responsable) != 1">s</xsl:if>
            </h4>
            
            <!-- FECHA -->
            <h2>
                Fecha: 
                <xsl:value-of select="substring(fechaHora,1,10)"/>
            </h2>
            
            <!-- HORA -->
            <h2>
                Hora: 
                <xsl:value-of select="substring(fechaHora,12,5)"/>
            </h2>
            
            <!-- LUGAR -->
            <h2>
                Lugar: 
                <xsl:value-of select="@sala"/>
            </h2>
            
            <!-- RESPONSABLES -->
            <ul>
                <xsl:apply-templates select="responsables/responsable"/>
            </ul>
            
        </article>
    </xsl:template>
    
    
    <!-- PLANTILLA PARA CADA RESPONSABLE -->
    <xsl:template match="responsable">
        <li>
            <xsl:value-of select="nomresponsable"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="email"/>
        </li>
    </xsl:template>
    
    

</xsl:stylesheet>

