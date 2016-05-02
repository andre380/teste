unit Upensamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Umanipulaideogramas,Udecisao,Utarefa,Uideograma,Uarrays,
  Ubaseideia,Ubasetarfa,Uarquivos,uacessorios;
  type

  TreEntrada=class
  str1,str2:string;
  item:variant;
  end;


  { Tpensamento }

  Tpensamento = class
    tendencia:integer;// 1 consonante , 2 dissonante , 3 irrelevante
    reEntrada:TreEntrada;
    manipulaideogramas:Tmanipulaideogramas;
    arquivoTarefa:Tarquivotarefas;//local


    filaAtual,proxfila:TlistTarefa;
    itarefaAtual:integer;
    tarefa:Ttarefa;
    ifilaAtual,iproxfila:integer;
    basetarefa:Tbasetarefa;//local

    procedure criaTarefa(nome:string;ideogr:Tideograma;tipo,categor:integer);
    procedure criaTarefaespecialista(nome:string;ideogr:Tideograma;tipo:integer;tarfbase:Ttarefa);
    procedure decideTarefa;
    procedure execTarefaBase(tarf,caller:Ttarefa);
    procedure executaTarefa(tarf,caller:Ttarefa);
    procedure ExecComoInternaNormal(tarf,caller:Ttarefa);
    procedure ExecComoInternaExpecialista(tarf,caller:Ttarefa);
    procedure ExecComoExternaNormal(tarf,caller:Ttarefa);
    procedure ExecComoExternaExpecialista(tarf,caller:Ttarefa);
    function tarefaconhecida(tarf,caller:Ttarefa):Ttarefa;
    procedure identificaIdeia(str1:string);
    procedure trocafila;
    procedure execDissonancia(tarf,caller:Ttarefa);
    procedure execConsonancia(tarf,caller:Ttarefa);
    function  herancaValida(herdeira,herdada:Ttarefa):boolean;
    function  buscaconsonancia(tarf:Ttarefa; var consonancia:Ttarefa):Boolean;

    constructor Create;
    destructor Destroy; override;
    procedure ciclo;
  end;
implementation

{ Tpensamento }
/// Recebe chamadas da thread
// soluçao para decidir
//No caso do reforço associativo, um mapeamento entre ações(saidas) e estímulos(entrada) é produzido,
//procurando maximizar o valor de desempenho do sistema de aprendizagem ou sinal de reforço.(retorno externo recompensa)
//Como o aprendiz não sabe a ação que deve tomar, este deve testar quais ações produzem mais recompensa.  "lido de livros e internet" ...
Procedure Tpensamento.ciclo;
Var
  cont,cont2,cont3: Integer;
  subprontas: Boolean;
  tarf,caller:Ttarefa;
  int1: LongInt;
Begin
  tarf:=nil;
  caller:=nil;
  int1:=filaAtual.Count;
  if (itarefaAtual+1=filaAtual.Count)and (itarefaAtual<>0) then begin
    trocafila;
  end ;
    tarf:= filaAtual.tarefas[itarefaAtual];
    caller:= filaAtual.Callers[itarefaAtual];
  //tarf.status 1 = concluida  2 = falhada  3 = preparada  4 = parte feita executando  5,6... parte feita aguardando
  //if true then
  if filaAtual.count>0 then
  begin
    if tarf= nil then
	  int1:=int1+1; //debug
    if  (tarf.status > 4) then
    begin
      tarf.status := tarf.status+1;
      for cont:=1 to  tarf.tamanho do
      begin
        if (tarf.lista[cont].status=2) then begin tarf.status:=2;  break; end;
        if (tarf.lista[cont].status <> 1) and (tarf.lista[cont]<>tarf) then begin
	        break;
        end;
        if cont = tarf.tamanho then //se chegou na ultima todas estao prontas
        begin
	  tarf.status:= 1;
        end;
      end;
    end;
    if  (tarf.status = 3)or(tarf.status = 4) then
    begin
      if (tarf.status = 3)then
      begin
        executaTarefa(tarf,caller);// ou faz a parte dela
      end;
      int1:=tarf.tamanho;
      if tarf.tamanho>0 then  //so p confirmar
        for cont:=1 to  tarf.tamanho do
        begin
	  if (tarf.lista[cont].status=2) then begin tarf.status:=2;  break; end;//se uma filha falhou a mae falha tambem
          if (tarf.lista[cont].status=3) then
          begin //poe a 1ª filha preparada na fila
	    proxfila.Add(tarf.lista[cont],tarf);//debug
            break;  //e para de procurar
          end;
          if (cont = tarf.tamanho)and(tarf.status>3)  then
          begin
            tarf.status:=5;  //se chegar ate o fim todas as subtarefas fiseram sua parte
          end;               //entao aguarda (5)
        end;
    end;
    itarefaAtual:=itarefaAtual+1;//vai p proxima na lista
  end else
  begin
    int1:=int1+2;
  end;
