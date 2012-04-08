unit uacessorios;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil,   LResources,  Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, PairSplitter, StdCtrls, Buttons, ActnList, ComCtrls,
  ButtonPanel, PopupNotifier, EditBtn,  Spin, Grids,
  XMLRead , XMLWrite , xmlutils , XMLPropStorage,
  xmltestreport ,dom,

  Uarrays,
  LCLType, Messages, Variants;
type

{ Tutilitarios }

Tutilitarios = class
   aAlfArray2  :TStringList;
  procedure AlfabeticaEquival(var vetor:Tarray30k);
  procedure AlfabeticaAntonimos(var vetor:Tarray30k);
  procedure frase_array(fa_sfrase: string; var vetor :Tarray500);
  function array_frase( vetor :Tarray500):string;
  function tiraAcento(ta_str1: string): string;

  function  casestr(str1,str2:string):boolean;
  function  casestr(str1,str2,str3:string):boolean;
  function  casestr(str1,str2,str3,str4:string):boolean;
  function  casestr(str1,str2,str3,str4,str5:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,
  str11:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,
  str11,str12:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,
  str11,str12,str13:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,
  str11,str12,str13,str14:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,
  str11,str12,str13,str14,str15:string):boolean;
  function  casestr(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,
  str11,str12,str13,str14,str15,str16:string):boolean;
  constructor create;
  destructor Destroy; override;
end;

{ TDOMDocument_arombed }

TDOMDocument_arombed =class(TDOMDocument)
  public
  function NovaTag(tagName:string):PHashItem;
end;

{ TDOMElementio }

TDOMElementio = class(TDOMElement)

  protected
    FNodeName: DOMString;
   // FAttributes: TDOMNamedNodeMap;
    function GetNodeType: Integer; override;
    function GetNodeName: DOMString; override;

    function GetAttributes: TDOMNamedNodeMap; override;
  public
    /// setnodename nao tem na classe tdomnode original.  #pu$%@@que@@@#$#car%#$o%#@$me%@a#@%$#@%
    function setnodename(name:DOMString):boolean;
    function  CloneNode(deep: Boolean; ACloneOwner: TDOMDocument): TDOMNode; overload; override;
    property  TagName: DOMString read FNodeName;
    procedure Normalize; override;
    function  GetAttribute(const name: DOMString): DOMString;

    function  GetAttributeNode(const name: DOMString): TDOMAttr;
    function SetAttributeNode(NewAttr: TDOMAttr): TDOMAttr;

    // Free NodeList with TDOMNodeList.Release!
    function  GetElementsByTagName(const name: DOMString): TDOMNodeList;

    // Introduced in DOM Level 2:
    function GetAttributeNS(const nsURI, aLocalName: DOMString): DOMString;
    //procedure SetAttributeNS(const nsURI, qualifiedName, value: DOMString);
    procedure RemoveAttributeNS(const nsURI, aLocalName: DOMString);
    function GetAttributeNodeNS(const nsURI, aLocalName: DOMString): TDOMAttr;
    function SetAttributeNodeNS(newAttr: TDOMAttr): TDOMAttr;
    function GetElementsByTagNameNS(const nsURI, aLocalName: DOMString): TDOMNodeList;
    function hasAttribute(const name: DOMString): Boolean;
    function hasAttributeNS(const nsURI, aLocalName: DOMString): Boolean;
    function HasAttributes: Boolean; override;
    function RemoveAttributes:boolean; //fuck self
    // extension
    //function CompareName(const name: DOMString): Integer; override;


  end;

{ openNOde }

{ Tdomtools }

Tdomtools=class
  procedure excluino(noexclusao:TDOMNode);
  procedure DOMnodeToTreenode(DomNode:TDOMNode;TreeNodeAlvo:TTreeNode);
  procedure insereAntes(treenode:TTreeNode;referencia, novono:TDOMNode);
  procedure insereDepois(treenode:TTreeNode;referencia, novono:TDOMNode);
  function  pegaNOfilho(nopai:TDOMNode;endereco:integer):TDOMNode;
  function  getNOorigem(treeview:TTreeView;docxml:TXMLDocument):TDOMNode;
  function  getNOdestino(treeview:TTreeView;docxml:TXMLDocument):TDOMNode ;
  procedure exemploscomDOMnode;
  procedure XML2Tree(tree: TTreeView; XMLDoc: TXMLDocument);
  function criaObjetoXML(nome: string): TXMLDocument;
end;

implementation

{ TDOMDocument_arombed }

function TDOMDocument_arombed.NovaTag(tagName: string): PHashItem;
var
  int1: LongInt;
  str1: String;
begin
  Result:= self.FNames.FindOrAdd(DOMPChar(tagName), Length(tagName));
  Result^.Key:=tagName;  // hiper pog
end;

