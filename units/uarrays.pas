unit Uarrays;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 
 type
 str=record letra,acento:word end;
 varchar =  array of str ;

 { TlistaDEstl }

 { Tlista_stl }

 Tlista_stl =class(TList)
 protected
   function Getstls(Index: Integer): TStringList;
   procedure Setstls(Index: Integer; const AValue: TStringList);

 public
   nome:string;
   function Add(Item: TStringList): Integer;overload;
   property stls[Index: Integer]:TStringList read Getstls write Setstls;
 end;

 { Tmarizstl }

 { Tmariz_stl }

 Tmariz_stl = class(tlist)
 private
   function Getstls(Index: Integer): Tlista_stl;
   procedure Setstls(Index: Integer; const AValue: Tlista_stl);
 public
   function Add(Item: Tlista_stl): Integer;overload;
   property stls[Index: Integer]:Tlista_stl read Getstls write Setstls;

 end;
 Tarray200= record
  lista:array[0..200] of string  ;
  tamanho:integer;
 end;
 Tarray500= record
  lista:array[0..500] of string  ;
  tamanho:integer;
 end;
 Tarray1k= record
  lista:array[0..1000] of string  ;
  tamanho:integer;
 end;
 Tarray5k= record
  lista:array[0..5000] of string  ;
  tamanho:integer;
 end;
 Tarray10k= record
  lista:array[0..10000] of string  ;
  tamanho:integer;
 end;
 Tarray20k= record
  lista:array[0..20000] of string  ;
  tamanho:integer;
 end;
 Tarray30k= record
  lista:array[0..30000] of string  ;
  tamanho:integer;
 end;
 Tarray40k= record
  lista:array[0..40000] of string  ;
  tamanho:integer;
 end;
 Tarray50k= record
  lista:array[0..50000] of string  ;
  tamanho:integer;
 end;
Tmatriz250x20= record
  coluna:array[0..250] of array [0..20] of  string  ;
  tamanho:integer;
 end;
 Tmatriz500x20= record
  coluna:array[0..500] of array [0..20] of  string  ;
  tamanho:integer;
  end;
 Tmatriz1kx20= record
  coluna:array[0..1000] of array [0..20] of  string  ;
  tamanho:integer;
 end;

implementation




{ TlistaDEstl }

function Tlista_stl.Getstls(Index: Integer): TStringList;
begin
  result:=TStringList(self.Get(index));
end;

procedure Tlista_stl.Setstls(Index: Integer; const AValue: TStringList);
begin
  self.Put(index,Pointer(AValue));
end;

function Tlista_stl.Add(Item: TStringList): Integer;
begin
  result:=self.Add(Pointer(item));
end;

{ Tmariz_stl }

function Tmariz_stl.Getstls(Index: Integer): Tlista_stl;
begin
  result:=Tlista_stl(self.Get(index));
end;

procedure Tmariz_stl.Setstls(Index: Integer; const AValue: Tlista_stl);
begin
  self.Put(index,Pointer(AValue));
end;

function Tmariz_stl.Add(Item: Tlista_stl): Integer;
begin
   result:=self.Add(Pointer(item));
end;

end.

