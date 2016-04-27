unit Uarquivos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uarrays,Uideograma,Utarefa,XMLRead,XMLWrite,DOM,uacessorios;
type
TlistaIdeograma=class
 ideograma:Tideograma;
 proximo:TlistaIdeograma;
 quantia:integer; end;

TlistaTarefa=class
 tarefa:Ttarefa;
 proximo:TlistaTarefa;
 quantia:integer; end;


{ TarquivaIdeogramas }

TarquivaIdeogramas = class
  endereco:string;
  arquivo:File of Rideograma;
  status:integer;
  NumRegistros:integer;
  function carrega:TlistaIdeograma;
  procedure salva (lista:TlistaIdeograma);
  function procura(smnt:Tsementeideograma):Tideograma;
  procedure entraEnderecoArquivo(str1:string);
end;

{ TxmlIdeogramas }

TxmlIdeogramas =class
  private
  docxml:TXMLDocument;
  domtools:Tdomtools;
  nopaiAux:TDOMNode;
  aberto:TDOMElementio;
  FideogramaRaiz: Tideograma;
  FNomeArquivo: string;
  procedure carregaxml ;
  procedure carregalista;
  procedure salvalista;
  procedure SetNomeArquivo(const AValue: string);
  public
  lista:TlistIdeograma;
  constructor create;
  destructor destroy;
  property ideogramaRaiz:Tideograma read FideogramaRaiz ;
  property NomeArquivo:string read FNomeArquivo write SetNomeArquivo;
end;

{ Tarquivotarefas }

Tarquivotarefas = class
  endereco:string;
  arquivot:File of Rtarefa;
  status:integer;
  NumRegistros:integer;
  function carrega:TlistaTarefa;
  procedure salva(lista:TlistaTarefa);
  function procura(smnt:Tsementetarefa):Ttarefa;
  procedure entraEnderecoArquivo(str1:string);
end;

{ TxmlTarefas }

TxmlTarefas= class
private
  FnomeArquivo: string;
  docxml:TXMLDocument;
  Ftarefaraiz: Ttarefa;
  procedure SetnomeArquivo(const AValue: string);
  procedure carregaxml ;
  procedure carregalista;
  procedure salvalista;
  procedure Settarefaraiz(const AValue: Ttarefa);

  public
  lista:TlistTarefa;
  constructor create;
  destructor destroy;
  property tarefaraiz:Ttarefa read Ftarefaraiz ;
  property nomeArquivo:string read FnomeArquivo write SetnomeArquivo;
end;

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
      break;
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

{ TarquivaIdeogramas }

function TarquivaIdeogramas.carrega: TlistaIdeograma;
var lista,listaini:TlistaIdeograma;
  registro:Rideograma;
  ideograma:Tideograma;
  cont: Integer;


begin

Result:=nil;
  if endereco<>'' then
  begin
    assignfile(arquivo, endereco);
    reset(arquivo);
    lista:=TlistaIdeograma.Create;
    listaini:=lista;
    lista.ideograma:=Tideograma.create;

    for cont:=1 to NumRegistros  do
    begin

      Read(arquivo,registro);
     lista.proximo:=TlistaIdeograma.Create;
     lista:=lista.proximo;
     lista.ideograma:=Tideograma.create;
     lista.ideograma.arquivo:=registro;
    end;
    Result:=listaini;
    CloseFile(arquivo);
    end;

end;

procedure TarquivaIdeogramas.salva(lista: TlistaIdeograma);
var listaApaga:TlistaIdeograma;
  cont: Integer;
 idogr:Tideograma;
 registro:Rideograma;
begin
  assignfile(arquivo, endereco);
  Rewrite(arquivo);
  reset(arquivo);
  closefile (arquivo);

  //listaApaga:=lista ;

  AssignFile(arquivo,endereco);
  Reset(arquivo);
  NumRegistros:=0;
  while lista.proximo<>nil do
  begin
    lista:=lista.proximo;
    registro:=lista.ideograma.arquivo;

    write (arquivo,registro);
    NumRegistros:=NumRegistros+1;
  end;
  CloseFile(arquivo);

 //lista:=listaApaga;
 //while lista.proximo<>nil do
 //begin
 // lista:=lista.proximo;
 // listaApaga.ideograma:=nil;
 // listaApaga.FreeInstance;
 // listaApaga:=lista;
 //end;

