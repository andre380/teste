unit Ucoisa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, PairSplitter, StdCtrls, Buttons, ActnList, ComCtrls,  Spin ,
  ButtonPanel, PopupNotifier,  EditBtn,
  Uclassificador,uacessorios,Umontador,Uconjugador,Uarrays,Uarquivos,
  Upensamento,Umanipulaideogramas;
 type

 { Tcoisa }

  Tcoisa = class (TThread)
    status:integer; //0=fechaThread 1=ocupado 2=em_espera  3..6=pronto
    classificador:Tclassificador;
    montador:Tmontador;
    pensamento:Tpensamento;
    utilitarios:Tutilitarios;
    arquivo:array[0..50000]of string;
    entrada:record str1,str2:string; item:variant; end;
    reEntrada:TreEntrada;
  protected
    procedure Execute; override;
  public
    procedure busa;
    procedure le_texto;

    constructor cria ; // o create esta reservado para ligar a thread
    destructor Destroy;  override;
  end;

implementation

{ Tcoisa }

procedure Tcoisa.Execute;
begin // metodo chamado pela thread
  while status>0 do
  begin
    if status>2 then
    status:=status-1;
    pensamento.ciclo;
    if status=2 then Sleep(20);
    if pensamento.filaAtual.Count>100 then status := 100;
  end;
end;

procedure Tcoisa.busa;
begin
  if entrada.str1='le_texto'then
  begin
  status:=1;
  le_texto;
  end;
  //if reEntrada.str1='le_texto'then
  //begin
  //
  //end;
end;

procedure Tcoisa.le_texto;
var teste: TextFile;
 merdA,temp,temp2,temp3, temp4 :string ;
iarquivo, icont, icont3,icont4 :integer;
ligado :boolean;
arrFrase: Tarray500;
ifrase,imatriz: Integer;
memo:TMemo;
tarquivo:string;
begin
 tarquivo:=entrada.str2;
 memo:=tmemo(longint(entrada.item));
 ifrase:=0;
   begin

         assignfile(teste,tarquivo );
         reset(teste);//prepara p/ ler
         icont:=0;
         while (EOF(teste)<>true)and(icont<50000) do
         begin
           icont:=icont+1;
           readln(teste,temp3);
           arquivo[icont]:=' '+ temp3;

         end; closefile (teste);
    iarquivo:= 0;temp:='';
   end;//põe o arquivo no array
FOR icont3:=0 to 1500 do
begin
 ligado:=false;
   temp2:= temp;

   while (((Pos('. ', arquivo[iarquivo])=0)and(Pos('?', arquivo[iarquivo])=0)
    and (Pos('!', arquivo[iarquivo])=0))or((Pos('. ', temp2)=0)and(Pos('?', temp2)=0)and
    (Pos('!', temp2)=0)))and(iarquivo<50000) do
    begin //enquanto n achar pontos
      if (pos('-',temp2) = Length(temp2))and(Length(temp2)>0) and (not (
      (pos('a ',arquivo[iarquivo]) = 1)   or(pos('o ',arquivo[iarquivo]) = 1) or
      (pos('as ',arquivo[iarquivo]) = 1)  or(pos('os ',arquivo[iarquivo]) = 1) or
      (pos('la ',arquivo[iarquivo]) = 1)  or(pos('lo ',arquivo[iarquivo]) = 1) or
      (pos('las ',arquivo[iarquivo]) = 1) or(pos('los ',arquivo[iarquivo]) = 1) or
      (pos('lhe ',arquivo[iarquivo]) = 1) or(pos('lhes ',arquivo[iarquivo]) = 1) or
      (pos('me ',arquivo[iarquivo]) = 1)  or(pos('se ',arquivo[iarquivo]) = 1) or
      (pos('nos ',arquivo[iarquivo]) = 1) or(pos('vos ',arquivo[iarquivo]) = 1) or
      (pos('te ',arquivo[iarquivo]) = 1) ))                   then
      begin //-me , -se , -te , -la(s) ,-lo(s) ,-lhe(s) ,-nos ,-vos ,-a(s) ,-o(s)
         delete(temp2,Length(temp2),1)     ; //apaga o ultimo caracter, o hifen
         temp2:=temp2+trim(arquivo[iarquivo]); //concatena
      end
      else
      begin
        temp2:=temp2+' '+arquivo[iarquivo];  //concatena com espaço
      end;
      iarquivo:=iarquivo+1;
      temp3:= temp2;
      ligado:=true;
    end;

   if (not(ligado))and(temp='') then
   begin
   temp2:= temp2+' '+arquivo[iarquivo];
   iarquivo:=iarquivo+1;
   end;

     if (Pos('. ', temp2)>0)or(Pos('?', temp2)>0)or(Pos('?', temp2)>0) then
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
             delete(temp3,2, pos('. ',temp3));
             temp:= temp3;
             delete(temp2,pos('. ',temp2)+1,(length(temp2)- pos('. ',temp2)));
         end;
     end
     else
     begin
       temp:='';
     end;

     temp2 := LowerCase(temp2);
     temp2:=utilitarios.tiraAcento(temp2);
     //memo.Lines.Add(temp2);
     //memo.Lines.Add(IntToStr(ifrase));
     classificador.entrafrase(temp2);
     ifrase:=ifrase+1;

     memo.lines.Add(montador.atrasaTempo(classificador.matriz));

end;

status:=6;
entrada.str1:='';
end;



constructor Tcoisa.cria;
begin
  pensamento:=Tpensamento.Create;
  classificador:=Tclassificador.create;
  montador:=Tmontador.Create;
  status:=2;
  //instrucoes para a thread ligar VVV
  create(false);                       //parecem fazer o contrario de ligar mas liga
  FreeOnTerminate := True;
  //instrucoes para a thread ligar ^^^
end;

destructor Tcoisa.Destroy;
begin
  classificador.Destroy;
  montador.Destroy;
  pensamento.Destroy;
  inherited Destroy;
end;




end.

