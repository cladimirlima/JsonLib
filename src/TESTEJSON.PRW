#include "Protheus.ch"

USER FUNCTION TESTEJSON()
U_TESTJSA()
return


/*/{Protheus.doc} TESTJS0
Neste exemplo demonstro como montar
este JSON
{"employees":[
    {"firstName":"John", "lastName":"Doe"}, 
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter", "lastName":"Jones"}
]}
@author desenvolvimento
@since 16/09/2014
@version 1.0
@return ${null}, ${null}
@example
(examples)
@see //http://www.w3schools.com/json/
/*/USER FUNCTION TESTJS0()
local oEmpl := JsonObject():New()
local aJson := {}
local oItem := nil
local aDados := {{"John","Doe"},{"Anna","Smith"},{"Peter","Jones"}}
Local var := 0

for var:= 1 to Len(aDados)
	oItem := JsonObject():New()
	oItem:PutVal("firstName", aDados[var][1])
	oItem:PutVal("lastName", aDados[var][2])
	aadd(aJson,oItem)
next
oEmpl:PutVal("employees",aJson)

MsgAlert(oEmpl:ToJson(),"Resultado")
RETURN

//http://pt.wikipedia.org/wiki/JSON
/*{ "Alunos" : [ 
        { "nome": "João", "notas": [ 8, 9, 7 ]  },
        { "nome": "Maria", "notas": [ 8, 10, 7 ] },
        { "nome": "Pedro", "notas": [ 10, 10, 9 ] } 
    ]
}*/
USER FUNCTION TESTJS1()
local oAlun := JsonObject():New()
local aJson := {}
local oItem := nil

oItem := JsonObject():New()
oItem:PutVal("nome","João") 
oItem:PutVal("notas",{8,9,7})
aadd(aJson,oItem)

oItem := JsonObject():New()
oItem:PutVal("nome","Maria") 
oItem:PutVal("notas",{8,10,7})
aadd(aJson,oItem)

oItem := JsonObject():New()
oItem:PutVal("nome","pedro") 
oItem:PutVal("notas",{10,10,9})
aadd(aJson,oItem)

oAlun:PutVal("Alunos",aJson)
MsgAlert(oAlun:ToJson(),"Resultado")

RETURN


//http://json.org/example
/*{ "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}*/
USER FUNCTION TESTJS2()
local oJson := JsonObject():New()
local gary := JsonObject():New()
local GDiv := JsonObject():New()
local GList := JsonObject():New()
local GEntry := JsonObject():New()
local GDef := JsonObject():New()

oJson:PutVal("glossary",gary) 

gary:PutVal("title","example glossary")
gary:PutVal("GlossDiv",GDiv)

GDiv:PutVal("title","S")
GDiv:PutVal("GlossList",GList)

GList:PutVal("GlossEntry",GEntry)

GEntry:PutVal("ID","SGML")
GEntry:PutVal("SortAs","SGML")
GEntry:PutVal("GlossTerm","Standard Generalized Markup Language")
GEntry:PutVal("Acronym","SGML")
GEntry:PutVal("Abbrev","ISO 8879:1986")
GEntry:PutVal("GlossDef",GDef)
GEntry:PutVal("GlossSee","markup")

GDef:PutVal("para","A meta-markup language, used to create markup languages such as DocBook.")
GDef:PutVal("GlossSeeAlso",{"GML","XML"})

MsgAlert(oJson:ToJson(),"Resultado")
RETURN


//http://json.org/example
/*{"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}*/
USER FUNCTION TESTJS3()
local oJson := JsonObject():New()
local oMen := JsonObject():New()
local opop := JsonObject():New()
local oItem := JsonObject():New()
local aJson := {}

oJson:PutVal("menu",oMen)

oMen:PutVal("id","file")
oMen:PutVal("value","File")
oMen:PutVal("popup",opop)

opop:PutVal("manuitem",aJson)

oItem := JsonObject():New()
oItem:PutVal("value","New")
oItem:PutVal("onclick","CreateNewDoc()")
aadd(aJson,oItem)

oItem := JsonObject():New()
oItem:PutVal("value","Open")
oItem:PutVal("onclick","OpenDoc()")
aadd(aJson,oItem)

oItem := JsonObject():New()
oItem:PutVal("value","Close")
oItem:PutVal("onclick","CloseDoc()")
aadd(aJson,oItem)