function Tutilitarios.tiraAcento(ta_str1: string): string;
begin
  if (pos('á',ta_str1)>0)then
  begin
    Insert('a',ta_str1,(pos('á',ta_str1)));
    Delete(ta_str1,(pos('á',ta_str1)),2);
  end;
  if (pos('â',ta_str1)>0)then
  begin
    Insert('a',ta_str1,(pos('â',ta_str1)));
    Delete(ta_str1,(pos('â',ta_str1)),2);
  end;
  if (pos('é',ta_str1)>1)and ((pos(' é ',ta_str1)>pos('é',ta_str1))or(pos(' é ',ta_str1)=0) )  then
  begin
    Insert('e',ta_str1,(pos('é',ta_str1)));
    Delete(ta_str1,(pos('é',ta_str1)),2);
  end;
  if (pos('ê',ta_str1)>0)then
  begin
    Insert('e',ta_str1,(pos('ê',ta_str1)));
    Delete(ta_str1,(pos('ê',ta_str1)),2);
  end;
  if (pos('í',ta_str1)>0)then
  begin
    Insert('i',ta_str1,(pos('í',ta_str1)));
    Delete(ta_str1,(pos('í',ta_str1)),2);
  end;
  if (pos('ó',ta_str1)>0)then
  begin
    Insert('o',ta_str1,(pos('ó',ta_str1)));
    Delete(ta_str1,(pos('ó',ta_str1)),2);
  end;
  if (pos('ú',ta_str1)>0)then
  begin
    Insert('u',ta_str1,(pos('ú',ta_str1)));
    Delete(ta_str1,(pos('ú',ta_str1)),2);
  end;

  result:= ta_str1;
end;

procedure Tutilitarios.frase_array(fa_sfrase: string;var vetor :Tarray500);/////////////////////////////////////////////////
var
  fa_ifrase: integer;
  fa_sfrase2: string;
begin
   fa_sfrase:= trim(fa_sfrase)+' ';
   if Pos('.',fa_sfrase)=Length(fa_sfrase)then fa_sfrase:=fa_sfrase+' ';
   vetor.tamanho:=0;
   for fa_ifrase := 0  to 256 do
   begin//desmfrase ini
    repeat
    if (Pos(', ', fa_sfrase)>1)and (Pos(', ', fa_sfrase)<>(Pos(' , ', fa_sfrase)+1)) then
    begin
     Insert(' ',fa_sfrase,Pos(', ', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos(', ', fa_sfrase));
    end;
      if (Pos(';', fa_sfrase)>1)and (Pos(';', fa_sfrase)<>(Pos(' ; ', fa_sfrase)+1)) then
    begin
     Insert(' ',fa_sfrase,Pos(';', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos(';', fa_sfrase));
    end;
    if (Pos(':', fa_sfrase)>1 )and (Pos(':', fa_sfrase)<>(Pos(' : ', fa_sfrase)+1))then
    begin
     Insert(' ',fa_sfrase,Pos(':', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos(':', fa_sfrase));
    end;
    if (Pos('!', fa_sfrase)>1 )and (Pos('!', fa_sfrase)<>(Pos(' ! ', fa_sfrase)+1))then
    begin
     Insert(' ',fa_sfrase,Pos('!', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos('!', fa_sfrase));
    end;
    if (Pos('?', fa_sfrase)>1)and (Pos('?', fa_sfrase)<>(Pos(' ? ', fa_sfrase)+1)) then
    begin
     Insert(' ',fa_sfrase,Pos('?', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos('?', fa_sfrase));
    end;
      if (Pos('"', fa_sfrase)>1)and (Pos('"', fa_sfrase)<>(Pos(' " ', fa_sfrase)+1)) then
    begin
     Insert(' ',fa_sfrase,Pos('"', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos('"', fa_sfrase));
    end;
      if (Pos('. ', fa_sfrase)>1)and (Pos('. ', fa_sfrase)<>(Pos(' . ', fa_sfrase)+1)) then
    begin
     Insert(' ',fa_sfrase,Pos('. ', fa_sfrase)+1);
      Insert(' ',fa_sfrase,Pos('. ', fa_sfrase));
    end;


    fa_sfrase2 := fa_sfrase ;
    delete(fa_sfrase2,(pos(' ',fa_sfrase)+1),
     (length(fa_sfrase)- pos(' ',fa_sfrase)));
     vetor.lista[fa_ifrase]:= fa_sfrase2;
      //del tudo depois da 1ª palavra
    delete (fa_sfrase,1,pos(' ',fa_sfrase)); //del a 1ª palavra
    until vetor.lista[fa_ifrase]<>' ' ; //ate n ter mais espaços
    if vetor.lista[fa_ifrase]>' ' then  vetor.tamanho:= vetor.tamanho+1;
   end;//desmfrase fim
end;

function Tutilitarios.array_frase(vetor: Tarray500): string;
var
  cont: Integer;
  frase:string;
begin
  for cont:= 0 to 499 do begin
    frase:= frase+vetor.lista[cont];
  end;
end;

function Tutilitarios.casestr(str1, str2: string): boolean;
begin
  Result:= false;
  if str1 = str2 then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3) then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4) then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5) then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6: string
  ): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6) then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7: string
  ): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7) then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7,
  str8: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)then result := true;


end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10: string): boolean ;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10)then result := true;

end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10, str11: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10) or(str1 = str11) then result := true;
end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10, str11, str12: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10) or(str1 = str11)or(str1 = str12) then result := true;
end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10, str11, str12, str13: string): boolean;
begin
   Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10) or(str1 = str11)or(str1 = str12)or(str1 = str13) then result := true;
