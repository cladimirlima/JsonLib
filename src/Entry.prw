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
CLASS Entry
	DATA KEY
	DATA VALUE
	
	METHOD New() CONSTRUCTOR
	METHOD GetKey()
	METHOD GetVALUE()
	METHOD SetVALUE()
	METHOD SetKEY_()
	METHOD ToJson()
ENDCLASS

METHOD New(_KEY,_VALUE) CLASS Entry
::KEY = _KEY
::VALUE= _VALUE
RETURN self

METHOD GetKey() CLASS Entry
RETURN ::KEY

METHOD GetVALUE() CLASS Entry
RETURN ::VALUE

METHOD SetVALUE(_VALUE) CLASS Entry
::VALUE = _VALUE
RETURN 
METHOD SetKEY_(_KEY) CLASS Entry
::KEY := _KEY
RETURN

METHOD ToJson() CLASS Entry
	LOCAL cRet
	LOCAL oObj
	Local var := 0
	
	IF ValType(::VALUE) == "C"
		cRet := '"'+::KEY+'"'+': '+'"'+::VALUE+'"'
	ELSEIF ValType(::VALUE) == "N" .OR. ValType(::VALUE) == "F"
		cRet := '"'+::KEY+'"'+': '+Alltrim(str(::VALUE))
	ELSEIF ValType(::VALUE) == "L"
		If(::VALUE)
			cRet := '"'+::KEY+'"'+': '+'true'
		Else
			cRet := '"'+::KEY+'"'+': '+'false'
		EndIf				
	ELSEIF ValType(::VALUE) == "D"
		cRet := '"'+::KEY+'"'+': '+'"'+dtoc(::VALUE)+'"'
	ELSEIF ValType(::VALUE) == "O"
		oObj := ::VALUE
		cRet :=  '"'+::KEY+'"' +': '+oObj:ToJson()
	ELSEIF ValType(::VALUE) == "A"
		if Len(::VALUE) > 0 
			cRet :=  '"'+::KEY+'"' +': ['
			
			if  ValType(::VALUE[1]) == "O"
				for var:= 1 to Len(::VALUE)
					oObj :=  ::VALUE[var]
					cRet += oObj:ToJson()
					If var < Len(::VALUE)
						cRet += ', '
					EndIF
				next
			else
				for var:= 1 to Len(::VALUE)
					If ValType(::VALUE[var]) == "C"
						cRet += '"'+alltrim(::VALUE[var])+'"'
					ELSEIF ValType(::VALUE[var]) == "N" .OR. ValType(::VALUE[1]) == "F" 
						cRet += alltrim(str(::VALUE[var]))
					ELSEIF ValType(::VALUE[var]) == "L" 
						if(::VALUE[var])
							cRet += "true"												
						Else
							cRet += "false"
						EndIf
					ELSEIF ValType(::VALUE[var]) == "D"
						cRet += dtoc(::VALUE[var])
					ENDIF
					
					If var < Len(::VALUE)
						cRet += ', '
					EndIF
				next
			EndIF
			
			cRet += ']' 
		EndIf
	ENDIF
	
	
		
RETURN cRet