MsgAlert(oJson:ToJson(),"Resultado")

RETURN

//http://json.org/example
/*{"widget": {
    "debug": "on",
    "window": {
        "title": "Sample Konfabulator Widget",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "image": { 
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    },
    "text": {
        "data": "Click Here",
        "size": 36,
        "style": "bold",
        "name": "text1",
        "hOffset": 250,
        "vOffset": 100,
        "alignment": "center",
        "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
    }
}}*/
USER FUNCTION TESTJS4()
local oJson := JsonObject():New()
local oWidg := JsonObject():New()
local oWind := JsonObject():New()
local oImag := JsonObject():New()
local oText := JsonObject():New()

oJson:PutVal("widget",oWidg)

oWidg:PutVal("debug","on")
oWidg:PutVal("window",oWind)
oWidg:PutVal("image",oImag)
oWidg:PutVal("text",oText)

oWind:PutVal("title","Sample Konfabulator Widget")
oWind:PutVal("name", "main_window")
oWind:PutVal("width", 500)
oWind:PutVal("height", 500)

oImag:PutVal("src", "Images/Sun.png")
oImag:PutVal("name", "sun1")
oImag:PutVal("hOffset", 250)
oImag:PutVal("vOffset", 250)
oImag:PutVal("alignment", "center")

oText:PutVal("data", "Click Here")
oText:PutVal("size",36)
oText:PutVal("style", "bold")
oText:PutVal("name", "text1")
oText:PutVal("hOffset", 250)
oText:PutVal("vOffset", 100)
oText:PutVal("alignment", "center")
oText:PutVal("onMouseUp", "sun1.opacity = (sun1.opacity / 100) * 90;")

MsgAlert(oJson:ToJson(),"Resultado")

RETURN

//http://json.org/example
/*{"web-app": {
  "servlet": [   
    {
      "servlet-name": "cofaxCDS",
      "servlet-class": "org.cofax.cds.CDSServlet",
      "init-param": {
        "configGlossary:installationAt": "Philadelphia, PA",
        "configGlossary:adminEmail": "ksm@pobox.com",
        "configGlossary:poweredBy": "Cofax",
        "configGlossary:poweredByIcon": "/images/cofax.gif",
        "configGlossary:staticPath": "/content/static",
        "templateProcessorClass": "org.cofax.WysiwygTemplate",
        "templateLoaderClass": "org.cofax.FilesTemplateLoader",
        "templatePath": "templates",
        "templateOverridePath": "",
        "defaultListTemplate": "listTemplate.htm",
        "defaultFileTemplate": "articleTemplate.htm",
        "useJSP": false,
        "jspListTemplate": "listTemplate.jsp",
        "jspFileTemplate": "articleTemplate.jsp",
        "cachePackageTagsTrack": 200,
        "cachePackageTagsStore": 200,
        "cachePackageTagsRefresh": 60,
        "cacheTemplatesTrack": 100,
        "cacheTemplatesStore": 50,
        "cacheTemplatesRefresh": 15,
        "cachePagesTrack": 200,
        "cachePagesStore": 100,
        "cachePagesRefresh": 10,
        "cachePagesDirtyRead": 10,
        "searchEngineListTemplate": "forSearchEnginesList.htm",
        "searchEngineFileTemplate": "forSearchEngines.htm",
        "searchEngineRobotsDb": "WEB-INF/robots.db",
        "useDataStore": true,
        "dataStoreClass": "org.cofax.SqlDataStore",
        "redirectionClass": "org.cofax.SqlRedirection",
        "dataStoreName": "cofax",
        "dataStoreDriver": "com.microsoft.jdbc.sqlserver.SQLServerDriver",
        "dataStoreUrl": "jdbc:microsoft:sqlserver://LOCALHOST:1433;DatabaseName=goon",
        "dataStoreUser": "sa",
        "dataStorePassword": "dataStoreTestQuery",
        "dataStoreTestQuery": "SET NOCOUNT ON;select test='test';",
        "dataStoreLogFile": "/usr/local/tomcat/logs/datastore.log",
        "dataStoreInitConns": 10,
        "dataStoreMaxConns": 100,
        "dataStoreConnUsageLimit": 100,
        "dataStoreLogLevel": "debug",
        "maxUrlLength": 500}},
    {
      "servlet-name": "cofaxEmail",
      "servlet-class": "org.cofax.cds.EmailServlet",
      "init-param": {
      "mailHost": "mail1",
      "mailHostOverride": "mail2"}},
    {
      "servlet-name": "cofaxAdmin",
      "servlet-class": "org.cofax.cds.AdminServlet"},
 
    {
      "servlet-name": "fileServlet",
      "servlet-class": "org.cofax.cds.FileServlet"},
    {
      "servlet-name": "cofaxTools",
      "servlet-class": "org.cofax.cms.CofaxToolsServlet",
      "init-param": {
        "templatePath": "toolstemplates/",
        "log": 1,
        "logLocation": "/usr/local/tomcat/logs/CofaxTools.log",
        "logMaxSize": "",
        "dataLog": 1,
        "dataLogLocation": "/usr/local/tomcat/logs/dataLog.log",
        "dataLogMaxSize": "",
        "removePageCache": "/content/admin/remove?cache=pages&id=",
        "removeTemplateCache": "/content/admin/remove?cache=templates&id=",
        "fileTransferFolder": "/usr/local/tomcat/webapps/content/fileTransferFolder",
        "lookInContext": 1,
        "adminGroupID": 4,
        "betaServer": true}}],
  "servlet-mapping": {
    "cofaxCDS": "/",
    "cofaxEmail": "/cofaxutil/aemail/*",
    "cofaxAdmin": "/admin/*",
    "fileServlet": "/static/*",
    "cofaxTools": "/tools/*"},
 
  "taglib": {
    "taglib-uri": "cofax.tld",
    "taglib-location": "/WEB-INF/tlds/cofax.tld"}}}*/
