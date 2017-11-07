<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
      <html>
        <head>
          
          <style>
            table{
            border-width : 3px;
            border-style : solid;
            width : 100%;
            bordercolor-color : E6E6E6;
            border-collapse: collapse
            }
            
            td {
            width : 30%;
            border-style : solid;
            padding : 5px;
            }
            th{
            border-width : 3px;
            border-style : solid;
            text-align: center;
            width : 30%;
            background-color: #D3D3D3;
            bordercolor-color : E6E6E6;
            border-collapse: collapse
            }



          </style>
        </head>
        <body>
          <!--variables-->
          <xsl:variable name="header">
            <tr>
              <th>Date</th>
              <th>Home</th>
              <th>Visitor</th>
            </tr>
          </xsl:variable>

          <xsl:variable name="title1">
            <table>
              <td align ="center">
                <font color="Blue" size ="25">Basketball Scores, Fall 2017 </font>
              </td>
            </table>
          </xsl:variable>

          <xsl:variable name="title2">
            <table>
              <td align ="center">
                <font color="Blue" size ="25"> Home Game at Miami </font>
              </td>
            </table>
          </xsl:variable>
          <!-- end variables-->
          
          
          
          <xsl:copy-of select="$title1"/>
          
         <!-- First table -->
          <table>
            <xsl:copy-of select="$header"/>
            <xsl:apply-templates select="teamscores/season/game"/>
            <!--<xsl:for-each select="teamscores/season/game">
              <tr>
                <td align="center">
                  Date: <xsl:apply-templates select="date"/><br />
                </td>
                <td>
                  <xsl:apply-templates select="team1"/>
                  <xsl:value-of select="team1/@score"/>
                  <xsl:if test="team1/@score > team2/@score">
                    <text >*</text>
                  </xsl:if>
                </td>
                <td>
                  <xsl:apply-templates select="team2"/>
                  <xsl:value-of select="team2/@score"/>
                  <xsl:if test="team2/@score > team1/@score">
                    <text >*</text>
                  </xsl:if>
                </td>
              </tr>
            </xsl:for-each>-->
           
          </table>

          <!-- end First table -->
          <br />
          <br />
          <!-- Second table -->
          <xsl:copy-of select="$title2"/>
          <table>
            <xsl:copy-of select="$header"/>

            <xsl:for-each select="teamscores/season/game">
              <xsl:if test="team1 = 'MIA'">
              <tr>
                <td align="center">
                  Date: <xsl:apply-templates select="date"/><br />
                </td>
                <td>
                  <xsl:apply-templates select="team1"/>
                  <xsl:value-of select="team1/@score"/>
                  <xsl:if test="team1/@score > team2/@score">
                    <text >*</text>
                  </xsl:if>
                </td>
                <td>
                  <xsl:apply-templates select="team2"/>
                  <xsl:value-of select="team2/@score"/>
                  <xsl:if test="team2/@score > team1/@score">
                    <text >*</text>
                  </xsl:if>
                </td>
              </tr>
              </xsl:if>
            </xsl:for-each>
            
          </table>

          <!-- End Second table -->
        </body>
      </html>
    </xsl:template>
  
  
  <xsl:template match="game">
    <!--<xsl:for-each select="teamscores/season/game">-->
      <tr>
        <td align="center">
          Date: <xsl:apply-templates select="date"/><br />
        </td>
        <td>
          <xsl:apply-templates select="team1"/>
          <xsl:value-of select="team1/@score"/>
          <xsl:if test="team1/@score > team2/@score">
            <text >*</text>
          </xsl:if>

        </td>
        <td>
          <xsl:apply-templates select="team2"/>
          <xsl:value-of select="team2/@score"/>
          <xsl:if test="team2/@score > team1/@score">
            <text >*</text>
          </xsl:if>
        </td>
      </tr>
    <!--</xsl:for-each>-->

  </xsl:template>
</xsl:stylesheet>
