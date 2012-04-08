unit Utarefa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,

  Uideograma,Udecisao;
 type

 Rsementetarefa= record
    nome:string[20];
    ideograma:Rsementeideograma;
    decisao:integer;//só o status da decisao
    tipo:integer;
    status:integer;//1=cumprida 2=falhada 3=executando 4=parte_feita 5=aguardando
    categoria:integer;
    tamanho:integer;
    sublista:array[1..100] of string[20];
  end;

  Rtarefa=record
     Rsemente:Rsementetarefa;
     lista:array[1..100] of Rsementetarefa;
   end;

  Tsementetarefa=class
     nome:string;
     ideograma:Tsementeideograma;
     decisao:integer;//só o status da decisao
     tipo:integer;// interna externa
     status:integer;//1=cumprida 2=falhada 3=executando 4=parte_feita 5=aguardando
     categoria:integer;//1=normal 2=especialista
     tamanho:integer;
     sublista:array[1..100] of string;

       function Regout:Rsementetarefa;
       procedure Regin(recsmtar:Rsementetarefa);
     property arquivo:Rsementetarefa read Regout write Regin;

     destructor destroy;
   end;

  { Ttarefa }

  Ttarefa = class
  private
    procedure Setcategoria(const AValue: integer);
    procedure setnome(const AValue:string);
    procedure Setstatus(const AValue: integer);
    procedure Settamanho(const AValue: integer);
    procedure Settipo(const AValue: integer);
    procedure setideograma(const AValue:Tideograma);
  protected
    Fnome     :string;
    Ftamanho  :integer;
    Ftipo     :integer;
    Fstatus   :integer;
    Fcategoria:integer;

    Fideograma:Tideograma;

    function Regout:Rtarefa;
    procedure Regin(rectar:Rtarefa);
  public
    semente:Tsementetarefa;
    decisao:Tdecisao;
    sementes:array [1..100]of Tsementetarefa;
    lista:array[1..100] of Ttarefa;
    property nome:string read fnome write setnome ;
    property ideograma :Tideograma read Fideograma write setideograma;
    property tipo:integer read Ftipo write Settipo;
    property status:integer read Fstatus write Setstatus ;
    property categoria:integer read Fcategoria write Setcategoria ;
    property tamanho:integer read Ftamanho write Settamanho ;
    property arquivo:Rtarefa read Regout write Regin;

    procedure addSubtarefa(tarefa:Ttarefa);
    procedure remSubtarefa;
    procedure remSubtarefa(indice:integer);
    procedure insSubtarefa(tarefa:Ttarefa;indice:integer);
    function casaSemente (smnt:Tsementetarefa):boolean;
    function constatarefa(tarefa:Ttarefa):boolean;

    function comparaRtarefa(r1,R2:Rsementetarefa):boolean;
    constructor Create;
    destructor Destroy; override;
  end;

  { TlistTarefa }

  TlistTarefa = class(TObject)
  private
    Fcount:integer;
    fTarefas,fCallers:TList;
    function GetCount: integer;
    function Gettarefas(Index: Integer): Ttarefa;
    procedure Settarefas(Index: Integer; const AValue: Ttarefa);
    function GetCallers(Index: Integer): Ttarefa;
    procedure SetCallers(Index: Integer; const AValue: Ttarefa);
  public
    function add(tarf:Ttarefa;Caller:Ttarefa=nil):integer;
    procedure Delete(Index: Integer);
    property Count: Integer read Fcount ;
    property tarefas[Index: Integer]: Ttarefa read Gettarefas write Settarefas;
    property Callers[Index: Integer]: Ttarefa read GetCallers write SetCallers;
    constructor create;
    destructor Destroy; override;
    procedure clear;
  end;
implementation

{ Ttarefa }

procedure Ttarefa.Settipo(const AValue: integer);
begin
  if Ftipo=AValue then exit;
  Ftipo:=AValue;
  semente.tipo:=AValue;
end;

Procedure Ttarefa.setideograma(const AValue: Tideograma);
Begin
  if AValue<>nil then begin
  Fideograma:=AValue;
  semente.ideograma:= fideograma.semente;
  end;