end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10, str11, str12, str13, str14: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10) or(str1 = str11)or(str1 = str12)or(str1 = str13)
  or(str1 = str14) then result := true;
end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10, str11, str12, str13, str14, str15: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10) or(str1 = str11)or(str1 = str12)or(str1 = str13)
  or(str1 = str14)or(str1 = str15) then result := true;
end;
function Tutilitarios.casestr(str1, str2, str3, str4, str5, str6, str7, str8,
  str9, str10, str11, str12, str13, str14, str15, str16: string): boolean;
begin
  Result:= false;
  if (str1 = str2)or(str1 = str3)or(str1 = str4)or(str1 = str5)
  or(str1 = str6)or(str1 = str7)or(str1 = str8) or(str1 = str9)
  or(str1 = str10) or(str1 = str11)or(str1 = str12)or(str1 = str13)
  or(str1 = str14)or(str1 = str15)or(str1 = str16) then result := true;
end;

constructor Tutilitarios.create;
begin
  inherited Create;
  aAlfArray2 :=TStringList.Create;
end;

destructor Tutilitarios.Destroy;
begin
  aAlfArray2.Destroy;
  inherited Destroy;
end;

//////////////////////////////////////////

procedure Tutilitarios.AlfabeticaEquival(var vetor:Tarray30k);
var
iultimo,ialf1,ialf2,ialf3,ialf4 :integer;
sAlfInten_figurda, salf2,salf3 : string ;
bAlfAchou: Boolean;
begin //AlfabeticaEquivalente ini
    ialf1 := 0 ;//to iAlfMaximo do
    repeat//
     if vetor.lista[ialf1]>' ' then
     begin//foriAlfMaximo
       salf2:= vetor.lista[ialf1]+' ';
       for ialf3:= 0 to 20 do  aAlfArray2[ialf3]:='';//limpa
       for ialf2 := 0  to 10 do //bota a linha num array
        begin//desmfrase ini
           repeat
            salf3 := salf2 ;
            if salf3> ' 'then begin
             delete(salf3,(pos(' ',salf2)+1),(length(salf2)- pos(' ',salf2)));
             aAlfArray2[ialf2]:= salf3;//del tudo depois do 1º espaço
             delete (salf2,1,pos(' ',salf2)); //del a 1ª palavra
            end;
          until aAlfArray2[ialf2]<>' ' ; //ate n ter mais espaços
           //ShowMessage(aAlfArray2[ialf2]+ '° indice:'+IntToStr(ialf2));
        end;//desmfrase fim   ////////////
       if aAlfArray2[2] > ' '  then begin //tem +q 2 palavras  no array
         vetor.lista[ialf1]:= ' '; vetor.tamanho:= vetor.tamanho-1; ialf1:=ialf1-1;
         for ialf2:= 0 to 10 do
         begin
            if aAlfArray2[ialf2+1]>' ' then
            begin
              vetor.lista[vetor.tamanho+1]:= (aAlfArray2[0]+ aAlfArray2[ialf2+1]);
              vetor.tamanho:=vetor.tamanho+1;
            end;
         end;
       end else //
       begin  //ve se //nao nada
       end;
     end;//forvetor.tamanho fim
     //if vetor.tamanho> 500 then ShowMessage('paso de 500');
     ialf1:= ialf1+1   // escremento
    until  ialf1> vetor.tamanho;

     for ialf1 :=0 to vetor.tamanho do
     begin// ordenador buble
       for ialf2:= ialf1 to vetor.tamanho do
       begin
        if vetor.lista[ialf1] > vetor.lista[ialf2] then
         begin
           salf2:= vetor.lista[ialf1];
           salf3:= vetor.lista[ialf2];//debug
           vetor.lista[ialf1]:= vetor.lista[ialf2];
           vetor.lista[ialf2]:= salf2;
         end;
       end;
     end;//ordenador buble

   repeat   bAlfAchou:= false; // apagador de duplicatas ini
     for ialf1:= 0 to vetor.tamanho do
     begin
         ialf2 := ialf1 +1;
       repeat
         if (((vetor.lista[ialf1] = vetor.lista[ialf2])or (vetor.lista[ialf1]=' ')
           or (vetor.lista[ialf1]=''))and (ialf1<vetor.tamanho)) then
         begin  bAlfAchou:= true;
           for ialf3 := ialf1 to vetor.tamanho+1 do
           vetor.lista[ialf3]:= vetor.lista[(ialf3+1)] ;
           vetor.tamanho:= vetor.tamanho - 1;
         end;
         ialf2:= ialf2+1;
        until ialf2 > vetor.tamanho+1 ;
     end;
     ialf2:= ialf2; //so p break point
   until not bAlfAchou; // apagador de duplicatas fim
    ialf1:=0;ialf2:=0;ialf3:=0;ialf4:=0;
end;