end;

function TarquivaIdeogramas.procura(smnt:Tsementeideograma): Tideograma;
var cont:integer;
 registro :Rideograma;
 ideograma:Tideograma;
begin
  Result:= nil;
  assignfile(arquivo, endereco);
  reset(arquivo);
  ideograma:= Tideograma.create;
  for cont:=1 to NumRegistros  do
  begin
    Read(arquivo,registro);
    ideograma.arquivo:=registro;
    if ideograma.casaSemente(smnt) then
    begin

      ideograma.semente.Destroy;
      ideograma.semente:=smnt;
      Result:= ideograma;
      break;
    end;
  end;
  if result = nil then begin
    ideograma.destroy;
  end;
  CloseFile(arquivo);
end;

procedure TarquivaIdeogramas.entraEnderecoArquivo(str1: string);
var R:Rideograma;
int1:integer;
begin
  if not(FileExists(str1))then
    begin
    assignfile(arquivo, str1);
    Rewrite(arquivo);
    reset(arquivo);
    closefile (arquivo);
    end;
  NumRegistros:=0;
  assignfile(arquivo, str1);
  reset(arquivo);//prepara p/ ler
  NumRegistros:=FileSize(arquivo);
  closefile (arquivo);
  endereco:=str1;
end;

function Tarquivotarefas.carrega: TlistaTarefa;
var lista,listajob:TlistaTarefa;
  registro:Rtarefa;
  ideograma:Tideograma;
  cont: Integer;
begin
  if endereco<>'' then
  begin
    assignfile(arquivot, endereco);
    reset(arquivot);
    lista:=TlistaTarefa.Create;
    listajob:=lista;
    for cont:=1 to NumRegistros  do
    begin
     listajob.proximo:= TlistaTarefa.Create;
     listajob:=listajob.proximo;
     listajob.tarefa:=Ttarefa.create;
     Read(arquivot,registro);
     listajob.tarefa.arquivo:=registro;
    end;
    CloseFile(arquivot);
  end;
  Result:=lista;
end;

procedure Tarquivotarefas.salva(lista:TlistaTarefa);
Var
  int1:integer;
  taref:Ttarefa;
  registrot: Rtarefa;

begin
  assignfile(arquivot, endereco);
  Rewrite(arquivot);
  reset(arquivot);
  closefile (arquivot);

  AssignFile(arquivot,endereco);
  Reset(arquivot);
  NumRegistros:=0;
  while lista.proximo<>nil do
  begin
    lista:=lista.proximo;
    registrot:=  lista.tarefa.arquivo;
    Write(arquivot,registrot);
    NumRegistros:=NumRegistros+1;
  end;
  CloseFile(arquivot);
end;

function Tarquivotarefas.procura(smnt:Tsementetarefa): Ttarefa;
var cont:integer;
 registro:Rtarefa;
 tarefa:Ttarefa;
 cont2: Integer;
 valido: Boolean;
begin
  Result:= nil;
  assignfile(arquivot, endereco);
  reset(arquivot);
  tarefa:=Ttarefa.Create;
  for cont:=1 to NumRegistros  do
  begin
    Read(arquivot,registro);
    tarefa.arquivo:=registro;
    if tarefa.casaSemente(smnt) then
    begin
      valido:=true;
      Result:=tarefa;
      Break;
    end
  end;
  if not valido then tarefa.Destroy;
  CloseFile(arquivot);
end;

procedure Tarquivotarefas.entraEnderecoArquivo(str1: string);
var R:Rsementetarefa;
int1:integer;
begin
  if not(FileExists(str1))then
    begin
    assignfile(arquivot, str1);
    Rewrite(arquivot);
    reset(arquivot);
    closefile (arquivot);
    end;
  NumRegistros:=0;

  assignfile(arquivot, str1);
  reset(arquivot);//prepara p/ ler
  int1:= FileSize(arquivot);
   NumRegistros:= FileSize(arquivot);
  closefile (arquivot);
  endereco:=str1;