End;

Function Ttarefa.Regout: Rtarefa;
var  rectar:Rtarefa;
  cont: Integer;
Begin
   rectar.Rsemente:= semente.arquivo;
   for cont:= 1 to tamanho do
   rectar.lista[cont]:=  sementes[cont].arquivo;
   Result:=rectar;
End;

Procedure Ttarefa.Regin(rectar: Rtarefa);
Var
  cont: Integer;
Begin
   semente.arquivo     :=rectar.Rsemente;
   for cont:= 1 to tamanho do begin

     if sementes[cont] = nil then sementes[cont]:=Tsementetarefa.Create;
     sementes[cont].arquivo:=rectar.lista[cont];
     semente.sublista[cont]:= sementes[cont].nome;
   end;
End;

procedure Ttarefa.Setcategoria(const AValue: integer);
begin
  if Fcategoria=AValue then exit;
  Fcategoria:=AValue;
  semente.categoria:=AValue;
end;

procedure Ttarefa.setnome(const AValue: string);
begin
  if Fnome=AValue then exit;
  fnome:=AValue;
  semente.nome:=AValue;
end;

procedure Ttarefa.Setstatus(const AValue: integer);
begin
  if Fstatus=AValue then exit;
  Fstatus:=AValue;
  semente.status:=AValue;
end;

procedure Ttarefa.Settamanho(const AValue: integer);
begin
  if Ftamanho=AValue then exit;
  Ftamanho:=AValue;
  semente.tamanho:=AValue;
end;

Procedure Ttarefa.addSubtarefa(tarefa: Ttarefa);
Begin
if tamanho < 100 then begin
  tamanho:=tamanho+1;                          ////////////////
  lista[tamanho]:= tarefa;
  semente.sublista[tamanho]:= tarefa.nome;
  sementes[tamanho]:= tarefa.semente;
end
End;

Procedure Ttarefa.remSubtarefa;
Begin
  if (tamanho>0) and(not((categoria=2)and(tamanho=1))) then begin
  lista[tamanho]:=nil;
  sementes[tamanho]:=nil;
  semente.sublista[tamanho]:='';
  tamanho:=tamanho-1;
  End;
End;

Procedure Ttarefa.remSubtarefa(indice: integer);
Var
  cont: LongInt;
Begin
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
End;

Procedure Ttarefa.insSubtarefa(tarefa: Ttarefa; indice: integer);
Var
  cont: LongInt;
Begin
  if tamanho < 100 then begin
  if (indice < tamanho) and(indice>0)and(tamanho>0) then
  begin
    tamanho:=tamanho+1;
    for cont := tamanho  DOWNTO indice+1  do
    begin
      lista[cont]:= lista[cont-1];
      sementes[cont]:=sementes[cont-1];
    end;
    lista[indice]:= tarefa;
    sementes[indice]:=tarefa.semente;
  end
  else begin
    if (tamanho=0) then begin
      tamanho:=tamanho+1;
      lista[tamanho]:= tarefa;
      sementes[tamanho]:=tarefa.semente;
    end;
  end;

end ;
End;

Function Ttarefa.casaSemente(smnt: Tsementetarefa): boolean;
Var
  cont: Integer;
  semntloc:Tsementetarefa;
Begin
  Result:= false;
  if semente = smnt then begin
   Result:=true
  end else
 begin

  if semente.tamanho = smnt.tamanho then begin
    if semente.ideograma.casaSemente(smnt.ideograma) then begin
      if semente.tipo = smnt.tipo then begin
        Result:=true;
        for cont:= 1 to smnt.tamanho do
        begin
          if semente.sublista[cont] <> smnt.sublista[cont] then begin
            Result:=false;
            Break;
          end;
        end;
      end;
    end;
  end;
 End;
End;

Function Ttarefa.constatarefa(tarefa: Ttarefa): boolean;
Var
  cont: Integer;
