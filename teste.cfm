<cffile action="read"
    file="/opt/coldfusion2016/cfusion/wwwroot/leitura/arquivo.txt"
    variable="result">

<cfdump var="#result#">

<cfset end = false>
<cfset linhas = ArrayNew(1)>
<cfset linhaI = 1>
<cfset linhaF = 23>

<cfloop condition="not end">
    <br>
    <br>início:  <cfdump var="#linhaI#">
    <br>qtd.:  <cfdump var="#linhaF#">

    <cfset linha = mid(result, linhaI, linhaF)>

    <cfset ArrayAppend(linhas, linha)>
    <cfset processar(linha)>

    <cfset linhaI = linhaI + linhaF>
    <cfset qtd = mid(result, linhaI, 3)>

    <cfif not IsNumeric(qtd)>
        <cfset end = true>
    <cfelse>
        <cfset linhaF = qtd + 3>
    </cfif>
</cfloop>

<cffunction name="processar" method="private" return="void" output="true">
    <cfargument name="linhaProcessar" type="string" required="true">

    <br>Procesar: <b>#linhaProcessar#</b>
</cffunction>

<cfdump var="#linhas#">
<br>ok
    