USER FUNCTION TESTJS5()
local oJson := JsonObject():New()
local oWapp := JsonObject():New()
local oSerMap := JsonObject():New()
local otaglib := JsonObject():New()
local oSerItem
local oIniPar 
local aServs := {}

oJson:PutVal("web-app",oWapp)

oSerItem := JsonObject():New()
oIniPar:= JsonObject():New()
oSerItem:PutVal("servlet-name", "cofaxCDS")
oSerItem:PutVal("servlet-class", "org.cofax.cds.CDSServlet")
oSerItem:PutVal("init-param",oIniPar)

oIniPar:PutVal("configGlossary,installationAt", "Philadelphia) PA")
oIniPar:PutVal("configGlossary,adminEmail", "ksm@pobox.com")
oIniPar:PutVal("configGlossary,poweredBy", "Cofax")
oIniPar:PutVal("configGlossary,poweredByIcon", "/images/cofax.gif")
oIniPar:PutVal("configGlossary,staticPath", "/content/static")
oIniPar:PutVal("templateProcessorClass", "org.cofax.WysiwygTemplate")
oIniPar:PutVal("templateLoaderClass", "org.cofax.FilesTemplateLoader")
oIniPar:PutVal("templatePath", "templates")
oIniPar:PutVal("templateOverridePath", "")
oIniPar:PutVal("defaultListTemplate", "listTemplate.htm")
oIniPar:PutVal("defaultFileTemplate", "articleTemplate.htm")
oIniPar:PutVal("useJSP", .F.)
oIniPar:PutVal("jspListTemplate", "listTemplate.jsp")
oIniPar:PutVal("jspFileTemplate", "articleTemplate.jsp")
oIniPar:PutVal("cachePackageTagsTrack", 200)
oIniPar:PutVal("cachePackageTagsStore", 200)
oIniPar:PutVal("cachePackageTagsRefresh", 60)
oIniPar:PutVal("cacheTemplatesTrack", 100)
oIniPar:PutVal("cacheTemplatesStore", 50)
oIniPar:PutVal("cacheTemplatesRefresh", 15)
oIniPar:PutVal("cachePagesTrack", 200)
oIniPar:PutVal("cachePagesStore", 100)
oIniPar:PutVal("cachePagesRefresh", 10)
oIniPar:PutVal("cachePagesDirtyRead", 10)
oIniPar:PutVal("searchEngineListTemplate", "forSearchEnginesList.htm")
oIniPar:PutVal("searchEngineFileTemplate", "forSearchEngines.htm")
oIniPar:PutVal("searchEngineRobotsDb", "WEB-INF/robots.db")
oIniPar:PutVal("useDataStore", .T.)
oIniPar:PutVal("dataStoreClass", "org.cofax.SqlDataStore")
oIniPar:PutVal("redirectionClass", "org.cofax.SqlRedirection")
oIniPar:PutVal("dataStoreName", "cofax")
oIniPar:PutVal("dataStoreDriver", "com.microsoft.jdbc.sqlserver.SQLServerDriver")
oIniPar:PutVal("dataStoreUrl", "jdbc,microsoft:sqlserver://LOCALHOST:1433;DatabaseName=goon")
oIniPar:PutVal("dataStoreUser", "sa")
oIniPar:PutVal("dataStorePassword", "dataStoreTestQuery")
oIniPar:PutVal("dataStoreTestQuery", "SET NOCOUNT ON;select test='test';")
oIniPar:PutVal("dataStoreLogFile", "/usr/local/tomcat/logs/datastore.log")
oIniPar:PutVal("dataStoreInitConns", 10)
oIniPar:PutVal("dataStoreMaxConns", 100)
oIniPar:PutVal("dataStoreConnUsageLimit", 100)
oIniPar:PutVal("dataStoreLogLevel", "debug")
oIniPar:PutVal("maxUrlLength", 500)
aadd(aServs,oSerItem)