Begin
   Result:=false ;
  for cont :=1 to tamanho do
  begin
    if tarefa = lista[cont] then
    begin
      result:=true;
      break;
    end;
  end;
End;

Function Ttarefa.comparaRtarefa(r1, R2: Rsementetarefa): boolean;
Begin

End;

constructor Ttarefa.Create;
var limpasub:array[1..100] of record ideograma:string; sub:array[1..100] of string end;
begin
  decisao:=Tdecisao.Create;
  semente:=Tsementetarefa.Create;
  nome:='';
  status:=3;
  tamanho:=0;
  tipo:=0;
  categoria:=0;
end;

destructor Ttarefa.Destroy;
var
  cont: Integer;
begin
  decisao.Destroy;
  ideograma:=nil;
  for cont:=1 to 100 do begin
  lista[cont]:= nil;

  end;
  inherited Destroy;
end;


{ Tsementetarefa }


Function Tsementetarefa.Regout: Rsementetarefa;
var recsmtar:Rsementetarefa;
  cont: Integer;
Begin
   recsmtar.nome:= nome;
   recsmtar.ideograma:= ideograma.arquivo;
   recsmtar.decisao:= decisao;
   recsmtar.tipo:= tipo;
   recsmtar.status:= status;
   recsmtar.categoria:= categoria;
   recsmtar.tamanho:= tamanho;
   for cont:= 1 to tamanho do
   recsmtar.sublista[cont]:=  sublista[cont];
   result:=recsmtar;
End;

Procedure Tsementetarefa.Regin(recsmtar: Rsementetarefa);
Var
  cont: Integer;
Begin
   nome:= recsmtar.nome;
   ideograma:= Tsementeideograma.create;
   ideograma.arquivo   := recsmtar.ideograma;
   decisao             := recsmtar.decisao;
   tipo                := recsmtar.tipo;
   status              := recsmtar.status;
   categoria           := recsmtar.categoria;
   tamanho             := recsmtar.tamanho;
   for cont:= 1 to tamanho do
   begin
   sublista[cont] := recsmtar.sublista[cont];
   End;
End;

Destructor Tsementetarefa.destroy;
Var
  cont: Integer;
Begin
  ideograma:=nil;
  //for cont:=1 to 100 do
  //begin
  //  sublista[cont]:= nil;
  //end;
End;

{ TlistTarefa }

function TlistTarefa.GetCount: integer;
begin
  result:=fTarefas.Count;
end;

function TlistTarefa.Gettarefas(Index: Integer): Ttarefa;
begin
  result:=Ttarefa(fTarefas.Items[Index]);
end;

procedure TlistTarefa.Settarefas(Index: Integer; const AValue: Ttarefa);
begin
  fTarefas.Items[Index]:=AValue;
end;

function TlistTarefa.GetCallers(Index: Integer): Ttarefa;
begin
  result:=Ttarefa(fCallers.Items[Index]);
end;

procedure TlistTarefa.SetCallers(Index: Integer; const AValue: Ttarefa);
begin
  fCallers.Items[Index]:=AValue;
end;

constructor TlistTarefa.create;
begin
 fTarefas:=TList.create;
 fcallers:=TList.Create;
end;

destructor TlistTarefa.Destroy;
begin
  fTarefas.Free;
  fCallers.Free;
  inherited Destroy;
end;

procedure TlistTarefa.clear;
begin
  fTarefas.Clear;
  fCallers.Clear;
  Fcount:=0;
end;

function TlistTarefa.add(tarf:Ttarefa;Caller:Ttarefa=nil): integer;
var
  int1,int2: LongInt;
begin
  fTarefas.Add(tarf);
  fCallers.Add(Caller);
  if fCallers.Count <> fTarefas.Count then
  begin
    int1:=int1+1;
    int1:=fCallers.Count;//debug
    int2:=fTarefas.Count;
  end;
  Fcount:=fCallers.Count;
end;

procedure TlistTarefa.Delete(Index: Integer);
begin
  fTarefas.Delete(Index);
  fCallers.Delete(Index);
  Fcount:=fCallers.Count;
end;

end.

