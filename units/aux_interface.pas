unit aux_interface;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,   LResources,  Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, PairSplitter, StdCtrls, Buttons, ActnList, ComCtrls,
  ButtonPanel, PopupNotifier,  EditBtn, Spin, Grids,//SynMemo, IDEWindowIntf, SynHighlighterXML,
  XMLRead , XMLWrite , xmlutils , XMLPropStorage,
  xmltestreport ,dom, uacessorios,Uclassificador,Uarrays, Uarquivotxt,

  LCLType, Messages,Ucoisa, Variants;
type
Ttxt= class
  arquivo:TextFile;
  linhas: array [0..50000] of string;
end;
 function carregaArquivo(nomearquivo:string;lines:TStrings):TStrings;
 function arrumatexto (texto:TStringList):TStringList ;
var
frases: array [0..50000] of string;
contfrases:integer;

implementation

function carregaArquivo(nomearquivo:string; lines:TStrings):TStrings;
var utilitarios:Tutilitarios;
linha,texto:string;
cont:integer;
array500:Tarray500;
 txt:Ttxt;
begin
 cont:=0;
 txt:=Ttxt.Create;
 AssignFile(txt.arquivo,nomearquivo);
 //for cont:=0 to 50000 do linhas[cont]:= '';
  reset(txt.arquivo);
 cont:=0;
  while (not EOF(txt.arquivo))and(cont<50000) do begin
    ReadLn(txt.arquivo,linha);

    txt.linhas[cont] := linha;
    cont:= cont+1;
  end;
  CloseFile(txt.arquivo);
  //arrumatexto(txt,cont-1);
  txt.Destroy;
for cont:=0 to contfrases do begin
if frases[cont]<>''then
lines.Add('   '+frases[cont]);

end;





end;

function arrumatexto(Texto:TStringList):TStringList;
var teste: TextFile;
 merdA,temp,temp2,temp3, temp4 :widestring ;
iarquivo,iarquivo2, icont, icont3,icont4 ,tamanho:integer;
ligado :boolean;
arrFrase: Tarray500;
ifrase,imatriz: Integer;
memo:TMemo;
tarquivo:string;
repete: Boolean;
str1,str2: String;
cont: Integer;

begin
 contfrases:= 0;
 ifrase:=0;
 iarquivo := 0;
 tamanho:= Texto.Count-1;
 //texto.Strings[iarquivo]:='';
 texto.Add('');texto.Add('');