procedure Tutilitarios.AlfabeticaAntonimos(var vetor:Tarray30k);
var
iultimo,ialf1,ialf2, ialf3,ialf4 :integer;
sAlfInten_figurda, salf2,salf3 : string ;
bAlfAchou: Boolean;
begin //AlfabeticaAntonimos ini
    ialf1 := 0 ;//to iAlfMaximo do
    repeat
     if vetor.lista[ialf1]>' ' then
     begin//foriAlfMaximo
       salf2:= trim(vetor.lista[ialf1])+' ';
       for ialf3:= 0 to 20 do  aAlfArray2[ialf3]:='';//limpa
       for ialf2 := 0  to 10 do //bota a linha num array
       begin//desmfrase ini
          repeat
            salf3 := salf2 ;
            if salf3>= ' 'then begin
             delete(salf3,(pos(' ',salf2)+1),(length(salf2)- pos(' ',salf2)));
             aAlfArray2[ialf2]:= salf3;//del tudo depois do 1º espaço
            end;
             delete (salf2,1,pos(' ',salf2)); //del a 1ª palavra
          until aAlfArray2[ialf2] <>' ' ; //ate n ter mais espaços

                  //ShowMessage(aAlfArray2[ialf2]+ '° indice:'+IntToStr(ialf2));
       end;//desmfrase fim   ////////////
       if aAlfArray2[2] > ' '  then
       begin //tem +q 2 palavras  no array
         vetor.lista[ialf1]:= ' '; vetor.tamanho:= vetor.tamanho-1; ialf1:=ialf1-1;
         for ialf2:= 0 to 10 do
         begin
            if aAlfArray2[ialf2+1]>' ' then
            begin
              vetor.lista[vetor.tamanho+1]:= (aAlfArray2[0]+ aAlfArray2[ialf2+1]);
              vetor.tamanho:=vetor.tamanho+1;
            end;
         end;
         for ialf2:= 0 to 10 do
         begin
            if aAlfArray2[ialf2+1]>' ' then
            begin
              vetor.lista[vetor.tamanho+1]:= (aAlfArray2[ialf2+1]+aAlfArray2[0]);
              vetor.tamanho:=vetor.tamanho+1; //ialf1:= ialf1+1;
            end;
          end;
       end else //ve se ja tem o inverso
       begin
       vetor.lista[ialf1]:= (aAlfArray2[0]+ aAlfArray2[1]);  //emenda p/normaliza os espaços 'a'='a '
         salf2:= (aAlfArray2[1]+aAlfArray2[0]);
         //ShowMessage(aAlfArray2[1]+ aAlfArray2[0]);
          bAlfAchou:=false;
         for ialf2 := 0 to vetor.tamanho do
         begin
           if (vetor.lista[ialf2]= salf2)and (salf2>' ') then
           begin //ShowMessage(salf2+ 'ja tem');
           bAlfAchou:=true;
           end;
         end;
         if (not bAlfAchou)and(salf2>' ') then
         begin
         vetor.lista[vetor.tamanho+1]:=salf2;
         vetor.tamanho:= vetor.tamanho+1;
         ialf1:= ialf1+1;
         end;
       end;
     end;//forvetor.tamanho fim
     ialf1:= ialf1+1   // escremento
    until  ialf1> vetor.tamanho;

     for ialf1 :=0 to vetor.tamanho do
     begin // ordenador buble  ini
       for ialf2:= ialf1 to vetor.tamanho do
       begin
        if vetor.lista[ialf1] > vetor.lista[ialf2] then
         begin
           salf2:= vetor.lista[ialf1];
           salf3:= vetor.lista[ialf2];//debug
           vetor.lista[ialf1]:= vetor.lista[ialf2];
           vetor.lista[ialf2]:= salf2;
         end;
       end;   //pra por em ordem alfabetca
     end;// ordenador buble fim

   repeat   bAlfAchou:= false; //apagador de duplicatas ini
     for ialf1:= 0 to vetor.tamanho do
     begin
         ialf2 := ialf1 +1;
       repeat
         if (((vetor.lista[ialf1] = vetor.lista[ialf2])or (vetor.lista[ialf1]=' ')
           or (vetor.lista[ialf1]=''))and (ialf1<vetor.tamanho)) then
         begin  bAlfAchou:= true;
         for ialf3 := ialf1 to vetor.tamanho+1 do
           vetor.lista[ialf3]:= vetor.lista[(ialf3+1)] ;
         vetor.tamanho:= vetor.tamanho - 1;//isso nao ta no laço do for
         end;
         ialf2:= ialf2+1;
        until ialf2 > vetor.tamanho+1 ; //busca ate o fim do array

      end;
      ialf2:= ialf2; //so p faze break point
   until not bAlfAchou; //apagador de duplicatas  fim
    ialf1:=0;ialf2:=0;ialf3:=0;ialf4:=0;
end;//alfabetica fim

{ Tdomtools }

procedure Tdomtools.excluino(noexclusao: TDOMNode);
var nopai:TDOMNode;
begin
 nopai:= noexclusao.ParentNode;
 nopai.DetachChild(noexclusao);
 noexclusao.FreeInstance;
end;