oSerItem := JsonObject():New()
oIniPar:= JsonObject():New()

oSerItem:PutVal("servlet-name", "cofaxEmail")
oSerItem:PutVal("servlet-class", "org.cofax.cds.EmailServlet")
oSerItem:PutVal("init-param",oIniPar)

oIniPar:PutVal("mailHost", "mail1")
oIniPar:PutVal("mailHostOverride", "mail2")
aadd(aServs,oSerItem)


oSerItem := JsonObject():New()
oSerItem:PutVal("servlet-name", "cofaxAdmin")
oSerItem:PutVal("servlet-class", "org.cofax.cds.AdminServlet")
aadd(aServs,oSerItem)

oSerItem := JsonObject():New()
oSerItem:PutVal("servlet-name", "fileServlet")
oSerItem:PutVal("servlet-class", "org.cofax.cds.FileServlet")
aadd(aServs,oSerItem)

oSerItem := JsonObject():New()
oIniPar:= JsonObject():New()
oSerItem:PutVal("servlet-name", "cofaxTools")
oSerItem:PutVal("servlet-class", "org.cofax.cms.CofaxToolsServlet")
oSerItem:PutVal("init-param",oIniPar)

oIniPar:PutVal("templatePath", "toolstemplates/")
oIniPar:PutVal("log", 1)
oIniPar:PutVal("logLocation", "/usr/local/tomcat/logs/CofaxTools.log")
oIniPar:PutVal("logMaxSize", "")
oIniPar:PutVal("dataLog", 1)
oIniPar:PutVal("dataLogLocation", "/usr/local/tomcat/logs/dataLog.log")
oIniPar:PutVal("dataLogMaxSize", "")
oIniPar:PutVal("removePageCache", "/content/admin/remove?cache=pages&id=")
oIniPar:PutVal("removeTemplateCache", "/content/admin/remove?cache=templates&id=")
oIniPar:PutVal("fileTransferFolder", "/usr/local/tomcat/webapps/content/fileTransferFolder")
oIniPar:PutVal("lookInContext", 1)
oIniPar:PutVal("adminGroupID", 4)
oIniPar:PutVal("betaServer", .T.)
aadd(aServs,oSerItem)

oWapp:PutVal("servlet",aServs)
oWapp:PutVal("servlet-mapping",oSerMap)

oSerMap:PutVal("cofaxCDS", "/")
oSerMap:PutVal("cofaxEmail", "/cofaxutil/aemail/*")
oSerMap:PutVal("cofaxAdmin", "/admin/*")
oSerMap:PutVal("fileServlet", "/static/*")
oSerMap:PutVal("cofaxTools", "/tools/*")

oWapp:PutVal("taglib",otaglib)

otaglib:PutVal("taglib-uri", "cofax.tld")
otaglib:PutVal("taglib-location", "/WEB-INF/tlds/cofax.tld")

MsgAlert(oJson:ToJson(),"Resultado")

RETURN

