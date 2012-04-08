unit Umontador;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uconjugador,Uarrays,uacessorios,Uarquivos;
  type

  { Tmontador }

  Tmontador= class
  status:integer;
  conjugador:Tconjugador;
  utitlitario:Tutilitarios;
  frase:string;
  matrfrase:Tmatriz500x20 ;


  function inverteFrase(matriz:Tmatriz500x20):string;
  function atrasaTempo(matriz:Tmatriz500x20):string;
  function mestreYoda(matriz:Tmatriz500x20):string;
  function montafrase (matriz:Tmatriz500x20):string;
  function situaverbo(verbo,tempo:string):string;
  function StriToint( s: string): integer;
  constructor Create;
  destructor Destroy; override;
  end    ;

implementation

{ Tmontador }


function Tmontador.inverteFrase(matriz: Tmatriz500x20): string;
begin

end;

function Tmontador.atrasaTempo(matriz: Tmatriz500x20): string;
var
  cont: Integer;
  str1:string;
begin

  for cont:= 0 to matriz.tamanho do
  begin
    if matriz.coluna[cont][2]='|1pi ' then
    begin
      matriz.coluna[cont][2]:='|1pp ';
    end;
    if matriz.coluna[cont][2]='|2pi ' then
    begin
      matriz.coluna[cont][2]:='|2pp ';
    end;
    if matriz.coluna[cont][2]='|3pi ' then
    begin
      matriz.coluna[cont][2]:='|3pp ';
      end;
    if matriz.coluna[cont][2]='|4pi ' then
    begin
      matriz.coluna[cont][2]:='|4pp ' ;
    end;
    if matriz.coluna[cont][2]='|5pi ' then
    begin
      matriz.coluna[cont][2]:='|5pp ' ;
    end;
    if matriz.coluna[cont][2]='|6pi ' then
    begin
      matriz.coluna[cont][2]:='|6pp ' ;
    end;
  end;
frase:= montafrase(matriz);
Result:= frase;
matrfrase:= matriz;
end;

function Tmontador.mestreYoda(matriz: Tmatriz500x20): string;
var
  cont: Integer;
  str1:string;
 tamanho, cont2: Integer;
begin
  str1:=''; tamanho:=  matriz.tamanho;
  for cont:= 0 to tamanho do
  begin
    for cont2:= 4 to StriToint(matriz.coluna[cont][3])+4 do
    begin
      str1:=str1+matriz.coluna[cont][cont2];
    end;
  end;
  matrfrase:= matriz;
  frase:= str1;
  Result:= str1 ;
end;

function Tmontador.montafrase(matriz: Tmatriz500x20): string;
var
  cont: Integer;
  str1,str2:string;
 tamanho,tamanho2, cont2, cont3 : Integer;
begin
  str1:=''; tamanho:=  matriz.tamanho;
  for cont:= 0 to tamanho do
  begin
    tamanho2:=StriToint(matriz.coluna[cont][3])+4;
    for cont2:= 4 to tamanho2 do
    begin
      if (utitlitario.casestr(matriz.coluna[cont][1],'verbo','verbo_sem_referencia'))or
      (utitlitario.casestr(matriz.coluna[cont][2],'|gerundio','|agente',
      '|acao','|resultado','|participio')) then
      begin
        conjugador.conjugaverbo(matriz.coluna[cont][cont2]);
           str1:=str1+' '+situaverbo((matriz.coluna[cont][cont2]),(matriz.coluna[cont][2]));
      end
      else
      begin
        str1:=str1+' '+matriz.coluna[cont][cont2];
      end;
    //  str1:=str1+matriz.coluna[cont][cont2];
    end;
  end;
  matrfrase:= matriz;
  frase:= str1;
  Result:= str1 ;
end;

function Tmontador.situaverbo(verbo, tempo: string): string;
var
  cont: Integer;
  str2: string;