procedure Tdomtools.DOMnodeToTreenode(DomNode: TDOMNode; TreeNodeAlvo: TTreeNode);
var
  iNode: TDOMNode;
  str1:string;
  int1: LongWord;
  Tree:TTreeView;
  cvNode: TDOMNode;
      procedure ProcessNode(Node: TDOMNode; TreeNode: TTreeNode); //procedure dentro da sessao var
      var
        cNode: TDOMNode;
        cont: Integer;
        str2: String;
      begin
        if Node = nil then Exit; // Pára, se atingir a folha
        // Adiciona um nó para a árvore
        if node.HasChildNodes then begin //ve se tem filhos
           if (node.HasAttributes) then   begin
               str2:='';
               for cont:=Node.Attributes.Length -1 downto 0 do begin
               str2:= str2+' '+Node.Attributes.Item[cont].NodeName
               +'='+Node.Attributes.Item[cont].NodeValue+' ' ;
               end;
              TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName +' '+str2);
               TreeNode.ImageIndex:=0;
               end
           else begin
             if node.NodeValue<>'' then begin
              TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName);
               TreeNode.ImageIndex:=1;
             end else begin
              TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName);
              TreeNode.ImageIndex:=0;

             end;
           end;
        end else
        begin //no sem filhos (folha)
        if (node.HasAttributes) then   begin
          if node.TextContent<>''then begin
           str2:='';
           for cont:=Node.Attributes.Length-1 downto 0 do begin
           str2:= str2+' '+Node.Attributes.Item[cont].NodeName
           +'='+Node.Attributes.Item[cont].NodeValue+' ';
           end;
           TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName +' '+str2);
           TreeNode.ImageIndex:=0;
           TreeNode := tree.Items.AddChild(TreeNode,Node.NodeValue);// grava folha
           TreeNode.ImageIndex:=2;
           TreeNode.Text:=node.NodeValue;
           end else begin
            str2:='';
           for cont:=Node.Attributes.Length-1 downto 0 do begin
           str2:= str2+' '+Node.Attributes.Item[cont].NodeName
           +'='+Node.Attributes.Item[cont].NodeValue+' ';
           end;
           TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName +' '+str2);
           TreeNode.ImageIndex:=1;
           end;
        end
        else BEGIN
            if (node.NodeValue='') then begin   // aqui caem nós vasios
            TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName);
            TreeNode.ImageIndex:=1;
            end
            else begin
            TreeNode := tree.Items.AddChild(TreeNode, Node.NodeValue);//aqui so cai texto que
            TreeNode.ImageIndex:=2;                            // é visto como nó e sempre tem
            end;                                          //o nome #text , o valor real fica no value desse nó(esse nó não pode ter filhos 'estéril' hshsh )
        end;
        end;

        // Vai para o primeiro nó filho
        cNode := Node.FirstChild;
        // Processa todos os nós filhos
        while cNode <> nil do
        begin
          ProcessNode(cNode, TreeNode);
          cNode := cNode.NextSibling;
        end;
      end;

begin  // // // // //
  iNode := DomNode;
  Tree:= TTreeView( TreeNodeAlvo.TreeView);

  // Vai para o primeiro nó filho
        cvNode := iNode.FirstChild;
        // Processa todos os nós filhos
        ProcessNode(cvNode, TreeNodeAlvo);
        cvNode := cvNode.NextSibling;
        while cvNode <> nil do
        begin
          ProcessNode(cvNode, TreeNodeAlvo);
          cvNode := cvNode.NextSibling;
        end;

end;
procedure Tdomtools.insereAntes(treenode:TTreeNode;referencia, novono: TDOMNode);
var
noPai:TDOMNode;
begin
  if novono.HasChildNodes then begin
   DOMnodeToTreenode(novono,treenode);
  end;
  noPai:=referencia.ParentNode;
  nopai.InsertBefore(novono,referencia);


end;

procedure Tdomtools.insereDepois(treenode:TTreeNode;referencia, novono: TDOMNode);
var
noPai:TDOMNode;
begin
  if novono.HasChildNodes then begin
   DOMnodeToTreenode(novono,treenode);
  end;
  noPai:=referencia.ParentNode;
 if referencia = noPai.LastChild then begin
   noPai.AppendChild(novono);
 end else begin
   if referencia = noPai.LastChild then begin
   noPai.AppendChild(novono);
   end else begin
     referencia:=referencia.NextSibling;
     noPai.InsertBefore(novono,referencia);
   end;
 end;
end;

function Tdomtools.pegaNOfilho(nopai: TDOMNode; endereco: integer): TDOMNode;
var nofilho:TDOMNode;
  cont: Integer;
  int1: LongWord;
  str1: String;
begin
  nofilho:=nil;
  int1:= nopai.ChildNodes.Length;
  str1:=nopai.TextContent;
  if nopai.ChildNodes.Length>endereco then begin
    nofilho:= nopai.FirstChild;
    for cont:=1 to endereco do begin
     nofilho:=nofilho.NextSibling;
    end;

  end;
  result:=nofilho;
end;

function Tdomtools.getNOorigem(treeview:TTreeView;docxml:TXMLDocument): TDOMNode;
var
  Posicao,posicaodestino: Integer;
  NovoNo: TDomNode;
  cont: Integer;
  enderecos,enderdestino:array[0..10] of integer ;
  noArvore :TTreeNode;
  nodomraiz,noDom,nodomirmao,nodompai:TDOMNode;
  int1: LongWord;
  int2: LongInt;