//http://json.org/example
/*{"menu": {
    "header": "SVG Viewer",
    "items": [
        {"id": "Open"},
        {"id": "OpenNew", "label": "Open New"},
        null,
        {"id": "ZoomIn", "label": "Zoom In"},
        {"id": "ZoomOut", "label": "Zoom Out"},
        {"id": "OriginalView", "label": "Original View"},
        null,
        {"id": "Quality"},
        {"id": "Pause"},
        {"id": "Mute"},
        null,
        {"id": "Find", "label": "Find..."},
        {"id": "FindAgain", "label": "Find Again"},
        {"id": "Copy"},
        {"id": "CopyAgain", "label": "Copy Again"},
        {"id": "CopySVG", "label": "Copy SVG"},
        {"id": "ViewSVG", "label": "View SVG"},
        {"id": "ViewSource", "label": "View Source"},
        {"id": "SaveAs", "label": "Save As"},
        null,
        {"id": "Help"},
        {"id": "About", "label": "About Adobe CVG Viewer..."}
    ]
}}*/
USER FUNCTION TESTJS6()
local oJson := JsonObject():New()
local oMenu := JsonObject():New()
local oItem  
local aItens := {}

oJson:PutVal("menu",oMenu)

oMenu:PutVal("header", "SVG Viewer")

oItem := JsonObject():New()
oItem:PutVal("id","Open")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","OpenNew")
oItem:PutVal("label","OpenNew")
aadd(aItens,oItem)

oItem := JsonObject():New()
//oItem:PutVal(null)
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","ZoomIn")
oItem:PutVal("label","ZoomIn")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","ZoomOut")
oItem:PutVal("label","ZoomOut")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","OriginalView")
oItem:PutVal("label","OriginalView")
aadd(aItens,oItem)

oItem := JsonObject():New()
//oItem:PutVal(null)
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","Quality")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","Pause")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","Mute")
aadd(aItens,oItem)

oItem := JsonObject():New()
//oItem:PutVal(null)
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","Find")
oItem:PutVal("label","Find...")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","FindAgain")
oItem:PutVal("label","FindAgain")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","Copy")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","CopyAgain")
oItem:PutVal("label","CopyAgain")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","CopySVG")
oItem:PutVal("label","CopySVG")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","ViewSVG")
oItem:PutVal("label","ViewSVG")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","ViewSource")
oItem:PutVal("label","ViewSource")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","SaveAs")
oItem:PutVal("label","SaveAs")
aadd(aItens,oItem)

oItem := JsonObject():New()
//oItem:PutVal(null
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","Help")
aadd(aItens,oItem)

oItem := JsonObject():New()
oItem:PutVal("id","About")
oItem:PutVal("label","AboutAdobeCVGViewer...")
aadd(aItens,oItem)

oMenu:PutVal("items",aItens) 

MsgAlert(oJson:ToJson(),"Resultado")
RETURN


//http://www.w3schools.com/json/
/*{"employees":[
    {"firstName":"John", "lastName":"Doe"}, 
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter", "lastName":"Jones"}
]}*/
USER FUNCTION TESTJS7()
local oJson
local cJson:= '{"employees":[' + CHR(13)
cJson+= '   {"firstName":"John", "lastName":"Doe"},  ' + CHR(10)
cJson+= '   {"firstName":"Anna", "lastName":"Smith"},' + CHR(13)+ CHR(10)
cJson+= '   {"firstName":"Peter", "lastName":"Jones"}' + CHR(13)+ CHR(10)
cJson+= ']}'

oJson := JsonObject():New()
oJson:Parse(cJson)
MsgAlert(oJson:ToJson(),"Resultado")
RETURN

//http://pt.wikipedia.org/wiki/JSON
/*{ "Alunos" : [ 
        { "nome": "João", "notas": [ 8, 9, 7 ]  },
        { "nome": "Maria", "notas": [ 8, 10, 7 ] },
        { "nome": "Pedro", "notas": [ 10, 10, 9 ] } 
    ]
}*/
USER FUNCTION TESTJS8()
local oJson := JsonObject():New()
local cJson:= '{ "Alunos" : [ '
cJson+= '        { "nome": "João", "notas": [ 8, 9, 7 ]  },'
cJson+= '        { "nome": "Maria", "notas": [ 8, 10, 7 ] },'
cJson+= '        { "nome": "Pedro", "notas": [ 10, 10, 9 ] }' 
cJson+= '    ]'
cJson+= '}'