End;

procedure Tpensamento.criaTarefa(nome:string;ideogr:Tideograma;tipo,categor:integer);
var
tarefaTemp:Ttarefa;
begin
tarefaTemp:=Ttarefa.Create;
tarefaTemp.nome:= nome;
tarefaTemp.ideograma:=ideogr;
tarefaTemp.tipo:=tipo;
tarefaTemp.categoria:=categor;
//iarrTarefa:= iarrTarefa+1;
//arrtarefa[iarrTarefa]:= tarefaTemp;
//tarefa := arrtarefa[iarrTarefa];
end;

Procedure Tpensamento.criaTarefaespecialista(nome:string;ideogr:Tideograma;tipo:integer;tarfbase:Ttarefa);
var tarefatemp:Ttarefa;
Begin
 tarefatemp:=Ttarefa.Create;
 tarefaTemp.nome:= nome;
 tarefaTemp.ideograma:=ideogr;
 tarefaTemp.tipo:=tipo;
 tarefaTemp.categoria:=2;
 tarefatemp.addSubtarefa(tarfbase);
 //iarrTarefa:= iarrTarefa+1;
 //arrtarefa[iarrTarefa]:= tarefaTemp;
 //tarefa := arrtarefa[iarrTarefa];

End;
///ainda nao
procedure Tpensamento.decideTarefa;
var
 prasoMedio,priorMedia, cont: Integer;
begin
//priorMedia:=0;
//prasoMedio:=0;
//for cont:=0 to 1000 do
//begin
//priorMedia:=priorMedia+tarefas[cont].decisao.prioridade;
//end;
//for cont:=0 to 10 do
//begin
//  //prasoMedio:=prasoMedio+tarefasimultaneas[cont].prasoAtual;
//end;
//priorMedia:=priorMedia Div 1000;
//tarefaAtual.decisao.parametros(priorAtual,priorMedia,prasoAtual,prasoMedio);

end;

procedure Tpensamento.execTarefaBase(tarf,caller: Ttarefa);
begin
  if tarf = basetarefa.tarefas[0]then begin //saber    1  ação
	 // iconhecida:=tarefaconhecida(caller);
	 // case iconhecida of
		//0: nao;
		//1: ;
		//2: ;
		//3: ;
		//4: ;
		//5: ;
		//6: ;
		//7: ;
		//8: ;
		//9: ;
		//10:sim;
	 // end;

  end;
  if tarf = basetarefa.tarefas[1]then begin //quem      2  referencia

  end;
  if tarf = basetarefa.tarefas[2]then begin //onde      3  referencia

  end;
  if tarf = basetarefa.tarefas[3]then begin //mover     4  ao

  end;
  if tarf = basetarefa.tarefas[4]then begin //copiar    4  aao

  end;
  if tarf = basetarefa.tarefas[5]then begin // perceber 5  aao

  end;
  if tarf = basetarefa.tarefas[6]then begin //que        6  conndicao

  end;
  if tarf = basetarefa.tarefas[7]then begin //se         6  cond

  end;
  if tarf = basetarefa.tarefas[8]then begin //ou         6  cond

  end;
  if tarf = basetarefa.tarefas[9]then begin //e          6  cond

  end;
  if tarf = basetarefa.tarefas[10]then begin //quando    7  referencia

  end;
  if tarf = basetarefa.tarefas[11]then begin //como      7  referencia

  end;
  if tarf = basetarefa.tarefas[12]then begin //de        8  referencia

  end;
  if tarf = basetarefa.tarefas[13]then begin //a         9  referencia

  end;
  if tarf = basetarefa.tarefas[14]then begin //o         9  referencia

  end;
  if tarf = basetarefa.tarefas[15]then begin //com       10 referencia

  end;
  if tarf = basetarefa.tarefas[16]then begin //sem       10 referencia

  end;
  if tarf = basetarefa.tarefas[17]then begin //em        11 referencia

  end;
  if tarf = basetarefa.tarefas[18]then begin //por      12 referencia ambigua (por = atraves) (por = no lugar de)

  end;
  if tarf = basetarefa.tarefas[19]then begin //para     13  referencia

  end;
  if tarf = basetarefa.tarefas[20]then begin //meu      14  referencia

  end;
  if tarf = basetarefa.tarefas[21]then begin //seu      14  referencia

  end;
  if tarf = basetarefa.tarefas[22]then begin //entre    15  referencia

  end;
  if tarf = basetarefa.tarefas[23]then begin //ter      16  aao

  end;
  if tarf = basetarefa.tarefas[24]then begin //poder    17  aao

  end;
  if tarf = basetarefa.tarefas[25]then begin //querer   18  aao

  end;
  if tarf = basetarefa.tarefas[26]then begin //fazer    19  aao

  end;
  if tarf = basetarefa.tarefas[27]then begin

  end;
  if tarf = basetarefa.tarefas[28]then begin

  end;