begin
if docxml= nil then exit;
  nodomraiz:= docxml.DocumentElement;
  if TreeView.Selected = nil then Exit;
   if TreeView.Selected.Level = 0 then
  begin
    Posicao := TreeView.Selected.Index;
    nodom:=nodomraiz.ChildNodes.Item[Posicao];
  end
  else
  begin
   int1:= TreeView.Selected.Level;int2:=TreeView.Selected.Index;
   enderecos[TreeView.Selected.Level]:= TreeView.Selected.Index;
   noArvore:=TreeView.Selected;////
   for cont:=TreeView.Selected.Level-1 downto 1 do
   begin
   noArvore:=noArvore.Parent;
   enderecos[cont]:=noArvore.Index;
   end;
   int1:= noArvore.Index;
   noArvore:=noArvore.Parent;
   enderecos[0]:= noArvore.Index;
   noDom:=nodomraiz;
   int1:= noDom.ChildNodes.Length;
   for cont:=0 to TreeView.Selected.Level do
   begin
    int2:=enderecos[cont];
    noDom:= noDom.ChildNodes.Item[enderecos[cont]];
    int1:= noDom.ChildNodes.Length;
   end;
    int2:= enderecos[cont+1];
  end;
   Result:= noDom;
   //noDom.NodeName
end;
function Tdomtools.getNOdestino(treeview:TTreeView;docxml:TXMLDocument): TDOMNode;
var
   Posicao,posicaodestino: Integer;
  cont: Integer;
  enderecos,enderdestino:array[0..10] of integer ;
   nodomraiz,noDom,nodomirmao,nodompai:TDOMNode;
  int1: Longint;
  int2: LongInt;
  NOBUG,noArvore: TTreeNode;
  expandido: Boolean;
  TIPO:TTreeViewInsertMarkType;
  nopaiAux: TDOMNode;
begin
nodomirmao:=nil;
nodomraiz:= docxml.DocumentElement;
//  gerar destino

  if nodomraiz.HasChildNodes then
  begin
    posicaodestino:=TreeView.InsertMarkNode.Index;

    if TreeView.InsertMarkNode.Level =0 then
    begin
      int1:= nodomraiz.ChildNodes.Length;
      if nodomraiz.ChildNodes.Length<=posicaodestino then
     nopaiAux:= nodomraiz else
      begin
      nopaiAux:= nodomraiz;
      nodomirmao:= pegaNOfilho(nodomraiz,posicaodestino);
      end;
    end else
    begin
      enderecos[TreeView.InsertMarkNode.Level]:= TreeView.InsertMarkNode.Index;
      noArvore:=TreeView.InsertMarkNode.Parent;
      for cont:=noArvore.Level downto 1 do
      begin
      enderecos[cont]:=noArvore.Index;
      noArvore:=noArvore.Parent;
      end;
      enderecos[0]:=noArvore.Index;//o ultimo tem q ser fora do for

      nodomirmao:=nodomraiz.ChildNodes.Item[enderecos[0]];
      int1:=enderecos[0];
      int2:=TreeView.InsertMarkNode.Level;
      for cont:=1 to TreeView.InsertMarkNode.Level do
      begin
       int1:=enderecos[cont];
       nodomirmao:=  pegaNOfilho(nodomirmao,enderecos[cont]);
      end;
    end;
    Result:=nodomirmao;
  end
  else
  begin
    result:=nodomraiz;
  end;
end;
procedure Tdomtools.exemploscomDOMnode;
var
 noraiz,nopai,nofilho,novono:TDOMNode;
 xdoc:TXMLDocument;//o xdoc é o que contem o domnode raiz(xdoc nao é o raiz )
begin
  ReadXMLFile(xdoc ,'arquivo.xml'); // instancía xdoc com o arquivo fornecido

  xdoc := TXMLDocument.create;// cria uma instancia nova
  noraiz := xdoc.CreateElement('cadastro');//cria um nó para raiz
  Xdoc.Appendchild(noraiz); // cadastra o nó raiz (só pode ter um)
  noraiz:= xdoc.DocumentElement; //atualiza o edereco do noraiz
  nopai := xdoc.CreateElement('usuario'); //cria um nó pai (ou filho do raiz)
  TDOMElement(nopai).SetAttribute('id', '001'); // cria um atributo para o nó pai
  noraiz.Appendchild(nopai);                    // cadastra o nó pai
  //so há duas maneiras de adicionar nós a arvore e precisa do nópai correspondente pra isso
  nopai.AppendChild(novono);  //insere o novonó depois do ultimo nófilho
  nopai.InsertBefore(novono,nofilho);//insere o novonó antes nófilho apresentado
  writeXMLFile(xDoc,'teste.xml');//gera um arquivo
end;

function Tdomtools.criaObjetoXML(nome:string):TXMLDocument;
var oXML:TXMLDocument; noraiz:TDOMNode;
begin
  oXML:=TXMLDocument.Create;
  try
    noraiz:=oXML.CreateElement(nome);
  except
    noraiz:=oXML.CreateElement('_');
  end;
  oXML.AppendChild(noraiz);
  result:=oXML;
