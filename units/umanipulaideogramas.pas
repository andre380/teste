unit Umanipulaideogramas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uideograma,Ubaseideia,Uarrays,Uarquivos;
 type

 { Tcomparaideogramas }

 { Tmanipulaideogramas }

 Tmanipulaideogramas =class
 status:integer   ;
 IdeogramaBase:Tideograma;
 lista:array[1..200]of Tideograma;

  arrIdeograma: array[0..100000] of Tideograma;
  //buferIdeograma: array[0..100] of Tideograma;
  ideograma:Tideograma;
  iideogrAtual,indiceflagideogr:integer;
  iarrideograma:integer;
  baseideia:Tbaseideia;//local
  arquivoIdeograma:TarquivaIdeogramas;//local


 procedure completaIdeograma(ideog:Tideograma);
 procedure apagaIdeograma(suicida:Tideograma);
 //function procuraIdeograma
 function espressaideia(ideog:Tideograma):Tmatriz500x20;
 function analisaEspressao(matriz:Tmatriz500x20):Tideograma;
 function CriaIdeograma(nome:string;tipo,categoria:integer ):Tideograma ;
 constructor create;
 destructor destroy;override;
 private
   function StriToint(s: string): integer;
 end;
implementation

{ Tmanipulaideogramas }

//Só existe mente quando, ao   perigo   de   falhar    no   cálculo,    se
    //acrescenta o  perigo de falhar na expectativa depositada sobre si.

Procedure Tmanipulaideogramas.completaIdeograma(ideog:Tideograma);
Var
  cont: Integer;
  cont2,cont3: Integer;
  executando,terminou: Boolean;
Begin
  for cont:=1 to ideog.tamanho  do
  begin
   if ideog.lista[cont]=nil then
   begin
     for cont2:=1 to iarrIdeograma do
     begin
       if arrIdeograma[cont2].casaSemente(ideog.sementes[cont])  then
       begin
         ideog.lista[cont]:= arrIdeograma[cont2];
         break;
       end;
     End;
   End;
  end;
End;

procedure Tmanipulaideogramas.apagaIdeograma(suicida:Tideograma);
var
  cont: Integer;
  cont2: LongInt;
begin
  for cont:=1 to iarrideograma do
  begin
    if arrIdeograma[cont]= suicida then
    begin
      suicida.destroy;
      for cont2:=cont to iarrideograma-1 do
      begin
        arrIdeograma[cont2]:= arrIdeograma[cont2];
      end;
      iarrideograma:=iarrideograma-1;
    end;
  end;
end;

function Tmanipulaideogramas.espressaideia(ideog: Tideograma): Tmatriz500x20;
var imatriz:integer;
 matriz:Tmatriz500x20;
 cont: Integer;
 ideog2 :Tideograma;
 pegobase: Boolean;
 cont2: Integer;
begin
  matriz.tamanho:=0;
 imatriz:=0;
  completaIdeograma(ideog);
  IF ideog.categoria =2 then
  begin
    completaIdeograma(ideog.lista[1]);
    ideog2:=ideog.lista[1]; //
    for cont:=1 to IdeogramaBase.tamanho do
    begin
      if ideog2=IdeogramaBase.lista[cont] then
      begin
        case cont of
        4..14:begin //nao inclui na resposta
                   pegobase:=true ;
                   break;
                   end;
          15:begin
            matriz.coluna[matriz.tamanho+1][4]:=ideog2.lista[1].ideia ;//sujeito herdado
            matriz.tamanho:= matriz.tamanho+1;
            pegobase:=true ;
            break;
          end;
          16:begin
            for cont2:=2 to ideog2.tamanho do
            begin
              matriz.coluna[matriz.tamanho+1][4]:=ideog2.lista[cont2].ideia;
              matriz.tamanho:= matriz.tamanho+1;
            end;
            pegobase:=true ;
            break;
          end;
          17,18:;//normal
          19:begin
            for cont2:=2 to ideog2.tamanho do
            begin
              matriz.coluna[matriz.tamanho+1][4]:=ideog2.lista[cont2].ideia ;
              matriz.tamanho:= matriz.tamanho+1;
            end;
            pegobase:=true ;
            break;
          end;
          20,21:begin
            matriz.coluna[matriz.tamanho+1][4]:=ideog2.ideia ;
            matriz.coluna[matriz.tamanho+1][1]:='verbo';
            matriz.coluna[matriz.tamanho+1][4]:=ideog2.lista[2].ideia;
            matriz.tamanho:= matriz.tamanho+1;
            pegobase:=true;
            Break;
          end;
          22,24,26:begin
            pegobase:=true ;
            break;
          end;
          23,25,27:begin
            for cont2:=2 to ideog2.tamanho do
            begin
              matriz.coluna[matriz.tamanho+1][4]:=ideog2.lista[cont2].ideia;
              matriz.tamanho:= matriz.tamanho+1;
            end;
            pegobase:=true ;
            break;
          end;





        end;
      end;
    end;
    if pegobase=false then
    begin
      matriz.coluna[matriz.tamanho+1][4]:=ideog2.ideia ;
      matriz.tamanho:= matriz.tamanho+1;
    end;
     pegobase:=false;
    for cont := 2 to ideog.tamanho do
    begin
      matriz.coluna[matriz.tamanho+1][2+cont]:=ideog2.lista[cont].ideia ;
      matriz.tamanho:= matriz.tamanho+1;
    end;
  end
  else
  begin
    for cont := 1 to ideog.tamanho do
    begin
      matriz.coluna[matriz.tamanho+1][2+cont]:=ideog.lista[cont].ideia;
      matriz.tamanho:= matriz.tamanho+1;
    end;
  end;