end;



{ TxmlIdeogramas }

procedure TxmlIdeogramas.carregaxml;
begin
   if FileExists(NomeArquivo)then
   ReadXMLFile(docxml ,NomeArquivo);
end;

procedure TxmlIdeogramas.carregalista;
var
  noIdeograma, noSemente, noSublista, noItem: TDOMNode;
  ideograma:tideograma;
  str1:string;
  int1: LongWord;
  cont: Integer;
  cont2: Integer;
begin  // // // // //
  if lista=nil then
  begin
    lista:=TlistIdeograma.Create;
  end;
  str1:=docxml.DocumentElement.NodeName;
  noIdeograma := docxml.DocumentElement.FirstChild;
  int1:= noIdeograma.ChildNodes.Length;
  while noIdeograma <> nil do
  begin
    ideograma:=Tideograma.create;

    ideograma.ideia:=noIdeograma.ChildNodes.Item[0].TextContent;
    str1:=ideograma.ideia;
    ideograma.tipo:=StrToInt(noIdeograma.ChildNodes.Item[1].TextContent);
    str1:=IntToStr(ideograma.tipo);
    ideograma.categoria:=StrToInt(noIdeograma.ChildNodes.Item[2].TextContent);
    str1:=IntToStr(ideograma.tipo);
    ideograma.tamanho:=StrToInt(noIdeograma.ChildNodes.Item[3].TextContent);
    str1:=IntToStr(ideograma.tipo);
    for cont := 1 to ideograma.tamanho do
    begin
      noSemente:=noIdeograma.ChildNodes.Item[4];
      ideograma.sementes[cont]:=Tsementeideograma.Create;
      ideograma.sementes[cont].ideia:=
      noSemente.ChildNodes.Item[cont-1].ChildNodes.Item[0].TextContent;
      str1:=ideograma.sementes[cont].ideia;

      ideograma.sementes[cont].tipo:=
      StrToInt(noSemente.ChildNodes.Item[cont-1].ChildNodes.Item[1].TextContent);
      str1:=IntToStr(ideograma.sementes[cont].tipo);

      ideograma.sementes[cont].categoria:=
      StrToInt(noSemente.ChildNodes.Item[cont-1].ChildNodes.Item[2].TextContent);
      str1:=IntToStr(ideograma.sementes[cont].tipo);

      ideograma.sementes[cont].tamanho:= StrToInt
       (noSemente.ChildNodes.Item[cont-1].ChildNodes.Item[3].TextContent);
      str1:=IntToStr(ideograma.sementes[cont].tamanho);

      for cont2 := 1 to ideograma.sementes[cont].tamanho do
      begin
        noSublista:=noSemente.ChildNodes.Item[cont-1].ChildNodes.Item[4];
        str1:= noSublista.ChildNodes.Item[cont2-1].TextContent;
        ideograma.sementes[cont].sublista[cont2] :=str1 ;
      end;
    end;

    lista.Add(ideograma);
    noIdeograma := noIdeograma.NextSibling;
  end;
end;

procedure TxmlIdeogramas.salvalista;
var
  noraiz,noIdeograma,noNome,notipo,noCategoria,notamanho,nosementes, noSemente, noSublista, noItem: TDOMNode;
  ideograma:tideograma;
  str1:string;
  int1: LongWord;
  cont: Integer;
  cont2: Integer;
  cont3: Integer;