oJson:Parse(cJson)
MsgAlert(oJson:ToJson(),"Resultado")
RETURN

//http://www.w3schools.com/json/
/*{"employees":[
    {"firstName":"John", "lastName":"Doe"}, 
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter", "lastName":"Jones"}
]}*/
USER FUNCTION TESTJS9()
Local nPos := 0
Local oJson := JsonObject():New()
Local aVar
Local cJson := '{"employees":['
cJson +='     {"firstName":"John", "lastName":"Doe"}, '
cJson +='    {"firstName":"Anna", "lastName":"Smith"},'
cJson +='    {"firstName":"Peter", "lastName":"Jones"}'
cJson +=' ]}'

oJson:Parse(cJson)
aVar := oJson:GetUndef("employees")
for nPos := 1 to Len(aVar)
	MsgAlert(aVar[nPos]:GetUndef("firstName") +" "+ aVar[nPos]:GetUndef("lastName"),'RESULTADO') 
next

RETURN




//http://json.org/example
/*{"menu": {
    "header": "SVG Viewer",
    "items": [
        {"id": "Open"},
        {"id": "OpenNew", "label": "Open New"},
        null,
        {"id": "ZoomIn", "label": "Zoom In"},
        {"id": "ZoomOut", "label": "Zoom Out"},
        {"id": "OriginalView", "label": "Original View"},
        null,
        {"id": "Quality"},
        {"id": "Pause"},
        {"id": "Mute"},
        null,
        {"id": "Find", "label": "Find..."},
        {"id": "FindAgain", "label": "Find Again"},
        {"id": "Copy"},
        {"id": "CopyAgain", "label": "Copy Again"},
        {"id": "CopySVG", "label": "Copy SVG"},
        {"id": "ViewSVG", "label": "View SVG"},
        {"id": "ViewSource", "label": "View Source"},
        {"id": "SaveAs", "label": "Save As"},
        null,
        {"id": "Help"},
        {"id": "About", "label": "About Adobe CVG Viewer..."}
    ]
}}*/
USER FUNCTION TESTJSA()
Local nPos := 0
Local oJson := JsonObject():New()
Local aVar := {}
Local var := 0
Local cJson := '{"menu": {														'
cJson+= '    "header": "SVG Viewer",                                    '
cJson+= '    "items": [                                                 '
cJson+= '        {"id": "Open"},                                        '
cJson+= '        {"id": "OpenNew", "label": "Open New"},                '
cJson+= '        null,                                                  '
cJson+= '        {"id": "ZoomIn", "label": "Zoom In"},                  '
cJson+= '        {"id": "ZoomOut", "label": "Zoom Out"},                '
cJson+= '        {"id": "OriginalView", "label": "Original View"},      '
cJson+= '        null,                                                  '
cJson+= '        {"id": "Quality"},                                     '
cJson+= '        {"id": "Pause"},                                       '
cJson+= '        {"id": "Mute"},                                        '
cJson+= '        null,                                                  '
cJson+= '        {"id": "Find", "label": "Find..."},                    '
cJson+= '        {"id": "FindAgain", "label": "Find Again"},            '
cJson+= '        {"id": "Copy"},                                        '
cJson+= '        {"id": "CopyAgain", "label": "Copy Again"},            '
cJson+= '        {"id": "CopySVG", "label": "Copy SVG"},                '
cJson+= '        {"id": "ViewSVG", "label": "View SVG"},                '
cJson+= '        {"id": "ViewSource", "label": "View Source"},          '
cJson+= '        {"id": "SaveAs", "label": "Save As"},                  '
cJson+= '        null,                                                  '
cJson+= '        {"id": "Help"},                                        '
cJson+= '        {"id": "About", "label": "About Adobe CVG Viewer..."}  '
cJson+= '    ]                                                          '
cJson+= '}}           

oJson:Parse(cJson)
MsgAlert(oJson:GetUndef("menu"):GetUndef("header"),"RESULTADO")

aVar := oJson:GetUndef("menu"):GetUndef("items")

for var:= 1 to Len(aVar)
	MsgAlert("ID " + aVar[var]:GetCharac("id") + "/ LABEL " + aVar[var]:GetCharac("label"), "RESULTADO")
next

RETURN