end;

///parte do metodo ciclo
procedure Tpensamento.trocafila;
var
  cont: Integer;
  cont2: LongInt;
  swapfila:TlistTarefa;
begin
  for cont :=filaAtual.Count-1 downto 0 do begin
    if filaAtual.tarefas[cont].status in  [1,2] then begin  //pronta ou falhada sai da fila
      filaAtual.Delete(cont);
    end;
  end;
  for cont :=proxfila.Count-1 downto 0 do begin
    if proxfila.tarefas[cont].status in  [1,2] then begin  //pronta ou falhada sai da fila
      proxfila.Delete(cont);
    end;
  end;
  swapfila:=filaAtual;
  filaAtual:=proxfila;
  proxfila:=swapfila;
  itarefaAtual:=0;
end;

procedure Tpensamento.execDissonancia(tarf, caller: Ttarefa);
var consonancia,tarf1,tarf2,tarf3:Ttarefa; cont:integer;
begin
  if tendencia=1 then
  begin // consonante
    if buscaconsonancia(tarf,consonancia) then
    begin
      for cont:= 1 to consonancia.tamanho-1 do
      proxfila.add(consonancia.lista[cont],tarf);
    end
    else
    begin
      tarf1:=Ttarefa.Create;
      tarf1.nome:= tarf.nome;
      tarf1.ideograma:=tarf.ideograma;
      tarf1.tipo:=tarf.tipo;
      tarf1.categoria:=2;
      tarf1.addSubtarefa(basetarefa.tarefas[29]);//talvez
      tarf1.addSubtarefa(tarf.lista[2]);//ideia opositora

      tarf2:=Ttarefa.Create;
      tarf2.nome:='consonancia_'+tarf.nome;
      tarf2.ideograma:=basetarefa.tarefas[28].ideograma;
      tarf2.tipo:=basetarefa.tarefas[28].tipo;
      tarf2.categoria:=2;
      tarf2.addSubtarefa(basetarefa.tarefas[28]);//relacao_consonancia
      tarf2.addSubtarefa(tarf.lista[2]); //ideia opositora
      tarf2.addSubtarefa(tarf1);         //talvez em relação a opositora

      proxfila.add(tarf2,tarf);
      proxfila.add(tarf1,tarf);
    end;
  end;
  if tendencia=2 then
  begin // dissonante
    tarf.lista[2].status:=2;
  end;
  if tendencia=3 then
  begin // irrelevante
    tarf.lista[2].arquiva;
    tarf.arquiva;
    tarf.lista[2].free;
    tarf.Free;
  end;
end;

procedure Tpensamento.execConsonancia(tarf, caller: Ttarefa);
var cont,cont2:integer; tarf1,tarf2:Ttarefa; talvez:boolean;
begin
  talvez:=true;
  for cont := 1 to tarf.tamanho-1 do
  begin
    if (tarf<>nil) and talvez and herancaValida(tarf.lista[cont].lista[0], basetarefa.tarefas[28]) then// é uma sub tarefa diferente de talvez
      talvez:=false;
    if (tarf<>nil) and (tarf.lista[cont].status = 2) then
    begin
      tarf1:=Ttarefa.Create;
      tarf1.nome:= tarf.nome;
      tarf1.ideograma:=tarf.ideograma;
      tarf1.tipo:=tarf.tipo;
      tarf1.categoria:=tarf.categoria;
      tarf1.addSubtarefa(tarf);
      for cont2 := 1 to tarf.tamanho-1 do
      begin
        if cont2 <> cont then
          tarf1.addSubtarefa(tarf.lista[cont2]);
      end;
      proxfila.add(tarf1);
      tarf.arquiva;
      tarf.Free;
      Break;
    end;
  end;

  if tarf<>nil then
  begin
    if tarf.tamanho < 3 then
    begin
      tarf.status:=2;
      tarf.arquiva;
      tarf.free;
    end;
    if talvez then
    begin
      tarf.arquiva;
      tarf.free;
    end;

  end;