begin  // // // // //
  docxml:=TXMLDocument.Create;
  noIdeograma := nil;
 //docxml.
  noraiz:=docxml.CreateElement('raiz');
  docxml.Appendchild(noraiz);

  for cont:=0 to lista.Count-1 do
  begin
    ideograma:=Tideograma(lista.Items[cont]);
    noIdeograma:=docxml.CreateElement('ideograma');
    noraiz.AppendChild(noIdeograma);

    noNome:=docxml.CreateElement('nome');
    notipo:=docxml.CreateElement('tipo');
    noCategoria:=docxml.CreateElement('categoria');
    notamanho:=docxml.CreateElement('tamanho');
    nosementes:=docxml.CreateElement('sementes');

    noNome.TextContent:= ideograma.ideia;
    notipo.TextContent:=IntToStr(ideograma.tipo);
    noCategoria.TextContent:=IntToStr(ideograma.categoria);
    notamanho.TextContent:=IntToStr(ideograma.tamanho);

    noIdeograma.AppendChild(noNome);
    noIdeograma.AppendChild(notipo);
    noIdeograma.AppendChild(noCategoria);
    noIdeograma.AppendChild(notamanho);
    noIdeograma.AppendChild(nosementes);
    for cont2:=1 to ideograma.tamanho do
    begin
      noSemente:=docxml.CreateElement('semente');
      nosementes.AppendChild(noSemente);
      noNome:=docxml.CreateElement('nome');
      notipo:=docxml.CreateElement('tipo');
      noCategoria:=docxml.CreateElement('categoria');
      notamanho:=docxml.CreateElement('tamanho');
      noSublista:=docxml.CreateElement('sublista');

      noNome.TextContent:= ideograma.sementes[cont2].ideia;
      notipo.TextContent:=IntToStr(ideograma.sementes[cont2].tipo);
      noCategoria.TextContent:=IntToStr(ideograma.sementes[cont2].categoria);
      notamanho.TextContent:=IntToStr(ideograma.sementes[cont2].tamanho);

      noSemente.AppendChild(noNome);
      noSemente.AppendChild(notipo);
      noSemente.AppendChild(noCategoria);
      noSemente.AppendChild(notamanho);
      noSemente.AppendChild(noSublista);
      for cont3:=1 to ideograma.sementes[cont2].tamanho do
      begin
        noNome:=docxml.CreateElement('nome');
        noNome.TextContent:=ideograma.sementes[cont2].sublista[cont3];
        noSublista.AppendChild(noNome);
      end;
    end;
  end;
  WriteXMLFile(docxml ,NomeArquivo);
end;

procedure TxmlIdeogramas.SetNomeArquivo(const AValue: string);
begin
  if FNomeArquivo=AValue then exit;
  FNomeArquivo:=AValue;
  if lista=nil then
  begin
    carregaxml;
    carregalista;
  end else
  begin
    salvalista;
  end;
end;

constructor TxmlIdeogramas.create;
begin
lista:=nil;
end;

destructor TxmlIdeogramas.destroy;
begin

end;




procedure TxmlTarefas.SetnomeArquivo(const AValue: string);
begin
  if FNomeArquivo=AValue then exit;
  FNomeArquivo:=AValue;
  if lista=nil then
  begin
    carregaxml;
    carregalista;
  end else
  begin
    salvalista;
  end;
end;


procedure TxmlTarefas.carregaxml;
begin
  if FileExists(NomeArquivo)then
   ReadXMLFile(docxml ,NomeArquivo);
end;

procedure TxmlTarefas.carregalista;
var
  noraiz,noTarefa,noNome,noideograma,notipo,nostatus,noCategoria,notamanho,
  nosementes, noSemente, noSublista, noItem: TDOMNode;
  ideograma:Tsementeideograma;
  tarefa:ttarefa;
  str1:string;
  int1: LongWord;
  cont: Integer;
  cont2: Integer;
  cont3: Integer;
