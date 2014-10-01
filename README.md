JsonLib uma biblioteca Json para AdvPL
=====================================

Com esta biblioteca é possível fazer a leitura, e escrita da formatação Json, alem disso é possivel a busca de dados de forma fácil, e intuitiva.

Toda a biblioteca foi desenvolvida utilizando os conceitos de Orientação a Objeto ADVPL, então se quiser aprender um pouco sobre isso, Confira os fontes, eles ficaram simples e fáceis de interpretar.

#### Nota
Para testar a Rotina foi feita a implementação de todos os exemplos da página 
**http://json.org/example.html** o arquivo fonte com este conteudo é o **src/TESTEJSON.PRW**, neste
mesmo arquivo há inumeros outros exemplos.

## Introdução

Atualmente o ADVPL já possui uma biblioteca para suporte a Json disponível no link 
https://github.com/imsys/JSON-ADVPL, entretanto decidi criar uma nova biblioteca pelos seguintes
motivos:

* Prefiro licenças mais permissivas, usei a Licença Apache 2.0 (que não possui copyleft).

* ADVPL OO, que se encontra pouco material na Internet(só se encontra os mesmos exemplos).

* Criar algo, que seja mais "parecido", como o JAVA, trata este tipo de formatação.

* Alem disso por algum motivo, não consegui extrair informações de um JSON utilizando a biblioteca JSON-ADVPL.

## Como utilizar

Basta compilar os seguintes arquivos na ordem abaixo no seu RPO:

* ENTRY.PRW
* Map.PRW
* JsonParse.PRW
* JsonObject.PRW


##Exemplos

### Para criar um objeto Json
    /*/{Protheus.doc} TESTJS0
    Neste exemplo demonstro como montar
    este JSON
    {"employees":[
        {"firstName":"John", "lastName":"Doe"}, 
        {"firstName":"Anna", "lastName":"Smith"},
        {"firstName":"Peter", "lastName":"Jones"}
    ]}
    Fonte do JSON //http://www.w3schools.com/json/
    @author desenvolvimento
    @since 16/09/2014
    @version 1.0
    @return ${null}, ${null}
    @example
    (examples)
    @see 
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

### Para fazer um Parse de um Json
    /*/{Protheus.doc} TESTJSA
    Neste exemplo mostro como fazer o parse de um Json e 
    tambem com extrair informações
    Fonte do JSON http://json.org/example
    
    {"menu": {
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
    }}
    @author desenvolvimento
    @since 17/09/2014
    @version 1.0
    @return ${return}, ${return_description}
    @example
    (examples)
    @see (links_or_references)
    /*/USER FUNCTION TESTJSA()
    Local nPos := 0
    Local oJson := JsonObject():New()
    Local aVar := {}
    Local var := 0
    Local cJson := '{"menu": {    													'
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
    cJson+= '}}           '
    
    oJson:Parse(cJson)
    MsgAlert(oJson:GetUndef("menu"):GetUndef("header"),"RESULTADO")
    
    aVar := oJson:GetUndef("menu"):GetUndef("items")
    
    for var:= 1 to Len(aVar)
    	MsgAlert("ID " + aVar[var]:GetCharac("id") + "/ LABEL " + aVar[var]:GetCharac("label"), "RESULTADO")
    next
    
    RETURN

    
**Para mais exemplos consulte src/TESTEJSON.PRW.**