end;

function Tpensamento.herancaValida(herdeira, herdada: Ttarefa): boolean;
begin

end;

function Tpensamento.buscaconsonancia(tarf: Ttarefa; var consonancia: Ttarefa
  ): Boolean;
begin
  //se não achar
  // procurar tambem consonancia com as tarefas herdadas e incluir a atual
end;

/// executa sua parte se possivel
procedure Tpensamento.executaTarefa(tarf,caller:Ttarefa);
var  endereco:longint;snome:string;itipo,icategoria,itamanho,istatus:integer;
begin
snome:=tarf.nome;
itipo:=tarf.tipo;
istatus:=tarf.status;
icategoria:=tarf.categoria;
itamanho:=tarf.tamanho;

  if tarf.tipo =1 then begin // interna
    if tarf.categoria=1 then begin //1=normal 2=especialista
        //if tarf.ideograma.tipo = 1 then begin  //1=acao 2=intencao 3=metodo 4=objeto
			 ExecComoInternaNormal(tarf,caller);
    end;
    if tarf.categoria=2 then begin //1=normal 2=especialista //especialista (tem o mesmo ideograma da original)
      if tarf.lista[1].status=1 then begin //1=cumprida 2=falhada 3=executando 4=parte_feita 5+=aguardando
			 ExecComoInternaExpecialista(tarf,caller);
      end;
    end;
  end;

  if tarf.tipo =2 then begin //externa
    if tarf.categoria=1 then begin
		ExecComoExternaNormal(tarf,caller);
    end;
    if tarf.categoria=2 then begin
      if tarf.lista[1].status=1 then begin
		  ExecComoExternaExpecialista(tarf,caller);
      end;
    end;
  end;
end;

procedure Tpensamento.ExecComoInternaNormal(tarf,caller: Ttarefa);
var snome:string;itipo,icategoria,itamanho:integer;
begin
snome:=tarf.nome;
itipo:=tarf.tipo;
icategoria:=tarf.categoria;
itamanho:=tarf.tamanho;
  if tarf = caller then
  begin
	  tarf.status:=4;
	  exit;
  end;


  if tarf = basetarefa.tarefas[0] then
  begin
//     saber

  end;

  if tarf = basetarefa.tarefas[3] then
  begin
//    mover
    snome:=basetarefa.tarefas[3].nome;
    itipo:=basetarefa.tarefas[3].tipo;
    icategoria:=basetarefa.tarefas[3].categoria;
    itamanho:=basetarefa.tarefas[3].tamanho;
  end;
  if tarf = basetarefa.tarefas[4] then
  begin
//   copiar

  end;
  if tarf = basetarefa.tarefas[5] then
  begin
//   perceber

  end;
  if tarf = basetarefa.tarefas[6] then
  begin
//   que

  end;
  if tarf = basetarefa.tarefas[7] then
  begin
//   se

  end;
  if tarf = basetarefa.tarefas[8] then
  begin
//   ou

  end;
  if tarf = basetarefa.tarefas[9] then
  begin
//   e

  end;

  if tarf = basetarefa.tarefas[12] then
  begin
//  de

  end;
  if tarf = basetarefa.tarefas[13] then
  begin
//  a

  end;
  if tarf = basetarefa.tarefas[14] then
  begin
  //o

  end;
  if tarf = basetarefa.tarefas[15] then
  begin
//  com

  end;
  if tarf = basetarefa.tarefas[16] then
  begin
//  sem

  end;
  if tarf = basetarefa.tarefas[17] then
  begin
//  em

  end;
  if tarf = basetarefa.tarefas[18] then
  begin
//  por

  end;
  if tarf = basetarefa.tarefas[19] then
  begin
//  para

  end;
  if tarf = basetarefa.tarefas[20] then
  begin
//  meu

  end;
  if tarf = basetarefa.tarefas[21] then
  begin
//  seu

  end;
  if tarf = basetarefa.tarefas[22] then
  begin
//  entre

  end;
  if tarf = basetarefa.tarefas[23] then
  begin