begin
Result:='';
    for cont:=1 to 143 do
        begin
              case cont of
           14      :  str2:='|1fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
           24      :  str2:='|1pi' ; //presente do indicativo ||   canto:cantas:canta
           34      :  str2:='|1pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
           44      :  str2:='|1ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
           54      :  str2:='|1mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
           64      :  str2:='|1ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
           74      :  str2:='|1ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
           84      :  str2:='|1ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
           94      :  str2:='|1is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
           104     :  str2:='|1fs';//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
             end;
              case cont of
           15      :   str2:='|2fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
           25      :   str2:='|2pi' ; //presente do indicativo ||   canto:cantas:canta
           35      :   str2:='|2pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
           45      :   str2:='|2ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
           55      :   str2:='|2mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
           65      :   str2:='|2ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
           75      :   str2:='|2ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
           85      :   str2:='|2ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
           95      :   str2:='|2is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
           105     :   str2:='|2fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
           114     :   str2:='|2ia' ;
           123     :   str2:='|2in' ;
               end;
              case cont of
           16      :   str2:='|3fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
           26      :   str2:='|3pi' ; //presente do indicativo ||   canto:cantas:canta
           36      :   str2:='|3pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
           46      :   str2:='|3ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
           56      :   str2:='|3mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
           66      :   str2:='|3ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
           76      :   str2:='|3ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
           86      :   str2:='|3ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
           96      :   str2:='|3is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
           106     :   str2:='|3fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
           115     :   str2:='|3ia' ;//imperativo afirmativo ORDEM || DEPOIS  TU canta:cante:cantemos:cantai:cantem
           124     :   str2:='|3in' ;//imperativo negativo ORDEM INUTIL || DEPOIS TU NAO cantes:cante:cantemos:canteis:cantem
             end;
               case cont of
           19      : str2:='|4fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
           29      : str2:='|4pi' ; //presente do indicativo ||   canto:cantas:canta
           39      : str2:='|4pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
           49      : str2:='|4ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
           59      : str2:='|4mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
           69      : str2:='|4ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
           79      : str2:='|4ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
           89      : str2:='|4ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
           99      : str2:='|4is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
           109     : str2:='|4fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
           118     : str2:='|4ia' ;
           127     : str2:='|4in' ;
               end;
               case cont of
           20      : str2:='|5fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
           30      : str2:='|5pi' ; //presente do indicativo ||   canto:cantas:canta
           40      : str2:='|5pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
           50      : str2:='|5ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
           60      : str2:='|5mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
           70      : str2:='|5ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
           80      : str2:='|5ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
           90      : str2:='|5ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
           100     : str2:='|5is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
           110     : str2:='|5fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
           119     : str2:='|5ia' ;
           128     : str2:='|5in' ;
               end;
              case cont of
           21      :  str2:='|6fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
           31      :  str2:='|6pi' ; //presente do indicativo ||   canto:cantas:canta
           41      :  str2:='|6pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
           51      :  str2:='|6ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
           61      :  str2:='|6mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
           71      :  str2:='|6ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
           81      :  str2:='|6ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
           91      :  str2:='|6ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
           101     :  str2:='|6is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
           111     :  str2:='|6fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
           120     :  str2:='|6ia' ;//imperativo afirmativo ORDEM || DEPOIS  TU canta:cante:cantemos:cantai:cantem
           129     :  str2:='|6in' ;//imperativo negativo ORDEM INUTIL || DEPOIS TU NAO cantes:cante:cantemos:canteis:cantem
             end;//case
             case cont of
           1,2,8,9,132,133,138,139: str2:= '|gerundio';
           3,7,10,134,137,140 : str2:= '|agente';
           4,11,12,135,141,142:str2:= '|acao';
           5,13,136,143:str2:= '|resultado';
           6:str2:= '|participio';
              end;
          if str2=Trim(tempo) then
          begin
           conjugador.conjugaverbo(verbo);
          Result:=conjugador.aconjugado[cont];
           break;
          end;

        end;
end;

function Tmontador.StriToint( s: string): integer; // StrToInt() gera raise exception; as veses '' é visto como nil  e nao como string nula
begin
  if s = '' then begin result:=0; end else
  try
  Result:= StrToInt(s);
  except Result:=0;
  end;
end;
constructor Tmontador.Create;
begin
  conjugador:=Tconjugador.Create;
 // matrfrase:=Tmatriz500x20.Create ;
end;

destructor Tmontador.Destroy;
begin
  conjugador.Destroy;
  //matrfrase.Destroy;
  inherited Destroy;
end;

end.