begin
  noraiz:= docxml.DocumentElement;
  lista:=TlistTarefa.Create;
  noTarefa:=noraiz.FirstChild;
  while noTarefa<>nil do
  begin
    tarefa:=Ttarefa.Create;
    tarefa.ideograma:=Tideograma.create;
    ideograma := tarefa.ideograma.semente;


    noNome:=noTarefa.ChildNodes.Item[0];
    noideograma:=noTarefa.ChildNodes.Item[1];
    notipo:=noTarefa.ChildNodes.Item[2];
    nostatus:=noTarefa.ChildNodes.Item[3];
    noCategoria:=noTarefa.ChildNodes.Item[4];
    notamanho:=noTarefa.ChildNodes.Item[5];
    nosementes:=noTarefa.ChildNodes.Item[6];


    tarefa.nome      := noNome.TextContent;
    tarefa.tipo      := StrToInt(notipo.TextContent);
    tarefa.status    := StrToInt(nostatus.TextContent);
    tarefa.categoria := StrToInt(noCategoria.TextContent);
    tarefa.tamanho   := StrToInt(notamanho.TextContent);



    noNome:=noideograma.ChildNodes.Item[0];
    notipo:=noideograma.ChildNodes.Item[1];
    noCategoria:=noideograma.ChildNodes.Item[2];
    notamanho:=noideograma.ChildNodes.Item[3];
    noSublista:=noideograma.ChildNodes.Item[4];

    ideograma.ideia     := noNome.TextContent;
    ideograma.tipo      := StrToInt(notipo.TextContent);
    ideograma.categoria := StrToInt(noCategoria.TextContent);
    ideograma.tamanho   := StrToInt(notamanho.TextContent);

    for cont2:=1 to ideograma.tamanho do
    begin
       noNome:=noSublista.ChildNodes.Item[cont2-1];
       ideograma.sublista[cont2] := noNome.TextContent;
    end;


    for cont2:=1 to tarefa.tamanho do
    begin
      noSemente:=nosementes.ChildNodes.Item[cont2-1];

      noNome:=noSemente.ChildNodes.Item[0];
      noideograma:=noSemente.ChildNodes.Item[1]  ;
      notipo:=noSemente.ChildNodes.Item[2];
      nostatus:=noSemente.ChildNodes.Item[3] ;
      noCategoria:=noSemente.ChildNodes.Item[4];
      notamanho:=noSemente.ChildNodes.Item[5];
      noSublista:=nosemente.ChildNodes.Item[6];

      tarefa.sementes[cont2]:=Tsementetarefa.Create;
      tarefa.sementes[cont2].nome                := noNome.TextContent;
      tarefa.sementes[cont2].ideograma:= Tsementeideograma.Create;
      tarefa.sementes[cont2].ideograma.ideia     := noideograma.TextContent;
      tarefa.sementes[cont2].tipo      := StrToInt(notipo.TextContent);
      tarefa.sementes[cont2].status    := StrToInt(nostatus.TextContent);
      tarefa.sementes[cont2].categoria := StrToInt(noCategoria.TextContent);
      tarefa.sementes[cont2].tamanho   := StrToInt(notamanho.TextContent);

      for cont3:=1 to tarefa.sementes[cont2].tamanho do
      begin
        noNome:=noSublista.ChildNodes.Item[cont3-1];
        tarefa.sementes[cont2].sublista[cont3] := noNome.TextContent;
      end;
    end;
    lista.Add(tarefa);
    noTarefa:=noTarefa.NextSibling;
  end;
end;

procedure TxmlTarefas.salvalista;
var
  noraiz,noTarefa,noNome,noideograma,notipo,nostatus,noCategoria,notamanho,
  nosementes, noSemente, noSublista, noItem: TDOMNode;
  ideograma:Tsementeideograma;
  tarefa:ttarefa;
  str1:string;
  int1: LongWord;
  cont: Integer;
  cont2: Integer;
  cont3: Integer;