//  ter

  end;
  if tarf = basetarefa.tarefas[24] then
  begin
//  poder

  end;
  if tarf = basetarefa.tarefas[25] then
  begin
//  querer

  end;
  if tarf = basetarefa.tarefas[26] then
  begin
//  fazer

  end;

end;

procedure Tpensamento.ExecComoInternaExpecialista(tarf,caller: Ttarefa);
begin
  //if tarefabase(tarf) then
  //begin
	 //execTarefaBase(tarf,caller);
  //end else

end;

procedure Tpensamento.ExecComoExternaNormal(tarf,caller: Ttarefa);
begin
  if tarf = caller then
  begin
	  tarf.status:=4;
	  exit;
  end;

end;

procedure Tpensamento.ExecComoExternaExpecialista(tarf,caller: Ttarefa);
begin
  if tarf.lista[1] = basetarefa.tarefas[0]then begin //saber

  end;
  if tarf.lista[1] = basetarefa.tarefas[1]then begin //quem

  end;
  if tarf.lista[1] = basetarefa.tarefas[2]then begin //onde

  end;
  if tarf.lista[1] = basetarefa.tarefas[3]then begin //mover

  end;
  if tarf.lista[1] = basetarefa.tarefas[4]then begin //copiar

  end;
  if tarf.lista[1] = basetarefa.tarefas[5]then begin // perceber

  end;
  if tarf.lista[1] = basetarefa.tarefas[6]then begin //que

  end;
  if tarf.lista[1] = basetarefa.tarefas[7]then begin //se

  end;
  if tarf.lista[1] = basetarefa.tarefas[8]then begin //ou

  end;
  if tarf.lista[1] = basetarefa.tarefas[9]then begin //e

  end;
  if tarf.lista[1] = basetarefa.tarefas[10]then begin //quando

  end;
  if tarf.lista[1] = basetarefa.tarefas[11]then begin //como

  end;
  if tarf.lista[1] = basetarefa.tarefas[12]then begin //de

  end;
  if tarf.lista[1] = basetarefa.tarefas[13]then begin //a

  end;
  if tarf.lista[1] = basetarefa.tarefas[14]then begin //o

  end;
  if tarf.lista[1] = basetarefa.tarefas[15]then begin //com

  end;
  if tarf.lista[1] = basetarefa.tarefas[16]then begin //sem

  end;
  if tarf.lista[1] = basetarefa.tarefas[17]then begin //em

  end;
  if tarf.lista[1] = basetarefa.tarefas[18]then begin //por

  end;
  if tarf.lista[1] = basetarefa.tarefas[19]then begin //para

  end;
  if tarf.lista[1] = basetarefa.tarefas[20]then begin //meu

  end;
  if tarf.lista[1] = basetarefa.tarefas[21]then begin //seu

  end;
  if tarf.lista[1] = basetarefa.tarefas[22]then begin //entre

  end;
  if tarf.lista[1] = basetarefa.tarefas[23]then begin //ter

  end;
  if tarf.lista[1] = basetarefa.tarefas[24]then begin //poder

  end;
  if tarf.lista[1] = basetarefa.tarefas[25]then begin //querer

  end;
  if tarf.lista[1] = basetarefa.tarefas[26]then begin //fazer

  end;

end;

function Tpensamento.tarefaconhecida(tarf, caller: Ttarefa): Ttarefa;
begin

end;


///assim espero
procedure Tpensamento.identificaIdeia(str1: string);
begin


end;
///cria manipulaideogramas,basetarefa e arquivotarefa
constructor Tpensamento.Create;
var
  cont: Integer;
begin
  filaAtual:=TlistTarefa.Create;
  proxfila:=TlistTarefa.Create;
  manipulaideogramas:=Tmanipulaideogramas.create ;
  basetarefa:=Tbasetarefa.Create;
  basetarefa.monta(manipulaideogramas);
  for cont:= 0 to 250 do
  begin
    if basetarefa.tarefas[cont]<>nil then
    filaAtual.Add(basetarefa.tarefas[cont]);
  end;
  arquivoTarefa:=Tarquivotarefas.Create;//local
  //filaAtual:=
end;

///libera da memoria apenas os objetos que criou
destructor Tpensamento.Destroy;
begin
  manipulaideogramas.destroy;
  //baseideia.destroy;
  //arquivoIdeograma.Destroy;
  basetarefa.Destroy;
  arquivoTarefa.Destroy;
  inherited Destroy;
end;



end.

