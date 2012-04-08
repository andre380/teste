unit Uverbos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uconjugador,Uarquivos,Uarrays;
type

{ Tverbos }

Tverbos= class
 status:integer;
 verbo:string;
 tipo:string;
 conjugador:Tconjugador;
 vetor:Tarray30k;
 baseverbo:Tarquivotxt;
     function tipoVerbo(pp_str1: string):string;
     function isola_verbo(str1: string):string;
     constructor Create;
     destructor Destroy; override;
end;
implementation



function Tverbos.tipoVerbo(pp_str1: string):string;///////////////////////////////////////
var pp_iverb:integer ; str2:string;
begin//tipoVerbo(ini);
 Result:='';
 for pp_iverb := 0 to 143 do
 begin
  str2:= conjugador.aconjugado[pp_iverb];
     if (conjugador.aconjugado[pp_iverb]= pp_str1) then
     begin//pp_iverb ini
          case pp_iverb of
       14      :  result:='|1fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
       24      :  result:='|1pi' ; //presente do indicativo ||   canto:cantas:canta
       34      :  result:='|1pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
       44      :  result:='|1ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
       54      :  result:='|1mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
       64      :  result:='|1ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
       74      :  result:='|1ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
       84      :  result:='|1ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
       94      :  result:='|1is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
       104     :  result:='|1fs';//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
         end;
          case pp_iverb of
       15      :   result:='|2fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
       25      :   result:='|2pi' ; //presente do indicativo ||   canto:cantas:canta
       35      :   result:='|2pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
       45      :   result:='|2ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
       55      :   result:='|2mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
       65      :   result:='|2ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
       75      :   result:='|2ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
       85      :   result:='|2ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
       95      :   result:='|2is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
       105     :   result:='|2fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
       114     :   result:='|2ia' ;
       123     :   result:='|2in' ;
           end;
          case pp_iverb of
       16      :   result:='|3fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
       26      :   result:='|3pi' ; //presente do indicativo ||   canto:cantas:canta
       36      :   result:='|3pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
       46      :   result:='|3ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
       56      :   result:='|3mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
       66      :   result:='|3ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
       76      :   result:='|3ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
       86      :   result:='|3ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
       96      :   result:='|3is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
       106     :   result:='|3fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
       115     :   result:='|3ia' ;//imperativo afirmativo ORDEM || DEPOIS  TU canta:cante:cantemos:cantai:cantem
       124     :   result:='|3in' ;//imperativo negativo ORDEM INUTIL || DEPOIS TU NAO cantes:cante:cantemos:canteis:cantem
         end;
           case pp_iverb of
       19      : result:='|4fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
       29      : result:='|4pi' ; //presente do indicativo ||   canto:cantas:canta
       39      : result:='|4pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
       49      : result:='|4ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
       59      : result:='|4mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
       69      : result:='|4ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
       79      : result:='|4ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
       89      : result:='|4ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
       99      : result:='|4is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
       109     : result:='|4fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
       118     : result:='|4ia' ;
       127     : result:='|4in' ;
           end;


           case pp_iverb of
       20      : result:='|5fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
       30      : result:='|5pi' ; //presente do indicativo ||   canto:cantas:canta
       40      : result:='|5pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
       50      : result:='|5ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
       60      : result:='|5mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
       70      : result:='|5ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
       80      : result:='|5ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
       90      : result:='|5ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
       100     : result:='|5is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
       110     : result:='|5fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
       119     : result:='|5ia' ;
       128     : result:='|5in' ;
           end;
          case pp_iverb of
       21      :  result:='|6fi' ; // futuro do presente do indicativo||   cantarei:cantarás:cantará
       31      :  result:='|6pi' ; //presente do indicativo ||   canto:cantas:canta
       41      :  result:='|6pp' ; //preterito perfeito *EI*||   cantei:cantaste:cantou
       51      :  result:='|6ii' ; //imperfeito do indicativo|| cantava:cantavas:cantava:cantávamos:cantáveis:cantavam
       61      :  result:='|6mi' ; //mais-que-perfeito do indicativo|| //N I N G U E M   U S A   I S S O cantara:cantaras:cantara:cantáramos:cantáreis:cantaram
       71      :  result:='|6ti' ; //futuro do pretérito do indicativo|| cantaria:cantarias:cantaria
       81      :  result:='|6ip' ; //PARA PRA eu cantar:cantares: cantar: cantarmos: cantardes:cantarem
       91      :  result:='|6ps' ; //presente do subjuntivo||  QUE EU  cante: cantes:cante:cantemos:canteis:cantem
       101     :  result:='|6is' ; //imperfeito do subjuntivo||SE QUANDO COMO QUE EU cantasse:cantasses:cantasse:cantássemos:cantásseis:cantassem
       111     :  result:='|6fs' ;//futuro do subjuntivo|| PARA PRA SE QUANDO COMO EU cantar:cantares:cantar:cantarmos:cantardes:cantarem
       120     :  result:='|6ia' ;//imperativo afirmativo ORDEM || DEPOIS  TU canta:cante:cantemos:cantai:cantem
       129     :  result:='|6in' ;//imperativo negativo ORDEM INUTIL || DEPOIS TU NAO cantes:cante:cantemos:canteis:cantem
         end;//case
         case pp_iverb of
       1,2,8,9,132,133,138,139: Result:= '|gerundio';
       3,7,10,134,137,140 : Result:= '|agente';
       4,11,12,135,141,142:Result:= '|acao';
       5,13,136,143:Result:= '|resultado';
       6:Result:= '|participio';
          end;
      end;//pp_iverb fim
   end;
