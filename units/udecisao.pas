unit Udecisao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
  type

  { Tdecisao }

  Tdecisao = class
  prioridade:integer;
  revisoes:integer;//
  status:Integer  ;//0=nula 1=sim 2=nao 3=simtemporario 4=naotemporario
  tipo:integer;   //interna ,esterna
  procedure parametros(importancia,importMedia,praso,prasoMedio:integer);
  end;

implementation

{ Tdecisao }

procedure Tdecisao.parametros(importancia,importMedia,praso,prasoMedio: integer);
begin
if status=0 then
begin
  if (importancia div 2)>=importMedia then
  begin
    status:=3;
  end
  else
  if(importMedia div 2)>=importancia then
  begin
    status:=4;
  end
  else
  if importancia > importMedia then
  begin
    if praso < prasoMedio then
    begin
      status:=3;
    end;
  end;
end;

if status=1 then//se for sim
begin
  if(importMedia div 2)>=importancia then
  begin
    if praso > prasoMedio then
    begin
      status:=3;
    end;
  end;
end;
if status=2 then //se for nao
begin
  if(importancia div 2)>=importMedia then
  begin
    if prasoMedio > praso then
    begin
      status:=4;
    end;
  end;
end;
if status=3 then //se for sim temp
begin
  if (importancia div 2)>=importMedia then
  begin
    status:=1;
  end
  else
  if(importMedia div 2)>=importancia then
  begin
    if praso > prasoMedio then
    begin
      status:=4;
    end;
  end;
end;
if status=4 then // se for nao temp
begin
  if (importMedia div 2)>=importancia then
  begin
    status:=2;
  end
  else
  if(importancia div 2)>=importMedia then
  begin
    if prasoMedio > praso then
    begin
      status:=3;
    end;
  end;
end;
end;////

end.