end;

procedure Tdomtools.XML2Tree(tree: TTreeView; XMLDoc: TXMLDocument);
var
  iNode: TDOMNode;
  str1:string;
  int1: LongWord;
      procedure ProcessNode(Node: TDOMNode; TreeNode: TTreeNode); //procedure dentro da sessao var (noia)
      var
        cNode: TDOMNode;
        cont: Integer;
        str2: String;
      begin
        if Node = nil then Exit; // Pára, se atingir a folha
        // Adiciona um nó para a árvore
        if node.HasChildNodes then begin //ve se tem filhos
           if (node.HasAttributes) then   begin
               str2:='';
               for cont:=Node.Attributes.Length -1 downto 0 do begin
               str2:= str2+' '+Node.Attributes.Item[cont].NodeName
               +'='+Node.Attributes.Item[cont].NodeValue+' ' ;
               end;
              TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName +' '+str2);
               TreeNode.ImageIndex:=0;
               end
           else begin
             if node.NodeValue<>'' then begin
              TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName);
               TreeNode.ImageIndex:=1;
             end else begin
              TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName);
              TreeNode.ImageIndex:=0;
             end;
           end;
        end else
        begin //no sem filhos (folha)
        if (node.HasAttributes) then   begin
          if node.TextContent<>''then begin
           str2:='';
           for cont:=Node.Attributes.Length-1 downto 0 do begin
           str2:= str2+' '+Node.Attributes.Item[cont].NodeName
           +'='+Node.Attributes.Item[cont].NodeValue+' ';
           end;
           TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName +' '+str2);
           TreeNode.ImageIndex:=0;
           TreeNode := tree.Items.AddChild(TreeNode,Node.NodeValue);// grava folha
           TreeNode.ImageIndex:=2;
           TreeNode.Text:=node.NodeValue;
           end else begin
            str2:='';
           for cont:=Node.Attributes.Length-1 downto 0 do begin
           str2:= str2+' '+Node.Attributes.Item[cont].NodeName
           +'='+Node.Attributes.Item[cont].NodeValue+' ';
           end;
           TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName +' '+str2);
           TreeNode.ImageIndex:=1;
           end;
        end
        else BEGIN
            if (node.NodeValue='') then begin   // aqui caem nós vasios
            TreeNode := tree.Items.AddChild(TreeNode,Node.NodeName);
            TreeNode.ImageIndex:=1;
            end
            else begin
            TreeNode := tree.Items.AddChild(TreeNode, Node.NodeValue);//aqui so cai texto que
            TreeNode.ImageIndex:=2;                            // é visto como nó e sempre tem
            end;                                          //o nome #text , o valor real fica no value desse nó(esse nó não pode ter filhos 'estéril' hshsh )
        end;
        end;
        // Vai para o primeiro nó filho
        cNode := Node.FirstChild;
        // Processa todos os nós filhos
        while cNode <> nil do
        begin
          ProcessNode(cNode, TreeNode);
          cNode := cNode.NextSibling;
        end;
      end;
begin  // // // // //
  iNode := XMLDoc.DocumentElement.FirstChild;
 // int1:= iNode.ChildNodes.Length;
  while iNode <> nil do
  begin
    ProcessNode(iNode, nil); // Recursivo
    iNode := iNode.NextSibling;
  end;
end;

function TDOMElementio.GetNodeType: Integer;
begin
  Result := ELEMENT_NODE;
end;

function TDOMElementio.GetNodeName: DOMString;
begin
  Result := FNodeName;
end;

function TDOMElementio.CloneNode(deep: Boolean; ACloneOwner: TDOMDocument): TDOMNode;
var
  i: Integer;
begin
  Result := ACloneOwner.CreateElement(FNodeName);
  if Assigned(FAttributes) then
  begin
    for i := 0 to FAttributes.Length - 1 do
      TDOMElementio(Result).SetAttributeNode(TDOMAttr(FAttributes[i].CloneNode(True, ACloneOwner)));
  end;
  if deep then
    CloneChildren(Result, ACloneOwner);
end;

procedure TDOMElementio.Normalize;
var
  I: Integer;
begin
  if Assigned(FAttributes) then
    for I := 0 to FAttributes.Length - 1 do
      FAttributes[I].Normalize;
  inherited Normalize;
end;

function TDOMElementio.GetAttributes: TDOMNamedNodeMap;
begin
  if FAttributes=nil then
    FAttributes := TDOMNamedNodeMap.Create(Self, ATTRIBUTE_NODE);
  Result := FAttributes;
end;