end;


function Tverbos.isola_verbo( str1: string):string;//////////////////////////////////
var
iv_abc,iv_iverb: integer;
cont,cont2,cont3, imeio,iMinimo,imaximo,iInten_figurada : integer;
cp_str2,cp_str3: string;
pego:boolean;
airregular:TStringList;
str10: string;
begin//DA FUNCTION
 result:='';
 airregular:=TStringList.Create;
 for cont:=0 to 40 do airregular.Add(' ');
 str1:= Trim(str1)+' ';
 iMinimo:=0;
 imaximo:=baseverbo.linhas;
for cont:=0 to 15  do
begin//1
  imeio:= ((imaximo -iMinimo)div 2)+iMinimo;
  cp_str2:= vetor.lista[imeio];
  //pra te certesa q vai se so a 1ª palavra e com espaço depois
  TrimLeft(cp_str2);
  delete(cp_str2,pos(' ',cp_str2),
  (length(cp_str2)- pos(' ',cp_str2)+1));
  cp_str2 := cp_str2+' ';
  if iMinimo>5 then cont3:= iMinimo-5 else cont3:= iMinimo;
  for cont2:=cont3 to cont3+10 do
  begin//K
  conjugador.conjugaverbo(vetor.lista[cont2]);
    for iv_iverb := 0 to 143 do
    begin//CCC
      if (str1  = conjugador.aconjugado[iv_iverb])and(str1 <> '') then
      begin//ww
        verbo := str1;
        result:= trim(vetor.lista[cont2])+' ';
        break;
      end;//ww
    end;//CCC
       if Result<>'' then
       break;
  end ;//K
      //@@@@
  if Result<>'' then
     break;
  if cp_str2>str1 then imaximo:=imeio //decide p/ que lado ir (semelhante a buble-sort)
  else iMinimo:=imeio;
end;//1

  airregular[1]:= 'dizer';airregular[2 ]:='dormir';airregular[3 ]:='fazer';airregular[4 ]:='ler';
  airregular[5]:='ouvir';airregular[6 ]:='pedir';airregular[7 ]:='perder';airregular[ 8]:='poder';
  airregular[ 9]:='por';airregular[10 ]:='querer';airregular[11 ]:='saber';airregular[12 ]:='sair';
  airregular[13 ]:='subir';airregular[ 14]:='trazer';airregular[15 ]:='ver';airregular[16 ]:='vir';
  airregular[17 ]:='dar';airregular[18 ]:='estar';airregular[19 ]:='ser';airregular[20 ]:='ter';
  airregular[21 ]:='haver';airregular[22 ]:='ver';airregular[23 ]:='vir';airregular[24 ]:='ir';
  airregular[25]:='rir';airregular[26 ]:='pôr';airregular[27 ]:='ler';airregular[28 ]:='crer';
  airregular[29 ]:='saber';airregular[30 ]:='caber';airregular[31 ]:='querer';airregular[32 ]:='poder';
  airregular[33 ]:='fazer';airregular[34 ]:='dizer';airregular[35 ]:='trazer';airregular[36 ]:='aprazer';
  if result = '' then
  for cont2:=0 to 36 do
   begin
   conjugador.conjugaverbo(airregular[cont2]);
    for iv_iverb := 0 to 143 do
     begin//iv ini
     str10:= conjugador.aconjugado[iv_iverb];
      if (str1  = conjugador.aconjugado[iv_iverb])and(str1 <> '') then
       begin//ww
        verbo := trim(airregular[cont2])+' ';
        result:= trim(airregular[cont2])+' ';
        break;
       end;//ww
      end;
   if Result<>'' then
      break;
   end ;//iv fim
  if Result<>'' then
  begin
  conjugador.conjugaverbo(Result);
  Result:= Result + tipoVerbo(str1)+' ';
  end;
  airregular.Destroy;
end;


 //////////////////////////////////////



constructor Tverbos.Create;
begin
 conjugador:= Tconjugador.Create;
 //vetor:=Tarray30k.Create;
 baseverbo:=Tarquivotxt.Create;

 baseverbo.enderecoArquivo('baseverbo.txt');
 baseverbo.gravaArray(vetor);


end;

destructor Tverbos.Destroy;
begin
  conjugador.Destroy;
  //vetor.Destroy;
  baseverbo.Destroy;
  inherited Destroy;
end;





end.

