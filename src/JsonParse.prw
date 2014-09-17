/*Copyright [2014] [Cladimir lima bubans]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.*/
#include "Protheus.ch"
CLASS JsonParse
	DATA cJSON
	DATA nPos
	DATA cCharPos
		
	METHOD New() CONSTRUCTOR
	METHOD ParseToObj()
	
	METHOD Clean() 
	
	METHOD NextChar()
	
	METHOD nextValue()
	
	METHOD readObject()
	METHOD readArray()
	METHOD readChar()
	METHOD readUndef() 
	
ENDCLASS
		
METHOD New(_cJson) CLASS JsonParse
::cJSON := _cJson
RETURN SELF

METHOD ParseToObj() CLASS JsonParse
	Local cKEY := ''
	Local cSTR
	Local UndefVar
	Local oJsonObj := JsonObject():New()
	::nPos:= 1 // ignoro o '{' inicial
	
	::Clean() 
	
	While(::nPos < Len(::cJson))
		cSTR:= ""
		if(::NextChar() == '"')
			While ::NextChar() != '"'   
				cSTR += ::cCharPos
			EndDo
		endIf
		
		if ::cCharPos != '}'
			if ::nPos < Len(::cJson)
				if(::NextChar() == '{')
					UndefVar := ::readObject()
				ElseIf (::cCharPos == '[')
					UndefVar := ::readArray()
				ElseIf (::cCharPos == '"')
					UndefVar := ::readChar()
				Else 
					UndefVar := ::readUndef()
				EndIf
				
				oJsonObj:PutVal(cSTR,UndefVar)
				
			EndIF
		EndIf
	EndDo
	
Return oJsonObj

METHOD readObject() CLASS JsonParse
	Local UndefVar
	Local cSTR 
	Local oItem := JsonObject():New()
	
	if upper(::cCharPos) == "N"  .AND. upper(substr(::cJSON,::nPos,4)) == "NULL"//is null
		::NextChar()
		::NextChar()
		::NextChar()
		RETURN oItem 
	EndIF
	
	while(::cCharPos != '}')
		cSTR:= "" 
		if(::NextChar() == '"')
			While ::NextChar() != '"'   
				cSTR += ::cCharPos
			EndDo
		endIf
		if ::cCharPos != '}'
			if(::NextChar() == '{')
				UndefVar := ::readObject()
			ElseIf (::cCharPos == '[')
				UndefVar := ::readArray()
			ElseIf (::cCharPos == '"')
				UndefVar := ::readChar()
			Else
				UndefVar := ::readUndef()
			EndIf
			
			oItem:PutVal(cSTR ,UndefVar)
		EndIF 
	EndDo

RETURN oItem

METHOD readArray() CLASS JsonParse
	Local aVals := {}
	Local cVal := ''
	Local oItem
	Local lHasNext := .T.
	Local var := 0
	Local var1 := 0
	Local isNumber := .F.
	
	if(::NextChar() == '{')
		
		While (lHasNext)
			oItem := ::readObject()
			aadd(aVals,oItem)
			
			if ::NextChar() == ','
				::NextChar()
			ElseIf ::cCharPos == ']'
				lHasNext := .F.
			EndIF
		EndDo
		
	else
		while ::cCharPos != ']' 
			cVal += ::cCharPos
			::NextChar()
		EndDo
		aVals := STRTOKARR(cVal, ',')	
		
		for var:= 1 to Len(aVals)
			if(ValType(aVals[var]) == "C")
				if (upper(aVals[var]) == 'FALSE' .OR. upper(aVals[var]) == '.F.')
					aVals[var] := .F.
					break
				ElseIf (upper(aVals[var]) == 'TRUE' .OR. upper(aVals[var]) == '.T.')
					aVals[var] := .T.
					break
				EndIF
				
				for var1:= 1 to Len(aVals[var])
					If ( (asc(substr(aVals[var],var1,1)) >= 48 .AND. asc(substr(aVals[var],var1,1)) <= 57) ;
							.OR. ( asc(substr(aVals[var],var1,1)) == 44 .OR. asc(substr(aVals[var],var1,1)) == 46 ) )
						isNumber := .T.	
					Else
						isNumber := .F.
					Endif
				next
				if(isNumber)
					aVals[var] := VAL(aVals[var])
				endIf
			endIf
		next
	endIf
	
RETURN aVals

METHOD readChar() CLASS JsonParse
	Local cStr := ""
	
	while ::NextChar(.T.) != '"'
		cStr += ::cCharPos
	EndDo
	
	::NextChar()
RETURN cStr 

METHOD readUndef() CLASS JsonParse
	Local cStr := ""
	
	while ::NextChar() != ' '
		cStr += ::cCharPos
	EndDo
		
RETURN cStr 

METHOD NextChar(lAnyChar) CLASS JsonParse
	Local lCharValid := .f.
	Local cNextChar:= ""
	DEFAULT lAnyChar := .F.
	
	while !lCharValid
		::nPos++
		cNextChar := substr(::cJSON,::nPos,1)
		
		if(lAnyChar)
			lCharValid := .T.
		Elseif (cNextChar == ' ') .OR. (cNextChar == ':')
			lCharValid := .F.
		ElseIF ((cNextChar == '/') .AND. ((substr(::cJSON,::nPos+1,1)=='*') .OR. (substr(::cJSON,::nPos+1,1)=='/')))
			lCharValid := .F.		
			::nPos++
		Else
			lCharValid := .T.		
		endIf
	EndDo
	::cCharPos := cNextChar 
Return cNextChar

METHOD Clean() CLASS JsonParse
Local aRem := {(CHR(13)+ CHR(10)),CHR(13),CHR(10),CHR(9),CHR(11)}
Local var := 0
Local aChar := {}

for var:= 1 to Len(aRem)
	::cJson := STRTRAN(::cJson ,aRem[var],"")	
next
::cJson := LTRIM(::cJson)
RETURN