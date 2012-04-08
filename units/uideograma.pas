unit Uideograma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
  type

  Rsementeideograma= record
  ideia:string[25];
  tipo:integer;
  catergoria:integer;
  tamanho:integer;
  sublista:array[1..200]of string[25];

  end;

  Rideograma=record
    ideia:string[25];
    tipo:integer;  //1=acao 2=intencao 3=metodo 4=objeto
    catergoria:integer;
    tamanho:integer;
    Rsementes:array[1..200]of Rsementeideograma;

    end;

  { Tsementeideograma }

  Tsementeideograma= class
  ideia:string;
  tipo:integer;
  categoria:integer;
  tamanho:integer;
  sublista:array[1..200]of string;
    function outReg{R}:Rsementeideograma;
    procedure inReg(Rsement:Rsementeideograma);
  property arquivo:Rsementeideograma read outReg write inReg;
  function confirmadna(smnt:Tsementeideograma):boolean;
  function casaSemente (smnt:Tsementeideograma):boolean;

  end;


  { Tideograma }
  Tideograma =class
    semente:Tsementeideograma;
     lista:array[1..200]of Tideograma;
    sementes:array[1..200]of Tsementeideograma;

    property ideia:string read semente.ideia write semente.ideia;  //se nao esta na base ideia é contestual(verbos geralmente tipo açao)
    property tipo:integer read semente.tipo write semente.tipo;  //1=acao 2=intencao 3=metodo 4=objeto
    property categoria:integer read semente.categoria write semente.categoria;  //1=descritor 2=especialista
    property tamanho: Integer read semente.tamanho write semente.tamanho;

    function outReg{R}:Rideograma;
    procedure inReg(regin:Rideograma);
    property arquivo:Rideograma read outReg write inReg;

    procedure addSubideograma(ideogr:Tideograma);
    procedure remSubideograma;
    procedure remSubideograma(indice:integer);
    procedure insSubideograma(ideogr:Tideograma;indice:integer);
    function casaSemente (semnt:Tsementeideograma):boolean;
    function constaideograma(ideog:Tideograma):boolean;
    procedure entraideia(ideograma:Tideograma);
    constructor create;
    destructor destroy;override;
  end;

  { TlistIdeograma }

  TlistIdeograma = class(tlist)
  private
    function Getideogramas(Index: Integer): Tideograma;
    procedure Setideogramas(Index: Integer; const AValue: Tideograma);
  public

  property ideogramas[Index: Integer]: Tideograma read Getideogramas write Setideogramas;
  end;





implementation

{ Tideograma }

function Tideograma.outReg: Rideograma;
var semnt:Tsementeideograma;
ideogr:Tideograma;
var
  cont: Integer;
  cont2: Integer;
  R_out:Rideograma;
  int1:integer;
begin
R_out.ideia:= ideia;
R_out.tipo:=tipo;
R_out.catergoria:= categoria;
R_out.tamanho:=tamanho;
int1:=tamanho;

  for cont:=1 to tamanho do
  begin
    R_out.Rsementes[cont]:= sementes[cont].arquivo;

  end;
  Result:= R_out;
end;

procedure Tideograma.inReg(regin: Rideograma);
var
  cont: Integer;
  cont2: Integer;
begin
ideia                          := regin.ideia;
tipo                           := regin.tipo;
categoria                      := regin.catergoria;
tamanho                        := regin.tamanho;
  for cont:=1 to tamanho do
  begin
    sementes[cont]                 :=Tsementeideograma.Create;
    sementes[cont].arquivo :=  regin.Rsementes[cont];
    semente.sublista[cont]:= regin.Rsementes[cont].ideia;
  end;

end;

procedure Tideograma.addSubideograma(ideogr: Tideograma);
var str1,str2:string;
begin
if tamanho < 200 then begin
  tamanho:=tamanho+1;                          ////////////////
  lista[tamanho]:= ideogr;
  str1:=lista[tamanho].ideia;
  semente.sublista[tamanho]:= ideogr.ideia;
  sementes[tamanho]:= ideogr.semente;
  str2:= semente.sublista[tamanho];
end

end;

procedure Tideograma.remSubideograma;
begin
  if (tamanho>0) and(not((categoria=2)and(tamanho=1))) then begin
  lista[tamanho]:=nil;
  sementes[tamanho]:=nil;
  semente.sublista[tamanho]:='';
  tamanho:=tamanho-1;

  End;
end;

procedure Tideograma.remSubideograma(indice: integer);
var
  cont: LongInt;
begin
  if (indice < tamanho) and(indice>0)and (not((categoria=2)and(indice=1)))  then
  begin
    for cont:=indice to tamanho do
    begin
      lista[cont]:=lista[cont+1];
      sementes[cont]:= sementes[cont+1];
    end;
    lista[tamanho]:=nil;
    sementes[tamanho]:=nil;
    semente.sublista[tamanho]:='';// sem lixo
    tamanho:=tamanho-1;

  end
  else
  if (tamanho>0) and (not((categoria=2)and(indice=1))) then
  begin
  lista[tamanho]:=nil;
  sementes[tamanho]:=nil;
  semente.sublista[tamanho]:='';
  tamanho:=tamanho-1;
  end;
end;



procedure Tideograma.insSubideograma(ideogr: Tideograma; indice: integer);
var
  cont: LongInt;