function TDOMElementio.setnodename(name: DOMString):boolean;//O furo da bala   (trocaram a bala)saco...
var nsi2:TNamespaceInfo; nodens:TDOMNode_NS ;  str1:string;
begin
  Result:=False;
  //A PROXIMA VERSSAO JA VAI VIR COM NODENAME ESCONDIDO EM OUTRO LUGAR  BANDO DE FDP
  //NSI:=TDOMNode_NS(self).NSI;
  //NSI.QName^.Key:=name; //bala nova  pela culatra
  str1:=NSI.QName^.Key;
  if (IsXmlName(name))
    and(str1<>'') then
  begin
  //TDOMNode_NS(self).SetNSI(name,Length(name));
  FNSI.QName := TDOMDocument_arombed(self.OwnerDocument).NovaTag(name);
  fNSI.NSIndex:= TDOMDocument_arombed(self.OwnerDocument).IndexOfNS(name);
  fNSI.PrefixLen:=Length(name);
  str1:=NSI.QName^.Key;

  str1:=fNSI.QName^.Key;
  str1:=str1;
  Result:=True;
  end
  else ShowMessage('valor invalido para nome de tag');

  //FNodeName:=name;   //bala antiga
  //PHashItem = ^THashItem;
  //THashItem = record
  //  Key: WideString;
  //  HashValue: LongWord;
  //  Next: PHashItem;
  //  Data: TObject;
  //end;
//  qname== ^THashItem;

//  FNSI: TNamespaceInfo;
  //TNamespaceInfo = packed record
  //  NSIndex: Word;
  //  PrefixLen: Word;
  //  QName: PHashItem;
  //end;

//function TDOMNode_NS.GetNodeName: DOMString;
//begin
//  // Because FNSI.QName is not set by the TDOMNode itself, but is set by
//  // other classes/functions, it is necessary to check if FNSQ.QName is
//  // assigned.
//  if as signed(FNSI.QName) then
//    Result := FNSI.QName^.Key
//  else
//    Result := '';
//end;
end;

function TDOMElementio.GetAttribute(const name: DOMString): DOMString;
var
  Attr: TDOMNode;
begin
  SetLength(Result, 0);
  if Assigned(FAttributes) then
  begin
    Attr := FAttributes.GetNamedItem(name);
    if Assigned(Attr) then
      Result := Attr.NodeValue;
  end;
end;

function TDOMElementio.GetAttributeNS(const nsURI, aLocalName: DOMString): DOMString;
var
  Attr: TDOMNode;
begin
  SetLength(Result, 0);
  if Assigned(FAttributes) then
  begin
    Attr := FAttributes.GetNamedItemNS(nsURI, aLocalName);
    if Assigned(Attr) then
      Result := Attr.NodeValue;
  end;
end;

procedure TDOMElementio.RemoveAttributeNS(const nsURI,
  aLocalName: DOMString);
begin
  Changing;
  // TODO: Implement TDOMElementio.RemoveAttributeNS
  raise EDOMNotSupported.Create('TDOMElementio.RemoveAttributeNS');
end;

function TDOMElementio.GetAttributeNode(const name: DOMString): TDOMAttr;
begin
  if Assigned(FAttributes) then
    Result := FAttributes.GetNamedItem(name) as TDOMAttr
  else
    Result := nil;
end;

function TDOMElementio.GetAttributeNodeNS(const nsURI, aLocalName: DOMString): TDOMAttr;
begin
  if Assigned(FAttributes) then
    Result := FAttributes.GetNamedItemNS(nsURI, aLocalName) as TDOMAttr
  else
    Result := nil;
end;

function TDOMElementio.SetAttributeNode(NewAttr: TDOMAttr): TDOMAttr;
begin
  Result := Attributes.SetNamedItem(NewAttr) as TDOMAttr;

  // TODO -cConformance: here goes inconsistency with DOM 2 - same as in TDOMNode.RemoveChild
  if Assigned(Result) and (Result <> NewAttr) then
  begin
    Result.Free;
    Result := nil;
  end;
end;

function TDOMElementio.SetAttributeNodeNS(NewAttr: TDOMAttr): TDOMAttr;
begin
  Result := Attributes.SetNamedItemNS(NewAttr) as TDOMAttr;

  // TODO -cConformance: here goes inconsistency with DOM 2 - same as in TDOMNode.RemoveChild
  if Assigned(Result) and (Result <> NewAttr) then
  begin
    Result.Free;
    Result := nil;
  end;
end;

function TDOMElementio.GetElementsByTagName(const name: DOMString): TDOMNodeList;
begin
  Result := TDOMElementList.Create(Self, name);
end;

function TDOMElementio.GetElementsByTagNameNS(const nsURI, aLocalName: DOMString): TDOMNodeList;
begin
  Result := TDOMElementList.Create(Self, nsURI, aLocalName);
end;

function TDOMElementio.hasAttribute(const name: DOMString): Boolean;
begin
  Result := Assigned(FAttributes) and
    Assigned(FAttributes.GetNamedItem(name));
end;

function TDOMElementio.hasAttributeNS(const nsURI, aLocalName: DOMString): Boolean;
begin
  Result := Assigned(FAttributes) and
    Assigned(FAttributes.getNamedItemNS(nsURI, aLocalName));
end;

function TDOMElementio.HasAttributes: Boolean;
begin
  Result := Assigned(FAttributes) and (FAttributes.Length > 0);
end;

function TDOMElementio.RemoveAttributes: boolean;
var
  cont: Integer;
begin
  for cont:=self.Attributes.Length -1 downto 0 do
  begin
   self.RemoveAttribute(self.Attributes.Item[cont].NodeName);
  end;
end;




{ openNOde }





end.