end;

function Tmanipulaideogramas.analisaEspressao(matriz: Tmatriz500x20
  ): Tideograma;
var
  cont: Integer;
  cont2: Integer;
  cont3: Integer;
  ideog,ideog2,ideog3,espressao:Tideograma;
  vetor:array[0..20]of string;
  flag:boolean;
begin
  espressao:=Tideograma.create;
  flag:=false;
  for cont:=0 to matriz.tamanho do
  begin
 //vetor[1]:= matriz[cont][1];

  if (vetor[1]= 'pronome') then begin    //2
   ideog:= baseideia.testaIdeia(vetor[4]);
   if ideog= nil then; //arranca os cabelos;
  end;
  if (vetor[1]= 'pronome_composto') then begin //3
   espressao.addSubideograma(baseideia.testaIdeia(vetor[4]));
   ideog:= baseideia.testaIdeia(vetor[5])
  end;
  if (vetor[1]= 'pron_sem_referencia') then begin //4
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[4]);
     ideog.addSubideograma(baseideia.testaIdeia(vetor[4]));
  end;
  if (vetor[1]= 'pron_sem_referencias') then begin //5
     for cont2 :=4 to 4 + StriToint(vetor[3]) do
     begin
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[cont2]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[4]);
     ideog.addSubideograma(baseideia.testaIdeia(vetor[cont2]));
     end
  end;
  if (vetor[1]= 'preposicaoreferncia') then begin //6
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[6]);
     ideog.addSubideograma(baseideia.testaIdeia(vetor[4]));

  end;
  if (vetor[1]= 'preposicaoAlvo') then begin//7
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[7]);
     ideog.addSubideograma(baseideia.testaIdeia(vetor[4]));
  end;
  if (vetor[1]= 'pronome_oculto') then begin//8
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[8]);
     ideog.addSubideograma(baseideia.testaIdeia(vetor[4]));
  end;
  if (vetor[1]= 'esclama') then begin    // 9
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[9]);
  end;
  if (vetor[1]= 'ponto') then begin //10
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[10]);
  end;
  if (vetor[1]= 'doispontos') then begin //11
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[11]);
  end;
  if (vetor[1]= 'pergunta') then begin       //12
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[12]);
  end;
  if (vetor[1]= 'negacao') then begin            //13
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[13]);
  end;
  if (vetor[1]= 'sujeito') then begin      //14
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[14]);
     for cont2:=5 to 5+StriToint(vetor[3]) do
     begin
     ideog2:=Tideograma.create ;
     ideog2.ideia:= vetor[cont2]   ;
     ideog2.categoria:= 1      ;
     ideog2.tipo:= 4           ;
     ideog2.addSubideograma(ideog);
     ideog.addSubideograma(ideog2);
     end;
  end;
  if (vetor[1]= 'sujeito_herdado') then begin//15      ////espcial
     ideog:=Tideograma.create ;
     ideog.ideia:= ''   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[15]);
     for cont2:= cont downto 1 do
     begin
        if (espressao.lista[cont2].categoria=2)and
         (espressao.lista[cont2].lista[1]=IdeogramaBase.lista[14])then
         begin
           ideog.addSubideograma(espressao.lista[cont2]);
           break;
         end;
     end;
  end;
  if (vetor[1]= 'sujeito_composto') then begin   //16       ///especia
     ideog:= Tideograma.create;
     ideog.ideia:= ''         ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[16]);

     ideog2:=Tideograma.create ;
     ideog2.ideia:= vetor[4]   ;
     ideog2.categoria:= 2      ;
     ideog2.tipo:= 4           ;
     ideog2.addSubideograma(IdeogramaBase.lista[14]);
     for cont2:=5 to 5+StriToint(vetor[3]) do
     begin
       if  (vetor[cont2]=', ')or(vetor[cont2]='; ')or(vetor[cont2]='e ')or(vetor[cont2]='ou ')  then
       begin
         ideog.addSubideograma(baseideia.testaIdeia(vetor[cont2]));  flag:=true;
       end
       else
       begin
         if flag then
         begin
           ideog2:=Tideograma.create ;
           ideog2.ideia:= vetor[cont2]   ;
           ideog2.categoria:= 2      ;
           ideog2.tipo:= 4           ;
           ideog2.addSubideograma(IdeogramaBase.lista[14]);
           flag:=false;
         end;
         ideog3:=Tideograma.create   ;
         ideog3.ideia:= vetor[cont2] ;
         ideog3.categoria:= 1        ;
         ideog3.tipo:= 4             ;
         ideog3.addSubideograma(ideog2);
         ideog2.addSubideograma(ideog3);
       end;
     end;
  end;
  if (vetor[1]= 'sujeitopassivo') then begin  //17
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[17]);
     for cont2:=5 to 5+StriToint(vetor[3]) do
     begin
     ideog2:=Tideograma.create ;
     ideog2.ideia:= vetor[cont2]   ;
     ideog2.categoria:= 1      ;
     ideog2.tipo:= 4           ;
     ideog2.addSubideograma(ideog);
     ideog.addSubideograma(ideog2);
     end;
  end;
  if (vetor[1]= 'substantivoReferencia') then begin //18
      ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[13]);
  end;
  if (vetor[1]= 'substantivoReferencias') then begin     //19
     ideog:=Tideograma.create ;
     ideog.ideia:= ''   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[19]);
     for cont2:= 4 to 4+ StriToint(vetor[3]) do
     begin
       ideog2:=Tideograma.create ;
       ideog2.ideia:= vetor[cont2]   ;
       ideog2.categoria:= 2      ;
       ideog2.tipo:= 4           ;
       ideog2.addSubideograma(IdeogramaBase.lista[18]);
       ideog.addSubideograma(ideog2);
     end;
  end;
  if (vetor[1]= 'verbo') then begin                     //20
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 1           ;
     ideog.addSubideograma(IdeogramaBase.lista[20]);
     ideog2:=Tideograma.create ;
     ideog2.ideia:= vetor[2]   ;
     ideog2.categoria:= 2      ;
     ideog2.tipo:= 4           ;
     ideog2.addSubideograma(ideog);
     ideog.addSubideograma(ideog2);
  end;
  if (vetor[1]= 'verbo_sem_referencia') then begin      //21
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 1           ;
     ideog.addSubideograma(IdeogramaBase.lista[21]);
     ideog2:=Tideograma.create ;
     ideog2.ideia:= vetor[2]   ;
     ideog2.categoria:= 2      ;
     ideog2.tipo:= 4           ;
     ideog2.addSubideograma(ideog);
     ideog.addSubideograma(ideog2);
  end;
  if (vetor[1]= 'adjetivo') then begin                //22
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[22]);
  end;
  if (vetor[1]= 'adjetivos') then begin               //23
     ideog:=Tideograma.create ;
     ideog.ideia:= ''   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[23]);
     for cont2:= 4 to 4+StriToint(vetor[3]) do
     begin
       ideog2:=Tideograma.create  ;
       ideog2.ideia:= vetor[cont2];
       ideog2.categoria:= 2       ;
       ideog2.tipo:= 4            ;
       ideog2.addSubideograma(IdeogramaBase.lista[22]);
       ideog.addSubideograma(ideog2);
     end;
  end;
  if (vetor[1]= 'adjetivo_do_verbo') then begin       //24
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[24]);
  end;                                                          //
  if (vetor[1]= 'adjetivos_do_verbo') then begin      //25
     ideog:=Tideograma.create ;
     ideog.ideia:= ''   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[25]);
     for cont2:= 4 to 4+StriToint(vetor[3]) do
     begin
       ideog2:=Tideograma.create  ;
       ideog2.ideia:= vetor[cont2];
       ideog2.categoria:= 2       ;
       ideog2.tipo:= 4            ;
       ideog2.addSubideograma(IdeogramaBase.lista[24]);
       ideog.addSubideograma(ideog2);
     end;
  end;
  if (vetor[1]= 'indefinido') then begin              //26
     ideog:=Tideograma.create ;
     ideog.ideia:= vetor[4]   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[26]);
  end;
  if (vetor[1]= 'indefinidos') then begin            //27
     ideog:=Tideograma.create ;
     ideog.ideia:= ''   ;
     ideog.categoria:= 2      ;
     ideog.tipo:= 4           ;
     ideog.addSubideograma(IdeogramaBase.lista[27]);
     for cont2:= 4 to 4+StriToint(vetor[3]) do
     begin
      //if (vetor[cont2]=', ')or(vetor[cont2]='; ')or(vetor[cont2]='e ')or(vetor[cont2]='ou '))
       ideog2:=Tideograma.create ;
       ideog2.ideia:= vetor[cont2]   ;
       ideog2.categoria:= 2      ;
       ideog2.tipo:= 4           ;
       ideog2.addSubideograma(IdeogramaBase.lista[26]);
       ideog.addSubideograma(ideog2);
     end;
  end;

  end;

end;

function Tmanipulaideogramas.CriaIdeograma(nome: string; tipo,
  categoria: integer): Tideograma;
begin

end;




function Tmanipulaideogramas.StriToint( s: string): integer; // StrToInt() gera raise exception as veses '' é visto como nil
begin
  if s = '' then begin result:=0; end else
  try
  Result:= StrToInt(s);
  except Result:=0;
  end;
end;

constructor Tmanipulaideogramas.create;
begin
  baseideia:=Tbaseideia.create;
end;

destructor Tmanipulaideogramas.destroy;
var
  cont: Integer;
begin
  ideograma:=nil;
  for cont:=1 to 200 do lista[cont]:=nil;
  baseideia.destroy;
   inherited destroy;
end;

end.