begin
if tamanho < 200 then begin
  if (indice < tamanho) and(indice>0)and(tamanho>0) then
  begin
    tamanho:=tamanho+1;
    for cont := tamanho  DOWNTO indice+1  do
    begin
      lista[cont]:= lista[cont-1];
      sementes[cont]:=sementes[cont-1];
    end;
    lista[indice]:= ideogr;
    sementes[indice]:=ideogr.semente;
  end
  else begin
    if (tamanho=0) then begin
      tamanho:=tamanho+1;
      lista[tamanho]:= ideogr;
      sementes[tamanho]:=ideogr.semente;
    end;
  end;

end ;
end;

Function Tideograma.casaSemente(semnt: Tsementeideograma): boolean;
Var
  cont: Integer;
  semntloc:Tsementeideograma;
  ideialoc:string;
  smntideia:string;
Begin
  Result:= false;
if semnt<>nil then
  if semente = semnt then begin
   Result:=true
  end else
 begin
    ideialoc:=semente.ideia;
    smntideia:=semnt.ideia;
  if semente.ideia = semnt.ideia then begin
    if semente.tamanho = semnt.tamanho then begin
      if semente.tipo = semnt.tipo then begin
        Result:=true;
        for cont:= 1 to semnt.tamanho do
        begin
          if semente.sublista[cont] <> semnt.sublista[cont] then begin
            Result:=false;
            Break;
          end;
        end;
      end;
    end;
  end;
 End;
End;






function Tideograma.constaideograma(ideog: Tideograma): boolean;
var
  cont: Integer;
begin
 Result:=false ;
  for cont :=1 to tamanho do
  begin
    if ideog = lista[cont] then
    begin
      result:=true;
      break;
    end;
  end;
end;



procedure Tideograma.entraideia(ideograma: Tideograma);

begin
  ideia:='';
  tipo:=0;
  ideia:=TrimLeft(' '+ideograma.ideia);

  if (ideograma.tipo=2)or(ideograma.tipo=3) then
  begin
    tipo:=3;
  end;
  if (ideograma.tipo=1) then begin
    tipo:=1;
  end;
  if (ideograma.tipo=4) then begin
    tipo:=4;
  end;
end;

constructor Tideograma.create;
begin
  semente:=Tsementeideograma.Create;
end;

destructor Tideograma.destroy;
var

  cont: Integer;
begin
 semente.Destroy;
 semente:=nil;

  for cont:=0 to 200 do
  begin
   lista[cont]:=nil;
   sementes[cont]:=nil;
  end;
  inherited destroy;
end;



{ Tsementeideograma }

Function Tsementeideograma.outReg: Rsementeideograma;
var Rsement:Rsementeideograma;
  cont: Integer;
Begin
 Rsement.ideia:= ideia;//:string;
 Rsement.tipo:= tipo;//:integer;
 Rsement.catergoria := categoria;
 Rsement.tamanho:=  tamanho;//:integer;
  //sublista:array[1..200]of string;
 if tamanho>0 then
 for cont:=1 to tamanho do
 begin
  Rsement.sublista[cont]:= sublista[cont];
 end;
 Result:=Rsement;
End;

Procedure Tsementeideograma.inReg(Rsement: Rsementeideograma);
Var
  cont: Integer;
Begin

  ideia          := Rsement.ideia;//:string;
  tipo           := Rsement.tipo;//:integer;
  tamanho        := Rsement.tamanho;//:integer;
  categoria      := Rsement.catergoria;
  //sublista:array[1..200]of string;
 if tamanho>0 then
 for cont:=1 to tamanho do
 begin
  sublista[cont] := Rsement.sublista[cont];
 end;

End;

Function Tsementeideograma.confirmadna(smnt: Tsementeideograma): boolean;
Var
  ideialoc: String;
  smntideia: String;
  cont: Integer;
  suicida:Tsementeideograma;
Begin
    Result:= false;
  if self = smnt then begin
   Result:=true
  end else
 begin
    ideialoc:=smnt.ideia;
    smntideia:=smnt.ideia;
  if ideia = smnt.ideia then begin
    if tamanho = smnt.tamanho then begin
      if tipo = smnt.tipo then begin
        Result:=true;
        for cont:= 1 to smnt.tamanho do
        begin
          if sublista[cont] <> smnt.sublista[cont] then begin
            Result:=false;
            Break;
          end;
        end;
      end;
    end;
  end;

   if (result= true) and( longint(smnt) <> longint(self))then
   begin
     suicida:=Self;
     self:=smnt;
     //suicida.FreeInstance;
   end;
 End;

End;

Function Tsementeideograma.casaSemente(smnt: Tsementeideograma): boolean;
Var
  ideialoc: String;
  smntideia: String;
  cont: Integer;
  suicida:Tsementeideograma;
Begin
    Result:= false;
  if self = smnt then begin
   Result:=true
  end else
 begin
    ideialoc:=smnt.ideia;
    smntideia:=smnt.ideia;
  if ideia = smnt.ideia then begin
    if tamanho = smnt.tamanho then begin
      if tipo = smnt.tipo then begin
        Result:=true;
        for cont:= 1 to smnt.tamanho do
        begin
          if sublista[cont] <> smnt.sublista[cont] then begin
            Result:=false;
            Break;
          end;
        end;
      end;
    end;
  end;

 End;

End;







{ TlistIdeograma }

function TlistIdeograma.Getideogramas(Index: Integer): Tideograma;
begin
  result:=Tideograma(Items[index]);
end;

procedure TlistIdeograma.Setideogramas(Index: Integer; const AValue: Tideograma
  );
begin
  Items[index]:=AValue;
end;

end.