begin
  docxml:=TXMLDocument.Create;
  noTarefa := nil;
 //docxml.
  noraiz:=docxml.CreateElement('raiz');
  docxml.Appendchild(noraiz);

  for cont:=0 to lista.Count-1 do
  begin
    tarefa:=Ttarefa(lista.tarefas[cont]);
    ideograma:=tarefa.ideograma.semente;
    noTarefa:=docxml.CreateElement('tarefa');
    noraiz.AppendChild(noTarefa);

    noNome:=docxml.CreateElement('nome');
    noideograma:=docxml.CreateElement('ideograma');
    notipo:=docxml.CreateElement('tipo');
    nostatus:=docxml.CreateElement('status');
    noCategoria:=docxml.CreateElement('categoria');
    notamanho:=docxml.CreateElement('tamanho');
    nosementes:=docxml.CreateElement('sementes');

    noNome.TextContent:= tarefa.nome;
    notipo.TextContent:=IntToStr(tarefa.tipo);
    nostatus.TextContent:=IntToStr(tarefa.status);
    noCategoria.TextContent:=IntToStr(tarefa.categoria);
    notamanho.TextContent:=IntToStr(tarefa.tamanho);

    noTarefa.AppendChild(noNome);
    noTarefa.AppendChild(noideograma);
    noTarefa.AppendChild(notipo);
    noTarefa.AppendChild(nostatus);
    noTarefa.AppendChild(noCategoria);
    noTarefa.AppendChild(notamanho);
    noTarefa.AppendChild(nosementes);

    noNome:=docxml.CreateElement('nome');
    notipo:=docxml.CreateElement('tipo');
    noCategoria:=docxml.CreateElement('categoria');
    notamanho:=docxml.CreateElement('tamanho');
    noSublista:=docxml.CreateElement('sublista');

    noNome.TextContent:= ideograma.ideia;
    notipo.TextContent:=IntToStr(ideograma.tipo);
    noCategoria.TextContent:=IntToStr(ideograma.categoria);
    notamanho.TextContent:=IntToStr(ideograma.tamanho);

    noideograma.AppendChild(noNome);
    noideograma.AppendChild(notipo);
    noideograma.AppendChild(noCategoria);
    noideograma.AppendChild(notamanho);
    noideograma.AppendChild(noSublista);
    for cont2:=1 to ideograma.tamanho do
    begin
       noNome:=docxml.CreateElement('nome');
       noNome.TextContent:=ideograma.sublista[cont2];
       noSublista.AppendChild(noNome);
    end;


    for cont2:=1 to tarefa.tamanho do
    begin
      noSemente:=docxml.CreateElement('semente');
      nosementes.AppendChild(noSemente);

      noNome:=docxml.CreateElement('nome');
      noideograma:=docxml.CreateElement('ideograma');
      notipo:=docxml.CreateElement('tipo');
      nostatus:=docxml.CreateElement('status');
      noCategoria:=docxml.CreateElement('categoria');
      notamanho:=docxml.CreateElement('tamanho');
      noSublista:=docxml.CreateElement('sublista');

      noNome.TextContent:= tarefa.sementes[cont2].nome;
      noideograma.TextContent:= tarefa.sementes[cont2].ideograma.ideia;
      notipo.TextContent:=IntToStr(tarefa.sementes[cont2].tipo);
      nostatus.TextContent:=IntToStr(tarefa.sementes[cont2].status);
      noCategoria.TextContent:=IntToStr(tarefa.sementes[cont2].categoria);
      notamanho.TextContent:=IntToStr(tarefa.sementes[cont2].tamanho);

      noSemente.AppendChild(noNome);
      noSemente.AppendChild(noideograma);
      noSemente.AppendChild(notipo);
      noSemente.AppendChild(nostatus);
      noSemente.AppendChild(noCategoria);
      noSemente.AppendChild(notamanho);
      noSemente.AppendChild(noSublista);
      for cont3:=1 to tarefa.sementes[cont2].tamanho do
      begin
        noNome:=docxml.CreateElement('nome');
        noNome.TextContent:=tarefa.sementes[cont2].sublista[cont3];
        noSublista.AppendChild(noNome);
      end;
    end;
  end;
  WriteXMLFile(docxml ,NomeArquivo);
end;

procedure TxmlTarefas.Settarefaraiz(const AValue: Ttarefa);
begin
  if Ftarefaraiz=AValue then exit;
  Ftarefaraiz:=AValue;
end;

constructor TxmlTarefas.create;
begin

end;

destructor TxmlTarefas.destroy;
begin

end;

end.

