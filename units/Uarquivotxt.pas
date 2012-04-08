unit Uarquivotxt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uarrays;
type

{ Tarquivotxt }

Tarquivotxt = class
  endereco:string;
  arquivo:TextFile;
  status:integer;
  linhas:integer;
  procedure gravaArray(var aarray :Tarray30k);
  function procura(str1:string):boolean;
  procedure enderecoArquivo(str1:string);
end;

implementation

{ Tarquivotxt }

procedure Tarquivotxt.gravaArray(var aarray :Tarray30k);
var cont,maximo:integer;
begin
  assignfile(arquivo,endereco);
  reset(arquivo);
  if linhas < 10000 then
  begin
   maximo:= linhas;
  end
  else
  maximo:=10000;
  for cont:=0 to maximo  do
  begin
    ReadLn(arquivo,aarray.lista[cont])
  end;
 CloseFile(arquivo);
end;
                               
function Tarquivotxt.procura(str1: string): boolean;
var cont:integer;
 linha :string;
begin

  Result:= false;
  assignfile(arquivo, endereco);
  reset(arquivo);
  for cont:=0 to linhas  do
  begin
    ReadLn(arquivo,linha);
    if pos(str1,linha)=1 then
    begin
      Result:= true;
      Break;
    end;
  end;
  CloseFile(arquivo);
end;

procedure Tarquivotxt.enderecoArquivo(str1: string);
begin
  if not(FileExists(str1))then
    begin
    assignfile(arquivo, str1);
    Rewrite(arquivo);
    reset(arquivo);
    closefile (arquivo);
    end;

  assignfile(arquivo, str1);
  reset(arquivo);//prepara p/ ler
   while (EOF(arquivo)=false) do
    begin
      ReadLn(arquivo)  ;
      linhas:=linhas+1;
    end;
  closefile (arquivo);
  endereco:=str1;
end;

end.