FOR icont3:=0 to tamanho do
//if iarquivo<tamanho then
begin

 ligado:=false;
   temp2:= temp;
   texto.strings[iarquivo] := Trim(texto.strings[iarquivo])+'  ';


    repete := true;
    while repete do begin  //tirar os espaços em branco
      repete:=false;
      if Pos('  ',texto.strings[iarquivo])>0 then begin
        repete:=true;
        str2:= texto.strings[iarquivo];
        delete(str2,Pos('  ',texto.strings[iarquivo]),1);
        texto.strings[iarquivo]:=str2;
      end;
       str1:=texto.strings[iarquivo];//debug
    end;
    while (((Pos('. ', texto.strings[iarquivo])=0)
        //or (Pos('.  ', texto.strings[iarquivo])=Length(texto.strings[iarquivo])-2)
        )
      and((Pos('?', texto.strings[iarquivo])=0)
        or(Pos('?', texto.strings[iarquivo])=Length(texto.strings[iarquivo])))
      and ((Pos('!', texto.strings[iarquivo])=0)
        or(Pos('?', texto.strings[iarquivo])=Length(texto.strings[iarquivo]))))
    and(iarquivo<=tamanho) do
     //enquanto n achar pontos vai juntando as strings
   begin
      if (pos('-',temp2) = Length(temp2))and(Length(temp2)>0) and (not (
      (pos('a ',texto.strings[iarquivo]) = 1)   or(pos('o ',texto.strings[iarquivo]) = 1) or
      (pos('as ',texto.strings[iarquivo]) = 1)  or(pos('os ',texto.strings[iarquivo]) = 1) or
      (pos('la ',texto.strings[iarquivo]) = 1)  or(pos('lo ',texto.strings[iarquivo]) = 1) or
      (pos('las ',texto.strings[iarquivo]) = 1) or(pos('los ',texto.strings[iarquivo]) = 1) or
      (pos('lhe ',texto.strings[iarquivo]) = 1) or(pos('lhes ',texto.strings[iarquivo]) = 1) or
      (pos('me ',texto.strings[iarquivo]) = 1)  or(pos('se ',texto.strings[iarquivo]) = 1) or
      (pos('nos ',texto.strings[iarquivo]) = 1) or(pos('vos ',texto.strings[iarquivo]) = 1) or
      (pos('te ',texto.strings[iarquivo]) = 1) ))                   then
      begin //-me , -se , -te , -la(s) ,-lo(s) ,-lhe(s) ,-nos ,-vos ,-a(s) ,-o(s)
         delete(temp2,Length(temp2),1)     ; //apaga o ultimo caracter, o hifen
         temp2:=temp2+trim(texto.strings[iarquivo])+'  '; //concatena simples
      end
      else
      begin
        if texto.strings[iarquivo]>'  'then
        if temp2 >' ' then  begin
        temp2:=Trim(temp2);
        temp2:=temp2+' '+texto.strings[iarquivo]  //concatena com espaço

        end
        else
        temp2:=texto.strings[iarquivo];
      end;
      if iarquivo<=tamanho then
      iarquivo:=iarquivo+1; ////
      temp3:= temp2;
      ligado:= false;
      if iarquivo<=tamanho then ligado:=true;
      texto.strings[iarquivo] := Trim(texto.strings[iarquivo])+'  ';
      repete := true;
      while repete do begin
      repete:=false;
      if Pos('  ',texto.strings[iarquivo])>0 then begin
        repete:=true;
        str2:= texto.strings[iarquivo];
        delete(str2,Pos('  ',texto.strings[iarquivo]),1);
        texto.strings[iarquivo]:=str2;
      end;
      end;
      str1:=texto.strings[iarquivo];//debug
      temp3:=temp3;//debug
    end ;


    repete := true;
    while repete do begin
    repete:=false;
    if Pos('  ',temp2)>0 then begin
      repete:=true;
      delete(temp2,Pos('  ',temp2),1)
    end;
    end;

   if (iarquivo<=tamanho) then
   begin
   temp2:=Trim(temp2);
   temp2:= temp2+' '+texto.strings[iarquivo];
   temp2:=Trim(temp2)+'  ';
   if iarquivo<tamanho then
   iarquivo:=iarquivo+1;
   end;
   temp2:=Trim(temp2)+'  ';



     if (Pos('.  ', temp2)>0)or(Pos('?', temp2)>0)or(Pos('?', temp2)>0) then
     begin
         if (Pos('?', temp2)>0) then
         begin
             temp3:=temp2;
             delete(temp3,1, pos('?',temp3));
             temp:= temp3;
             delete(temp2,pos('?',temp2)+1,(length(temp2)- pos('?',temp2)));
         end
         else
         if (Pos('!', temp2)>0) then
         begin
             temp3:=temp2;
             delete(temp3,1, pos('!',temp3));
             temp:= temp3;
             delete(temp2,pos('!',temp2)+1,(length(temp2)- pos('!',temp2)));
         end
         else
         begin
             temp3:=temp2;
             delete(temp3,1, pos('. ',temp3));
             temp:= trim (temp3);
             delete(temp2,pos('. ',temp2)+1,(length(temp2)- pos('. ',temp2)));
         end;
     end
     else
     begin
       temp:='';
     end;

     if temp2>'                                                                                    '
     +'                                                                                            '
     +'                                                                                            '
     +'                                                                                        ' then
    // memo1.Lines.Add(temp2);
     begin
     frases[contfrases]:= temp2 ;
     temp2:='';
     contfrases := contfrases + 1 ;

     end;
     if (contfrases>49000 )or( iarquivo = tamanho) then begin
       temp:=temp;  //debug
       break;
     end;
end;
   contfrases := contfrases-1;
   Result:=TStringList.Create;
   for cont:= 0   to contfrases do
   begin
     Result.Add(frases[cont]);
   end;
end;

end.

