unit Uintencidade;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uarquivotxt,Uarrays;
  type

{ Tintencidade }

Tintencidade = class
  status:integer;
  vetor:Tarray30k;
  atual :string;
  pareados:TStringList;
  numPareados:integer;
  arquivo:Tarquivotxt;
  function compativel( if_str1:string): boolean;
  constructor Create(str1:string);
  destructor Destroy; override;
  end;
implementation

function Tintencidade.compativel( if_str1:string): boolean;///////////////////////////////////////
var
  cont: Integer;
begin
   Result:= False;
   if_str1:= Trim(if_str1);
   if_str1:=if_str1+' ';
   if arquivo.procura(if_str1) = true then
   begin
      numPareados:=0;
      atual:=if_str1;
      arquivo.gravaArray(vetor);
      for cont:=0 to arquivo.linhas  do
      begin
        if pos(if_str1,vetor.lista[cont])=1 then
        begin
        pareados[numPareados]:= vetor.lista[cont];
         numPareados:=numPareados+1;

        end;
      end;
      result:=true;
   end;
end;



constructor Tintencidade.Create(str1:string);
  var
    cont: Integer;
  begin
    pareados:=TStringList.Create;
    for cont:=0 to 200 do pareados.Add(' ');
    arquivo:= Tarquivotxt.Create;
     arquivo.enderecoArquivo(str1);
     //vetor:=Tarray30k.Create;

  end;

destructor Tintencidade.Destroy;
begin
  arquivo.Destroy;
  arquivo.Destroy;
  //vetor.Destroy;
  inherited Destroy;
end;

end.

