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
CLASS Map

	DATA aENTRY

	METHOD New() CONSTRUCTOR
	METHOD Size()
	METHOD HasKey()
	METHOD HasValue()
	METHOD GetIndex()
	METHOD GetEntry()
	METHOD SetEntry()
	METHOD PutEntry() 
	//METHOD DelEntry()
	METHOD ToJson()
ENDCLASS

METHOD New(_Map) CLASS Map
	::aENTRY := {}	
RETURN SELF

METHOD Size() CLASS Map
RETURN LEN(aEntry)

METHOD HasKey(cKEY) CLASS Map
	Local var := 0
	
	for var:= 1 to Len(::aENTRY)
		if ::aENTRY[var]:GetKey() == cKEY
			RETURN .T.		
		endif
	next
RETURN .F.

METHOD HasValue(uVALUE) CLASS Map
	Local var := 0
	
	for var:= 1 to Len(::aENTRY)
		if type(::aENTRY[var]:GetValue()) == type(var)
			if ::aENTRY[var]:GetValue() == type(var)
				RETURN .T.		
			endif
		endif
	next
RETURN .F.

METHOD GetIndex(cKEY) CLASS Map
	Local var := 0
	
	for var:= 1 to Len(::aENTRY)
		if ::aENTRY[var]:GetKey() == cKEY
			RETURN var		
		endif
	next	
RETURN 0

METHOD GetEntry(cKEY) CLASS Map
	Local var := 0
	local oEntry:= nil
	
	var := ::GetIndex(cKEY)
	
	if(var > 0)
		oEntry := ::aENTRY[var]
	endIf
RETURN oEntry

METHOD SetEntry(oEntry) CLASS Map
	if ::HasKey(oEntry:GetKEY())
		::aENTRY[::GetIndex(oEntry:GetKEY())] := oEntry
	Endif
RETURN 

METHOD PutEntry(oEntry) CLASS Map
	If ::HasKey(oEntry:GetKey())
		::SetEntry(oEntry)
	Else
		aadd(::aENTRY,oEntry)
	Endif
RETURN

METHOD ToJson() CLASS Map
	Local cJson := "{"
	Local var := 0
	Local oEntry
	
	for var:= 1 to Len(::aEntry)
		oEntry := ::aEntry[var]
		cJson += oEntry:ToJson()
		
		if(var < Len(::aEntry))
			cJson += ', ' 
		endIf
	next
	
	cJson += "}"
	
	if Len(::aEntry) == 0
		cJson := "null"	
	endIF
	
	
RETURN cJson 