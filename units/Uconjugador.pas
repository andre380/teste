unit Uconjugador;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 
type
/// monta um array com o verbo fornecido

{ Tconjugador }

Tconjugador = class
  status:integer;
  verbo :string;
  a_eu_tu_ele,aconjugado:TStringList;
  aderivado: array[0..30] of string;
  /// monta um array com o verbo fornecido
  procedure conjugaverbo(cj_str1:string);
  constructor Create;
  destructor Destroy; override;
end;
implementation
   procedure Tconjugador.conjugaverbo(cj_str1:string);
 var
 eu,GERm, GERf, GERAm, GERAf, PART, AGENTE1, AGENTE2, AGENTE3, ACAO1, ACAO2, ACAO3, RESU1, RESU2 : string;
   IP_eu ,IP_tu, IP_ele ,IP_ela ,IP_voce ,IP_nos ,IP_vos ,IP_voces ,IP_eles ,IP_elas : string;
   PI_eu ,PI_tu ,PI_ele ,PI_ela ,PI_voce ,PI_nos ,PI_vos ,PI_voces ,PI_eles ,PI_elas : string;
   PP_eu ,PP_tu ,PP_ele ,PP_ela ,PP_voce ,PP_nos ,PP_vos ,PP_voces ,PP_eles ,PP_elas : string;
   II_eu ,II_tu ,II_ele ,II_ela ,II_voce ,II_nos ,II_vos ,II_voces ,II_eles ,II_elas : string;
   MI_eu ,MI_tu ,MI_ele ,MI_ela ,MI_voce ,MI_nos ,MI_vos ,MI_voces ,MI_eles ,MI_elas : string;
   TI_eu ,TI_tu ,TI_ele ,TI_ela ,TI_voce ,TI_nos ,TI_vos ,TI_voces ,TI_eles ,TI_elas : string;
   FI_eu ,FI_tu ,FI_ele ,FI_ela ,FI_voce ,FI_nos ,FI_vos ,FI_voces ,FI_eles ,FI_elas : string;
   PS_eu ,PS_tu ,PS_ele ,PS_ela ,PS_voce ,PS_nos ,PS_vos ,PS_voces ,PS_eles ,PS_elas : string;
   IS_eu ,IS_tu ,IS_ele ,IS_ela ,IS_voce ,IS_nos ,IS_vos ,IS_voces ,IS_eles ,IS_elas : string;
   FS_eu ,FS_tu ,FS_ele ,FS_ela ,FS_voce ,FS_nos ,FS_vos ,FS_voces ,FS_eles ,FS_elas : string;
   IA_eu ,IA_tu ,IA_ele ,IA_ela ,IA_voce ,IA_nos ,IA_vos ,IA_voces ,IA_eles ,IA_elas : string;
   IN_eu ,IN_tu ,IN_ele ,IN_ela ,IN_voce ,IN_nos ,IN_vos ,IN_voces ,IN_eles ,IN_elas : string;
   icont: Integer;
   begin//conjuga_verbo ini
   eu:= cj_str1+' ';
  //12/4/09  macia  otrivina
if (Pos('ar ',eu)>0)or(Pos('er ',eu)>0)or
(Pos('ir ',eu)>0)or(Pos('por ',eu)>0)then
begin
 begin// bloco_de_verbos ini

  if  (pos('ar ',eu)  > 1) and (pos('ar ',eu)  < 20)then
   begin // ar inicio
           if Pos('ç',eu)>0 then
           begin
             Insert('¨',eu,pos('ç',eu));
             delete(eu,pos('ç',eu),2);
           end;

      //testa se é irregular
   if ((pos('car ',eu)  > 1) and (pos('car ',eu)< 20)) then
   begin//car inicio

   delete(eu,pos('ar ',eu)-1,(length(eu)- pos('ar ',eu)+2));

   {adjacente, adoçante, adolescente, agravante, alvejante, amante, antecedente, aparente, ardente,
   assaltante, atenuante, beneficente, cadente, cantante, ciente, cintilante, circunferente, coexistente,
   colante, competente, concluinte, confidente, conivente, conseguinte, constituinte, contribuinte,
   cortante, crente, crescente, decadente, delinqüente, derrapante, deslizante, deslumbrante, detergente,
   diferente, diletante, diligente, dissonante, distante, dormente, entorpecente, errante, esclerosante,
   estafante, excipiente, extenuante, falante, fervente, figurante, flagrante, fluente, fluorescente,
   fumegante, gerente, importante, inadimplente, incongruente, independente, indulgente, inflamante,
   influente, mirante, montante, navegante, nutriente, obstante, oponente, ouvinte, parturiente,
   pedinte, poente, poluente, possuinte, protuberante, purificante, quiescente, rastejante, recalcitrante,
   recipiente, referente}
       GERm      :=(eu+'cado ');   //ado s
       GERf      :=(eu+'cada ');        //ada s
       GERAm      :=(eu+'cado ');
       GERAf      :=(eu+'cada ');
       PART      :=(eu+'cando ');
       AGENTE1   :=(eu+'cante ');      //ante s //ente s  formig a nte | consequ e nte  |ouv i nte
       AGENTE2   :=(eu+'cador ');
       AGENTE3   :=(eu+'cadora ');
       ACAO1     :=(eu+'camento ');
       ACAO2     :=(eu+'cação ');
       ACAO3     :=(eu+'camenta ');
       RESU1     :=(eu+'casso ');
       RESU2     :=(eu+'cassa ');

       IP_eu     :=(eu+'car ');
       IP_tu     :=(eu+'cares ');
       IP_ele    :=(eu+'car ');
       IP_ela    :=(eu+'car ');
       IP_voce   :=(eu+'car ');
       IP_nos    :=(eu+'carmos ');
       IP_vos    :=(eu+'cardes ');
       IP_voces  :=(eu+'carem ');
       IP_eles   :=(eu+'carem ');
       IP_elas   :=(eu+'carem ');

       PI_eu     :=(eu+'co ');
       PI_tu     :=(eu+'cas ');
       PI_ele    :=(eu+'ca ');
       PI_ela    :=(eu+'ca ');
       PI_voce   :=(eu+'ca ');
       PI_nos    :=(eu+'camos ');
       PI_vos    :=(eu+'cais ');
       PI_voces  :=(eu+'cam ');
       PI_eles   :=(eu+'cam ');
       PI_elas   :=(eu+'cam ');

       PP_eu     :=(eu+'quei ');
       PP_tu     :=(eu+'caste ');
       PP_ele    :=(eu+'cou ');
       PP_ela    :=(eu+'cou ');
       PP_voce   :=(eu+'cou ');
       PP_nos    :=(eu+'camos ');
       PP_vos    :=(eu+'castes ');
       PP_voces  :=(eu+'caram ');
       PP_eles   :=(eu+'caram ');
       PP_elas   :=(eu+'caram ');

       II_eu     :=(eu+'cava ');
       II_tu     :=(eu+'cavas ');
       II_ele    :=(eu+'cava ');
       II_ela    :=(eu+'cava ');
       II_voce   :=(eu+'cava ');
       II_nos    :=(eu+'cavamos ');
       II_vos    :=(eu+'caveis ');
       II_voces  :=(eu+'cavam ');
       II_eles   :=(eu+'cavam ');
       II_elas   :=(eu+'cavam ');

       MI_eu     :=(eu+'cara ');
       MI_tu     :=(eu+'caras ');
       MI_ele    :=(eu+'cara ');
       MI_ela    :=(eu+'cara ');
       MI_voce   :=(eu+'cara ');
       MI_nos    :=(eu+'caramos ');
       MI_vos    :=(eu+'careis ');
       MI_voces  :=(eu+'caram ');
       MI_eles   :=(eu+'caram ');
       MI_elas   :=(eu+'caram ');

       TI_eu     :=(eu+'caria ');
       TI_tu     :=(eu+'carias ');
       TI_ele    :=(eu+'caria ');
       TI_ela    :=(eu+'caria ');
       TI_voce   :=(eu+'caria ');
       TI_nos    :=(eu+'cariamos ');
       TI_vos    :=(eu+'carieis ');
       TI_voces  :=(eu+'cariam ');
       TI_eles   :=(eu+'cariam ');
       TI_elas   :=(eu+'cariam ');

       FI_eu     :=(eu+'carei ');
       FI_tu     :=(eu+'caras ');
       FI_ele    :=(eu+'cara ');
       FI_ela    :=(eu+'cara ');
       FI_voce   :=(eu+'cara ');
       FI_nos    :=(eu+'caremos ');
       FI_vos    :=(eu+'careis ');
       FI_voces  :=(eu+'carão ');
       FI_eles   :=(eu+'carão ');
       FI_elas   :=(eu+'carão ');

       PS_eu     :=(eu+'que ');
       PS_tu     :=(eu+'ques ');
       PS_ele    :=(eu+'que ');
       PS_ela    :=(eu+'que ');
       PS_voce   :=(eu+'que ');
       PS_nos    :=(eu+'quemos ');
       PS_vos    :=(eu+'queis ');
       PS_voces  :=(eu+'quem ');
       PS_eles   :=(eu+'quem ');
       PS_elas   :=(eu+'quem ');

       IS_eu     :=(eu+'casse ');
       IS_tu     :=(eu+'casses ');
       IS_ele    :=(eu+'casse ');
       IS_ela    :=(eu+'casse ');
       IS_voce   :=(eu+'casse ');
       IS_nos    :=(eu+'cassemos ');
       IS_vos    :=(eu+'casseis ');
       IS_voces  :=(eu+'cassem ');
       IS_eles   :=(eu+'cassem ');
       IS_elas   :=(eu+'cassem ');

       FS_eu     :=(eu+'car ');
       FS_tu     :=(eu+'cares ');
       FS_ele    :=(eu+'car ');
       FS_ela    :=(eu+'car ');
       FS_voce   :=(eu+'car ');
       FS_nos    :=(eu+'carmos ');
       FS_vos    :=(eu+'cardes ');
       FS_voces  :=(eu+'carem ');
       FS_eles   :=(eu+'carem ');
       FS_elas   :=(eu+'carem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ca ');
       IA_ele    :=(eu+'que ');
       IA_ela    :=(eu+'que ');
       IA_voce   :=(eu+'que ');
       IA_nos    :=(eu+'quemos ');
       IA_vos    :=(eu+'cai ');
       IA_voces  :=(eu+'quem ');
       IA_eles   :=(eu+'quem ');
       IA_elas   :=(eu+'quem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ques ');
       IN_ele    :=(eu+'que ');
       IN_ela    :=(eu+'que ');
       IN_voce   :=(eu+'que ');
       IN_nos    :=(eu+'quemos ');
       IN_vos    :=(eu+'queis ');
       IN_voces  :=(eu+'quem ');
       IN_eles   :=(eu+'quem ');
       IN_elas   :=(eu+'quem ');

   end //car meio
  else
   begin //car cont
   if ((pos('gar ',eu)  > 1) and (pos('gar ',eu)< 20))  then
    begin// gar inicio
       delete(eu,pos('ar ',eu),(length(eu)- pos('ar ',eu)+1));

       GERm      :=(eu+'ado ');
       GERf      :=(eu+'ada ');
       GERAm      :=(eu+'ado ');
       GERAf      :=(eu+'ada ');
       PART      :=(eu+'ando ');
       AGENTE1   :=(eu+'ante ');
       AGENTE2   :=(eu+'ador ');
       AGENTE3   :=(eu+'adora ');
       ACAO1     :=(eu+'amento ');
       ACAO2     :=(eu+'ação ');
       ACAO3     :=(eu+'amenta ');
       RESU1     :=(eu+'asso ');
       RESU2     :=(eu+'assa ');

       IP_eu     :=(eu+'ar ');
       IP_tu     :=(eu+'ares ');
       IP_ele    :=(eu+'ar ');
       IP_ela    :=(eu+'ar ');
       IP_voce   :=(eu+'ar ');
       IP_nos    :=(eu+'armos ');
       IP_vos    :=(eu+'ardes ');
       IP_voces  :=(eu+'arem ');
       IP_eles   :=(eu+'arem ');
       IP_elas   :=(eu+'arem ');

       PI_eu     :=(eu+'o ');
       PI_tu     :=(eu+'as ');
       PI_ele    :=(eu+'a ');
       PI_ela    :=(eu+'a ');
       PI_voce   :=(eu+'a ');
       PI_nos    :=(eu+'amos ');
       PI_vos    :=(eu+'ais ');
       PI_voces  :=(eu+'am ');
       PI_eles   :=(eu+'am ');
       PI_elas   :=(eu+'am ');

       PP_eu     :=(eu+'uei ');
       PP_tu     :=(eu+'aste ');
       PP_ele    :=(eu+'ou ');
       PP_ela    :=(eu+'ou ');
       PP_voce   :=(eu+'ou ');
       PP_nos    :=(eu+'amos ');
       PP_vos    :=(eu+'astes ');
       PP_voces  :=(eu+'aram ');
       PP_eles   :=(eu+'aram ');
       PP_elas   :=(eu+'aram ');

       II_eu     :=(eu+'ava ');
       II_tu     :=(eu+'avas ');
       II_ele    :=(eu+'ava ');
       II_ela    :=(eu+'ava ');
       II_voce   :=(eu+'ava ');
       II_nos    :=(eu+'avamos ');
       II_vos    :=(eu+'aveis ');
       II_voces  :=(eu+'avam ');
       II_eles   :=(eu+'avam ');
       II_elas   :=(eu+'avam ');

       MI_eu     :=(eu+'ara ');
       MI_tu     :=(eu+'aras ');
       MI_ele    :=(eu+'ara ');
       MI_ela    :=(eu+'ara ');
       MI_voce   :=(eu+'ara ');
       MI_nos    :=(eu+'aramos ');
       MI_vos    :=(eu+'areis ');
       MI_voces  :=(eu+'aram ');
       MI_eles   :=(eu+'aram ');
       MI_elas   :=(eu+'aram ');

       TI_eu     :=(eu+'aria ');
       TI_tu     :=(eu+'arias ');
       TI_ele    :=(eu+'aria ');
       TI_ela    :=(eu+'aria ');
       TI_voce   :=(eu+'aria ');
       TI_nos    :=(eu+'ariamos ');
       TI_vos    :=(eu+'arieis ');
       TI_voces  :=(eu+'ariam ');
       TI_eles   :=(eu+'ariam ');
       TI_elas   :=(eu+'ariam ');

       FI_eu     :=(eu+'arei ');
       FI_tu     :=(eu+'aras ');
       FI_ele    :=(eu+'ara ');
       FI_ela    :=(eu+'ara ');
       FI_voce   :=(eu+'ara ');
       FI_nos    :=(eu+'aremos ');
       FI_vos    :=(eu+'areis ');
       FI_voces  :=(eu+'arão ');
       FI_eles   :=(eu+'arão ');
       FI_elas   :=(eu+'arão ');

       PS_eu     :=(eu+'ue ');
       PS_tu     :=(eu+'ues ');
       PS_ele    :=(eu+'ue ');
       PS_ela    :=(eu+'ue ');
       PS_voce   :=(eu+'ue ');
       PS_nos    :=(eu+'uemos ');
       PS_vos    :=(eu+'ueis ');
       PS_voces  :=(eu+'uem ');
       PS_eles   :=(eu+'uem ');
       PS_elas   :=(eu+'uem ');

       IS_eu     :=(eu+'asse ');
       IS_tu     :=(eu+'asses ');
       IS_ele    :=(eu+'asse ');
       IS_ela    :=(eu+'asse ');
       IS_voce   :=(eu+'asse ');
       IS_nos    :=(eu+'assemos ');
       IS_vos    :=(eu+'asseis ');
       IS_voces  :=(eu+'assem ');
       IS_eles   :=(eu+'assem ');
       IS_elas   :=(eu+'assem ');

       FS_eu     :=(eu+'ar ');
       FS_tu     :=(eu+'ares ');
       FS_ele    :=(eu+'ar ');
       FS_ela    :=(eu+'ar ');
       FS_voce   :=(eu+'ar ');
       FS_nos    :=(eu+'armos ');
       FS_vos    :=(eu+'ardes ');
       FS_voces  :=(eu+'arem ');
       FS_eles   :=(eu+'arem ');
       FS_elas   :=(eu+'arem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'a ');
       IA_ele    :=(eu+'ue ');
       IA_ela    :=(eu+'ue ');
       IA_voce   :=(eu+'ue ');
       IA_nos    :=(eu+'uemos ');
       IA_vos    :=(eu+'ai ');
       IA_voces  :=(eu+'uem ');
       IA_eles   :=(eu+'uem ');
       IA_elas   :=(eu+'uem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ues ');
       IN_ele    :=(eu+'ue ');
       IN_ela    :=(eu+'ue ');
       IN_voce   :=(eu+'ue ');
       IN_nos    :=(eu+'uemos ');
       IN_vos    :=(eu+'ueis ');
       IN_voces  :=(eu+'uem ');
       IN_eles   :=(eu+'uem ');
       IN_elas   :=(eu+'uem ');
     end // gar meio
    else
    begin// gar  cont
    if  ((pos('ear ',eu)  > 1) and (pos('ear ',eu)< 20))then
     begin // ear   inicio
       // memo1.Lines.add ('ear iar');
     //delete( eu, recenc i ar,( (9 letras - 8 posiçao do ar )+ 2) )
    //                              9-8sobra 1  e tem q apaga 3 o 'a' o 'i'  e o espaço depois

        delete(eu,pos('ar ',eu)-1,(length(eu)- pos('ar ',eu)+2));

       GERm      :=(eu+'eado ');
       GERf      :=(eu+'eada ');
       GERAm      :=(eu+'eado ');
       GERAf      :=(eu+'eado ');
       PART      :=(eu+'eando ');
       AGENTE1   :=(eu+'eante ');
       AGENTE2   :=(eu+'eador ');
       AGENTE3   :=(eu+'eadora ');
       ACAO1     :=(eu+'eamento ');
       ACAO2     :=(eu+'eação ');
       ACAO3     :=(eu+'eamenta ');
       RESU1     :=(eu+'easso ');
       RESU2     :=(eu+'eassa ');

       IP_eu     :=(eu+'ear ');
       IP_tu     :=(eu+'eares ');
       IP_ele    :=(eu+'ear ');
       IP_ela    :=(eu+'ear ');
       IP_voce   :=(eu+'ear ');
       IP_nos    :=(eu+'earmos ');
       IP_vos    :=(eu+'eardes ');
       IP_voces  :=(eu+'earem ');
       IP_eles   :=(eu+'earem ');
       IP_elas   :=(eu+'earem ');

       PI_eu     :=(eu+'eio ');
       PI_tu     :=(eu+'eias ');
       PI_ele    :=(eu+'eia ');
       PI_ela    :=(eu+'eia ');
       PI_voce   :=(eu+'eia ');
       PI_nos    :=(eu+'eamos ');
       PI_vos    :=(eu+'eais ');
       PI_voces  :=(eu+'eiam ');
       PI_eles   :=(eu+'eiam ');
       PI_elas   :=(eu+'eiam ');

       PP_eu     :=(eu+'ei ');
       PP_tu     :=(eu+'easte ');
       PP_ele    :=(eu+'eou ');
       PP_ela    :=(eu+'eou ');
       PP_voce   :=(eu+'eou ');
       PP_nos    :=(eu+'eamos');
       PP_vos    :=(eu+'eastes ');
       PP_voces  :=(eu+'earam ');
       PP_eles   :=(eu+'earam ');
       PP_elas   :=(eu+'earam ');

       II_eu     :=(eu+'eava ');
       II_tu     :=(eu+'eavas ');
       II_ele    :=(eu+'eava ');
       II_ela    :=(eu+'eava ');
       II_voce   :=(eu+'eava ');
       II_nos    :=(eu+'eavamos ');
       II_vos    :=(eu+'eaveis ');
       II_voces  :=(eu+'eavam ');
       II_eles   :=(eu+'eavam ');
       II_elas   :=(eu+'eavam ');

       MI_eu     :=(eu+'eara ');
       MI_tu     :=(eu+'earas ');
       MI_ele    :=(eu+'eara ');
       MI_ela    :=(eu+'eara ');
       MI_voce   :=(eu+'eara ');
       MI_nos    :=(eu+'earamos ');
       MI_vos    :=(eu+'eareis ');
       MI_voces  :=(eu+'earam ');
       MI_eles   :=(eu+'earam ');
       MI_elas   :=(eu+'earam ');

       TI_eu     :=(eu+'earia ');
       TI_tu     :=(eu+'earias ');
       TI_ele    :=(eu+'earia ');
       TI_ela    :=(eu+'earia ');
       TI_voce   :=(eu+'earia ');
       TI_nos    :=(eu+'eariamos ');
       TI_vos    :=(eu+'earieis ');
       TI_voces  :=(eu+'eariam ');
       TI_eles   :=(eu+'eariam ');
       TI_elas   :=(eu+'eariam ');

       FI_eu     :=(eu+'earei ');
       FI_tu     :=(eu+'earas ');
       FI_ele    :=(eu+'eara ');
       FI_ela    :=(eu+'eara ');
       FI_voce   :=(eu+'eara ');
       FI_nos    :=(eu+'earemos ');
       FI_vos    :=(eu+'eareis ');
       FI_voces  :=(eu+'earão ');
       FI_eles   :=(eu+'earão ');
       FI_elas   :=(eu+'earão ');

       PS_eu     :=(eu+'eie ');
       PS_tu     :=(eu+'eies ');
       PS_ele    :=(eu+'eie ');
       PS_ela    :=(eu+'eie ');
       PS_voce   :=(eu+'eie ');
       PS_nos    :=(eu+'eemos ');
       PS_vos    :=(eu+'eeis ');
       PS_voces  :=(eu+'eiem ');
       PS_eles   :=(eu+'eiem ');
       PS_elas   :=(eu+'eiem ');

       IS_eu     :=(eu+'easse ');
       IS_tu     :=(eu+'easses ');
       IS_ele    :=(eu+'easse ');
       IS_ela    :=(eu+'easse ');
       IS_voce   :=(eu+'easse ');
       IS_nos    :=(eu+'eassemos ');
       IS_vos    :=(eu+'easseis ');
       IS_voces  :=(eu+'eassem ');
       IS_eles   :=(eu+'eassem ');
       IS_elas   :=(eu+'eassem ');

       FS_eu     :=(eu+'ear ');
       FS_tu     :=(eu+'eares ');
       FS_ele    :=(eu+'ear ');
       FS_ela    :=(eu+'ear ');
       FS_voce   :=(eu+'ear ');
       FS_nos    :=(eu+'earmos ');
       FS_vos    :=(eu+'eardes ');
       FS_voces  :=(eu+'earem ');
       FS_eles   :=(eu+'earem ');
       FS_elas   :=(eu+'earem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'eia ');
       IA_ele    :=(eu+'eie ');
       IA_ela    :=(eu+'eie ');
       IA_voce   :=(eu+'eie ');
       IA_nos    :=(eu+'eemos ');
       IA_vos    :=(eu+'eai ');
       IA_voces  :=(eu+'eiem ');
       IA_eles   :=(eu+'eiem ');
       IA_elas   :=(eu+'eiem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'eies ');
       IN_ele    :=(eu+'eie ');
       IN_ela    :=(eu+'eie ');
       IN_voce   :=(eu+'eie ');
       IN_nos    :=(eu+'eemos ');
       IN_vos    :=(eu+'eeis ');
       IN_voces  :=(eu+'eiem ');
       IN_eles   :=(eu+'eiem ');
       IN_elas   :=(eu+'eiem ');

     end//ear  meio
     else    // tenta no dar
     begin// ear  contin
      // dar 'n pode'
     if  ((pos('dar ',eu)  > 0) and (pos('dar ',eu)< 2))      then
      begin //dar  inicio
     //  memo1.lines.add('dar é um verbo muito irregular e dizem q doi');
     delete(eu,pos('ar ',eu),(length(eu)- pos('ar ',eu)+1));

       GERm      :=(eu+'ado ');
       GERf      :=(eu+'ada ');
       GERAm      :=(eu+'ado ');
       GERAf      :=(eu+'ada ');
       PART      :=(eu+'ando ');
       AGENTE1   :=(eu+'ante ');
       AGENTE2   :=(eu+'ador ');
       AGENTE3   :=(eu+'adora ');
       ACAO1     :=(eu+'amento ');
       ACAO2     :=(eu+'ação ');
       ACAO3     :=(eu+'amenta ');
       RESU1     :=(eu+'asso ');
       RESU2     :=(eu+'assa ');

       IP_eu     :=(eu+'ar ');
       IP_tu     :=(eu+'ares ');
       IP_ele    :=(eu+'ar ');
       IP_ela    :=(eu+'ar ');
       IP_voce   :=(eu+'ar ');
       IP_nos    :=(eu+'armos ');
       IP_vos    :=(eu+'ardes ');
       IP_voces  :=(eu+'arem ');
       IP_eles   :=(eu+'arem ');
       IP_elas   :=(eu+'arem ');

       PI_eu     :=(eu+'ou ');
       PI_tu     :=(eu+'as ');
       PI_ele    :=(eu+'a ');
       PI_ela    :=(eu+'a ');
       PI_voce   :=(eu+'a ');
       PI_nos    :=(eu+'amos ');
       PI_vos    :=(eu+'ais ');
       PI_voces  :=(eu+'ão ');
       PI_eles   :=(eu+'ão ');
       PI_elas   :=(eu+'ão ');

       PP_eu     :=(eu+'ei ');
       PP_tu     :=(eu+'este ');
       PP_ele    :=(eu+'eu ');
       PP_ela    :=(eu+'eu ');
       PP_voce   :=(eu+'eu ');
       PP_nos    :=(eu+'emos ');
       PP_vos    :=(eu+'estes ');
       PP_voces  :=(eu+'eram ');
       PP_eles   :=(eu+'eram ');
       PP_elas   :=(eu+'eram ');

       II_eu     :=(eu+'ava ');
       II_tu     :=(eu+'avas ');
       II_ele    :=(eu+'ava ');
       II_ela    :=(eu+'ava ');
       II_voce   :=(eu+'ava ');
       II_nos    :=(eu+'avamos ');
       II_vos    :=(eu+'aveis ');
       II_voces  :=(eu+'avam ');
       II_eles   :=(eu+'avam ');
       II_elas   :=(eu+'avam ');

       MI_eu     :=(eu+'era ');
       MI_tu     :=(eu+'eras ');
       MI_ele    :=(eu+'era ');
       MI_ela    :=(eu+'era ');
       MI_voce   :=(eu+'era ');
       MI_nos    :=(eu+'eramos ');
       MI_vos    :=(eu+'ereis ');
       MI_voces  :=(eu+'eram ');
       MI_eles   :=(eu+'eram ');
       MI_elas   :=(eu+'eram ');

       TI_eu     :=(eu+'aria ');
       TI_tu     :=(eu+'arias ');
       TI_ele    :=(eu+'aria ');
       TI_ela    :=(eu+'aria ');
       TI_voce   :=(eu+'aria ');
       TI_nos    :=(eu+'ariamos ');
       TI_vos    :=(eu+'arieis ');
       TI_voces  :=(eu+'ariam ');
       TI_eles   :=(eu+'ariam ');
       TI_elas   :=(eu+'ariam ');

       FI_eu     :=(eu+'arei ');
       FI_tu     :=(eu+'aras ');
       FI_ele    :=(eu+'ara ');
       FI_ela    :=(eu+'ara ');
       FI_voce   :=(eu+'ara ');
       FI_nos    :=(eu+'aremos ');
       FI_vos    :=(eu+'areis ');
       FI_voces  :=(eu+'arão ');
       FI_eles   :=(eu+'arão ');
       FI_elas   :=(eu+'arão ');

       PS_eu     :=(eu+'e ');
       PS_tu     :=(eu+'es ');
       PS_ele    :=(eu+'e ');
       PS_ela    :=(eu+'e ');
       PS_voce   :=(eu+'e ');
       PS_nos    :=(eu+'emos ');
       PS_vos    :=(eu+'eis ');
       PS_voces  :=(eu+'eem ');
       PS_eles   :=(eu+'eem ');
       PS_elas   :=(eu+'eem ');

       IS_eu     :=(eu+'esse ');
       IS_tu     :=(eu+'esses ');
       IS_ele    :=(eu+'esse ');
       IS_ela    :=(eu+'esse ');
       IS_voce   :=(eu+'esse ');
       IS_nos    :=(eu+'essemos ');
       IS_vos    :=(eu+'esseis ');
       IS_voces  :=(eu+'essem ');
       IS_eles   :=(eu+'essem ');
       IS_elas   :=(eu+'essem ');

       FS_eu     :=(eu+'er ');
       FS_tu     :=(eu+'eres ');
       FS_ele    :=(eu+'er ');
       FS_ela    :=(eu+'er ');
       FS_voce   :=(eu+'er ');
       FS_nos    :=(eu+'ermos ');
       FS_vos    :=(eu+'erdes ');
       FS_voces  :=(eu+'erem ');
       FS_eles   :=(eu+'erem ');
       FS_elas   :=(eu+'erem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'a ');
       IA_ele    :=(eu+'e ');
        IA_ela    :=(eu+'e ');
       IA_voce   :=(eu+'e ');
       IA_nos    :=(eu+'emos ');
       IA_vos    :=(eu+'ai ');
       IA_voces  :=(eu+'eem ');
       IA_eles   :=(eu+'eem ');
       IA_elas   :=(eu+'eem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'es ');
       IN_ele    :=(eu+'e ');
       IN_ela    :=(eu+'e ');
       IN_voce   :=(eu+'e ');
       IN_nos    :=(eu+'emos ');
       IN_vos    :=(eu+'eis ');
       IN_voces  :=(eu+'eem ');
       IN_eles   :=(eu+'eem ');
       IN_elas   :=(eu+'eem ');
       end //dar meio
       else // entao vai nos ar normal    ops falta mais
      begin// dar cont


      if ((pos('odiar ',eu) = 1 )or
      (pos('ansiar ',eu)  = 1 )or
      (pos('incendiar ',eu)  = 1)) and (pos('iar ',eu)< 20)then
       begin//iar irregulares inicioc

       delete(eu,pos('ar ',eu)-1,(length(eu)- pos('ar ',eu)+2));

       GERm      :=(eu+'iado ');
       GERf      :=(eu+'iada ');
       GERAm      :=(eu+'iado ');
       GERAf      :=(eu+'iada ');
       PART      :=(eu+'iando ');
       AGENTE1   :=(eu+'iante ');
       AGENTE2   :=(eu+'iador ');
       AGENTE3   :=(eu+'iadora ');
       ACAO1     :=(eu+'iamento ');
       ACAO2     :=(eu+'iação ');
       ACAO3     :=(eu+'amenta ');
       RESU1     :=(eu+'asso ');
       RESU2     :=(eu+'assa ');

       IP_eu     :=(eu+'iar ');
       IP_tu     :=(eu+'iares ');
       IP_ele    :=(eu+'iar ');
       IP_ela    :=(eu+'iar ');
       IP_voce   :=(eu+'iar ');
       IP_nos    :=(eu+'iarmos ');
       IP_vos    :=(eu+'iardes ');
       IP_voces  :=(eu+'iarem ');
       IP_eles   :=(eu+'iarem ');
       IP_elas   :=(eu+'iarem ');

       PI_eu     :=(eu+'eio ');
       PI_tu     :=(eu+'eias ');
       PI_ele    :=(eu+'eia ');
       PI_ela    :=(eu+'eia ');
       PI_voce   :=(eu+'eia ');
       PI_nos    :=(eu+'eamos ');
       PI_vos    :=(eu+'eais ');
       PI_voces  :=(eu+'eiam ');
       PI_eles   :=(eu+'eiam ');
       PI_elas   :=(eu+'eiam ');

       PP_eu     :=(eu+'iei ');
       PP_tu     :=(eu+'iaste ');
       PP_ele    :=(eu+'iou ');
       PP_ela    :=(eu+'iou ');
       PP_voce   :=(eu+'iou ');
       PP_nos    :=(eu+'iamos ');
       PP_vos    :=(eu+'iastes ');
       PP_voces  :=(eu+'iaram ');
       PP_eles   :=(eu+'iaram ');
       PP_elas   :=(eu+'iaram ');

       II_eu     :=(eu+'iava ');
       II_tu     :=(eu+'iavas ');
       II_ele    :=(eu+'iava ');
       II_ela    :=(eu+'iava ');
       II_voce   :=(eu+'iava ');
       II_nos    :=(eu+'iavamos ');
       II_vos    :=(eu+'iaveis ');
       II_voces  :=(eu+'iavam ');
       II_eles   :=(eu+'iavam ');
       II_elas   :=(eu+'iavam ');

       MI_eu     :=(eu+'iara ');
       MI_tu     :=(eu+'iaras ');
       MI_ele    :=(eu+'iara ');
       MI_ela    :=(eu+'iara ');
       MI_voce   :=(eu+'iara ');
       MI_nos    :=(eu+'iaramos ');
       MI_vos    :=(eu+'iareis ');
       MI_voces  :=(eu+'iaram ');
       MI_eles   :=(eu+'iaram ');
       MI_elas   :=(eu+'iaram ');

       TI_eu     :=(eu+'iaria ');
       TI_tu     :=(eu+'iarias ');
       TI_ele    :=(eu+'iaria ');
       TI_ela    :=(eu+'iaria ');
       TI_voce   :=(eu+'iaria ');
       TI_nos    :=(eu+'iariamos ');
       TI_vos    :=(eu+'iarieis ');
       TI_voces  :=(eu+'iariam ');
       TI_eles   :=(eu+'iariam ');
       TI_elas   :=(eu+'iariam ');

       FI_eu     :=(eu+'iarei ');
       FI_tu     :=(eu+'iaras ');
       FI_ele    :=(eu+'iara ');
       FI_ela    :=(eu+'iara ');
       FI_voce   :=(eu+'iara ');
       FI_nos    :=(eu+'iaremos ');
       FI_vos    :=(eu+'iareis ');
       FI_voces  :=(eu+'iarão ');
       FI_eles   :=(eu+'iarão ');
       FI_elas   :=(eu+'iarão ');

       PS_eu     :=(eu+'eie ');
       PS_tu     :=(eu+'eies ');
       PS_ele    :=(eu+'eie ');
       PS_ela    :=(eu+'eie ');
       PS_voce   :=(eu+'eie ');
       PS_nos    :=(eu+'eemos ');
       PS_vos    :=(eu+'eeis ');
       PS_voces  :=(eu+'eiem ');
       PS_eles   :=(eu+'eiem ');
       PS_elas   :=(eu+'eiem ');

       IS_eu     :=(eu+'iasse ');
       IS_tu     :=(eu+'iasses ');
       IS_ele    :=(eu+'iasse ');
       IS_ela    :=(eu+'iasse ');
       IS_voce   :=(eu+'iasse ');
       IS_nos    :=(eu+'iassemos ');
       IS_vos    :=(eu+'iasseis ');
       IS_voces  :=(eu+'iassem ');
       IS_eles   :=(eu+'iassem ');
       IS_elas   :=(eu+'iassem ');

       FS_eu     :=(eu+'iar ');
       FS_tu     :=(eu+'iares ');
       FS_ele    :=(eu+'iar ');
       FS_ela    :=(eu+'iar ');
       FS_voce   :=(eu+'iar ');
       FS_nos    :=(eu+'iarmos ');
       FS_vos    :=(eu+'iardes ');
       FS_voces  :=(eu+'iarem ');
       FS_eles   :=(eu+'iarem ');
       FS_elas   :=(eu+'iarem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'eia ');
       IA_ele    :=(eu+'eie ');
       IA_ela    :=(eu+'eie ');
       IA_voce   :=(eu+'eie ');
       IA_nos    :=(eu+'eemos ');
       IA_vos    :=(eu+'eai ');
       IA_voces  :=(eu+'eiem ');
       IA_eles   :=(eu+'eiem ');
       IA_elas   :=(eu+'eiem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'eies ');
       IN_ele    :=(eu+'eie ');
       IN_ela    :=(eu+'eie ');
       IN_voce   :=(eu+'eie ');
       IN_nos    :=(eu+'eemos ');
       IN_vos    :=(eu+'eeis ');
       IN_voces  :=(eu+'eiem ');
       IN_eles   :=(eu+'eiem ');
       IN_elas   :=(eu+'eiem ');
       end //iar irreguleares meio
      else
      begin//iar irregulares contin

     if  ((pos('¨ar ',eu)  > 0) and (pos('¨ar ',eu)< 20))      then
      begin //çar inicio
         if Pos('¨',eu)>0 then
           begin
             //Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
      delete(eu,pos('ar ',eu)-1,(length(eu)- pos('ar ',eu)+2));
   //     memo1.lines.add ('verbos regulares terminados em ar');


       GERm      :=(eu+'çado ');
       GERf      :=(eu+'çada ');
       GERAm      :=(eu+'çado ');
       GERAf      :=(eu+'çada ');
       PART      :=(eu+'çando ');
       AGENTE1   :=(eu+'çante ');
       AGENTE2   :=(eu+'çador ');
       AGENTE3   :=(eu+'çadora ');
       ACAO1     :=(eu+'çamento ');
       ACAO2     :=(eu+'çação ');
       ACAO3     :=(eu+'çamenta ');
       RESU1     :=(eu+'çasso ');
       RESU2     :=(eu+'çassa ');

       IP_eu     :=(eu+'çar ');
       IP_tu     :=(eu+'çares ');
       IP_ele    :=(eu+'çar ');
       IP_ela    :=(eu+'çar ');
       IP_voce   :=(eu+'çar ');
       IP_nos    :=(eu+'çarmos ');
       IP_vos    :=(eu+'çardes ');
       IP_voces  :=(eu+'çarem ');
       IP_eles   :=(eu+'çarem ');
       IP_elas   :=(eu+'çarem ');

       PI_eu     :=(eu+'ço ');
       PI_tu     :=(eu+'ças ');
       PI_ele    :=(eu+'ça ');
       PI_ela    :=(eu+'ça ');
       PI_voce   :=(eu+'ça ');
       PI_nos    :=(eu+'çamos ');
       PI_vos    :=(eu+'çais ');
       PI_voces  :=(eu+'çam ');
       PI_eles   :=(eu+'çam ');
       PI_elas   :=(eu+'çam ');

       PP_eu     :=(eu+'cei ');
       PP_tu     :=(eu+'çaste ');
       PP_ele    :=(eu+'çou ');
       PP_ela    :=(eu+'çou ');
       PP_voce   :=(eu+'çou ');
       PP_nos    :=(eu+'çamos ');
       PP_vos    :=(eu+'çastes ');
       PP_voces  :=(eu+'çaram ');
       PP_eles   :=(eu+'çaram ');
       PP_elas   :=(eu+'çaram ');

       II_eu     :=(eu+'çava ');
       II_tu     :=(eu+'çavas ');
       II_ele    :=(eu+'çava ');
       II_ela    :=(eu+'çava ');
       II_voce   :=(eu+'çava ');
       II_nos    :=(eu+'çavamos ');
       II_vos    :=(eu+'çaveis ');
       II_voces  :=(eu+'çavam ');
       II_eles   :=(eu+'çavam ');
       II_elas   :=(eu+'çavam ');

       MI_eu     :=(eu+'çara ');
       MI_tu     :=(eu+'çaras ');
       MI_ele    :=(eu+'çara ');
       MI_ela    :=(eu+'çara ');
       MI_voce   :=(eu+'çara ');
       MI_nos    :=(eu+'çaramos ');
       MI_vos    :=(eu+'çareis ');
       MI_voces  :=(eu+'çaram ');
       MI_eles   :=(eu+'çaram ');
       MI_elas   :=(eu+'çaram ');

       TI_eu     :=(eu+'çaria ');
       TI_tu     :=(eu+'çarias ');
       TI_ele    :=(eu+'çaria ');
       TI_ela    :=(eu+'çaria ');
       TI_voce   :=(eu+'çaria ');
       TI_nos    :=(eu+'çariamos ');
       TI_vos    :=(eu+'çarieis ');
       TI_voces  :=(eu+'çariam ');
       TI_eles   :=(eu+'çariam ');
       TI_elas   :=(eu+'çariam ');

       FI_eu     :=(eu+'çarei ');
       FI_tu     :=(eu+'çaras ');
       FI_ele    :=(eu+'çara ');
       FI_ela    :=(eu+'çara ');
       FI_voce   :=(eu+'çara ');
       FI_nos    :=(eu+'çaremos ');
       FI_vos    :=(eu+'çareis ');
       FI_voces  :=(eu+'çarão ');
       FI_eles   :=(eu+'çarão ');
       FI_elas   :=(eu+'çarão ');

       PS_eu     :=(eu+'ce ');
       PS_tu     :=(eu+'ces ');
       PS_ele    :=(eu+'ce ');
       PS_ela    :=(eu+'ce ');
       PS_voce   :=(eu+'ce ');
       PS_nos    :=(eu+'cemos ');
       PS_vos    :=(eu+'ceis ');
       PS_voces  :=(eu+'cem ');
       PS_eles   :=(eu+'cem ');
       PS_elas   :=(eu+'cem ');

       IS_eu     :=(eu+'çasse ');
       IS_tu     :=(eu+'çasses ');
       IS_ele    :=(eu+'çasse ');
       IS_ela    :=(eu+'çasse ');
       IS_voce   :=(eu+'çasse ');
       IS_nos    :=(eu+'çassemos ');
       IS_vos    :=(eu+'çasseis ');
       IS_voces  :=(eu+'çassem ');
       IS_eles   :=(eu+'çassem ');
       IS_elas   :=(eu+'çassem ');

       FS_eu     :=(eu+'çar ');
       FS_tu     :=(eu+'çares ');
       FS_ele    :=(eu+'çar ');
       FS_ela    :=(eu+'çar ');
       FS_voce   :=(eu+'çar ');
       FS_nos    :=(eu+'çarmos ');
       FS_vos    :=(eu+'çardes ');
       FS_voces  :=(eu+'çarem ');
       FS_eles   :=(eu+'çarem ');
       FS_elas   :=(eu+'çarem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ça ');
       IA_ele    :=(eu+'ce ');
       IA_ela    :=(eu+'ce ');
       IA_voce   :=(eu+'ce ');
       IA_nos    :=(eu+'cemos ');
       IA_vos    :=(eu+'çai ');
       IA_voces  :=(eu+'cem ');
       IA_eles   :=(eu+'cem ');
       IA_elas   :=(eu+'cem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ces ');
       IN_ele    :=(eu+'ce ');
       IN_ela    :=(eu+'ce ');
       IN_voce   :=(eu+'ce ');
       IN_nos    :=(eu+'cemos ');
       IN_vos    :=(eu+'ceis ');
       IN_voces  :=(eu+'cem ');
       IN_eles   :=(eu+'cem ');
       IN_elas   :=(eu+'cem ');

      end//çar meio
     else
      begin//çar conti
     if   ((pos('estar ',eu)  > 1) and (pos('estar ',eu)< 20))      then
      begin //testar ini

      delete(eu,pos('ar ',eu),(length(eu)- pos('ar ',eu)+2));
      GERm      :=(eu+'ado ');
       GERf      :=(eu+'ada ');
       GERAm      :=(eu+'ado ');
       GERAf      :=(eu+'ada ');
       PART      :=(eu+'ando ');
       AGENTE1   :=(eu+'ante ');
       AGENTE2   :=(eu+'ador ');
       AGENTE3   :=(eu+'adora ');
       ACAO1     :=(eu+'amento ');
       ACAO2     :=(eu+'ação ');
       ACAO3     :=(eu+'amenta ');
       RESU1     :=(eu+'asso ');
       RESU2     :=(eu+'assa ');

       IP_eu     :=(eu+'ar ');
       IP_tu     :=(eu+'ares ');
       IP_ele    :=(eu+'ar ');
       IP_ela    :=(eu+'ar ');
       IP_voce   :=(eu+'ar ');
       IP_nos    :=(eu+'armos ');
       IP_vos    :=(eu+'ardes ');
       IP_voces  :=(eu+'arem ');
       IP_eles   :=(eu+'arem ');
       IP_elas   :=(eu+'arem ');

       PI_eu     :=(eu+'o ');
       PI_tu     :=(eu+'as ');
       PI_ele    :=(eu+'a ');
       PI_ela    :=(eu+'a ');
       PI_voce   :=(eu+'a ');
       PI_nos    :=(eu+'amos ');
       PI_vos    :=(eu+'ais ');
       PI_voces  :=(eu+'am ');
       PI_eles   :=(eu+'am ');
       PI_elas   :=(eu+'am ');

       PP_eu     :=(eu+'ei ');
       PP_tu     :=(eu+'aste ');
       PP_ele    :=(eu+'ou ');
       PP_ela    :=(eu+'ou ');
       PP_voce   :=(eu+'ou ');
       PP_nos    :=(eu+'amos ');
       PP_vos    :=(eu+'astes ');
       PP_voces  :=(eu+'aram ');
       PP_eles   :=(eu+'aram ');
       PP_elas   :=(eu+'aram ');

       II_eu     :=(eu+'ava ');
       II_tu     :=(eu+'avas ');
       II_ele    :=(eu+'ava ');
       II_ela    :=(eu+'ava ');
       II_voce   :=(eu+'ava ');
       II_nos    :=(eu+'avamos ');
       II_vos    :=(eu+'aveis ');
       II_voces  :=(eu+'avam ');
       II_eles   :=(eu+'avam ');
       II_elas   :=(eu+'avam ');

       MI_eu     :=(eu+'ara ');
       MI_tu     :=(eu+'aras ');
       MI_ele    :=(eu+'ara ');
       MI_ela    :=(eu+'ara ');
       MI_voce   :=(eu+'ara ');
       MI_nos    :=(eu+'aramos ');
       MI_vos    :=(eu+'areis ');
       MI_voces  :=(eu+'aram ');
       MI_eles   :=(eu+'aram ');
       MI_elas   :=(eu+'aram ');

       TI_eu     :=(eu+'aria ');
       TI_tu     :=(eu+'arias ');
       TI_ele    :=(eu+'aria ');
       TI_ela    :=(eu+'aria ');
       TI_voce   :=(eu+'aria ');
       TI_nos    :=(eu+'ariamos ');
       TI_vos    :=(eu+'arieis ');
       TI_voces  :=(eu+'ariam ');
       TI_eles   :=(eu+'ariam ');
       TI_elas   :=(eu+'ariam ');

       FI_eu     :=(eu+'arei ');
       FI_tu     :=(eu+'aras ');
       FI_ele    :=(eu+'ara ');
       FI_ela    :=(eu+'ara ');
       FI_voce   :=(eu+'ara ');
       FI_nos    :=(eu+'aremos ');
       FI_vos    :=(eu+'areis ');
       FI_voces  :=(eu+'arão ');
       FI_eles   :=(eu+'arão ');
       FI_elas   :=(eu+'arão ');

       PS_eu     :=(eu+'e ');
       PS_tu     :=(eu+'es ');
       PS_ele    :=(eu+'e ');
       PS_ela    :=(eu+'e ');
       PS_voce   :=(eu+'e ');
       PS_nos    :=(eu+'emos ');
       PS_vos    :=(eu+'eis ');
       PS_voces  :=(eu+'em ');
       PS_eles   :=(eu+'em ');
       PS_elas   :=(eu+'em ');

       IS_eu     :=(eu+'asse ');
       IS_tu     :=(eu+'asses ');
       IS_ele    :=(eu+'asse ');
       IS_ela    :=(eu+'asse ');
       IS_voce   :=(eu+'asse ');
       IS_nos    :=(eu+'assemos ');
       IS_vos    :=(eu+'asseis ');
       IS_voces  :=(eu+'assem ');
       IS_eles   :=(eu+'assem ');
       IS_elas   :=(eu+'assem ');

       FS_eu     :=(eu+'ar ');
       FS_tu     :=(eu+'ares ');
       FS_ele    :=(eu+'ar ');
       FS_ela    :=(eu+'ar ');
       FS_voce   :=(eu+'ar ');
       FS_nos    :=(eu+'armos ');
       FS_vos    :=(eu+'ardes ');
       FS_voces  :=(eu+'arem ');
       FS_eles   :=(eu+'arem ');
       FS_elas   :=(eu+'arem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'a ');
       IA_ele    :=(eu+'e ');
       IA_ela    :=(eu+'e ');
       IA_voce   :=(eu+'e ');
       IA_nos    :=(eu+'emos ');
       IA_vos    :=(eu+'ai ');
       IA_voces  :=(eu+'em ');
       IA_eles   :=(eu+'em ');
       IA_elas   :=(eu+'em ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'es ');
       IN_ele    :=(eu+'e ');
       IN_ela    :=(eu+'e ');
       IN_voce   :=(eu+'e ');
       IN_nos    :=(eu+'emos ');
       IN_vos    :=(eu+'eis ');
       IN_voces  :=(eu+'em ');
       IN_eles   :=(eu+'em ');
       IN_elas   :=(eu+'em ');

      end//testar meio
     else
     if   ((pos('estar ',eu)  = 1) and (pos('estar ',eu)< 20))      then
      begin //estar ini

      delete(eu,pos('ar ',eu),(length(eu)- pos('ar ',eu)+2));
      GERm      :=(eu+'ado ');
       GERf      :=(eu+'ada ');
       GERAm      :=(eu+'ado ');
       GERAf      :=(eu+'ada ');
       PART      :=(eu+'ando ');
       AGENTE1   :=(eu+'ante ');
       AGENTE2   :=(eu+'ador ');
       AGENTE3   :=(eu+'adora ');
       ACAO1     :=(eu+'amento ');
       ACAO2     :=(eu+'ação ');
       ACAO3     :=(eu+'amenta ');
       RESU1     :=(eu+'asso ');
       RESU2     :=(eu+'assa ');

       IP_eu     :=(eu+'ar ');
       IP_tu     :=(eu+'ares ');
       IP_ele    :=(eu+'ar ');
       IP_ela    :=(eu+'ar ');
       IP_voce   :=(eu+'ar ');
       IP_nos    :=(eu+'armos ');
       IP_vos    :=(eu+'ardes ');
       IP_voces  :=(eu+'arem ');
       IP_eles   :=(eu+'arem ');
       IP_elas   :=(eu+'arem ');

       PI_eu     :=(eu+'ou ');
       PI_tu     :=(eu+'as ');
       PI_ele    :=(eu+'a ');
       PI_ela    :=(eu+'a ');
       PI_voce   :=(eu+'a ');
       PI_nos    :=(eu+'amos ');
       PI_vos    :=(eu+'ais ');
       PI_voces  :=(eu+'ão ');
       PI_eles   :=(eu+'ão ');
       PI_elas   :=(eu+'ão ');

       PP_eu     :=(eu+'ive ');
       PP_tu     :=(eu+'iveste ');
       PP_ele    :=(eu+'eve ');
       PP_ela    :=(eu+'eve ');
       PP_voce   :=(eu+'eve ');
       PP_nos    :=(eu+'ivemos ');
       PP_vos    :=(eu+'ivestes ');
       PP_voces  :=(eu+'iveram ');
       PP_eles   :=(eu+'iveram ');
       PP_elas   :=(eu+'iveram ');

       II_eu     :=(eu+'ava ');
       II_tu     :=(eu+'avas ');
       II_ele    :=(eu+'ava ');
       II_ela    :=(eu+'ava ');
       II_voce   :=(eu+'ava ');
       II_nos    :=(eu+'avamos ');
       II_vos    :=(eu+'aveis ');
       II_voces  :=(eu+'avam ');
       II_eles   :=(eu+'avam ');
       II_elas   :=(eu+'avam ');

       MI_eu     :=(eu+'ivera ');
       MI_tu     :=(eu+'iveras ');
       MI_ele    :=(eu+'ivera ');
       MI_ela    :=(eu+'ivera ');
       MI_voce   :=(eu+'ivera ');
       MI_nos    :=(eu+'iveramos ');
       MI_vos    :=(eu+'ivereis ');
       MI_voces  :=(eu+'iveram ');
       MI_eles   :=(eu+'iveram ');
       MI_elas   :=(eu+'iveram ');

       TI_eu     :=(eu+'aria ');
       TI_tu     :=(eu+'arias ');
       TI_ele    :=(eu+'aria ');
       TI_ela    :=(eu+'aria ');
       TI_voce   :=(eu+'aria ');
       TI_nos    :=(eu+'ariamos ');
       TI_vos    :=(eu+'arieis ');
       TI_voces  :=(eu+'ariam ');
       TI_eles   :=(eu+'ariam ');
       TI_elas   :=(eu+'ariam ');

       FI_eu     :=(eu+'arei ');
       FI_tu     :=(eu+'aras ');
       FI_ele    :=(eu+'ara ');
       FI_ela    :=(eu+'ara ');
       FI_voce   :=(eu+'ara ');
       FI_nos    :=(eu+'aremos ');
       FI_vos    :=(eu+'areis ');
       FI_voces  :=(eu+'arão ');
       FI_eles   :=(eu+'arão ');
       FI_elas   :=(eu+'arão ');

       PS_eu     :=(eu+'eja ');
       PS_tu     :=(eu+'ejas ');
       PS_ele    :=(eu+'eja ');
       PS_ela    :=(eu+'eja ');
       PS_voce   :=(eu+'eja ');
       PS_nos    :=(eu+'ejamos ');
       PS_vos    :=(eu+'ejais ');
       PS_voces  :=(eu+'ejam ');
       PS_eles   :=(eu+'ejam ');
       PS_elas   :=(eu+'ejam ');

       IS_eu     :=(eu+'ivesse ');
       IS_tu     :=(eu+'ivesses ');
       IS_ele    :=(eu+'ivesse ');
       IS_ela    :=(eu+'ivesse ');
       IS_voce   :=(eu+'ivesse ');
       IS_nos    :=(eu+'ivessemos ');
       IS_vos    :=(eu+'ivesseis ');
       IS_voces  :=(eu+'ivessem ');
       IS_eles   :=(eu+'ivessem ');
       IS_elas   :=(eu+'ivessem ');

       FS_eu     :=(eu+'iver ');
       FS_tu     :=(eu+'iveres ');
       FS_ele    :=(eu+'iver ');
       FS_ela    :=(eu+'iver ');
       FS_voce   :=(eu+'iver ');
       FS_nos    :=(eu+'ivermos ');
       FS_vos    :=(eu+'iverdes ');
       FS_voces  :=(eu+'iverem ');
       FS_eles   :=(eu+'iverem ');
       FS_elas   :=(eu+'iverem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'á ');
       IA_ele    :=(eu+'eja ');
       IA_ela    :=(eu+'eja ');
       IA_voce   :=(eu+'eja ');
       IA_nos    :=(eu+'ejamos ');
       IA_vos    :=(eu+'ai ');
       IA_voces  :=(eu+'ejam ');
       IA_eles   :=(eu+'ejam ');
       IA_elas   :=(eu+'ejam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ejas ');
       IN_ele    :=(eu+'eja ');
       IN_ela    :=(eu+'eja ');
       IN_voce   :=(eu+'eja ');
       IN_nos    :=(eu+'ejamos ');
       IN_vos    :=(eu+'ejais ');
       IN_voces  :=(eu+'ejam ');
       IN_eles   :=(eu+'ejam ');
       IN_elas   :=(eu+'ejam ');

      end//estar meio
      else
      begin
       ///###### aqui os ar regulares ate q em fim
           if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
    delete(eu,pos('ar ',eu),(length(eu)- pos('ar ',eu)+1));
   //     memo1.lines.add ('verbos regulares terminados em ar');


       GERm      :=(eu+'ado ');
       GERf      :=(eu+'ada ');
       GERAm      :=(eu+'ado ');
       GERAf      :=(eu+'ada ');
       PART      :=(eu+'ando ');
       AGENTE1   :=(eu+'ante ');
       AGENTE2   :=(eu+'ador ');
       AGENTE3   :=(eu+'adora ');
       ACAO1     :=(eu+'amento ');
       ACAO2     :=(eu+'ação ');
       ACAO3     :=(eu+'amenta ');
       RESU1     :=(eu+'asso ');
       RESU2     :=(eu+'assa ');

       IP_eu     :=(eu+'ar ');
       IP_tu     :=(eu+'ares ');
       IP_ele    :=(eu+'ar ');
       IP_ela    :=(eu+'ar ');
       IP_voce   :=(eu+'ar ');
       IP_nos    :=(eu+'armos ');
       IP_vos    :=(eu+'ardes ');
       IP_voces  :=(eu+'arem ');
       IP_eles   :=(eu+'arem ');
       IP_elas   :=(eu+'arem ');

       PI_eu     :=(eu+'o ');
       PI_tu     :=(eu+'as ');
       PI_ele    :=(eu+'a ');
       PI_ela    :=(eu+'a ');
       PI_voce   :=(eu+'a ');
       PI_nos    :=(eu+'amos ');
       PI_vos    :=(eu+'ais ');
       PI_voces  :=(eu+'am ');
       PI_eles   :=(eu+'am ');
       PI_elas   :=(eu+'am ');

       PP_eu     :=(eu+'ei ');
       PP_tu     :=(eu+'aste ');
       PP_ele    :=(eu+'ou ');
       PP_ela    :=(eu+'ou ');
       PP_voce   :=(eu+'ou ');
       PP_nos    :=(eu+'amos ');
       PP_vos    :=(eu+'astes ');
       PP_voces  :=(eu+'aram ');
       PP_eles   :=(eu+'aram ');
       PP_elas   :=(eu+'aram ');

       II_eu     :=(eu+'ava ');
       II_tu     :=(eu+'avas ');
       II_ele    :=(eu+'ava ');
       II_ela    :=(eu+'ava ');
       II_voce   :=(eu+'ava ');
       II_nos    :=(eu+'avamos ');
       II_vos    :=(eu+'aveis ');
       II_voces  :=(eu+'avam ');
       II_eles   :=(eu+'avam ');
       II_elas   :=(eu+'avam ');

       MI_eu     :=(eu+'ara ');
       MI_tu     :=(eu+'aras ');
       MI_ele    :=(eu+'ara ');
       MI_ela    :=(eu+'ara ');
       MI_voce   :=(eu+'ara ');
       MI_nos    :=(eu+'aramos ');
       MI_vos    :=(eu+'areis ');
       MI_voces  :=(eu+'aram ');
       MI_eles   :=(eu+'aram ');
       MI_elas   :=(eu+'aram ');

       TI_eu     :=(eu+'aria ');
       TI_tu     :=(eu+'arias ');
       TI_ele    :=(eu+'aria ');
       TI_ela    :=(eu+'aria ');
       TI_voce   :=(eu+'aria ');
       TI_nos    :=(eu+'ariamos ');
       TI_vos    :=(eu+'arieis ');
       TI_voces  :=(eu+'ariam ');
       TI_eles   :=(eu+'ariam ');
       TI_elas   :=(eu+'ariam ');

       FI_eu     :=(eu+'arei ');
       FI_tu     :=(eu+'aras ');
       FI_ele    :=(eu+'ara ');
       FI_ela    :=(eu+'ara ');
       FI_voce   :=(eu+'ara ');
       FI_nos    :=(eu+'aremos ');
       FI_vos    :=(eu+'areis ');
       FI_voces  :=(eu+'arão ');
       FI_eles   :=(eu+'arão ');
       FI_elas   :=(eu+'arão ');

       PS_eu     :=(eu+'e ');
       PS_tu     :=(eu+'es ');
       PS_ele    :=(eu+'e ');
       PS_ela    :=(eu+'e ');
       PS_voce   :=(eu+'e ');
       PS_nos    :=(eu+'emos ');
       PS_vos    :=(eu+'eis ');
       PS_voces  :=(eu+'em ');
       PS_eles   :=(eu+'em ');
       PS_elas   :=(eu+'em ');

       IS_eu     :=(eu+'asse ');
       IS_tu     :=(eu+'asses ');
       IS_ele    :=(eu+'asse ');
       IS_ela    :=(eu+'asse ');
       IS_voce   :=(eu+'asse ');
       IS_nos    :=(eu+'assemos ');
       IS_vos    :=(eu+'asseis ');
       IS_voces  :=(eu+'assem ');
       IS_eles   :=(eu+'assem ');
       IS_elas   :=(eu+'assem ');

       FS_eu     :=(eu+'ar ');
       FS_tu     :=(eu+'ares ');
       FS_ele    :=(eu+'ar ');
       FS_ela    :=(eu+'ar ');
       FS_voce   :=(eu+'ar ');
       FS_nos    :=(eu+'armos ');
       FS_vos    :=(eu+'ardes ');
       FS_voces  :=(eu+'arem ');
       FS_eles   :=(eu+'arem ');
       FS_elas   :=(eu+'arem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'a ');
       IA_ele    :=(eu+'e ');
       IA_ela    :=(eu+'e ');
       IA_voce   :=(eu+'e ');
       IA_nos    :=(eu+'emos ');
       IA_vos    :=(eu+'ai ');
       IA_voces  :=(eu+'em ');
       IA_eles   :=(eu+'em ');
       IA_elas   :=(eu+'em ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'es ');
       IN_ele    :=(eu+'e ');
       IN_ela    :=(eu+'e ');
       IN_voce   :=(eu+'e ');
       IN_nos    :=(eu+'emos ');
       IN_vos    :=(eu+'eis ');
       IN_voces  :=(eu+'em ');
       IN_eles   :=(eu+'em ');
       IN_elas   :=(eu+'em ');
       end;//estar fim
       end;//çar fim
       end;//iar irregulares fim
      end;// dar fim
     end;// ear fim
     end;//gar fim
     end;//car fim
    end;//ar fim

          // se nao deu no ar
       // #########   tenta no er agora

  if  (pos('er ',eu)  > 1) and (pos('er ',eu)  < 20)then
   begin // er inicio
    if (pos('zer ',eu) > 1)and  (pos('zer ',eu) < 20) then
     begin//zer inicio
      if (pos('izer ',eu) > 1)and  (pos('izer ',eu) < 20) then
       begin//izer inicio
      // term com izer  // eu tu ele
     //  memo1.lines.add ('izer');
     if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
     delete(eu,pos('er ',eu)-2,(length(eu)- pos('er ',eu)+3));

       GERm      :=(eu+'ito ');
       GERf      :=(eu+'ita ');
       GERAm      :=(eu+'izido ');
       GERAf      :=(eu+'izida ');
       PART      :=(eu+'izendo ');
       AGENTE1   :=(eu+'izente ');
       AGENTE2   :=(eu+'izidor ');
       AGENTE3   :=(eu+'izidora ');
       ACAO1     :=(eu+'izimento ');
       ACAO2     :=(eu+'izição ');
       ACAO3     :=(eu+'izimenta ');
       RESU1     :=(eu+'izisso ');
       RESU2     :=(eu+'izissa ');

       IP_eu     :=(eu+'izer ');
       IP_tu     :=(eu+'izeres ');
       IP_ele    :=(eu+'izer ');
       IP_ela    :=(eu+'izer ');
       IP_voce   :=(eu+'izer ');
       IP_nos    :=(eu+'izermos ');
       IP_vos    :=(eu+'izerdes ');
       IP_voces  :=(eu+'izerem ');
       IP_eles   :=(eu+'izerem ');
       IP_elas   :=(eu+'izerem ');

       PI_eu     :=(eu+'igo ');
       PI_tu     :=(eu+'izes ');
       PI_ele    :=(eu+'iz ');
       PI_ela    :=(eu+'iz ');
       PI_voce   :=(eu+'iz ');
       PI_nos    :=(eu+'izemos ');
       PI_vos    :=(eu+'izeis ');
       PI_voces  :=(eu+'izem ');
       PI_eles   :=(eu+'izem ');
       PI_elas   :=(eu+'izem ');

       PP_eu     :=(eu+'isse');
       PP_tu     :=(eu+'isseste '); //ei
       PP_ele    :=(eu+'isse ');
       PP_ela    :=(eu+'isse ');
       PP_voce   :=(eu+'isse ');
       PP_nos    :=(eu+'issemos ');
       PP_vos    :=(eu+'issestes ');
       PP_voces  :=(eu+'isseram ');
       PP_eles   :=(eu+'isseram ');
       PP_elas   :=(eu+'isseram ');

       II_eu     :=(eu+'izia ');
       II_tu     :=(eu+'izias ');
       II_ele    :=(eu+'izia ');
       II_ela    :=(eu+'izia ');
       II_voce   :=(eu+'izia ');
       II_nos    :=(eu+'iziamos ');
       II_vos    :=(eu+'izieis ');
       II_voces  :=(eu+'iziam ');
       II_eles   :=(eu+'iziam ');
       II_elas   :=(eu+'iziam ');

       MI_eu     :=(eu+'issera ');
       MI_tu     :=(eu+'isseras ');
       MI_ele    :=(eu+'issera ');
       MI_ela    :=(eu+'issera ');
       MI_voce   :=(eu+'issera ');
       MI_nos    :=(eu+'isseramos ');
       MI_vos    :=(eu+'issereis ');
       MI_voces  :=(eu+'isseram ');
       MI_eles   :=(eu+'isseram ');
       MI_elas   :=(eu+'isseram ');

       TI_eu     :=(eu+'iria ');
       TI_tu     :=(eu+'irias ');
       TI_ele    :=(eu+'iria ');
       TI_ela    :=(eu+'iria ');
       TI_voce   :=(eu+'iria ');
       TI_nos    :=(eu+'iriamos ');
       TI_vos    :=(eu+'irieis ');
       TI_voces  :=(eu+'iriam ');
       TI_eles   :=(eu+'iriam ');
       TI_elas   :=(eu+'iriam ');

       FI_eu     :=(eu+'irei ');
       FI_tu     :=(eu+'iras ');
       FI_ele    :=(eu+'ira ');
       FI_ela    :=(eu+'ira ');
       FI_voce   :=(eu+'ira ');
       FI_nos    :=(eu+'iremos ');
       FI_vos    :=(eu+'ireis ');
       FI_voces  :=(eu+'irão ');
       FI_eles   :=(eu+'irão ');
       FI_elas   :=(eu+'irão ');

       PS_eu     :=(eu+'iga ');
       PS_tu     :=(eu+'igas ');
       PS_ele    :=(eu+'iga ');
       PS_ela    :=(eu+'iga ');
       PS_voce   :=(eu+'iga ');
       PS_nos    :=(eu+'igamos ');
       PS_vos    :=(eu+'igais ');
       PS_voces  :=(eu+'igam ');
       PS_eles   :=(eu+'igam ');
       PS_elas   :=(eu+'igam ');

       IS_eu     :=(eu+'issesse ');
       IS_tu     :=(eu+'issesses ');
       IS_ele    :=(eu+'issesse ');
       IS_ela    :=(eu+'issesse ');
       IS_voce   :=(eu+'issesse ');
       IS_nos    :=(eu+'issessemos ');
       IS_vos    :=(eu+'issesseis ');
       IS_voces  :=(eu+'issessem ');
       IS_eles   :=(eu+'issessem ');
       IS_elas   :=(eu+'issessem ');

       FS_eu     :=(eu+'isser ');
       FS_tu     :=(eu+'isseres ');
       FS_ele    :=(eu+'isser ');
       FS_ela    :=(eu+'isser ');
       FS_voce   :=(eu+'isser ');
       FS_nos    :=(eu+'issermos ');
       FS_vos    :=(eu+'isserdes ');
       FS_voces  :=(eu+'isserem ');
       FS_eles   :=(eu+'isserem ');
       FS_elas   :=(eu+'isserem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'iz ');
       IA_ele    :=(eu+'iga ');
       IA_ela    :=(eu+'iga ');
       IA_voce   :=(eu+'iga ');
       IA_nos    :=(eu+'igamos ');
       IA_vos    :=(eu+'izeis ');
       IA_voces  :=(eu+'igam ');
       IA_eles   :=(eu+'igam ');
       IA_elas   :=(eu+'igam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'igas ');
       IN_ele    :=(eu+'iga ');
       IN_ela    :=(eu+'iga ');
       IN_voce   :=(eu+'iga ');
       IN_nos    :=(eu+'igamos ');
       IN_vos    :=(eu+'igais ');
       IN_voces  :=(eu+'igam ');
       IN_eles   :=(eu+'igam ');
       IN_elas   :=(eu+'igam ');
       end;//izer fim
      if (pos('fazer ',eu) > 0) and  (pos('fazer ',eu) < 20) then
       begin //fazer inicio
       // term com azer  // eu tu ele

       //memo1.lines.add ('fazer');
       delete(eu,pos('er ',eu)-2,(length(eu)- pos('er ',eu)+3));

       GERm      :=(eu+'eito ');
       GERf      :=(eu+'eita ');
       GERAm      :=(eu+'azido ');
       GERAf      :=(eu+'azida ');
       PART      :=(eu+'azendo ');
       AGENTE1   :=(eu+'azente ');
       AGENTE2   :=(eu+'azedor ');
       AGENTE3   :=(eu+'azedora ');
       ACAO1     :=(eu+'azimento ');
       ACAO2     :=(eu+'azeção ');
       ACAO3     :=(eu+'azimenta ');
       RESU1     :=(eu+'azesso ');
       RESU2     :=(eu+'azessa ');

       IP_eu     :=(eu+'azer ');
       IP_tu     :=(eu+'azeres ');
       IP_ele    :=(eu+'azer ');
       IP_ela    :=(eu+'azer ');
       IP_voce   :=(eu+'azer ');
       IP_nos    :=(eu+'azermos ');
       IP_vos    :=(eu+'azerdes ');
       IP_voces  :=(eu+'azerem ');
       IP_eles   :=(eu+'azerem ');
       IP_elas   :=(eu+'azerem ');

       PI_eu     :=(eu+'aço ');
       PI_tu     :=(eu+'aes ');
       PI_ele    :=(eu+'az ');
       PI_ela    :=(eu+'az ');
       PI_voce   :=(eu+'az ');
       PI_nos    :=(eu+'azemos ');
       PI_vos    :=(eu+'azeis ');
       PI_voces  :=(eu+'azem ');
       PI_eles   :=(eu+'azem ');
       PI_elas   :=(eu+'azem ');

       PP_eu     :=(eu+'iz ');
       PP_tu     :=(eu+'izeste ');
       PP_ele    :=(eu+'ez ');
       PP_ela    :=(eu+'ez ');
       PP_voce   :=(eu+'ez ');
       PP_nos    :=(eu+'izemos ');      //EI
       PP_vos    :=(eu+'izestes ');
       PP_voces  :=(eu+'izeram ');
       PP_eles   :=(eu+'izeram ');
       PP_elas   :=(eu+'izeram ');

       II_eu     :=(eu+'azia ');
       II_tu     :=(eu+'azias ');
       II_ele    :=(eu+'azia ');
       II_ela    :=(eu+'azia ');
       II_voce   :=(eu+'azia ');
       II_nos    :=(eu+'aziamos ');
       II_vos    :=(eu+'azieis ');
       II_voces  :=(eu+'aziam ');
       II_eles   :=(eu+'aziam ');
       II_elas   :=(eu+'aziam ');

       MI_eu     :=(eu+'izera ');
       MI_tu     :=(eu+'izeras ');
       MI_ele    :=(eu+'izera ');
       MI_ela    :=(eu+'izera ');
       MI_voce   :=(eu+'izera ');
       MI_nos    :=(eu+'izeramos ');
       MI_vos    :=(eu+'izereis ');
       MI_voces  :=(eu+'izeram ');
       MI_eles   :=(eu+'izeram ');
       MI_elas   :=(eu+'izeram ');

       TI_eu     :=(eu+'aria ');
       TI_tu     :=(eu+'arias ');
       TI_ele    :=(eu+'aria ');
       TI_ela    :=(eu+'aria ');
       TI_voce   :=(eu+'aria ');
       TI_nos    :=(eu+'ariamos ');
       TI_vos    :=(eu+'arieis ');
       TI_voces  :=(eu+'ariam ');
       TI_eles   :=(eu+'ariam ');
       TI_elas   :=(eu+'ariam ');

       FI_eu     :=(eu+'arei ');
       FI_tu     :=(eu+'aras ');
       FI_ele    :=(eu+'ara ');
       FI_ela    :=(eu+'ara ');
       FI_voce   :=(eu+'ara ');
       FI_nos    :=(eu+'aremos ');
       FI_vos    :=(eu+'areis ');
       FI_voces  :=(eu+'arão ');
       FI_eles   :=(eu+'arão ');
       FI_elas   :=(eu+'arão ');

       PS_eu     :=(eu+'aça ');
       PS_tu     :=(eu+'aças ');
       PS_ele    :=(eu+'aça ');
       PS_ela    :=(eu+'aça ');
       PS_voce   :=(eu+'aça ');
       PS_nos    :=(eu+'açamos ');
       PS_vos    :=(eu+'açais ');
       PS_voces  :=(eu+'açam ');
       PS_eles   :=(eu+'açam ');
       PS_elas   :=(eu+'açam ');

       IS_eu     :=(eu+'izesse ');
       IS_tu     :=(eu+'izesses ');
       IS_ele    :=(eu+'izesse ');
       IS_ela    :=(eu+'izesse ');
       IS_voce   :=(eu+'izesse ');
       IS_nos    :=(eu+'izessemos ');
       IS_vos    :=(eu+'izesseis ');
       IS_voces  :=(eu+'izessem ');
       IS_eles   :=(eu+'izessem ');
       IS_elas   :=(eu+'izessem ');

       FS_eu     :=(eu+'izer ');
       FS_tu     :=(eu+'izeres ');
       FS_ele    :=(eu+'izer ');
       FS_ela    :=(eu+'izer ');
       FS_voce   :=(eu+'izer ');
       FS_nos    :=(eu+'izermos ');
       FS_vos    :=(eu+'izerdes ');
       FS_voces  :=(eu+'izerem ');
       FS_eles   :=(eu+'izerem ');
       FS_elas   :=(eu+'izerem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'az ');
       IA_ele    :=(eu+'aça ');
       IA_ela    :=(eu+'aça ');
       IA_voce   :=(eu+'aça ');
       IA_nos    :=(eu+'açamos ');
       IA_vos    :=(eu+'açais ');
       IA_voces  :=(eu+'açam ');
       IA_eles   :=(eu+'açam ');
       IA_elas   :=(eu+'açam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'aças ');
       IN_ele    :=(eu+'aça ');
       IN_ela    :=(eu+'aça ');
       IN_voce   :=(eu+'aça ');
       IN_nos    :=(eu+'açamos ');
       IN_vos    :=(eu+'açais ');
       IN_voces  :=(eu+'açam ');
       IN_eles   :=(eu+'açam ');
       IN_elas   :=(eu+'açam ');


       end;//fazer fim
     end;//zer fim
    if (pos('ler ',eu) > 0)and  (pos('ler ',eu) < 20) then
     begin // ler inicio
      if (pos('aler ',eu) > 1)and  (pos('aler ',eu) < 20) then
       begin// aler inicio
       //term c aler    // eu tu ele
       //memo1.lines.add ('aler');
       delete(eu,pos('er ',eu)-2,(length(eu)- pos('er ',eu)+3));

       GERm      :=(eu+'alido ');
       GERf      :=(eu+'alida ');
       GERAm      :=(eu+'alido ');
       GERAf      :=(eu+'alida ');
       PART      :=(eu+'alendo ');
       AGENTE1   :=(eu+'alente ');
       AGENTE2   :=(eu+'aledor ');
       AGENTE3   :=(eu+'aledora ');
       ACAO1     :=(eu+'alimento ');
       ACAO2     :=(eu+'alição ');
       ACAO3     :=(eu+'alimenta ');
       RESU1     :=(eu+'alisso ');
       RESU2     :=(eu+'alissa ');

       IP_eu     :=(eu+'er ');
       IP_tu     :=(eu+'eres ');
       IP_ele    :=(eu+'er ');
       IP_ela    :=(eu+'er ');
       IP_voce   :=(eu+'er ');
       IP_nos    :=(eu+'ermos ');
       IP_vos    :=(eu+'erdes ');
       IP_voces  :=(eu+'erem ');
       IP_eles   :=(eu+'erem ');
       IP_elas   :=(eu+'erem ');

       PI_eu     :=(eu+'alho ');
       PI_tu     :=(eu+'ales ');
       PI_ele    :=(eu+'ale ');
       PI_ela    :=(eu+'ale ');
       PI_voce   :=(eu+'ale ');
       PI_nos    :=(eu+'alemos ');
       PI_vos    :=(eu+'aleis ');
       PI_voces  :=(eu+'alem ');
       PI_eles   :=(eu+'alem ');
       PI_elas   :=(eu+'alem ');

       PP_eu     :=(eu+'i ');
       PP_tu     :=(eu+'este ');
       PP_ele    :=(eu+'eu ');
       PP_ela    :=(eu+'eu ');
       PP_voce   :=(eu+'eu ');         //EI
       PP_nos    :=(eu+'emos ');
       PP_vos    :=(eu+'estes ');
       PP_voces  :=(eu+'eram ');
       PP_eles   :=(eu+'eram ');
       PP_elas   :=(eu+'eram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'era ');
       MI_tu     :=(eu+'eras ');
       MI_ele    :=(eu+'era ');
       MI_ela    :=(eu+'era ');
       MI_voce   :=(eu+'era ');
       MI_nos    :=(eu+'eramos ');
       MI_vos    :=(eu+'ereis ');
       MI_voces  :=(eu+'eram ');
       MI_eles   :=(eu+'eram ');
       MI_elas   :=(eu+'eram ');

       TI_eu     :=(eu+'eria ');
       TI_tu     :=(eu+'erias ');
       TI_ele    :=(eu+'eria ');
       TI_ela    :=(eu+'eria ');
       TI_voce   :=(eu+'eria ');
       TI_nos    :=(eu+'eriamos ');
       TI_vos    :=(eu+'erieis ');
       TI_voces  :=(eu+'eriam ');
       TI_eles   :=(eu+'eriam ');
       TI_elas   :=(eu+'eriam ');

       FI_eu     :=(eu+'erei ');
       FI_tu     :=(eu+'eras ');
       FI_ele    :=(eu+'era ');
       FI_ela    :=(eu+'era ');
       FI_voce   :=(eu+'era ');
       FI_nos    :=(eu+'eremos ');
       FI_vos    :=(eu+'ereis ');
       FI_voces  :=(eu+'erão ');
       FI_eles   :=(eu+'erão ');
       FI_elas   :=(eu+'erão ');

       PS_eu     :=(eu+'alha ');
       PS_tu     :=(eu+'alhas ');
       PS_ele    :=(eu+'alha ');
       PS_ela    :=(eu+'alha ');
       PS_voce   :=(eu+'alha ');
       PS_nos    :=(eu+'alhamos ');
       PS_vos    :=(eu+'alhais ');
       PS_voces  :=(eu+'alham ');
       PS_eles   :=(eu+'alham ');
       PS_elas   :=(eu+'alham ');

       IS_eu     :=(eu+'esse ');
       IS_tu     :=(eu+'esses ');
       IS_ele    :=(eu+'esse ');
       IS_ela    :=(eu+'esse ');
       IS_voce   :=(eu+'esse ');
       IS_nos    :=(eu+'essemos ');
       IS_vos    :=(eu+'esseis ');
       IS_voces  :=(eu+'essem ');
       IS_eles   :=(eu+'essem ');
       IS_elas   :=(eu+'essem ');

       FS_eu     :=(eu+'er ');
       FS_tu     :=(eu+'eres ');
       FS_ele    :=(eu+'er ');
       FS_ela    :=(eu+'er ');
       FS_voce   :=(eu+'er ');
       FS_nos    :=(eu+'ermos ');
       FS_vos    :=(eu+'erdes ');
       FS_voces  :=(eu+'erem ');
       FS_eles   :=(eu+'erem ');
       FS_elas   :=(eu+'erem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ale ');
       IA_ele    :=(eu+'alha ');
       IA_ela    :=(eu+'alha ');
       IA_voce   :=(eu+'alha ');
       IA_nos    :=(eu+'alhamos ');
       IA_vos    :=(eu+'alei ');
       IA_voces  :=(eu+'alham ');
       IA_eles   :=(eu+'alham ');
       IA_elas   :=(eu+'alham ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'alhas ');
       IN_ele    :=(eu+'alha ');
       IN_ela    :=(eu+'alha ');
       IN_voce   :=(eu+'alha ');
       IN_nos    :=(eu+'alhamos ');
       IN_vos    :=(eu+'alhais ');
       IN_voces  :=(eu+'alham ');
       IN_eles   :=(eu+'alham ');
       IN_elas   :=(eu+'alham ');


       end// aler meio
       else // n tem aler entao conjuga ler de leitura
       begin // aler contin
      //o resto terminado com ler   eu tu ele
      // memo1.lines.add ('ler');
       delete(eu,pos('er ',eu),(length(eu)- pos('er ',eu)+1));

       GERm      :=(eu+'ido ');
       GERf      :=(eu+'ida ');
       GERAm      :=(eu+'ido ');
       GERAf      :=(eu+'ida ');
       PART      :=(eu+'endo ');
       AGENTE1   :=(eu+'ente ');
       AGENTE2   :=(eu+'edor ');
       AGENTE3   :=(eu+'edora ');
       ACAO1     :=(eu+'imento ');
       ACAO2     :=(eu+'eção ');
       ACAO3     :=(eu+'imenta ');
       RESU1     :=(eu+'isso ');
       RESU2     :=(eu+'issa ');

       IP_eu     :=(eu+'er ');
       IP_tu     :=(eu+'eres ');
       IP_ele    :=(eu+'er ');
       IP_ela    :=(eu+'er ');
       IP_voce   :=(eu+'er ');
       IP_nos    :=(eu+'ermos ');
       IP_vos    :=(eu+'erdes ');
       IP_voces  :=(eu+'erem ');
       IP_eles   :=(eu+'erem ');
       IP_elas   :=(eu+'erem ');

       PI_eu     :=(eu+'eio ');
       PI_tu     :=(eu+'es ');
       PI_ele    :=(eu+'e ');
       PI_ela    :=(eu+'e ');
       PI_voce   :=(eu+'e ');
       PI_nos    :=(eu+'emos ');
       PI_vos    :=(eu+'edes ');
       PI_voces  :=(eu+'eem ');
       PI_eles   :=(eu+'eem ');
       PI_elas   :=(eu+'eem ');

       PP_eu     :=(eu+'i ');
       PP_tu     :=(eu+'este ');
       PP_ele    :=(eu+'eu ');
       PP_ela    :=(eu+'eu ');
       PP_voce   :=(eu+'eu ');         //EI
       PP_nos    :=(eu+'emos ');
       PP_vos    :=(eu+'estes ');
       PP_voces  :=(eu+'eram ');
       PP_eles   :=(eu+'eram ');
       PP_elas   :=(eu+'eram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'era ');
       MI_tu     :=(eu+'eras ');
       MI_ele    :=(eu+'era ');
       MI_ela    :=(eu+'era ');
       MI_voce   :=(eu+'era ');
       MI_nos    :=(eu+'eramos ');
       MI_vos    :=(eu+'ereis ');
       MI_voces  :=(eu+'eram ');
       MI_eles   :=(eu+'eram ');
       MI_elas   :=(eu+'eram ');

       TI_eu     :=(eu+'eria ');
       TI_tu     :=(eu+'erias ');
       TI_ele    :=(eu+'eria ');
       TI_ela    :=(eu+'eria ');
       TI_voce   :=(eu+'eria ');
       TI_nos    :=(eu+'eriamos ');
       TI_vos    :=(eu+'erieis ');
       TI_voces  :=(eu+'eriam ');
       TI_eles   :=(eu+'eriam ');
       TI_elas   :=(eu+'eriam ');

       FI_eu     :=(eu+'erei ');
       FI_tu     :=(eu+'eras ');
       FI_ele    :=(eu+'era ');
       FI_ela    :=(eu+'era ');
       FI_voce   :=(eu+'era ');
       FI_nos    :=(eu+'eremos ');
       FI_vos    :=(eu+'ereis ');
       FI_voces  :=(eu+'erão ');
       FI_eles   :=(eu+'erão ');
       FI_elas   :=(eu+'erão ');

       PS_eu     :=(eu+'eia ');
       PS_tu     :=(eu+'eias ');
       PS_ele    :=(eu+'eia ');
       PS_ela    :=(eu+'eia ');
       PS_voce   :=(eu+'eia ');
       PS_nos    :=(eu+'eiamos ');
       PS_vos    :=(eu+'eiais ');
       PS_voces  :=(eu+'eiam ');
       PS_eles   :=(eu+'eiam ');
       PS_elas   :=(eu+'eiam ');

       IS_eu     :=(eu+'esse ');
       IS_tu     :=(eu+'esses ');
       IS_ele    :=(eu+'esse ');
       IS_ela    :=(eu+'esse ');
       IS_voce   :=(eu+'esse ');
       IS_nos    :=(eu+'essemos ');
       IS_vos    :=(eu+'esseis ');
       IS_voces  :=(eu+'essem ');
       IS_eles   :=(eu+'essem ');
       IS_elas   :=(eu+'essem ');

       FS_eu     :=(eu+'er ');
       FS_tu     :=(eu+'eres ');
       FS_ele    :=(eu+'er ');
       FS_ela    :=(eu+'er ');
       FS_voce   :=(eu+'er ');
       FS_nos    :=(eu+'ermos ');
       FS_vos    :=(eu+'erdes ');
       FS_voces  :=(eu+'erem ');
       FS_eles   :=(eu+'erem ');
       FS_elas   :=(eu+'erem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'e ');
       IA_ele    :=(eu+'eia ');
       IA_ela    :=(eu+'eia ');
       IA_voce   :=(eu+'eia ');
       IA_nos    :=(eu+'eiamos ');
       IA_vos    :=(eu+'edes ');
       IA_voces  :=(eu+'eiam ');
       IA_eles   :=(eu+'eiam ');
       IA_elas   :=(eu+'eiam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'eias ');
       IN_ele    :=(eu+'eia ');
       IN_ela    :=(eu+'eia ');
       IN_voce   :=(eu+'eia ');
       IN_nos    :=(eu+'eiamos ');
       IN_vos    :=(eu+'eiais ');
       IN_voces  :=(eu+'eiam ');
       IN_eles   :=(eu+'eiam ');
       IN_elas   :=(eu+'eiam ');

       end;//aler fim
     end;//ler fim
    if (pos('crer ',eu) > 1)and  (pos('crer ',eu) < 20) then
     begin//crer inicio
      // term c crer // eu tu ele
      //memo1.lines.add ('crer');
       delete(eu,pos('er ',eu)-1,(length(eu)- pos('er ',eu)+2));

       GERm      :=(eu+'ido ');
       GERf      :=(eu+'ida ');
       GERAm      :=(eu+'ito ');
       GERAf      :=(eu+'ita ');
       PART      :=(eu+'endo ');
       AGENTE1   :=(eu+'ente ');
       AGENTE2   :=(eu+'edor ');
       AGENTE3   :=(eu+'edora ');
       ACAO1     :=(eu+'imento ');
       ACAO2     :=(eu+'ição ');
       ACAO3     :=(eu+'imenta ');
       RESU1     :=(eu+'isso ');
       RESU2     :=(eu+'issa ');

       IP_eu     :=(eu+'er ');
       IP_tu     :=(eu+'eres ');
       IP_ele    :=(eu+'er ');
       IP_ela    :=(eu+'er ');
       IP_voce   :=(eu+'er ');
       IP_nos    :=(eu+'ermos ');
       IP_vos    :=(eu+'erdes ');
       IP_voces  :=(eu+'erem ');
       IP_eles   :=(eu+'erem ');
       IP_elas   :=(eu+'erem ');

       PI_eu     :=(eu+'eio ');
       PI_tu     :=(eu+'es ');
       PI_ele    :=(eu+'e ');
       PI_ela    :=(eu+'e ');
       PI_voce   :=(eu+'e ');
       PI_nos    :=(eu+'emos ');
       PI_vos    :=(eu+'edes ');
       PI_voces  :=(eu+'eem ');
       PI_eles   :=(eu+'eem ');
       PI_elas   :=(eu+'eem ');

       PP_eu     :=(eu+'i ');
       PP_tu     :=(eu+'este ');
       PP_ele    :=(eu+'eu ');
       PP_ela    :=(eu+'eu ');
       PP_voce   :=(eu+'eu ');         //EI
       PP_nos    :=(eu+'emos ');
       PP_vos    :=(eu+'estes ');
       PP_voces  :=(eu+'eram ');
       PP_eles   :=(eu+'eram ');
       PP_elas   :=(eu+'eram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'era ');
       MI_tu     :=(eu+'eras ');
       MI_ele    :=(eu+'era ');
       MI_ela    :=(eu+'era ');
       MI_voce   :=(eu+'era ');
       MI_nos    :=(eu+'eramos ');
       MI_vos    :=(eu+'ereis ');
       MI_voces  :=(eu+'eram ');
       MI_eles   :=(eu+'eram ');
       MI_elas   :=(eu+'eram ');

       TI_eu     :=(eu+'eria ');
       TI_tu     :=(eu+'erias ');
       TI_ele    :=(eu+'eria ');
       TI_ela    :=(eu+'eria ');
       TI_voce   :=(eu+'eria ');
       TI_nos    :=(eu+'eriamos ');
       TI_vos    :=(eu+'erieis ');
       TI_voces  :=(eu+'eriam ');
       TI_eles   :=(eu+'eriam ');
       TI_elas   :=(eu+'eriam ');

       FI_eu     :=(eu+'erei ');
       FI_tu     :=(eu+'eras ');
       FI_ele    :=(eu+'era ');
       FI_ela    :=(eu+'era ');
       FI_voce   :=(eu+'era ');
       FI_nos    :=(eu+'eremos ');
       FI_vos    :=(eu+'ereis ');
       FI_voces  :=(eu+'erão ');
       FI_eles   :=(eu+'erão ');
       FI_elas   :=(eu+'erão ');

       PS_eu     :=(eu+'eia ');
       PS_tu     :=(eu+'eias ');
       PS_ele    :=(eu+'eia ');
       PS_ela    :=(eu+'eia ');
       PS_voce   :=(eu+'eia ');
       PS_nos    :=(eu+'eiamos ');
       PS_vos    :=(eu+'eiais ');
       PS_voces  :=(eu+'eiam ');
       PS_eles   :=(eu+'eiam ');
       PS_elas   :=(eu+'eiam ');

       IS_eu     :=(eu+'esse ');
       IS_tu     :=(eu+'esses ');
       IS_ele    :=(eu+'esse ');
       IS_ela    :=(eu+'esse ');
       IS_voce   :=(eu+'esse ');
       IS_nos    :=(eu+'essemos ');
       IS_vos    :=(eu+'esseis ');
       IS_voces  :=(eu+'essem ');
       IS_eles   :=(eu+'essem ');
       IS_elas   :=(eu+'essem ');

       FS_eu     :=(eu+'er ');
       FS_tu     :=(eu+'eres ');
       FS_ele    :=(eu+'er ');
       FS_ela    :=(eu+'er ');
       FS_voce   :=(eu+'er ');
       FS_nos    :=(eu+'ermos ');
       FS_vos    :=(eu+'erdes ');
       FS_voces  :=(eu+'erem ');
       FS_eles   :=(eu+'erem ');
       FS_elas   :=(eu+'erem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'e ');
       IA_ele    :=(eu+'eia ');
       IA_ela    :=(eu+'eia ');
       IA_voce   :=(eu+'eia ');
       IA_nos    :=(eu+'eiamos ');
       IA_vos    :=(eu+'edes ');
       IA_voces  :=(eu+'eiam ');
       IA_eles   :=(eu+'eiam ');
       IA_elas   :=(eu+'eiam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'eias ');
       IN_ele    :=(eu+'eia ');
       IN_ela    :=(eu+'eia ');
       IN_voce   :=(eu+'eia ');
       IN_nos    :=(eu+'eiamos ');
       IN_vos    :=(eu+'eiais ');
       IN_voces  :=(eu+'eiam ');
       IN_eles   :=(eu+'eiam ');
       IN_elas   :=(eu+'eiam ');

     end;//crer fim  // eu tu ele
     if (pos('ser ',eu) > 0) then
     begin//ser inicio
      // term c ser   // eu tu ele
      //memo1.lines.add ('ser');
      delete(eu,pos('er ',eu)-1,(length(eu)- pos('er ',eu)+2));

       GERm      :=(eu+'sido ');
       GERf      :=(eu+'sida ');
       GERAm      :=(eu+'sido ');
       GERAf      :=(eu+'sida ');
       PART      :=(eu+'sendo ');
       AGENTE1   :=(eu+'sente ');
       AGENTE2   :=(eu+'sedor ');
       AGENTE3   :=(eu+'sedora ');
       ACAO1     :=(eu+'simento ');
       ACAO2     :=(eu+'sição ');
       ACAO3     :=(eu+'simenta ');
       RESU1     :=(eu+'sisso ');
       RESU2     :=(eu+'sissa ');

       IP_eu     :=(eu+'ser ');
       IP_tu     :=(eu+'seres ');
       IP_ele    :=(eu+'ser ');
       IP_ela    :=(eu+'ser ');
       IP_voce   :=(eu+'ser ');
       IP_nos    :=(eu+'sermos ');
       IP_vos    :=(eu+'serdes ');
       IP_voces  :=(eu+'serem ');
       IP_eles   :=(eu+'serem ');
       IP_elas   :=(eu+'serem ');

       PI_eu     :=(eu+'sou ');
       PI_tu     :=(eu+'és ');
       PI_ele    :=(eu+'é ');
       PI_ela    :=(eu+'é ');
       PI_voce   :=(eu+'é ');
       PI_nos    :=(eu+'somos ');
       PI_vos    :=(eu+'sois ');
       PI_voces  :=(eu+'sao ');
       PI_eles   :=(eu+'sao ');
       PI_elas   :=(eu+'sao ');

       PP_eu     :=(eu+'fui' );
       PP_tu     :=(eu+'foste ');
       PP_ele    :=(eu+'foi ');
       PP_ela    :=(eu+'foi ');
       PP_voce   :=(eu+'foi ');         //EI
       PP_nos    :=(eu+'fomos ');
       PP_vos    :=(eu+'fostes ');
       PP_voces  :=(eu+'foram ');
       PP_eles   :=(eu+'foram ');
       PP_elas   :=(eu+'foram ');

       II_eu     :=(eu+'era ');
       II_tu     :=(eu+'eras ');
       II_ele    :=(eu+'era ');
       II_ela    :=(eu+'era ');
       II_voce   :=(eu+'era ');
       II_nos    :=(eu+'eramos ');
       II_vos    :=(eu+'ereis ');
       II_voces  :=(eu+'eram ');
       II_eles   :=(eu+'eram ');
       II_elas   :=(eu+'eram ');

       MI_eu     :=(eu+'fora ');
       MI_tu     :=(eu+'foras ');
       MI_ele    :=(eu+'fora ');
       MI_ela    :=(eu+'fora ');
       MI_voce   :=(eu+'fora ');
       MI_nos    :=(eu+'foramos ');
       MI_vos    :=(eu+'foreis ');
       MI_voces  :=(eu+'foram ');
       MI_eles   :=(eu+'foram ');
       MI_elas   :=(eu+'foram ');

       TI_eu     :=(eu+'seria ');
       TI_tu     :=(eu+'serias ');
       TI_ele    :=(eu+'seria ');
       TI_ela    :=(eu+'seria ');
       TI_voce   :=(eu+'seria ');
       TI_nos    :=(eu+'seriamos ');
       TI_vos    :=(eu+'serieis ');
       TI_voces  :=(eu+'seriam ');
       TI_eles   :=(eu+'seriam ');
       TI_elas   :=(eu+'seriam ');

       FI_eu     :=(eu+'serei ');
       FI_tu     :=(eu+'seras ');
       FI_ele    :=(eu+'sera ');
       FI_ela    :=(eu+'sera ');
       FI_voce   :=(eu+'sera ');
       FI_nos    :=(eu+'seremos ');
       FI_vos    :=(eu+'sereis ');
       FI_voces  :=(eu+'serão ');
       FI_eles   :=(eu+'serão ');
       FI_elas   :=(eu+'serão ');

       PS_eu     :=(eu+'seja ');
       PS_tu     :=(eu+'sejas ');
       PS_ele    :=(eu+'seja ');
       PS_ela    :=(eu+'seja ');
       PS_voce   :=(eu+'seja ');
       PS_nos    :=(eu+'sejamos ');
       PS_vos    :=(eu+'sejais ');
       PS_voces  :=(eu+'sejam ');
       PS_eles   :=(eu+'sejam ');
       PS_elas   :=(eu+'sejam ');

       IS_eu     :=(eu+'fosse ');
       IS_tu     :=(eu+'fosses ');
       IS_ele    :=(eu+'fosse ');
       IS_ela    :=(eu+'fosse ');
       IS_voce   :=(eu+'fosse ');
       IS_nos    :=(eu+'fossemos ');
       IS_vos    :=(eu+'fosseis ');
       IS_voces  :=(eu+'fossem ');
       IS_eles   :=(eu+'fossem ');
       IS_elas   :=(eu+'fossem ');

       FS_eu     :=(eu+'for ');
       FS_tu     :=(eu+'fores ');
       FS_ele    :=(eu+'for ');
       FS_ela    :=(eu+'for ');
       FS_voce   :=(eu+'for ');
       FS_nos    :=(eu+'formos ');
       FS_vos    :=(eu+'fordes ');
       FS_voces  :=(eu+'forem ');
       FS_eles   :=(eu+'forem ');
       FS_elas   :=(eu+'forem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'seja ');
       IA_ele    :=(eu+'seja ');
       IA_ela    :=(eu+'seja ');
       IA_voce   :=(eu+'seja ');
       IA_nos    :=(eu+'sejamos ');
       IA_vos    :=(eu+'sede ');
       IA_voces  :=(eu+'sejam ');
       IA_eles   :=(eu+'sejam ');
       IA_elas   :=(eu+'sejam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'sejas ');
       IN_ele    :=(eu+'seja ');
       IN_ela    :=(eu+'seja ');
       IN_voce   :=(eu+'seja ');
       IN_nos    :=(eu+'sejamos ');
       IN_vos    :=(eu+'sejais ');
       IN_voces  :=(eu+'sejam ');
       IN_eles   :=(eu+'sejam ');
       IN_elas   :=(eu+'sejam ');

     end;//ser fim
   if (pos('oer ',eu) > 1)and  (pos('oer ',eu) < 20) then
     begin//oer inicio
      //termi com oer  // eu tu ele
      delete(eu,pos('er ',eu)-1,(length(eu)- pos('er ',eu)+2));

       GERm      :=(eu+'oido ');
       GERf      :=(eu+'oida ');
       GERAm      :=(eu+'oido ');
       GERAf      :=(eu+'oida ');
       PART      :=(eu+'oendo ');
       AGENTE1   :=(eu+'oente ');
       AGENTE2   :=(eu+'oedor ');
       AGENTE3   :=(eu+'oedora ');
       ACAO1     :=(eu+'oimento ');
       ACAO2     :=(eu+'oição ');
       ACAO3     :=(eu+'oimenta ');
       RESU1     :=(eu+'oisso ');
       RESU2     :=(eu+'oissa ');

       IP_eu     :=(eu+'oer ');
       IP_tu     :=(eu+'oeres ');
       IP_ele    :=(eu+'oer ');
       IP_ela    :=(eu+'oer ');
       IP_voce   :=(eu+'oer ');
       IP_nos    :=(eu+'oermos ');
       IP_vos    :=(eu+'oerdes ');
       IP_voces  :=(eu+'oerem ');
       IP_eles   :=(eu+'oerem ');
       IP_elas   :=(eu+'oerem ');

       PI_eu     :=(eu+'oo ');
       PI_tu     :=(eu+'oes ');
       PI_ele    :=(eu+'oi ');
       PI_ela    :=(eu+'oi ');
       PI_voce   :=(eu+'oi ');
       PI_nos    :=(eu+'oemos ');
       PI_vos    :=(eu+'oeis ');
       PI_voces  :=(eu+'oem ');
       PI_eles   :=(eu+'oem ');
       PI_elas   :=(eu+'oem ');

       PP_eu     :=(eu+'oí ');
       PP_tu     :=(eu+'oeste ');
       PP_ele    :=(eu+'oeu ');
       PP_ela    :=(eu+'oeu ');
       PP_voce   :=(eu+'oeu ');         //EI
       PP_nos    :=(eu+'oemos ');
       PP_vos    :=(eu+'oestes ');
       PP_voces  :=(eu+'oeram ');
       PP_eles   :=(eu+'oeram ');
       PP_elas   :=(eu+'oeram ');

       II_eu     :=(eu+'oia ');
       II_tu     :=(eu+'oias ');
       II_ele    :=(eu+'oia ');
       II_ela    :=(eu+'oia ');
       II_voce   :=(eu+'oia ');
       II_nos    :=(eu+'oiamos ');
       II_vos    :=(eu+'oieis ');
       II_voces  :=(eu+'oiam ');
       II_eles   :=(eu+'oiam ');
       II_elas   :=(eu+'oiam ');

       MI_eu     :=(eu+'oera ');
       MI_tu     :=(eu+'oeras ');
       MI_ele    :=(eu+'oera ');
       MI_ela    :=(eu+'oera ');
       MI_voce   :=(eu+'oera ');
       MI_nos    :=(eu+'oeramos ');
       MI_vos    :=(eu+'oêreis ');
       MI_voces  :=(eu+'oeram ');
       MI_eles   :=(eu+'oeram ');
       MI_elas   :=(eu+'oeram ');

       TI_eu     :=(eu+'oeria ');
       TI_tu     :=(eu+'oerias ');
       TI_ele    :=(eu+'oeria ');
       TI_ela    :=(eu+'oeria ');
       TI_voce   :=(eu+'oeria ');
       TI_nos    :=(eu+'oeriamos ');
       TI_vos    :=(eu+'oerieis ');
       TI_voces  :=(eu+'oeriam ');
       TI_eles   :=(eu+'oeriam ');
       TI_elas   :=(eu+'oeriam ');

       FI_eu     :=(eu+'oerei ');
       FI_tu     :=(eu+'oeras ');
       FI_ele    :=(eu+'oera ');
       FI_ela    :=(eu+'oera ');
       FI_voce   :=(eu+'oera ');
       FI_nos    :=(eu+'oeremos ');
       FI_vos    :=(eu+'oereis ');
       FI_voces  :=(eu+'oerão ');
       FI_eles   :=(eu+'oerão ');
       FI_elas   :=(eu+'oerão ');

       PS_eu     :=(eu+'oa ');
       PS_tu     :=(eu+'oas ');
       PS_ele    :=(eu+'oa ');
       PS_ela    :=(eu+'oa ');
       PS_voce   :=(eu+'oa ');
       PS_nos    :=(eu+'oamos ');
       PS_vos    :=(eu+'oais ');
       PS_voces  :=(eu+'oam ');
       PS_eles   :=(eu+'oam ');
       PS_elas   :=(eu+'oam ');

       IS_eu     :=(eu+'oesse ');
       IS_tu     :=(eu+'oesses ');
       IS_ele    :=(eu+'oesse ');
       IS_ela    :=(eu+'oesse ');
       IS_voce   :=(eu+'oesse ');
       IS_nos    :=(eu+'oessemos ');
       IS_vos    :=(eu+'oesseis ');
       IS_voces  :=(eu+'oessem ');
       IS_eles   :=(eu+'oessem ');
       IS_elas   :=(eu+'oessem ');

       FS_eu     :=(eu+'oer ');
       FS_tu     :=(eu+'oeres ');
       FS_ele    :=(eu+'oer ');
       FS_ela    :=(eu+'oer ');
       FS_voce   :=(eu+'oer ');
       FS_nos    :=(eu+'oermos ');
       FS_vos    :=(eu+'oerdes ');
       FS_voces  :=(eu+'oerem ');
       FS_eles   :=(eu+'oerem ');
       FS_elas   :=(eu+'oerem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'oe ');
       IA_ele    :=(eu+'oa ');
       IA_ela    :=(eu+'oa ');
       IA_voce   :=(eu+'oa ');
       IA_nos    :=(eu+'oamos ');
       IA_vos    :=(eu+'oei ');
       IA_voces  :=(eu+'oam ');
       IA_eles   :=(eu+'oam ');
       IA_elas   :=(eu+'oam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'oas ');
       IN_ele    :=(eu+'oa ');
       IN_ela    :=(eu+'oa ');
       IN_voce   :=(eu+'oa ');
       IN_nos    :=(eu+'oamos ');
       IN_vos    :=(eu+'oais ');
       IN_voces  :=(eu+'oam ');
       IN_eles   :=(eu+'oam ');
       IN_elas   :=(eu+'oam ');

     end;//oer fim

     if (pos('saber ',eu) = 1)and  (pos('saber ',eu) < 20) then
     begin//saber inicio
      eu:='';

       GERm      :=(eu+'sabido ');
       GERf      :=(eu+'sabida ');
       GERAm      :=(eu+'sabido ');
       GERAf      :=(eu+'sabida ');
       PART      :=(eu+'sabendo ');
       AGENTE1   :=(eu+'sabente ');
       AGENTE2   :=(eu+'sabedor ');
       AGENTE3   :=(eu+'sabedora ');
       ACAO1     :=(eu+'sabimento ');
       ACAO2     :=(eu+'sabição ');
       ACAO3     :=(eu+'sabimenta ');
       RESU1     :=(eu+'sabisso ');
       RESU2     :=(eu+'sabissa ');

       IP_eu     :=(eu+'saber ');
       IP_tu     :=(eu+'saberes ');
       IP_ele    :=(eu+'saber ');
       IP_ela    :=(eu+'saber ');
       IP_voce   :=(eu+'saber ');
       IP_nos    :=(eu+'sabermos ');
       IP_vos    :=(eu+'saberdes ');
       IP_voces  :=(eu+'saberem ');
       IP_eles   :=(eu+'saberem ');
       IP_elas   :=(eu+'saberem ');

       PI_eu     :=(eu+'sei ');
       PI_tu     :=(eu+'sabes ');
       PI_ele    :=(eu+'sabe ');
       PI_ela    :=(eu+'sabe ');
       PI_voce   :=(eu+'sabe ');
       PI_nos    :=(eu+'sabemos ');
       PI_vos    :=(eu+'sabeis ');
       PI_voces  :=(eu+'sabem ');
       PI_eles   :=(eu+'sabem ');
       PI_elas   :=(eu+'sabem ');

       PP_eu     :=(eu+'soube ');
       PP_tu     :=(eu+'soubeste ');
       PP_ele    :=(eu+'soube ');
       PP_ela    :=(eu+'soube ');
       PP_voce   :=(eu+'soube ');         //EI
       PP_nos    :=(eu+'soubemos ');
       PP_vos    :=(eu+'soubestes ');
       PP_voces  :=(eu+'souberam ');
       PP_eles   :=(eu+'souberam ');
       PP_elas   :=(eu+'souberam ');

       II_eu     :=(eu+'sabia ');
       II_tu     :=(eu+'sabias ');
       II_ele    :=(eu+'sabia ');
       II_ela    :=(eu+'sabia ');
       II_voce   :=(eu+'sabia ');
       II_nos    :=(eu+'sabiamos ');
       II_vos    :=(eu+'sabieis ');
       II_voces  :=(eu+'sabiam ');
       II_eles   :=(eu+'sabiam ');
       II_elas   :=(eu+'sabiam ');

       MI_eu     :=(eu+'soubera ');
       MI_tu     :=(eu+'souberas ');
       MI_ele    :=(eu+'soubera ');
       MI_ela    :=(eu+'soubera ');
       MI_voce   :=(eu+'soubera ');
       MI_nos    :=(eu+'souberamos ');
       MI_vos    :=(eu+'soubereis ');
       MI_voces  :=(eu+'souberam ');
       MI_eles   :=(eu+'souberam ');
       MI_elas   :=(eu+'souberam ');

       TI_eu     :=(eu+'saberia ');
       TI_tu     :=(eu+'saberias ');
       TI_ele    :=(eu+'sabteria ');
       TI_ela    :=(eu+'sabteria ');
       TI_voce   :=(eu+'sabteria ');
       TI_nos    :=(eu+'saberiamos ');
       TI_vos    :=(eu+'saberieis ');
       TI_voces  :=(eu+'saberiam ');
       TI_eles   :=(eu+'saberiam ');
       TI_elas   :=(eu+'saberiam ');

       FI_eu     :=(eu+'saberei ');
       FI_tu     :=(eu+'saberas ');
       FI_ele    :=(eu+'sabera ');
       FI_ela    :=(eu+'sabera ');
       FI_voce   :=(eu+'sabera ');
       FI_nos    :=(eu+'saberemos ');
       FI_vos    :=(eu+'sabereis ');
       FI_voces  :=(eu+'saberão ');
       FI_eles   :=(eu+'saberão ');
       FI_elas   :=(eu+'saberão ');

       PS_eu     :=(eu+'ivera ');
       PS_tu     :=(eu+'iveras ');
       PS_ele    :=(eu+'ivera ');
       PS_ela    :=(eu+'ivera ');
       PS_voce   :=(eu+'ivera ');
       PS_nos    :=(eu+'iveramos ');
       PS_vos    :=(eu+'iverais ');
       PS_voces  :=(eu+'iveram ');
       PS_eles   :=(eu+'iveram ');
       PS_elas   :=(eu+'iveram ');

       IS_eu     :=(eu+'soubesse ');
       IS_tu     :=(eu+'soubesses ');
       IS_ele    :=(eu+'soubesse ');
       IS_ela    :=(eu+'soubesse ');
       IS_voce   :=(eu+'soubesse ');
       IS_nos    :=(eu+'soubessemos ');
       IS_vos    :=(eu+'soubeisseis ');
       IS_voces  :=(eu+'soubessem ');
       IS_eles   :=(eu+'soubessem ');
       IS_elas   :=(eu+'soubssem ');

       FS_eu     :=(eu+'soubver ');
       FS_tu     :=(eu+'souberes ');
       FS_ele    :=(eu+'souber ');
       FS_ela    :=(eu+'souber ');
       FS_voce   :=(eu+'souber ');
       FS_nos    :=(eu+'soubemos ');
       FS_vos    :=(eu+'soubes ');
       FS_voces  :=(eu+'souberem ');
       FS_eles   :=(eu+'souberem ');
       FS_elas   :=(eu+'souberem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'sabe ');
       IA_ele    :=(eu+'saiba ');
       IA_ela    :=(eu+'saiba ');
       IA_voce   :=(eu+'saiba ');
       IA_nos    :=(eu+'saibamos ');
       IA_vos    :=(eu+'saibei ');
       IA_voces  :=(eu+'saibam ');
       IA_eles   :=(eu+'saibam ');
       IA_elas   :=(eu+'saibam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'saibas ');
       IN_ele    :=(eu+'saiba ');
       IN_ela    :=(eu+'saiba ');
       IN_voce   :=(eu+'saiba ');
       IN_nos    :=(eu+'saibamos ');
       IN_vos    :=(eu+'saibei ');
       IN_voces  :=(eu+'saibam ');
       IN_eles   :=(eu+'saibam ');
       IN_elas   :=(eu+'saibam ');

     end;// saber fim


     if (pos('ter ',eu) = 1)and  (pos('ter ',eu) < 20) then
     begin//ter inicio
      eu:='';
     // delete(eu,pos('er ',eu)-1,(length(eu)- pos('er ',eu)+2));
       GERm      :=(eu+'tido ');
       GERf      :=(eu+'tida ');
       GERAm      :=(eu+'tido ');
       GERAf      :=(eu+'tida ');
       PART      :=(eu+'tendo ');
       AGENTE1   :=(eu+'tente ');
       AGENTE2   :=(eu+'tedor ');
       AGENTE3   :=(eu+'tedora ');
       ACAO1     :=(eu+'timento ');
       ACAO2     :=(eu+'tição ');
       ACAO3     :=(eu+'timenta ');
       RESU1     :=(eu+'tisso ');
       RESU2     :=(eu+'tissa ');

       IP_eu     :=(eu+'ter ');
       IP_tu     :=(eu+'teres ');
       IP_ele    :=(eu+'ter ');
       IP_ela    :=(eu+'ter ');
       IP_voce   :=(eu+'ter ');
       IP_nos    :=(eu+'termos ');
       IP_vos    :=(eu+'terdes ');
       IP_voces  :=(eu+'terem ');
       IP_eles   :=(eu+'terem ');
       IP_elas   :=(eu+'terem ');

       PI_eu     :=(eu+'tenho ');
       PI_tu     :=(eu+'tens ');
       PI_ele    :=(eu+'tem ');
       PI_ela    :=(eu+'tem ');
       PI_voce   :=(eu+'tem ');
       PI_nos    :=(eu+'temos ');
       PI_vos    :=(eu+'teis ');
       PI_voces  :=(eu+'teem ');
       PI_eles   :=(eu+'teem ');
       PI_elas   :=(eu+'teem ');

       PP_eu     :=(eu+'tive ');
       PP_tu     :=(eu+'tiveste ');
       PP_ele    :=(eu+'teve ');
       PP_ela    :=(eu+'teve ');
       PP_voce   :=(eu+'teve ');         //EI
       PP_nos    :=(eu+'tivemos ');
       PP_vos    :=(eu+'tivestes ');
       PP_voces  :=(eu+'tiveram ');
       PP_eles   :=(eu+'tiveram ');
       PP_elas   :=(eu+'tiveram ');

       II_eu     :=(eu+'tinha ');
       II_tu     :=(eu+'tinhas ');
       II_ele    :=(eu+'tinha ');
       II_ela    :=(eu+'tinha ');
       II_voce   :=(eu+'tinha ');
       II_nos    :=(eu+'tinhamos ');
       II_vos    :=(eu+'tinheis ');
       II_voces  :=(eu+'tinham ');
       II_eles   :=(eu+'tinham ');
       II_elas   :=(eu+'tinham ');

       MI_eu     :=(eu+'tivera ');
       MI_tu     :=(eu+'tiveras ');
       MI_ele    :=(eu+'tivera ');
       MI_ela    :=(eu+'tivera ');
       MI_voce   :=(eu+'tivera ');
       MI_nos    :=(eu+'tiveramos ');
       MI_vos    :=(eu+'tivereis ');
       MI_voces  :=(eu+'tiveram ');
       MI_eles   :=(eu+'tiveram ');
       MI_elas   :=(eu+'tiveram ');

       TI_eu     :=(eu+'teria ');
       TI_tu     :=(eu+'terias ');
       TI_ele    :=(eu+'teria ');
       TI_ela    :=(eu+'teria ');
       TI_voce   :=(eu+'teria ');
       TI_nos    :=(eu+'teriamos ');
       TI_vos    :=(eu+'terieis ');
       TI_voces  :=(eu+'teriam ');
       TI_eles   :=(eu+'teriam ');
       TI_elas   :=(eu+'teriam ');

       FI_eu     :=(eu+'terei ');
       FI_tu     :=(eu+'teras ');
       FI_ele    :=(eu+'tera ');
       FI_ela    :=(eu+'tera ');
       FI_voce   :=(eu+'tera ');
       FI_nos    :=(eu+'teremos ');
       FI_vos    :=(eu+'tereis ');
       FI_voces  :=(eu+'terão ');
       FI_eles   :=(eu+'terão ');
       FI_elas   :=(eu+'terão ');

       PS_eu     :=(eu+'tivera ');
       PS_tu     :=(eu+'tiveras ');
       PS_ele    :=(eu+'tivera ');
       PS_ela    :=(eu+'tivera ');
       PS_voce   :=(eu+'tivera ');
       PS_nos    :=(eu+'tiveramos ');
       PS_vos    :=(eu+'tiverais ');
       PS_voces  :=(eu+'tiveram ');
       PS_eles   :=(eu+'tiveram ');
       PS_elas   :=(eu+'tiveram ');

       IS_eu     :=(eu+'tivesse ');
       IS_tu     :=(eu+'tivesses ');
       IS_ele    :=(eu+'tivesse ');
       IS_ela    :=(eu+'tivesse ');
       IS_voce   :=(eu+'tivesse ');
       IS_nos    :=(eu+'tivessemos ');
       IS_vos    :=(eu+'tiveisseis ');
       IS_voces  :=(eu+'tivessem ');
       IS_eles   :=(eu+'tivessem ');
       IS_elas   :=(eu+'vivssem ');

       FS_eu     :=(eu+'tiver ');
       FS_tu     :=(eu+'tiveres ');
       FS_ele    :=(eu+'tiver ');
       FS_ela    :=(eu+'tiver ');
       FS_voce   :=(eu+'tiver ');
       FS_nos    :=(eu+'tivemos ');
       FS_vos    :=(eu+'tives ');
       FS_voces  :=(eu+'tiverem ');
       FS_eles   :=(eu+'tiverem ');
       FS_elas   :=(eu+'tiverem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'tenha ');
       IA_ele    :=(eu+'tenha ');
       IA_ela    :=(eu+'tenha ');
       IA_voce   :=(eu+'tenha ');
       IA_nos    :=(eu+'tenhamos ');
       IA_vos    :=(eu+'tenhei ');
       IA_voces  :=(eu+'tenham ');
       IA_eles   :=(eu+'tenham ');
       IA_elas   :=(eu+'tenham ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'tenhas ');
       IN_ele    :=(eu+'tenha ');
       IN_ela    :=(eu+'tenha ');
       IN_voce   :=(eu+'tenha ');
       IN_nos    :=(eu+'tenhamos ');
       IN_vos    :=(eu+'tenhei ');
       IN_voces  :=(eu+'tenham ');
       IN_eles   :=(eu+'tenham ');
       IN_elas   :=(eu+'tenham ');

     end;// ter fim

    if (pos('ver ',eu) = 1)and  (pos('ver ',eu) < 20) then
     begin//ver inicio
      eu:='';
     // delete(eu,pos('er ',eu)-1,(length(eu)- pos('er ',eu)+2));
       GERm      :=(eu+'visto ');
       GERf      :=(eu+'vista ');
       GERAm      :=(eu+'visto ');
       GERAf      :=(eu+'vista ');
       PART      :=(eu+'vendo ');
       AGENTE1   :=(eu+'vente ');
       AGENTE2   :=(eu+'vedor ');
       AGENTE3   :=(eu+'vedora ');
       ACAO1     :=(eu+'vimento ');
       ACAO2     :=(eu+'vição ');
       ACAO3     :=(eu+'vimenta ');
       RESU1     :=(eu+'visso ');
       RESU2     :=(eu+'vissa ');

       IP_eu     :=(eu+'ver ');
       IP_tu     :=(eu+'veres ');
       IP_ele    :=(eu+'ver ');
       IP_ela    :=(eu+'ver ');
       IP_voce   :=(eu+'ver ');
       IP_nos    :=(eu+'vermos ');
       IP_vos    :=(eu+'verdes ');
       IP_voces  :=(eu+'verem ');
       IP_eles   :=(eu+'verem ');
       IP_elas   :=(eu+'verem ');

       PI_eu     :=(eu+'vejo ');
       PI_tu     :=(eu+'ves ');
       PI_ele    :=(eu+'ve ');
       PI_ela    :=(eu+'ve ');
       PI_voce   :=(eu+'ve ');
       PI_nos    :=(eu+'vemos ');
       PI_vos    :=(eu+'veis ');
       PI_voces  :=(eu+'veem ');
       PI_eles   :=(eu+'veem ');
       PI_elas   :=(eu+'veem ');

       PP_eu     :=(eu+'vi ');
       PP_tu     :=(eu+'viste ');
       PP_ele    :=(eu+'vi ');
       PP_ela    :=(eu+'vi ');
       PP_voce   :=(eu+'vi ');         //EI
       PP_nos    :=(eu+'vimos ');
       PP_vos    :=(eu+'vistes ');
       PP_voces  :=(eu+'viram ');
       PP_eles   :=(eu+'viram ');
       PP_elas   :=(eu+'viram ');

       II_eu     :=(eu+'via ');
       II_tu     :=(eu+'vias ');
       II_ele    :=(eu+'via ');
       II_ela    :=(eu+'via ');
       II_voce   :=(eu+'via ');
       II_nos    :=(eu+'viamos ');
       II_vos    :=(eu+'vieis ');
       II_voces  :=(eu+'viam ');
       II_eles   :=(eu+'viam ');
       II_elas   :=(eu+'viam ');

       MI_eu     :=(eu+'vira ');
       MI_tu     :=(eu+'viras ');
       MI_ele    :=(eu+'vira ');
       MI_ela    :=(eu+'vira ');
       MI_voce   :=(eu+'vira ');
       MI_nos    :=(eu+'viramos ');
       MI_vos    :=(eu+'vireis ');
       MI_voces  :=(eu+'viram ');
       MI_eles   :=(eu+'viram ');
       MI_elas   :=(eu+'viram ');

       TI_eu     :=(eu+'veria ');
       TI_tu     :=(eu+'verias ');
       TI_ele    :=(eu+'veria ');
       TI_ela    :=(eu+'veria ');
       TI_voce   :=(eu+'veria ');
       TI_nos    :=(eu+'veriamos ');
       TI_vos    :=(eu+'verieis ');
       TI_voces  :=(eu+'veriam ');
       TI_eles   :=(eu+'veriam ');
       TI_elas   :=(eu+'veriam ');

       FI_eu     :=(eu+'verei ');
       FI_tu     :=(eu+'veras ');
       FI_ele    :=(eu+'vera ');
       FI_ela    :=(eu+'vera ');
       FI_voce   :=(eu+'vera ');
       FI_nos    :=(eu+'veremos ');
       FI_vos    :=(eu+'vereis ');
       FI_voces  :=(eu+'verão ');
       FI_eles   :=(eu+'verão ');
       FI_elas   :=(eu+'verão ');

       PS_eu     :=(eu+'vira ');
       PS_tu     :=(eu+'viras ');
       PS_ele    :=(eu+'vira ');
       PS_ela    :=(eu+'vira ');
       PS_voce   :=(eu+'vira ');
       PS_nos    :=(eu+'viramos ');
       PS_vos    :=(eu+'virais ');
       PS_voces  :=(eu+'viram ');
       PS_eles   :=(eu+'viram ');
       PS_elas   :=(eu+'viram ');

       IS_eu     :=(eu+'visse ');
       IS_tu     :=(eu+'visses ');
       IS_ele    :=(eu+'visse ');
       IS_ela    :=(eu+'visse ');
       IS_voce   :=(eu+'visse ');
       IS_nos    :=(eu+'vssemos ');
       IS_vos    :=(eu+'visseis ');
       IS_voces  :=(eu+'vissem ');
       IS_eles   :=(eu+'vissem ');
       IS_elas   :=(eu+'vissem ');

       FS_eu     :=(eu+'vir ');
       FS_tu     :=(eu+'vires ');
       FS_ele    :=(eu+'vir ');
       FS_ela    :=(eu+'vir ');
       FS_voce   :=(eu+'vir ');
       FS_nos    :=(eu+'vimos ');
       FS_vos    :=(eu+'vides ');
       FS_voces  :=(eu+'virem ');
       FS_eles   :=(eu+'virem ');
       FS_elas   :=(eu+'virem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'veja ');
       IA_ele    :=(eu+'veja ');
       IA_ela    :=(eu+'veja ');
       IA_voce   :=(eu+'veja ');
       IA_nos    :=(eu+'vejamos ');
       IA_vos    :=(eu+'vejei ');
       IA_voces  :=(eu+'vejam ');
       IA_eles   :=(eu+'vejam ');
       IA_elas   :=(eu+'vejam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'vejas ');
       IN_ele    :=(eu+'veja ');
       IN_ela    :=(eu+'veja ');
       IN_voce   :=(eu+'veja ');
       IN_nos    :=(eu+'vejamos ');
       IN_vos    :=(eu+'vejei ');
       IN_voces  :=(eu+'vejam ');
       IN_eles   :=(eu+'vejam ');
       IN_elas   :=(eu+'vejam ');

     end;// ver meio
     if (pos('haver ',eu) = 1)and  (pos('haver ',eu) < 20) then
     begin//haver inicio
      eu:='';

       GERm      :=(eu+'havido ');
       GERf      :=(eu+'havida ');
       GERAm      :=(eu+'havisto ');
       GERAf      :=(eu+'havista ');
       PART      :=(eu+'havendo ');
       AGENTE1   :=(eu+'havente ');
       AGENTE2   :=(eu+'havedor ');
       AGENTE3   :=(eu+'havedora ');
       ACAO1     :=(eu+'havimento ');
       ACAO2     :=(eu+'haveção ');
       ACAO3     :=(eu+'havimenta ');
       RESU1     :=(eu+'havisso ');
       RESU2     :=(eu+'havissa ');

       IP_eu     :=(eu+'haver ');
       IP_tu     :=(eu+'haveres ');
       IP_ele    :=(eu+'haver ');
       IP_ela    :=(eu+'haver ');
       IP_voce   :=(eu+'haver ');
       IP_nos    :=(eu+'havermos ');
       IP_vos    :=(eu+'haverdes ');
       IP_voces  :=(eu+'haverem ');
       IP_eles   :=(eu+'haverem ');
       IP_elas   :=(eu+'haverem ');

       PI_eu     :=(eu+'hei ');
       PI_tu     :=(eu+'has ');
       PI_ele    :=(eu+'ha ');
       PI_ela    :=(eu+'ha ');
       PI_voce   :=(eu+'ha ');
       PI_nos    :=(eu+'havemos ');
       PI_vos    :=(eu+'haveis ');
       PI_voces  :=(eu+'hão ');
       PI_eles   :=(eu+'hão ');
       PI_elas   :=(eu+'hão ');

       PP_eu     :=(eu+'houve ');
       PP_tu     :=(eu+'houveste ');
       PP_ele    :=(eu+'houve ');
       PP_ela    :=(eu+'houve ');
       PP_voce   :=(eu+'houve ');         //EI
       PP_nos    :=(eu+'houvemos ');
       PP_vos    :=(eu+'houvestes ');
       PP_voces  :=(eu+'houveram ');
       PP_eles   :=(eu+'houveram ');
       PP_elas   :=(eu+'houveram ');

       II_eu     :=(eu+'havia ');
       II_tu     :=(eu+'havias ');
       II_ele    :=(eu+'havia ');
       II_ela    :=(eu+'havia ');
       II_voce   :=(eu+'havia ');
       II_nos    :=(eu+'haviamos ');
       II_vos    :=(eu+'havieis ');
       II_voces  :=(eu+'haviam ');
       II_eles   :=(eu+'haviam ');
       II_elas   :=(eu+'haviam ');

       MI_eu     :=(eu+'houvera ');
       MI_tu     :=(eu+'houveras ');
       MI_ele    :=(eu+'houvera ');
       MI_ela    :=(eu+'houvera ');
       MI_voce   :=(eu+'houvera ');
       MI_nos    :=(eu+'houveramos ');
       MI_vos    :=(eu+'houvereis ');
       MI_voces  :=(eu+'houveram ');
       MI_eles   :=(eu+'houveram ');
       MI_elas   :=(eu+'houveram ');

       TI_eu     :=(eu+'haveria ');
       TI_tu     :=(eu+'haverias ');
       TI_ele    :=(eu+'haveria ');
       TI_ela    :=(eu+'haveria ');
       TI_voce   :=(eu+'haveria ');
       TI_nos    :=(eu+'haveriamos ');
       TI_vos    :=(eu+'haverieis ');
       TI_voces  :=(eu+'haveriam ');
       TI_eles   :=(eu+'haveriam ');
       TI_elas   :=(eu+'haveriam ');

       FI_eu     :=(eu+'haverei ');
       FI_tu     :=(eu+'haveras ');
       FI_ele    :=(eu+'havera ');
       FI_ela    :=(eu+'havera ');
       FI_voce   :=(eu+'havera ');
       FI_nos    :=(eu+'haveremos ');
       FI_vos    :=(eu+'havereis ');
       FI_voces  :=(eu+'haverão ');
       FI_eles   :=(eu+'haverão ');
       FI_elas   :=(eu+'haverão ');

       PS_eu     :=(eu+'haja ');
       PS_tu     :=(eu+'hajas ');
       PS_ele    :=(eu+'haja ');
       PS_ela    :=(eu+'haja ');
       PS_voce   :=(eu+'haja ');
       PS_nos    :=(eu+'hajamos ');
       PS_vos    :=(eu+'hajais ');
       PS_voces  :=(eu+'hajam ');
       PS_eles   :=(eu+'hajam ');
       PS_elas   :=(eu+'hajam ');

       IS_eu     :=(eu+'houvesse ');
       IS_tu     :=(eu+'houvesses ');
       IS_ele    :=(eu+'houvesse ');
       IS_ela    :=(eu+'houvesse ');
       IS_voce   :=(eu+'houvesse ');
       IS_nos    :=(eu+'houvessemos ');
       IS_vos    :=(eu+'houvesseis ');
       IS_voces  :=(eu+'houvessem ');
       IS_eles   :=(eu+'houvessem ');
       IS_elas   :=(eu+'houvessem ');

       FS_eu     :=(eu+'houver ');
       FS_tu     :=(eu+'houveres ');
       FS_ele    :=(eu+'houver ');
       FS_ela    :=(eu+'houver ');
       FS_voce   :=(eu+'houver ');
       FS_nos    :=(eu+'houvemos ');
       FS_vos    :=(eu+'houvedes ');
       FS_voces  :=(eu+'houverem ');
       FS_eles   :=(eu+'houverem ');
       FS_elas   :=(eu+'houverem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ha ');
       IA_ele    :=(eu+'haja ');
       IA_ela    :=(eu+'haja ');
       IA_voce   :=(eu+'haja ');
       IA_nos    :=(eu+'hajamos ');
       IA_vos    :=(eu+'havei ');
       IA_voces  :=(eu+'hajam ');
       IA_eles   :=(eu+'hajam ');
       IA_elas   :=(eu+'hajam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'hajas ');
       IN_ele    :=(eu+'haja ');
       IN_ela    :=(eu+'haja ');
       IN_voce   :=(eu+'haja ');
       IN_nos    :=(eu+'hajamos ');
       IN_vos    :=(eu+'hajais ');
       IN_voces  :=(eu+'hajam ');
       IN_eles   :=(eu+'hajam ');
       IN_elas   :=(eu+'hajam ');

     end;// haver meio

if (pos('poder ',eu) = 1) then
     begin//poder inicio
      eu:='p';
      //delete(eu,pos('er ',eu)-2,(length(eu)- pos('er ',eu)+3));

       GERm      :=(eu+'odido ');
       GERf      :=(eu+'odida ');
       GERAm      :=(eu+'odido ');
       GERAf      :=(eu+'odida ');
       PART      :=(eu+'odendo ');
       AGENTE1   :=(eu+'odente ');
       AGENTE2   :=(eu+'odedor ');
       AGENTE3   :=(eu+'odedora ');
       ACAO1     :=(eu+'odimento ');
       ACAO2     :=(eu+'odição ');
       ACAO3     :=(eu+'odimenta ');
       RESU1     :=(eu+'odisso ');
       RESU2     :=(eu+'odissa ');

       IP_eu     :=(eu+'oder ');
       IP_tu     :=(eu+'oderes ');
       IP_ele    :=(eu+'oder ');
       IP_ela    :=(eu+'oder ');
       IP_voce   :=(eu+'oder ');
       IP_nos    :=(eu+'odermos ');
       IP_vos    :=(eu+'oderdes ');
       IP_voces  :=(eu+'oderem ');
       IP_eles   :=(eu+'oderem ');
       IP_elas   :=(eu+'oderem ');

       PI_eu     :=(eu+'osso ');
       PI_tu     :=(eu+'odes ');
       PI_ele    :=(eu+'ode ');
       PI_ela    :=(eu+'ode ');
       PI_voce   :=(eu+'ode ');
       PI_nos    :=(eu+'odemos ');
       PI_vos    :=(eu+'odeis ');
       PI_voces  :=(eu+'odem ');
       PI_eles   :=(eu+'odem ');
       PI_elas   :=(eu+'odem ');

       PP_eu     :=(eu+'ude ');
       PP_tu     :=(eu+'udeste ');
       PP_ele    :=(eu+'ode ');
       PP_ela    :=(eu+'ode ');
       PP_voce   :=(eu+'ode ');         //EI
       PP_nos    :=(eu+'udemos ');
       PP_vos    :=(eu+'udestes ');
       PP_voces  :=(eu+'uderam ');
       PP_eles   :=(eu+'uderam ');
       PP_elas   :=(eu+'uderam ');

       II_eu     :=(eu+'odia ');
       II_tu     :=(eu+'odias ');
       II_ele    :=(eu+'odia ');
       II_ela    :=(eu+'odia ');
       II_voce   :=(eu+'odia ');
       II_nos    :=(eu+'odiamos ');
       II_vos    :=(eu+'odieis ');
       II_voces  :=(eu+'odiam ');
       II_eles   :=(eu+'odiam ');
       II_elas   :=(eu+'odiam ');

       MI_eu     :=(eu+'udera ');
       MI_tu     :=(eu+'uderas ');
       MI_ele    :=(eu+'udera ');
       MI_ela    :=(eu+'udera ');
       MI_voce   :=(eu+'udera ');
       MI_nos    :=(eu+'uderamos ');
       MI_vos    :=(eu+'udereis ');
       MI_voces  :=(eu+'uderam ');
       MI_eles   :=(eu+'uderam ');
       MI_elas   :=(eu+'uderam ');

       TI_eu     :=(eu+'oderia ');
       TI_tu     :=(eu+'oderias ');
       TI_ele    :=(eu+'oderia ');
       TI_ela    :=(eu+'oderia ');
       TI_voce   :=(eu+'oderia ');
       TI_nos    :=(eu+'oderiamos ');
       TI_vos    :=(eu+'oderieis ');
       TI_voces  :=(eu+'oderiam ');
       TI_eles   :=(eu+'oderiam ');
       TI_elas   :=(eu+'oderiam ');

       FI_eu     :=(eu+'oderei ');
       FI_tu     :=(eu+'oderas ');
       FI_ele    :=(eu+'odera ');
       FI_ela    :=(eu+'odera ');
       FI_voce   :=(eu+'odera ');
       FI_nos    :=(eu+'oderemos ');
       FI_vos    :=(eu+'odereis ');
       FI_voces  :=(eu+'oderão ');
       FI_eles   :=(eu+'oderão ');
       FI_elas   :=(eu+'oderão ');

       PS_eu     :=(eu+'ossa ');
       PS_tu     :=(eu+'ossas ');
       PS_ele    :=(eu+'ossa ');
       PS_ela    :=(eu+'ossa ');
       PS_voce   :=(eu+'ossa ');
       PS_nos    :=(eu+'ossamos ');
       PS_vos    :=(eu+'ossais ');
       PS_voces  :=(eu+'ossam ');
       PS_eles   :=(eu+'ossam ');
       PS_elas   :=(eu+'ossam ');

       IS_eu     :=(eu+'udesse ');
       IS_tu     :=(eu+'udesses ');
       IS_ele    :=(eu+'udesse ');
       IS_ela    :=(eu+'udesse ');
       IS_voce   :=(eu+'udesse ');
       IS_nos    :=(eu+'udessemos ');
       IS_vos    :=(eu+'udesseis ');
       IS_voces  :=(eu+'udessem ');
       IS_eles   :=(eu+'udessem ');
       IS_elas   :=(eu+'udessem ');

       FS_eu     :=(eu+'uder ');
       FS_tu     :=(eu+'uderes ');
       FS_ele    :=(eu+'uder ');
       FS_ela    :=(eu+'uder ');
       FS_voce   :=(eu+'uder ');
       FS_nos    :=(eu+'udermos ');
       FS_vos    :=(eu+'uderdes ');
       FS_voces  :=(eu+'uderem ');
       FS_eles   :=(eu+'uderem ');
       FS_elas   :=(eu+'uderem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ode ');
       IA_ele    :=(eu+'ode ');
       IA_ela    :=(eu+'ode ');
       IA_voce   :=(eu+'ode ');
       IA_nos    :=(eu+'odemos ');
       IA_vos    :=(eu+'odei ');
       IA_voces  :=(eu+'odem ');
       IA_eles   :=(eu+'odem ');
       IA_elas   :=(eu+'odem ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'odes ');
       IN_ele    :=(eu+'ode ');
       IN_ela    :=(eu+'ode ');
       IN_voce   :=(eu+'ode ');
       IN_nos    :=(eu+'odemos ');
       IN_vos    :=(eu+'odei ');
       IN_voces  :=(eu+'odem ');
       IN_eles   :=(eu+'odem ');
       IN_elas   :=(eu+'odem ');

     end;// poder fim


    if (pos('erer ',eu) > 1)and  (pos('erer ',eu) < 20) then
     begin//erer inicio
      //termi com erer  // eu tu ele
      //memo1.lines.add ('erer');
      delete(eu,pos('er ',eu)-2,(length(eu)- pos('er ',eu)+3));

       GERm      :=(eu+'erido ');
       GERf      :=(eu+'erida ');
       GERAm      :=(eu+'erido ');
       GERAf      :=(eu+'erida ');
       PART      :=(eu+'erendo ');
       AGENTE1   :=(eu+'erente ');
       AGENTE2   :=(eu+'eredor ');
       AGENTE3   :=(eu+'eredora ');
       ACAO1     :=(eu+'erimento ');
       ACAO2     :=(eu+'erição ');
       ACAO3     :=(eu+'erimenta ');
       RESU1     :=(eu+'erisso ');
       RESU2     :=(eu+'erissa ');

       IP_eu     :=(eu+'erer ');
       IP_tu     :=(eu+'ereres ');
       IP_ele    :=(eu+'erer ');
       IP_ela    :=(eu+'erer ');
       IP_voce   :=(eu+'erer ');
       IP_nos    :=(eu+'erermos ');
       IP_vos    :=(eu+'ererdes ');
       IP_voces  :=(eu+'ererem ');
       IP_eles   :=(eu+'ererem ');
       IP_elas   :=(eu+'ererem ');

       PI_eu     :=(eu+'ero ');
       PI_tu     :=(eu+'eres ');
       PI_ele    :=(eu+'er ');
       PI_ela    :=(eu+'er ');
       PI_voce   :=(eu+'er ');
       PI_nos    :=(eu+'eremos ');
       PI_vos    :=(eu+'ereis ');
       PI_voces  :=(eu+'erem ');
       PI_eles   :=(eu+'erem ');
       PI_elas   :=(eu+'erem ');

       PP_eu     :=(eu+'is ');
       PP_tu     :=(eu+'iseste ');
       PP_ele    :=(eu+'is ');
       PP_ela    :=(eu+'is ');
       PP_voce   :=(eu+'is ');         //EI
       PP_nos    :=(eu+'isemos ');
       PP_vos    :=(eu+'isestes ');
       PP_voces  :=(eu+'iseram ');
       PP_eles   :=(eu+'iseram ');
       PP_elas   :=(eu+'iseram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'isera ');
       MI_tu     :=(eu+'iseras ');
       MI_ele    :=(eu+'isera ');
       MI_ela    :=(eu+'isera ');
       MI_voce   :=(eu+'isera ');
       MI_nos    :=(eu+'iseramos ');
       MI_vos    :=(eu+'isereis ');
       MI_voces  :=(eu+'iseram ');
       MI_eles   :=(eu+'iseram ');
       MI_elas   :=(eu+'iseram ');

       TI_eu     :=(eu+'ereria ');
       TI_tu     :=(eu+'ererias ');
       TI_ele    :=(eu+'ereria ');
       TI_ela    :=(eu+'ereria ');
       TI_voce   :=(eu+'ereria ');
       TI_nos    :=(eu+'ereriamos ');
       TI_vos    :=(eu+'ererieis ');
       TI_voces  :=(eu+'ereriam ');
       TI_eles   :=(eu+'ereriam ');
       TI_elas   :=(eu+'ereriam ');

       FI_eu     :=(eu+'ererei ');
       FI_tu     :=(eu+'ereras ');
       FI_ele    :=(eu+'erera ');
       FI_ela    :=(eu+'erera ');
       FI_voce   :=(eu+'era ');
       FI_nos    :=(eu+'ereremos ');
       FI_vos    :=(eu+'erereis ');
       FI_voces  :=(eu+'ererão ');
       FI_eles   :=(eu+'ererão ');
       FI_elas   :=(eu+'ererão ');

       PS_eu     :=(eu+'eira ');
       PS_tu     :=(eu+'eiras ');
       PS_ele    :=(eu+'eira ');
       PS_ela    :=(eu+'eira ');
       PS_voce   :=(eu+'eira ');
       PS_nos    :=(eu+'eiramos ');
       PS_vos    :=(eu+'eirais ');
       PS_voces  :=(eu+'eiram ');
       PS_eles   :=(eu+'eiram ');
       PS_elas   :=(eu+'eiram ');

       IS_eu     :=(eu+'isesse ');
       IS_tu     :=(eu+'isesses ');
       IS_ele    :=(eu+'isesse ');
       IS_ela    :=(eu+'isesse ');
       IS_voce   :=(eu+'isesse ');
       IS_nos    :=(eu+'siessemos ');
       IS_vos    :=(eu+'isesseis ');
       IS_voces  :=(eu+'isessem ');
       IS_eles   :=(eu+'isessem ');
       IS_elas   :=(eu+'isessem ');

       FS_eu     :=(eu+'iser ');
       FS_tu     :=(eu+'iseres ');
       FS_ele    :=(eu+'iser ');
       FS_ela    :=(eu+'iser ');
       FS_voce   :=(eu+'iser ');
       FS_nos    :=(eu+'isermos ');
       FS_vos    :=(eu+'iserdes ');
       FS_voces  :=(eu+'iserem ');
       FS_eles   :=(eu+'iserem ');
       FS_elas   :=(eu+'iserem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'er ');
       IA_ele    :=(eu+'eira ');
       IA_ela    :=(eu+'eira ');
       IA_voce   :=(eu+'eira ');
       IA_nos    :=(eu+'eiramos ');
       IA_vos    :=(eu+'erei ');
       IA_voces  :=(eu+'eiram ');
       IA_eles   :=(eu+'eiram ');
       IA_elas   :=(eu+'eiram ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'eiras ');
       IN_ele    :=(eu+'eira ');
       IN_ela    :=(eu+'eira ');
       IN_voce   :=(eu+'eira ');
       IN_nos    :=(eu+'eiramos ');
       IN_vos    :=(eu+'erei ');
       IN_voces  :=(eu+'eiram ');
       IN_eles   :=(eu+'eiram ');
       IN_elas   :=(eu+'eiram ');

     end// erer meio
     else // faz os er normais
     begin //erer continu   //      er regular fica no else do erer
        //#####

     //vai testar se tinha um dos de cima  se tinha nao vai conjuga mais nada
                              // só conjuga se der falso





    if not( (pos('izer ',eu) > 1) or (pos('fazer ',eu) > 0)or (pos('ler ',eu) > 0)
     or (pos('crer ',eu) > 1) or (pos('ser ',eu) > 0)or
     (pos('ver ',eu) = 1)or(pos('poder ',eu) = 1)or (pos('erer ',eu)> 1)) then
      // se for algun deses n faz nada
     begin// er normal ini

                  // ####################
             //verbos regulares terminados em er

      if  (pos('er ',eu) > 1) then // se ja foi conjugado n vai te er
      begin // sobro er inicio 'tem er de fe mesmo'
      delete(eu,pos('er ',eu),(length(eu)- pos('er ',eu)+1));
     //memo1.lines.add ('er regulares');
     if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('er ',eu),(length(eu)- pos('er ',eu)+1));

       GERm      :=(eu+'ido ');
       GERf      :=(eu+'ida ');
       GERAm      :=(eu+'ido ');
       GERAf      :=(eu+'ida ');
       PART      :=(eu+'endo ');
       AGENTE1   :=(eu+'ente ');
       AGENTE2   :=(eu+'edor ');
       AGENTE3   :=(eu+'edora ');
       ACAO1     :=(eu+'imento ');
       ACAO2     :=(eu+'ição ');
       ACAO3     :=(eu+'imenta ');
       RESU1     :=(eu+'isso ');
       RESU2     :=(eu+'issa ');

       IP_eu     :=(eu+'er ');
       IP_tu     :=(eu+'eres ');
       IP_ele    :=(eu+'er ');
       IP_ela    :=(eu+'er ');
       IP_voce   :=(eu+'er ');
       IP_nos    :=(eu+'ermos ');
       IP_vos    :=(eu+'erdes ');
       IP_voces  :=(eu+'erem ');
       IP_eles   :=(eu+'erem ');
       IP_elas   :=(eu+'erem ');

       PI_eu     :=(eu+'o ');
       PI_tu     :=(eu+'es ');
       PI_ele    :=(eu+'e ');
       PI_ela    :=(eu+'e ');
       PI_voce   :=(eu+'e ');
       PI_nos    :=(eu+'emos ');
       PI_vos    :=(eu+'eis ');
       PI_voces  :=(eu+'em ');
       PI_eles   :=(eu+'em ');
       PI_elas   :=(eu+'em ');

       PP_eu     :=(eu+'i ');
       PP_tu     :=(eu+'este ');
       PP_ele    :=(eu+'eu ');
       PP_ela    :=(eu+'eu ');
       PP_voce   :=(eu+'eu ');         //EI
       PP_nos    :=(eu+'emos ');
       PP_vos    :=(eu+'estes ');
       PP_voces  :=(eu+'eram ');
       PP_eles   :=(eu+'eram ');
       PP_elas   :=(eu+'eram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'era ');
       MI_tu     :=(eu+'eras ');
       MI_ele    :=(eu+'era ');
       MI_ela    :=(eu+'era ');
       MI_voce   :=(eu+'era ');
       MI_nos    :=(eu+'eramos ');
       MI_vos    :=(eu+'ereis ');
       MI_voces  :=(eu+'eram ');
       MI_eles   :=(eu+'eram ');
       MI_elas   :=(eu+'eram ');

       TI_eu     :=(eu+'eria ');
       TI_tu     :=(eu+'erias ');
       TI_ele    :=(eu+'eria ');
       TI_ela    :=(eu+'eria ');
       TI_voce   :=(eu+'eria ');
       TI_nos    :=(eu+'eriamos ');
       TI_vos    :=(eu+'erieis ');
       TI_voces  :=(eu+'eriam ');
       TI_eles   :=(eu+'eriam ');
       TI_elas   :=(eu+'eriam ');

       FI_eu     :=(eu+'erei ');
       FI_tu     :=(eu+'eras ');
       FI_ele    :=(eu+'era ');
       FI_ela    :=(eu+'era ');
       FI_voce   :=(eu+'era ');
       FI_nos    :=(eu+'eremos ');
       FI_vos    :=(eu+'ereis ');
       FI_voces  :=(eu+'erão ');
       FI_eles   :=(eu+'erão ');
       FI_elas   :=(eu+'erão ');

       PS_eu     :=(eu+'a ');
       PS_tu     :=(eu+'as ');
       PS_ele    :=(eu+'a ');
       PS_ela    :=(eu+'a ');
       PS_voce   :=(eu+'a ');
       PS_nos    :=(eu+'amos ');
       PS_vos    :=(eu+'ais ');
       PS_voces  :=(eu+'am ');
       PS_eles   :=(eu+'am ');
       PS_elas   :=(eu+'am ');

       IS_eu     :=(eu+'esse ');
       IS_tu     :=(eu+'esses ');
       IS_ele    :=(eu+'esse ');
       IS_ela    :=(eu+'esse ');
       IS_voce   :=(eu+'esse ');
       IS_nos    :=(eu+'essemos ');
       IS_vos    :=(eu+'esseis ');
       IS_voces  :=(eu+'essem ');
       IS_eles   :=(eu+'essem ');
       IS_elas   :=(eu+'essem ');

       FS_eu     :=(eu+'er ');
       FS_tu     :=(eu+'eres ');
       FS_ele    :=(eu+'er ');
       FS_ela    :=(eu+'er ');
       FS_voce   :=(eu+'er ');
       FS_nos    :=(eu+'ermos ');
       FS_vos    :=(eu+'erdes ');
       FS_voces  :=(eu+'erem ');
       FS_eles   :=(eu+'erem ');
       FS_elas   :=(eu+'erem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'e ');
       IA_ele    :=(eu+'a ');
       IA_ela    :=(eu+'a ');
       IA_voce   :=(eu+'a ');
       IA_nos    :=(eu+'amos ');
       IA_vos    :=(eu+'ei ');
       IA_voces  :=(eu+'am ');
       IA_eles   :=(eu+'am ');
       IA_elas   :=(eu+'am ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'as ');
       IN_ele    :=(eu+'a ');
       IN_ela    :=(eu+'a ');
       IN_voce   :=(eu+'a ');
       IN_nos    :=(eu+'amos ');
       IN_vos    :=(eu+'ais ');
       IN_voces  :=(eu+'am ');
       IN_eles   :=(eu+'am ');
       IN_elas   :=(eu+'am ');

      end;//sobro er fim
     end;// er normal fim
     end;//erer fim    // er regular fica no else do erer  que é o ultimo laço dentro de er
    end;// er fim


                  //#######################
                     //terminados em ir

   if (pos('ir ',eu) > 0)and  (pos('ir ',eu) < 20) then
    begin//ir inicio

    if (pos('ertir ',eu) > 1)and  (pos('ertir ',eu) < 20) then
     begin//ertir inicio
      // term c ertir // eu tu ele
      //memo1.lines.add ('ertir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'ertido ');
       GERf      :=(eu+'ertida ');
       GERAm      :=(eu+'erso ');
       GERAf      :=(eu+'erso ');
       PART      :=(eu+'ertindo ');
       AGENTE1   :=(eu+'ertinte ');
       AGENTE2   :=(eu+'ertidor ');
       AGENTE3   :=(eu+'ertidora ');
       ACAO1     :=(eu+'ertimento ');
       ACAO2     :=(eu+'ertição ');
       ACAO3     :=(eu+'ertimenta ');
       RESU1     :=(eu+'ertisso ');
       RESU2     :=(eu+'ertissa ');

       IP_eu     :=(eu+'ertir ');
       IP_tu     :=(eu+'ertires ');
       IP_ele    :=(eu+'ertir ');
       IP_ela    :=(eu+'ertir ');
       IP_voce   :=(eu+'ertir ');
       IP_nos    :=(eu+'ertirmos ');
       IP_vos    :=(eu+'ertirdes ');
       IP_voces  :=(eu+'ertirem ');
       IP_eles   :=(eu+'ertirem ');
       IP_elas   :=(eu+'ertirem ');

       PI_eu     :=(eu+'irto ');
       PI_tu     :=(eu+'ertes ');
       PI_ele    :=(eu+'erte ');
       PI_ela    :=(eu+'erte ');
       PI_voce   :=(eu+'erte ');
       PI_nos    :=(eu+'ertimos ');
       PI_vos    :=(eu+'ertis ');
       PI_voces  :=(eu+'ertem ');
       PI_eles   :=(eu+'ertem ');
       PI_elas   :=(eu+'ertem ');

       PP_eu     :=(eu+'erti ');
       PP_tu     :=(eu+'ertiste ');
       PP_ele    :=(eu+'ertiu ');
       PP_ela    :=(eu+'ertiu ');
       PP_voce   :=(eu+'ertiu ');         //EI
       PP_nos    :=(eu+'ertimos ');
       PP_vos    :=(eu+'ertistes ');
       PP_voces  :=(eu+'ertiram ');
       PP_eles   :=(eu+'ertiram ');
       PP_elas   :=(eu+'ertiram ');

       II_eu     :=(eu+'ertia ');
       II_tu     :=(eu+'ertias ');
       II_ele    :=(eu+'ertia ');
       II_ela    :=(eu+'ertia ');
       II_voce   :=(eu+'ertia ');
       II_nos    :=(eu+'ertiamos ');
       II_vos    :=(eu+'ertieis ');
       II_voces  :=(eu+'ertiam ');
       II_eles   :=(eu+'ertiam ');
       II_elas   :=(eu+'ertiam ');

       MI_eu     :=(eu+'ertira ');
       MI_tu     :=(eu+'ertiras ');
       MI_ele    :=(eu+'ertira ');
       MI_ela    :=(eu+'ertira ');
       MI_voce   :=(eu+'ertira ');
       MI_nos    :=(eu+'ertiramos ');
       MI_vos    :=(eu+'ertireis ');
       MI_voces  :=(eu+'ertiram ');
       MI_eles   :=(eu+'ertiram ');
       MI_elas   :=(eu+'ertiram ');

       TI_eu     :=(eu+'ertiria ');
       TI_tu     :=(eu+'ertirias ');
       TI_ele    :=(eu+'ertiria ');
       TI_ela    :=(eu+'ertiria ');
       TI_voce   :=(eu+'ertiria ');
       TI_nos    :=(eu+'ertiriamos ');
       TI_vos    :=(eu+'ertirieis ');
       TI_voces  :=(eu+'ertiriam ');
       TI_eles   :=(eu+'ertiriam ');
       TI_elas   :=(eu+'ertiriam ');

       FI_eu     :=(eu+'ertirei ');
       FI_tu     :=(eu+'ertiras ');
       FI_ele    :=(eu+'ertira ');
       FI_ela    :=(eu+'ertira ');
       FI_voce   :=(eu+'ertira ');
       FI_nos    :=(eu+'ertiremos ');
       FI_vos    :=(eu+'ertireis ');
       FI_voces  :=(eu+'ertirão ');
       FI_eles   :=(eu+'ertirão ');
       FI_elas   :=(eu+'ertirão ');

       PS_eu     :=(eu+'irta ');
       PS_tu     :=(eu+'irtas ');
       PS_ele    :=(eu+'irta ');
       PS_ela    :=(eu+'irta ');
       PS_voce   :=(eu+'irta ');
       PS_nos    :=(eu+'irtamos ');
       PS_vos    :=(eu+'irtais ');
       PS_voces  :=(eu+'irtam ');
       PS_eles   :=(eu+'irtam ');
       PS_elas   :=(eu+'irtam ');

       IS_eu     :=(eu+'ertisse ');
       IS_tu     :=(eu+'ertisses ');
       IS_ele    :=(eu+'ertisse ');
       IS_ela    :=(eu+'ertisse ');
       IS_voce   :=(eu+'ertisse ');
       IS_nos    :=(eu+'ertissemos ');
       IS_vos    :=(eu+'ertisseis ');
       IS_voces  :=(eu+'ertissem ');
       IS_eles   :=(eu+'ertissem ');
       IS_elas   :=(eu+'ertissem ');

       FS_eu     :=(eu+'ertir ');
       FS_tu     :=(eu+'ertires ');
       FS_ele    :=(eu+'ertir ');
       FS_ela    :=(eu+'ertir ');
       FS_voce   :=(eu+'ertir ');
       FS_nos    :=(eu+'ertirmos ');
       FS_vos    :=(eu+'ertirdes ');
       FS_voces  :=(eu+'ertirem ');
       FS_eles   :=(eu+'ertirem ');
       FS_elas   :=(eu+'ertirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'erte ');
       IA_ele    :=(eu+'irta ');
       IA_ela    :=(eu+'irta ');
       IA_voce   :=(eu+'irta ');
       IA_nos    :=(eu+'irtamos ');
       IA_vos    :=(eu+'erti ');
       IA_voces  :=(eu+'irtam ');
       IA_eles   :=(eu+'irtam ');
       IA_elas   :=(eu+'irtam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'irtas ');
       IN_ele    :=(eu+'irta ');
       IN_ela    :=(eu+'irta ');
       IN_voce   :=(eu+'irta ');
       IN_nos    :=(eu+'irtamos ');
       IN_vos    :=(eu+'irtais ');
       IN_voces  :=(eu+'irtam ');
       IN_eles   :=(eu+'irtam ');
       IN_elas   :=(eu+'irtam ');

     end;//ertir fim  // eu tu ele//ertir
    if (pos('elir ',eu) > 1)and  (pos('elir ',eu) < 20) then
     begin//elir inicio
      // term c r // eu tu ele
     // memo1.lines.add ('elir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'elido ');
       GERf      :=(eu+'elida ');
       GERAm      :=(eu+'elido ');
       GERAf      :=(eu+'elida ');
       PART      :=(eu+'elindo ');
       AGENTE1   :=(eu+'elinte ');
       AGENTE2   :=(eu+'elidor ');
       AGENTE3   :=(eu+'elidora ');
       ACAO1     :=(eu+'elimento ');
       ACAO2     :=(eu+'elição ');
       ACAO3     :=(eu+'elimenta ');
       RESU1     :=(eu+'elisso ');
       RESU2     :=(eu+'elissa ');


       IP_eu     :=(eu+'elir ');
       IP_tu     :=(eu+'elires ');
       IP_ele    :=(eu+'elir ');
       IP_ela    :=(eu+'elir ');
       IP_voce   :=(eu+'elir ');
       IP_nos    :=(eu+'elirmos ');
       IP_vos    :=(eu+'elirdes ');
       IP_voces  :=(eu+'elirem ');
       IP_eles   :=(eu+'elirem ');
       IP_elas   :=(eu+'elirem ');

       PI_eu     :=(eu+'ilo ');
       PI_tu     :=(eu+'eles ');
       PI_ele    :=(eu+'ele ');
       PI_ela    :=(eu+'ele ');
       PI_voce   :=(eu+'ele ');
       PI_nos    :=(eu+'elimos ');
       PI_vos    :=(eu+'elis ');
       PI_voces  :=(eu+'elem ');
       PI_eles   :=(eu+'elem ');
       PI_elas   :=(eu+'elem ');

       PP_eu     :=(eu+'eli ');
       PP_tu     :=(eu+'eliste ');
       PP_ele    :=(eu+'eliu ');
       PP_ela    :=(eu+'eliu ');
       PP_voce   :=(eu+'eliu ');         //EI
       PP_nos    :=(eu+'elimos ');
       PP_vos    :=(eu+'elistes ');
       PP_voces  :=(eu+'eliram ');
       PP_eles   :=(eu+'eliram ');
       PP_elas   :=(eu+'eliram ');

       II_eu     :=(eu+'elia ');
       II_tu     :=(eu+'elias ');
       II_ele    :=(eu+'elia ');
       II_ela    :=(eu+'elia ');
       II_voce   :=(eu+'elia ');
       II_nos    :=(eu+'eliamos ');
       II_vos    :=(eu+'elieis ');
       II_voces  :=(eu+'eliam ');
       II_eles   :=(eu+'eliam ');
       II_elas   :=(eu+'eliam ');

       MI_eu     :=(eu+'elira ');
       MI_tu     :=(eu+'eliras ');
       MI_ele    :=(eu+'elira ');
       MI_ela    :=(eu+'elira ');
       MI_voce   :=(eu+'elira ');
       MI_nos    :=(eu+'eliramos ');
       MI_vos    :=(eu+'elireis ');
       MI_voces  :=(eu+'eliram ');
       MI_eles   :=(eu+'eliram ');
       MI_elas   :=(eu+'eliram ');

       TI_eu     :=(eu+'eliria ');
       TI_tu     :=(eu+'elirias ');
       TI_ele    :=(eu+'eliria ');
       TI_ela    :=(eu+'eliria ');
       TI_voce   :=(eu+'eliria ');
       TI_nos    :=(eu+'eliriamos ');
       TI_vos    :=(eu+'elirieis ');
       TI_voces  :=(eu+'eliriam ');
       TI_eles   :=(eu+'eliriam ');
       TI_elas   :=(eu+'eliriam ');

       FI_eu     :=(eu+'elirei ');
       FI_tu     :=(eu+'eliras ');
       FI_ele    :=(eu+'elira ');
       FI_ela    :=(eu+'elira ');
       FI_voce   :=(eu+'elira ');
       FI_nos    :=(eu+'eliremos ');
       FI_vos    :=(eu+'elireis ');
       FI_voces  :=(eu+'elirão ');
       FI_eles   :=(eu+'elirão ');
       FI_elas   :=(eu+'elirão ');

       PS_eu     :=(eu+'ila ');
       PS_tu     :=(eu+'ilas ');
       PS_ele    :=(eu+'ila ');
       PS_ela    :=(eu+'ila ');
       PS_voce   :=(eu+'ila ');
       PS_nos    :=(eu+'ilamos ');
       PS_vos    :=(eu+'ilais ');
       PS_voces  :=(eu+'ilam ');
       PS_eles   :=(eu+'ilam ');
       PS_elas   :=(eu+'ilam ');

       IS_eu     :=(eu+'elisse ');
       IS_tu     :=(eu+'elisses ');
       IS_ele    :=(eu+'elisse ');
       IS_ela    :=(eu+'elisse ');
       IS_voce   :=(eu+'elisse ');
       IS_nos    :=(eu+'elissemos ');
       IS_vos    :=(eu+'elisseis ');
       IS_voces  :=(eu+'elissem ');
       IS_eles   :=(eu+'elissem ');
       IS_elas   :=(eu+'elissem ');

       FS_eu     :=(eu+'elir ');
       FS_tu     :=(eu+'elires ');
       FS_ele    :=(eu+'elir ');
       FS_ela    :=(eu+'elir ');
       FS_voce   :=(eu+'elir ');
       FS_nos    :=(eu+'elirmos ');
       FS_vos    :=(eu+'elirdes ');
       FS_voces  :=(eu+'elirem ');
       FS_eles   :=(eu+'elirem ');
       FS_elas   :=(eu+'elirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ele ');
       IA_ele    :=(eu+'ila ');
       IA_ela    :=(eu+'ila ');
       IA_voce   :=(eu+'ila ');
       IA_nos    :=(eu+'ilamos ');
       IA_vos    :=(eu+'eli ');
       IA_voces  :=(eu+'ilam ');
       IA_eles   :=(eu+'ilam ');
       IA_elas   :=(eu+'ilam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ilas ');
       IN_ele    :=(eu+'ila ');
       IN_ela    :=(eu+'ila ');
       IN_voce   :=(eu+'ila ');
       IN_nos    :=(eu+'ilamos ');
       IN_vos    :=(eu+'ilais ');
       IN_voces  :=(eu+'ilam ');
       IN_eles   :=(eu+'ilam ');
       IN_elas   :=(eu+'ilam ');

     end;//elir fim  // eu tu ele//elir
    if (pos('entir ',eu) > 1)and  (pos('entir ',eu) < 20) then
     begin//entir inicio
      // term c entir // eu tu ele
      //memo1.lines.add ('entir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'entido ');
       GERf      :=(eu+'entida ');
       GERAm      :=(eu+'entiroso ');
       GERAf      :=(eu+'entirosa ');
       PART      :=(eu+'entindo ');
       AGENTE1   :=(eu+'entinte ');
       AGENTE2   :=(eu+'entidor ');
       AGENTE3   :=(eu+'entidora ');
       ACAO1     :=(eu+'entimento ');
       ACAO2     :=(eu+'entição ');
       ACAO3     :=(eu+'entimenta ');
       RESU1     :=(eu+'entisso ');
       RESU2     :=(eu+'entissa ');


       IP_eu     :=(eu+'entir ');
       IP_tu     :=(eu+'entires ');
       IP_ele    :=(eu+'entir ');
       IP_ela    :=(eu+'entir ');
       IP_voce   :=(eu+'entir ');
       IP_nos    :=(eu+'entirmos ');
       IP_vos    :=(eu+'entirdes ');
       IP_voces  :=(eu+'entirem ');
       IP_eles   :=(eu+'entirem ');
       IP_elas   :=(eu+'entirem ');

       PI_eu     :=(eu+'into ');
       PI_tu     :=(eu+'entes ');
       PI_ele    :=(eu+'ente ');
       PI_ela    :=(eu+'ente ');
       PI_voce   :=(eu+'ente ');
       PI_nos    :=(eu+'entimos ');
       PI_vos    :=(eu+'entis ');
       PI_voces  :=(eu+'entem ');
       PI_eles   :=(eu+'entem ');
       PI_elas   :=(eu+'entem ');

       PP_eu     :=(eu+'enti ');
       PP_tu     :=(eu+'netiste ');
       PP_ele    :=(eu+'entiu ');
       PP_ela    :=(eu+'entiu ');
       PP_voce   :=(eu+'entiu ');         //EI
       PP_nos    :=(eu+'entimos ');
       PP_vos    :=(eu+'entistes ');
       PP_voces  :=(eu+'entiram ');
       PP_eles   :=(eu+'entiram ');
       PP_elas   :=(eu+'entiram ');

       II_eu     :=(eu+'entia ');
       II_tu     :=(eu+'entias ');
       II_ele    :=(eu+'entia ');
       II_ela    :=(eu+'entia ');
       II_voce   :=(eu+'entia ');
       II_nos    :=(eu+'entiamos ');
       II_vos    :=(eu+'entieis ');
       II_voces  :=(eu+'entiam ');
       II_eles   :=(eu+'entiam ');
       II_elas   :=(eu+'entiam ');

       MI_eu     :=(eu+'entira ');
       MI_tu     :=(eu+'entiras ');
       MI_ele    :=(eu+'entira ');
       MI_ela    :=(eu+'entira ');
       MI_voce   :=(eu+'entira ');
       MI_nos    :=(eu+'entiramos ');
       MI_vos    :=(eu+'entireis ');
       MI_voces  :=(eu+'entiram ');
       MI_eles   :=(eu+'entiram ');
       MI_elas   :=(eu+'entiram ');

       TI_eu     :=(eu+'entiria ');
       TI_tu     :=(eu+'entirias ');
       TI_ele    :=(eu+'entiria ');
       TI_ela    :=(eu+'entiria ');
       TI_voce   :=(eu+'entiria ');
       TI_nos    :=(eu+'entiriamos ');
       TI_vos    :=(eu+'entirieis ');
       TI_voces  :=(eu+'entiriam ');
       TI_eles   :=(eu+'entiriam ');
       TI_elas   :=(eu+'entiriam ');

       FI_eu     :=(eu+'entirei ');
       FI_tu     :=(eu+'entiras ');
       FI_ele    :=(eu+'entira ');
       FI_ela    :=(eu+'entira ');
       FI_voce   :=(eu+'entira ');
       FI_nos    :=(eu+'entiremos ');
       FI_vos    :=(eu+'entireis ');
       FI_voces  :=(eu+'entirão ');
       FI_eles   :=(eu+'entirão ');
       FI_elas   :=(eu+'entirão ');

       PS_eu     :=(eu+'inta ');
       PS_tu     :=(eu+'intas ');
       PS_ele    :=(eu+'inta ');
       PS_ela    :=(eu+'inta ');
       PS_voce   :=(eu+'inta ');
       PS_nos    :=(eu+'intamos ');
       PS_vos    :=(eu+'intais ');
       PS_voces  :=(eu+'intam ');
       PS_eles   :=(eu+'intam ');
       PS_elas   :=(eu+'intam ');

       IS_eu     :=(eu+'entisse ');
       IS_tu     :=(eu+'entisses ');
       IS_ele    :=(eu+'entisse ');
       IS_ela    :=(eu+'entisse ');
       IS_voce   :=(eu+'entisse ');
       IS_nos    :=(eu+'entissemos ');
       IS_vos    :=(eu+'entisseis ');
       IS_voces  :=(eu+'entissem ');
       IS_eles   :=(eu+'entissem ');
       IS_elas   :=(eu+'entissem ');

       FS_eu     :=(eu+'entir ');
       FS_tu     :=(eu+'entires ');
       FS_ele    :=(eu+'entir ');
       FS_ela    :=(eu+'entir ');
       FS_voce   :=(eu+'entir ');
       FS_nos    :=(eu+'entirmos ');
       FS_vos    :=(eu+'entirdes ');
       FS_voces  :=(eu+'entirem ');
       FS_eles   :=(eu+'entirem ');
       FS_elas   :=(eu+'entirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ente ');
       IA_ele    :=(eu+'inta ');
       IA_ela    :=(eu+'inta ');
       IA_voce   :=(eu+'inta ');
       IA_nos    :=(eu+'intamos ');
       IA_vos    :=(eu+'enti ');
       IA_voces  :=(eu+'intam ');
       IA_eles   :=(eu+'intam ');
       IA_elas   :=(eu+'intam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'intas ');
       IN_ele    :=(eu+'inta ');
       IN_ela    :=(eu+'inta ');
       IN_voce   :=(eu+'inta ');
       IN_nos    :=(eu+'intamos ');
       IN_vos    :=(eu+'intais ');
       IN_voces  :=(eu+'intam ');
       IN_eles   :=(eu+'intam ');
       IN_elas   :=(eu+'intam ');

     end;//entir fim  // eu tu ele//entir
    if (pos('etir ',eu) > 1)and  (pos('etir ',eu) < 20) then
     begin//etir inicio
      // term c etir // eu tu ele
      //memo1.lines.add ('etir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'etido ');
       GERf      :=(eu+'etida ');
       GERAm      :=(eu+'etido ');
       GERAf      :=(eu+'etida ');
       PART      :=(eu+'etindo ');
       AGENTE1   :=(eu+'etinte ');
       AGENTE2   :=(eu+'etidor ');
       AGENTE3   :=(eu+'etidora ');
       ACAO1     :=(eu+'etimento ');
       ACAO2     :=(eu+'etição ');
       ACAO3     :=(eu+'etimenta ');
       RESU1     :=(eu+'etisso ');
       RESU2     :=(eu+'etissa ');

       IP_eu     :=(eu+'etir ');
       IP_tu     :=(eu+'etires ');
       IP_ele    :=(eu+'etir ');
       IP_ela    :=(eu+'etir ');
       IP_voce   :=(eu+'etir ');
       IP_nos    :=(eu+'etirmos ');
       IP_vos    :=(eu+'etirdes ');
       IP_voces  :=(eu+'etirem ');
       IP_eles   :=(eu+'etirem ');
       IP_elas   :=(eu+'etirem ');

       PI_eu     :=(eu+'ito ');
       PI_tu     :=(eu+'etes ');
       PI_ele    :=(eu+'ete ');
       PI_ela    :=(eu+'ete ');
       PI_voce   :=(eu+'ete ');
       PI_nos    :=(eu+'etimos ');
       PI_vos    :=(eu+'etis ');
       PI_voces  :=(eu+'etem ');
       PI_eles   :=(eu+'etem ');
       PI_elas   :=(eu+'etem ');

       PP_eu     :=(eu+'eti ');
       PP_tu     :=(eu+'etiste ');
       PP_ele    :=(eu+'etiu ');
       PP_ela    :=(eu+'etiu ');
       PP_voce   :=(eu+'etiu ');         //EI
       PP_nos    :=(eu+'etimos ');
       PP_vos    :=(eu+'etistes ');
       PP_voces  :=(eu+'etiram ');
       PP_eles   :=(eu+'etiram ');
       PP_elas   :=(eu+'etiram ');

       II_eu     :=(eu+'etia ');
       II_tu     :=(eu+'etias ');
       II_ele    :=(eu+'etia ');
       II_ela    :=(eu+'etia ');
       II_voce   :=(eu+'etia ');
       II_nos    :=(eu+'etiamos ');
       II_vos    :=(eu+'etieis ');
       II_voces  :=(eu+'etiam ');
       II_eles   :=(eu+'etiam ');
       II_elas   :=(eu+'etiam ');

       MI_eu     :=(eu+'etira ');
       MI_tu     :=(eu+'etiras ');
       MI_ele    :=(eu+'etira ');
       MI_ela    :=(eu+'etira ');
       MI_voce   :=(eu+'etira ');
       MI_nos    :=(eu+'etiramos ');
       MI_vos    :=(eu+'etireis ');
       MI_voces  :=(eu+'etiram ');
       MI_eles   :=(eu+'etiram ');
       MI_elas   :=(eu+'etiram ');

       TI_eu     :=(eu+'etiria ');
       TI_tu     :=(eu+'etirias ');
       TI_ele    :=(eu+'etiria ');
       TI_ela    :=(eu+'etiria ');
       TI_voce   :=(eu+'etiria ');
       TI_nos    :=(eu+'etiriamos ');
       TI_vos    :=(eu+'etirieis ');
       TI_voces  :=(eu+'etiriam ');
       TI_eles   :=(eu+'etiriam ');
       TI_elas   :=(eu+'etiriam ');

       FI_eu     :=(eu+'etirei ');
       FI_tu     :=(eu+'etiras ');
       FI_ele    :=(eu+'etira ');
       FI_ela    :=(eu+'etira ');
       FI_voce   :=(eu+'etira ');
       FI_nos    :=(eu+'etiremos ');
       FI_vos    :=(eu+'etireis ');
       FI_voces  :=(eu+'etirão ');
       FI_eles   :=(eu+'etirão ');
       FI_elas   :=(eu+'etirão ');

       PS_eu     :=(eu+'ita ');
       PS_tu     :=(eu+'itas ');
       PS_ele    :=(eu+'ita ');
       PS_ela    :=(eu+'ita ');
       PS_voce   :=(eu+'ita ');
       PS_nos    :=(eu+'itamos ');
       PS_vos    :=(eu+'itais ');
       PS_voces  :=(eu+'itam ');
       PS_eles   :=(eu+'itam ');
       PS_elas   :=(eu+'itam ');

       IS_eu     :=(eu+'etisse ');
       IS_tu     :=(eu+'etisses ');
       IS_ele    :=(eu+'etisse ');
       IS_ela    :=(eu+'etisse ');
       IS_voce   :=(eu+'etisse ');
       IS_nos    :=(eu+'etissemos ');
       IS_vos    :=(eu+'etisseis ');
       IS_voces  :=(eu+'etissem ');
       IS_eles   :=(eu+'etissem ');
       IS_elas   :=(eu+'etissem ');

       FS_eu     :=(eu+'etir ');
       FS_tu     :=(eu+'etires ');
       FS_ele    :=(eu+'etir ');
       FS_ela    :=(eu+'etir ');
       FS_voce   :=(eu+'etir ');
       FS_nos    :=(eu+'etirmos ');
       FS_vos    :=(eu+'etirdes ');
       FS_voces  :=(eu+'etirem ');
       FS_eles   :=(eu+'etirem ');
       FS_elas   :=(eu+'etirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ete ');
       IA_ele    :=(eu+'ita ');
       IA_ela    :=(eu+'ita ');
       IA_voce   :=(eu+'ita ');
       IA_nos    :=(eu+'itamos ');
       IA_vos    :=(eu+'eti ');
       IA_voces  :=(eu+'itam ');
       IA_eles   :=(eu+'itam ');
       IA_elas   :=(eu+'itam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'itas ');
       IN_ele    :=(eu+'ita ');
       IN_ela    :=(eu+'ita ');
       IN_voce   :=(eu+'ita ');
       IN_nos    :=(eu+'itamos ');
       IN_vos    :=(eu+'itais ');
       IN_voces  :=(eu+'itam ');
       IN_eles   :=(eu+'itam ');
       IN_elas   :=(eu+'itam ');

     end;//etir fim  // eu tu ele//etir

    if (pos('estir ',eu) > 1)and  (pos('estir ',eu) < 20) then
     begin//estir inicio
      // term c estir // eu tu ele
      // memo1.lines.add ('estir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'estido ');
       GERf      :=(eu+'estida ');
       GERAm      :=(eu+'estido ');
       GERAf      :=(eu+'estida ');
       PART      :=(eu+'estindo ');
       AGENTE1   :=(eu+'estinte ');
       AGENTE2   :=(eu+'estidor ');
       AGENTE3   :=(eu+'estidora ');
       ACAO1     :=(eu+'estimento ');
       ACAO2     :=(eu+'estição ');
       ACAO3     :=(eu+'estimenta ');
       RESU1     :=(eu+'estisso ');
       RESU2     :=(eu+'estissa ');

       IP_eu     :=(eu+'estir ');
       IP_tu     :=(eu+'estires ');
       IP_ele    :=(eu+'estir ');
       IP_ela    :=(eu+'estir ');
       IP_voce   :=(eu+'estir ');
       IP_nos    :=(eu+'estirmos ');
       IP_vos    :=(eu+'estirdes ');
       IP_voces  :=(eu+'estirem ');
       IP_eles   :=(eu+'estirem ');
       IP_elas   :=(eu+'estirem ');

       PI_eu     :=(eu+'isto ');
       PI_tu     :=(eu+'estes ');
       PI_ele    :=(eu+'este ');
       PI_ela    :=(eu+'este ');
       PI_voce   :=(eu+'este ');
       PI_nos    :=(eu+'estimos ');
       PI_vos    :=(eu+'estis ');
       PI_voces  :=(eu+'estem ');
       PI_eles   :=(eu+'estem ');
       PI_elas   :=(eu+'estem ');

       PP_eu     :=(eu+'esti ');
       PP_tu     :=(eu+'estiste ');
       PP_ele    :=(eu+'estiu ');
       PP_ela    :=(eu+'estiu ');
       PP_voce   :=(eu+'estiu ');         //EI
       PP_nos    :=(eu+'estimos ');
       PP_vos    :=(eu+'estistes ');
       PP_voces  :=(eu+'estiram ');
       PP_eles   :=(eu+'estiram ');
       PP_elas   :=(eu+'estiram ');

       II_eu     :=(eu+'estia ');
       II_tu     :=(eu+'estias ');
       II_ele    :=(eu+'estia ');
       II_ela    :=(eu+'estia ');
       II_voce   :=(eu+'estia ');
       II_nos    :=(eu+'estiamos ');
       II_vos    :=(eu+'estieis ');
       II_voces  :=(eu+'estiam ');
       II_eles   :=(eu+'estiam ');
       II_elas   :=(eu+'estiam ');

       MI_eu     :=(eu+'estira ');
       MI_tu     :=(eu+'estiras ');
       MI_ele    :=(eu+'estira ');
       MI_ela    :=(eu+'estira ');
       MI_voce   :=(eu+'estira ');
       MI_nos    :=(eu+'estiramos ');
       MI_vos    :=(eu+'estireis ');
       MI_voces  :=(eu+'estiram ');
       MI_eles   :=(eu+'estiram ');
       MI_elas   :=(eu+'estiram ');

       TI_eu     :=(eu+'estiria ');
       TI_tu     :=(eu+'estirias ');
       TI_ele    :=(eu+'estiria ');
       TI_ela    :=(eu+'estiria ');
       TI_voce   :=(eu+'estiria ');
       TI_nos    :=(eu+'estiriamos ');
       TI_vos    :=(eu+'estirieis ');
       TI_voces  :=(eu+'estiriam ');
       TI_eles   :=(eu+'estiriam ');
       TI_elas   :=(eu+'estiriam ');

       FI_eu     :=(eu+'estirei ');
       FI_tu     :=(eu+'estiras ');
       FI_ele    :=(eu+'estira ');
       FI_ela    :=(eu+'estira ');
       FI_voce   :=(eu+'estira ');
       FI_nos    :=(eu+'estiremos ');
       FI_vos    :=(eu+'estireis ');
       FI_voces  :=(eu+'estirão ');
       FI_eles   :=(eu+'estirão ');
       FI_elas   :=(eu+'estirão ');

       PS_eu     :=(eu+'ista ');
       PS_tu     :=(eu+'istas ');
       PS_ele    :=(eu+'ista ');
       PS_ela    :=(eu+'ista ');
       PS_voce   :=(eu+'ista ');
       PS_nos    :=(eu+'istamos ');
       PS_vos    :=(eu+'istais ');
       PS_voces  :=(eu+'istam ');
       PS_eles   :=(eu+'istam ');
       PS_elas   :=(eu+'istam ');

       IS_eu     :=(eu+'estisse ');
       IS_tu     :=(eu+'estisses ');
       IS_ele    :=(eu+'estisse ');
       IS_ela    :=(eu+'estisse ');
       IS_voce   :=(eu+'estisse ');
       IS_nos    :=(eu+'estissemos ');
       IS_vos    :=(eu+'estisseis ');
       IS_voces  :=(eu+'estissem ');
       IS_eles   :=(eu+'estissem ');
       IS_elas   :=(eu+'estissem ');

       FS_eu     :=(eu+'estir ');
       FS_tu     :=(eu+'estires ');
       FS_ele    :=(eu+'estir ');
       FS_ela    :=(eu+'estir ');
       FS_voce   :=(eu+'estir ');
       FS_nos    :=(eu+'estirmos ');
       FS_vos    :=(eu+'estirdes ');
       FS_voces  :=(eu+'estirem ');
       FS_eles   :=(eu+'estirem ');
       FS_elas   :=(eu+'estirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'este ');
       IA_ele    :=(eu+'ista ');
       IA_ela    :=(eu+'ista ');
       IA_voce   :=(eu+'ista ');
       IA_nos    :=(eu+'istamos ');
       IA_vos    :=(eu+'esti ');
       IA_voces  :=(eu+'istam ');
       IA_eles   :=(eu+'istam ');
       IA_elas   :=(eu+'istam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'istas ');
       IN_ele    :=(eu+'ista ');
       IN_ela    :=(eu+'ista ');
       IN_voce   :=(eu+'ista ');
       IN_nos    :=(eu+'istamos ');
       IN_vos    :=(eu+'istais ');
       IN_voces  :=(eu+'istam ');
       IN_eles   :=(eu+'istam ');
       IN_elas   :=(eu+'istam ');

     end;//estir fim  // eu tu ele//estir
    if (pos('erzir ',eu) > 1)and  (pos('erzir ',eu) < 20) then
     begin//erzir inicio
      // term c erzir // eu tu ele
      //memo1.lines.add ('erzir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'erzido ');
       GERf      :=(eu+'erzida ');
       GERAm      :=(eu+'erzido ');
       GERAf      :=(eu+'erzida ');
       PART      :=(eu+'erzindo ');
       AGENTE1   :=(eu+'erzinte ');
       AGENTE2   :=(eu+'erzidor ');
       AGENTE3   :=(eu+'erzidora ');
       ACAO1     :=(eu+'erzimento ');
       ACAO2     :=(eu+'erzição ');
       ACAO3     :=(eu+'erzimenta ');
       RESU1     :=(eu+'erzisso ');
       RESU2     :=(eu+'erzissa ');

       IP_eu     :=(eu+'erzir ');
       IP_tu     :=(eu+'erzires ');
       IP_ele    :=(eu+'erzir ');
       IP_ela    :=(eu+'erzir ');
       IP_voce   :=(eu+'erzir ');
       IP_nos    :=(eu+'erzirmos ');
       IP_vos    :=(eu+'erzirdes ');
       IP_voces  :=(eu+'erzirem ');
       IP_eles   :=(eu+'ertirem ');
       IP_elas   :=(eu+'erzirem ');

       PI_eu     :=(eu+'irzo ');
       PI_tu     :=(eu+'erzes ');
       PI_ele    :=(eu+'erze ');
       PI_ela    :=(eu+'erze ');
       PI_voce   :=(eu+'erze ');
       PI_nos    :=(eu+'erzimos ');
       PI_vos    :=(eu+'erzis ');
       PI_voces  :=(eu+'erzem ');
       PI_eles   :=(eu+'erzem ');
       PI_elas   :=(eu+'erzem ');

       PP_eu     :=(eu+'erzi ');
       PP_tu     :=(eu+'erziste ');
       PP_ele    :=(eu+'erziu ');
       PP_ela    :=(eu+'erziu ');
       PP_voce   :=(eu+'erziu ');         //EI
       PP_nos    :=(eu+'erzimos ');
       PP_vos    :=(eu+'erzistes ');
       PP_voces  :=(eu+'erziram ');
       PP_eles   :=(eu+'erziram ');
       PP_elas   :=(eu+'erziram ');

       II_eu     :=(eu+'erzia ');
       II_tu     :=(eu+'erzias ');
       II_ele    :=(eu+'erzia ');
       II_ela    :=(eu+'erzia ');
       II_voce   :=(eu+'erzia ');
       II_nos    :=(eu+'erziamos ');
       II_vos    :=(eu+'erzieis ');
       II_voces  :=(eu+'erziam ');
       II_eles   :=(eu+'erziam ');
       II_elas   :=(eu+'erziam ');

       MI_eu     :=(eu+'erzira ');
       MI_tu     :=(eu+'erziras ');
       MI_ele    :=(eu+'erzira ');
       MI_ela    :=(eu+'erzira ');
       MI_voce   :=(eu+'erzira ');
       MI_nos    :=(eu+'erziramos ');
       MI_vos    :=(eu+'erzireis ');
       MI_voces  :=(eu+'erziram ');
       MI_eles   :=(eu+'erziram ');
       MI_elas   :=(eu+'erziram ');

       TI_eu     :=(eu+'erziria ');
       TI_tu     :=(eu+'erzirias ');
       TI_ele    :=(eu+'erziria ');
       TI_ela    :=(eu+'erziria ');
       TI_voce   :=(eu+'erziria ');
       TI_nos    :=(eu+'erziriamos ');
       TI_vos    :=(eu+'erzirieis ');
       TI_voces  :=(eu+'erziriam ');
       TI_eles   :=(eu+'erziriam ');
       TI_elas   :=(eu+'erziriam ');

       FI_eu     :=(eu+'erzirei ');
       FI_tu     :=(eu+'erziras ');
       FI_ele    :=(eu+'erzira ');
       FI_ela    :=(eu+'erzira ');
       FI_voce   :=(eu+'erzira ');
       FI_nos    :=(eu+'erziremos ');
       FI_vos    :=(eu+'erzireis ');
       FI_voces  :=(eu+'erzirão ');
       FI_eles   :=(eu+'erzirão ');
       FI_elas   :=(eu+'erzirão ');

       PS_eu     :=(eu+'irza ');
       PS_tu     :=(eu+'irzas ');
       PS_ele    :=(eu+'irza ');
       PS_ela    :=(eu+'irza ');
       PS_voce   :=(eu+'irza ');
       PS_nos    :=(eu+'irzamos ');
       PS_vos    :=(eu+'irzais ');
       PS_voces  :=(eu+'irzam ');
       PS_eles   :=(eu+'irzam ');
       PS_elas   :=(eu+'irzam ');

       IS_eu     :=(eu+'erzisse ');
       IS_tu     :=(eu+'erzisses ');
       IS_ele    :=(eu+'erzisse ');
       IS_ela    :=(eu+'erzisse ');
       IS_voce   :=(eu+'erzisse ');
       IS_nos    :=(eu+'erzissemos ');
       IS_vos    :=(eu+'erzisseis ');
       IS_voces  :=(eu+'erzissem ');
       IS_eles   :=(eu+'erzissem ');
       IS_elas   :=(eu+'erzissem ');

       FS_eu     :=(eu+'erzir ');
       FS_tu     :=(eu+'erzires ');
       FS_ele    :=(eu+'erzir ');
       FS_ela    :=(eu+'erzir ');
       FS_voce   :=(eu+'erzir ');
       FS_nos    :=(eu+'erzirmos ');
       FS_vos    :=(eu+'erzirdes ');
       FS_voces  :=(eu+'erzirem ');
       FS_eles   :=(eu+'erzirem ');
       FS_elas   :=(eu+'erzirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'erze ');
       IA_ele    :=(eu+'irza ');
       IA_ela    :=(eu+'irza ');
       IA_voce   :=(eu+'irza ');
       IA_nos    :=(eu+'irzamos ');
       IA_vos    :=(eu+'erzi ');
       IA_voces  :=(eu+'irzam ');
       IA_eles   :=(eu+'irzam ');
       IA_elas   :=(eu+'irzam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'irzas ');
       IN_ele    :=(eu+'irza ');
       IN_ela    :=(eu+'irza ');
       IN_voce   :=(eu+'irza ');
       IN_nos    :=(eu+'irzamos ');
       IN_vos    :=(eu+'irzais ');
       IN_voces  :=(eu+'irzam ');
       IN_eles   :=(eu+'irzam ');
       IN_elas   :=(eu+'irzam ');

     end;//erzir fim  // eu tu ele//erzir
    if (pos('eguir ',eu) > 1)and  (pos('eguir ',eu) < 20) then
     begin//eguir inicio
      // term c erguir // eu tu ele
       //memo1.lines.add ('eguir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'eguido');
       GERf      :=(eu+'eguida ');
       PART      :=(eu+'eguindo ');
       GERAm      :=(eu+'eguido ');
       GERAf      :=(eu+'eguida ');
       AGENTE1   :=(eu+'eguinte ');
       AGENTE2   :=(eu+'eguidor ');
       AGENTE3   :=(eu+'eguidora ');
       ACAO1     :=(eu+'eguimento ');
       ACAO2     :=(eu+'eguição ');
       ACAO3     :=(eu+'eguimenta ');
       RESU1     :=(eu+'eguisso ');
       RESU2     :=(eu+'eguissa ');

       IP_eu     :=(eu+'eguir ');
       IP_tu     :=(eu+'eguires ');
       IP_ele    :=(eu+'eguir ');
       IP_ela    :=(eu+'eguir ');
       IP_voce   :=(eu+'eguir ');
       IP_nos    :=(eu+'eguirmos ');
       IP_vos    :=(eu+'eguirdes ');
       IP_voces  :=(eu+'eguirem ');
       IP_eles   :=(eu+'eguirem ');
       IP_elas   :=(eu+'eguirem ');

       PI_eu     :=(eu+'igo ');
       PI_tu     :=(eu+'egues ');
       PI_ele    :=(eu+'egue ');
       PI_ela    :=(eu+'egue ');
       PI_voce   :=(eu+'egue ');
       PI_nos    :=(eu+'eguimos ');
       PI_vos    :=(eu+'eguis ');
       PI_voces  :=(eu+'eguem ');
       PI_eles   :=(eu+'eguem ');
       PI_elas   :=(eu+'eguem ');

       PP_eu     :=(eu+'egui ');
       PP_tu     :=(eu+'eguiste ');
       PP_ele    :=(eu+'eguiu ');
       PP_ela    :=(eu+'eguiu ');
       PP_voce   :=(eu+'eguiu ');         //EI
       PP_nos    :=(eu+'eguimos ');
       PP_vos    :=(eu+'eguistes ');
       PP_voces  :=(eu+'eguiram ');
       PP_eles   :=(eu+'eguiram ');
       PP_elas   :=(eu+'eguiram ');

       II_eu     :=(eu+'eguia ');
       II_tu     :=(eu+'eguias ');
       II_ele    :=(eu+'eguia ');
       II_ela    :=(eu+'eguia ');
       II_voce   :=(eu+'eguia ');
       II_nos    :=(eu+'eguiamos ');
       II_vos    :=(eu+'eguieis ');
       II_voces  :=(eu+'eguiam ');
       II_eles   :=(eu+'eguiam ');
       II_elas   :=(eu+'eguiam ');

       MI_eu     :=(eu+'eguira ');
       MI_tu     :=(eu+'eguiras ');
       MI_ele    :=(eu+'eguira ');
       MI_ela    :=(eu+'eguira ');
       MI_voce   :=(eu+'eguira ');
       MI_nos    :=(eu+'eguiramos ');
       MI_vos    :=(eu+'eguireis ');
       MI_voces  :=(eu+'eguiram ');
       MI_eles   :=(eu+'eguiram ');
       MI_elas   :=(eu+'eguiram ');

       TI_eu     :=(eu+'eguiria ');
       TI_tu     :=(eu+'eguirias ');
       TI_ele    :=(eu+'eguiria ');
       TI_ela    :=(eu+'eguiria ');
       TI_voce   :=(eu+'eguiria ');
       TI_nos    :=(eu+'eguiriamos ');
       TI_vos    :=(eu+'eguirieis ');
       TI_voces  :=(eu+'eguiriam ');
       TI_eles   :=(eu+'eguiriam ');
       TI_elas   :=(eu+'eguiriam ');

       FI_eu     :=(eu+'eguirei ');
       FI_tu     :=(eu+'eguiras ');
       FI_ele    :=(eu+'eguira ');
       FI_ela    :=(eu+'eguira ');
       FI_voce   :=(eu+'eguira ');
       FI_nos    :=(eu+'eguiremos ');
       FI_vos    :=(eu+'eguireis ');
       FI_voces  :=(eu+'eguirão ');
       FI_eles   :=(eu+'eguirão ');
       FI_elas   :=(eu+'eguirão ');

       PS_eu     :=(eu+'iga ');
       PS_tu     :=(eu+'igas ');
       PS_ele    :=(eu+'iga ');
       PS_ela    :=(eu+'iga ');
       PS_voce   :=(eu+'iga ');
       PS_nos    :=(eu+'igamos ');
       PS_vos    :=(eu+'igais ');
       PS_voces  :=(eu+'igam ');
       PS_eles   :=(eu+'igam ');
       PS_elas   :=(eu+'igam ');

       IS_eu     :=(eu+'eguisse ');
       IS_tu     :=(eu+'eguisses ');
       IS_ele    :=(eu+'eguisse ');
       IS_ela    :=(eu+'eguise ');
       IS_voce   :=(eu+'eguisse ');
       IS_nos    :=(eu+'eguissemos ');
       IS_vos    :=(eu+'eguisseis ');
       IS_voces  :=(eu+'eguissem ');
       IS_eles   :=(eu+'eguissem ');
       IS_elas   :=(eu+'eguissem ');

       FS_eu     :=(eu+'eguir ');
       FS_tu     :=(eu+'eguires ');
       FS_ele    :=(eu+'eguir ');
       FS_ela    :=(eu+'eguir ');
       FS_voce   :=(eu+'eguir ');
       FS_nos    :=(eu+'eguirmos ');
       FS_vos    :=(eu+'eguirdes ');
       FS_voces  :=(eu+'eguirem ');
       FS_eles   :=(eu+'eguirem ');
       FS_elas   :=(eu+'eguirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'egue ');
       IA_ele    :=(eu+'iga ');
       IA_ela    :=(eu+'iga ');
       IA_voce   :=(eu+'iga ');
       IA_nos    :=(eu+'igamos ');
       IA_vos    :=(eu+'egui ');
       IA_voces  :=(eu+'igam ');
       IA_eles   :=(eu+'igam ');
       IA_elas   :=(eu+'igam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'igas ');
       IN_ele    :=(eu+'iga ');
       IN_ela    :=(eu+'iga ');
       IN_voce   :=(eu+'iga ');
       IN_nos    :=(eu+'igamos ');
       IN_vos    :=(eu+'igais ');
       IN_voces  :=(eu+'igam ');
       IN_eles   :=(eu+'igam ');
       IN_elas   :=(eu+'igam ');



     end//eguir meio  // eu tu ele//eguir
    else
     begin//eguir continuaçao
      if (pos('guir ',eu) > 1)and  (pos('guir ',eu) < 20) then
       begin//guir inicio
        // term c guir // eu tu ele
       // memo1.lines.add ('guir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'guido ');
       GERf      :=(eu+'guida ');
       GERAm      :=(eu+'guido ');
       GERAf      :=(eu+'guida ');
       PART      :=(eu+'guindo ');
       AGENTE1   :=(eu+'guinte ');
       AGENTE2   :=(eu+'guidor ');
       AGENTE3   :=(eu+'guidora ');
       ACAO1     :=(eu+'guimento ');
       ACAO2     :=(eu+'guição ');
       ACAO3     :=(eu+'guimenta ');
       RESU1     :=(eu+'guisso ');
       RESU2     :=(eu+'guissa ');

       IP_eu     :=(eu+'guir ');
       IP_tu     :=(eu+'guires ');
       IP_ele    :=(eu+'guir ');
       IP_ela    :=(eu+'guir ');
       IP_voce   :=(eu+'guir ');
       IP_nos    :=(eu+'guirmos ');
       IP_vos    :=(eu+'guirdes ');
       IP_voces  :=(eu+'guirem ');
       IP_eles   :=(eu+'guirem ');
       IP_elas   :=(eu+'guirem ');

       PI_eu     :=(eu+'guo ');
       PI_tu     :=(eu+'gues ');
       PI_ele    :=(eu+'gue ');
       PI_ela    :=(eu+'gue ');
       PI_voce   :=(eu+'gue ');
       PI_nos    :=(eu+'guimos ');
       PI_vos    :=(eu+'guis ');
       PI_voces  :=(eu+'guem ');
       PI_eles   :=(eu+'guem ');
       PI_elas   :=(eu+'guem ');

       PP_eu     :=(eu+'gui ');
       PP_tu     :=(eu+'guiste ');
       PP_ele    :=(eu+'guiu ');
       PP_ela    :=(eu+'guiu ');
       PP_voce   :=(eu+'guiu ');         //EI
       PP_nos    :=(eu+'guimos ');
       PP_vos    :=(eu+'guistes ');
       PP_voces  :=(eu+'guiram ');
       PP_eles   :=(eu+'guiram ');
       PP_elas   :=(eu+'guiram ');

       II_eu     :=(eu+'guia ');
       II_tu     :=(eu+'guias ');
       II_ele    :=(eu+'guia ');
       II_ela    :=(eu+'guia ');
       II_voce   :=(eu+'guia ');
       II_nos    :=(eu+'guiamos ');
       II_vos    :=(eu+'guieis ');
       II_voces  :=(eu+'guiam ');
       II_eles   :=(eu+'guiam ');
       II_elas   :=(eu+'guiam ');

       MI_eu     :=(eu+'guira ');
       MI_tu     :=(eu+'guiras ');
       MI_ele    :=(eu+'guira ');
       MI_ela    :=(eu+'guira ');
       MI_voce   :=(eu+'guira ');
       MI_nos    :=(eu+'guiramos ');
       MI_vos    :=(eu+'guireis ');
       MI_voces  :=(eu+'guiram ');
       MI_eles   :=(eu+'guiram ');
       MI_elas   :=(eu+'guiram ');

       TI_eu     :=(eu+'guiria ');
       TI_tu     :=(eu+'guirias ');
       TI_ele    :=(eu+'guiria ');
       TI_ela    :=(eu+'guiria ');
       TI_voce   :=(eu+'guiria ');
       TI_nos    :=(eu+'gumos ');
       TI_vos    :=(eu+'guirieis ');
       TI_voces  :=(eu+'guiriam ');
       TI_eles   :=(eu+'guiriam ');
       TI_elas   :=(eu+'guiriam ');

       FI_eu     :=(eu+'guirei ');
       FI_tu     :=(eu+'guiras ');
       FI_ele    :=(eu+'guira ');
       FI_ela    :=(eu+'guira ');
       FI_voce   :=(eu+'guira ');
       FI_nos    :=(eu+'guiremos ');
       FI_vos    :=(eu+'guireis ');
       FI_voces  :=(eu+'guirão ');
       FI_eles   :=(eu+'guirão ');
       FI_elas   :=(eu+'guirão ');

       PS_eu     :=(eu+'gua ');
       PS_tu     :=(eu+'guas ');
       PS_ele    :=(eu+'gua ');
       PS_ela    :=(eu+'gua ');
       PS_voce   :=(eu+'gua ');
       PS_nos    :=(eu+'guamos ');
       PS_vos    :=(eu+'guais ');
       PS_voces  :=(eu+'guam ');
       PS_eles   :=(eu+'guam ');
       PS_elas   :=(eu+'guam ');

       IS_eu     :=(eu+'guisse ');
       IS_tu     :=(eu+'guisses ');
       IS_ele    :=(eu+'guisse ');
       IS_ela    :=(eu+'guisse ');
       IS_voce   :=(eu+'guisse ');
       IS_nos    :=(eu+'guissemos ');
       IS_vos    :=(eu+'guisseis ');
       IS_voces  :=(eu+'guissem ');
       IS_eles   :=(eu+'guissem ');
       IS_elas   :=(eu+'guissem ');

       FS_eu     :=(eu+'guir ');
       FS_tu     :=(eu+'guires ');
       FS_ele    :=(eu+'guir ');
       FS_ela    :=(eu+'guir ');
       FS_voce   :=(eu+'guir ');
       FS_nos    :=(eu+'guirmos ');
       FS_vos    :=(eu+'guirdes ');
       FS_voces  :=(eu+'guirem ');
       FS_eles   :=(eu+'guirem ');
       FS_elas   :=(eu+'guirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'gue ');
       IA_ele    :=(eu+'gua ');
       IA_ela    :=(eu+'gua ');
       IA_voce   :=(eu+'gua ');
       IA_nos    :=(eu+'guamos ');
       IA_vos    :=(eu+'gui ');
       IA_voces  :=(eu+'guam ');
       IA_eles   :=(eu+'guam ');
       IA_elas   :=(eu+'guam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'guas ');
       IN_ele    :=(eu+'gua ');
       IN_ela    :=(eu+'gua ');
       IN_voce   :=(eu+'gua ');
       IN_nos    :=(eu+'guamos ');
       IN_vos    :=(eu+'guais ');
       IN_voces  :=(eu+'guam ');
       IN_eles   :=(eu+'guam ');
       IN_elas   :=(eu+'guam ');

       end//guir meio  // eu tu ele//guir
      else
       begin//guir continu

        if (pos('uir ',eu) > 1)and  (pos('uir ',eu) < 20) then
         begin//uir inicio
           // term c uir // eu tu ele
       //    memo1.lines.add ('uir');
       if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'uido ');
       GERf      :=(eu+'uida ');
       GERAm      :=(eu+'uio ');
       GERAf      :=(eu+'uia ');
       PART      :=(eu+'uindo ');
       AGENTE1   :=(eu+'uinte ');
       AGENTE2   :=(eu+'uidor ');
       AGENTE3   :=(eu+'uidora ');
       ACAO1     :=(eu+'uimento ');
       ACAO2     :=(eu+'uição ');
       ACAO3     :=(eu+'uimenta ');
       RESU1     :=(eu+'uisso ');
       RESU2     :=(eu+'uissa ');

       IP_eu     :=(eu+'uir ');
       IP_tu     :=(eu+'uires ');
       IP_ele    :=(eu+'uir ');
       IP_ela    :=(eu+'uir ');
       IP_voce   :=(eu+'uir ');
       IP_nos    :=(eu+'uirmos ');
       IP_vos    :=(eu+'uirdes ');
       IP_voces  :=(eu+'uirem ');
       IP_eles   :=(eu+'uirem ');
       IP_elas   :=(eu+'uirem ');

       PI_eu     :=(eu+'uo ');
       PI_tu     :=(eu+'uis ');
       PI_ele    :=(eu+'ui ');
       PI_ela    :=(eu+'ui ');
       PI_voce   :=(eu+'ui ');
       PI_nos    :=(eu+'uimos ');
       PI_vos    :=(eu+'uis ');
       PI_voces  :=(eu+'uem ');
       PI_eles   :=(eu+'uem ');
       PI_elas   :=(eu+'uem ');

       PP_eu     :=(eu+'ui ');
       PP_tu     :=(eu+'uiste ');
       PP_ele    :=(eu+'uiu ');
       PP_ela    :=(eu+'uiu ');
       PP_voce   :=(eu+'uiu ');         //EI
       PP_nos    :=(eu+'uimos ');
       PP_vos    :=(eu+'uistes ');
       PP_voces  :=(eu+'uiram ');
       PP_eles   :=(eu+'uiram ');
       PP_elas   :=(eu+'uiram ');

       II_eu     :=(eu+'uia ');
       II_tu     :=(eu+'uias ');
       II_ele    :=(eu+'uia ');
       II_ela    :=(eu+'uia ');
       II_voce   :=(eu+'uia ');
       II_nos    :=(eu+'uiamos ');
       II_vos    :=(eu+'uieis ');
       II_voces  :=(eu+'uiam ');
       II_eles   :=(eu+'uiam ');
       II_elas   :=(eu+'uiam ');

       MI_eu     :=(eu+'uira ');
       MI_tu     :=(eu+'uiras ');
       MI_ele    :=(eu+'uira ');
       MI_ela    :=(eu+'uira ');
       MI_voce   :=(eu+'uira ');
       MI_nos    :=(eu+'uiramos ');
       MI_vos    :=(eu+'uireis ');
       MI_voces  :=(eu+'uiram ');
       MI_eles   :=(eu+'uiram ');
       MI_elas   :=(eu+'uiram ');

       TI_eu     :=(eu+'uiria ');
       TI_tu     :=(eu+'uirias ');
       TI_ele    :=(eu+'uiria ');
       TI_ela    :=(eu+'uiria ');
       TI_voce   :=(eu+'uiria ');
       TI_nos    :=(eu+'uiriamos ');
       TI_vos    :=(eu+'uirieis ');
       TI_voces  :=(eu+'uiriam ');
       TI_eles   :=(eu+'uiriam ');
       TI_elas   :=(eu+'uiriam ');

       FI_eu     :=(eu+'uirei ');
       FI_tu     :=(eu+'uiras ');
       FI_ele    :=(eu+'uira ');
       FI_ela    :=(eu+'uira ');
       FI_voce   :=(eu+'uira ');
       FI_nos    :=(eu+'uiremos ');
       FI_vos    :=(eu+'uireis ');
       FI_voces  :=(eu+'uirão ');
       FI_eles   :=(eu+'uirão ');
       FI_elas   :=(eu+'uirão ');

       PS_eu     :=(eu+'ua ');
       PS_tu     :=(eu+'uas ');
       PS_ele    :=(eu+'ua ');
       PS_ela    :=(eu+'ua ');
       PS_voce   :=(eu+'ua ');
       PS_nos    :=(eu+'uamos ');
       PS_vos    :=(eu+'uais ');
       PS_voces  :=(eu+'uam ');
       PS_eles   :=(eu+'uam ');
       PS_elas   :=(eu+'uam ');

       IS_eu     :=(eu+'uisse ');
       IS_tu     :=(eu+'uisses ');
       IS_ele    :=(eu+'uisse ');
       IS_ela    :=(eu+'uisse ');
       IS_voce   :=(eu+'uisse ');
       IS_nos    :=(eu+'uissemos ');
       IS_vos    :=(eu+'uisseis ');
       IS_voces  :=(eu+'uissem ');
       IS_eles   :=(eu+'uissem ');
       IS_elas   :=(eu+'uissem ');

       FS_eu     :=(eu+'uir ');
       FS_tu     :=(eu+'uires ');
       FS_ele    :=(eu+'uir ');
       FS_ela    :=(eu+'uir ');
       FS_voce   :=(eu+'uir ');
       FS_nos    :=(eu+'uirmos ');
       FS_vos    :=(eu+'uirdes ');
       FS_voces  :=(eu+'uirem ');
       FS_eles   :=(eu+'uirem ');
       FS_elas   :=(eu+'uirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ui ');
       IA_ele    :=(eu+'ua ');
       IA_ela    :=(eu+'ua ');
       IA_voce   :=(eu+'ua ');
       IA_nos    :=(eu+'uamos ');
       IA_vos    :=(eu+'uí ');
       IA_voces  :=(eu+'uam ');
       IA_eles   :=(eu+'uam ');
       IA_elas   :=(eu+'uam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'uas ');
       IN_ele    :=(eu+'ua ');
       IN_ela    :=(eu+'ua ');
       IN_voce   :=(eu+'ua ');
       IN_nos    :=(eu+'uamos ');
       IN_vos    :=(eu+'uais ');
       IN_voces  :=(eu+'uam ');
       IN_eles   :=(eu+'uam ');
       IN_elas   :=(eu+'uam ');

         end;//uir fim  // eu tu ele//uir
       end;//guir fim
     end;//eguir fim

    if (pos('fugir ',eu) > 0)and  (pos('fugir ',eu) < 20) then
     begin//fugir inicio
      // term c ugir // eu tu ele
      delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));
      // memo1.lines.add ('fugir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'fugido ');
       GERf      :=(eu+'fugida ');
       GERAm      :=(eu+'fugido ');
       GERAf      :=(eu+'fugido ');
       PART      :=(eu+'fugindo ');
       AGENTE1   :=(eu+'fuginte ');
       AGENTE2   :=(eu+'fugidor ');
       AGENTE3   :=(eu+'fugidora ');
       ACAO1     :=(eu+'fugimento ');
       ACAO2     :=(eu+'fugição ');
       ACAO3     :=(eu+'fugimenta ');
       RESU1     :=(eu+'fugisso ');
       RESU2     :=(eu+'fugissa ');

       IP_eu     :=(eu+'fugir ');
       IP_tu     :=(eu+'fugires ');
       IP_ele    :=(eu+'fugir ');
       IP_ela    :=(eu+'fugir ');
       IP_voce   :=(eu+'fugir ');
       IP_nos    :=(eu+'fugirmos ');
       IP_vos    :=(eu+'fugirdes ');
       IP_voces  :=(eu+'fugirem ');
       IP_eles   :=(eu+'fugirem ');
       IP_elas   :=(eu+'fugirem ');

       PI_eu     :=(eu+'fujo ');
       PI_tu     :=(eu+'foges ');
       PI_ele    :=(eu+'foge ');
       PI_ela    :=(eu+'foge ');
       PI_voce   :=(eu+'foge ');
       PI_nos    :=(eu+'fugimos ');
       PI_vos    :=(eu+'fugis ');
       PI_voces  :=(eu+'fogem ');
       PI_eles   :=(eu+'fogem ');
       PI_elas   :=(eu+'fogem ');

       PP_eu     :=(eu+'fugi ');
       PP_tu     :=(eu+'fugiste ');
       PP_ele    :=(eu+'fugiu ');
       PP_ela    :=(eu+'fugiu ');
       PP_voce   :=(eu+'fugiu ');         //EI
       PP_nos    :=(eu+'fugimos ');
       PP_vos    :=(eu+'fugistes ');
       PP_voces  :=(eu+'fugiram ');
       PP_eles   :=(eu+'fugiram ');
       PP_elas   :=(eu+'fugiram ');

       II_eu     :=(eu+'fugia ');
       II_tu     :=(eu+'fugias ');
       II_ele    :=(eu+'fugia ');
       II_ela    :=(eu+'fugia ');
       II_voce   :=(eu+'fugia ');
       II_nos    :=(eu+'fugiamos ');
       II_vos    :=(eu+'fugieis ');
       II_voces  :=(eu+'fugiam ');
       II_eles   :=(eu+'fugiam ');
       II_elas   :=(eu+'fugiam ');

       MI_eu     :=(eu+'fugira ');
       MI_tu     :=(eu+'fugiras ');
       MI_ele    :=(eu+'fugira ');
       MI_ela    :=(eu+'fugira ');
       MI_voce   :=(eu+'fugira ');
       MI_nos    :=(eu+'fugiramos ');
       MI_vos    :=(eu+'fugireis ');
       MI_voces  :=(eu+'fugiram ');
       MI_eles   :=(eu+'fugiram ');
       MI_elas   :=(eu+'fugiram ');

       TI_eu     :=(eu+'fugiria ');
       TI_tu     :=(eu+'fugirias ');
       TI_ele    :=(eu+'fugiria ');
       TI_ela    :=(eu+'fugiria ');
       TI_voce   :=(eu+'fugiria ');
       TI_nos    :=(eu+'fugiriamos ');
       TI_vos    :=(eu+'fugirieis ');
       TI_voces  :=(eu+'fugiriam ');
       TI_eles   :=(eu+'fugiriam ');
       TI_elas   :=(eu+'fugiriam ');

       FI_eu     :=(eu+'fugirei ');
       FI_tu     :=(eu+'fugiras ');
       FI_ele    :=(eu+'fugira ');
       FI_ela    :=(eu+'fugira ');
       FI_voce   :=(eu+'fugira ');
       FI_nos    :=(eu+'fugiremos ');
       FI_vos    :=(eu+'fugireis ');
       FI_voces  :=(eu+'fugirão ');
       FI_eles   :=(eu+'fugirão ');
       FI_elas   :=(eu+'fugirão ');

       PS_eu     :=(eu+'fuja ');
       PS_tu     :=(eu+'fujas ');
       PS_ele    :=(eu+'fuja ');
       PS_ela    :=(eu+'fuja ');
       PS_voce   :=(eu+'fuja ');
       PS_nos    :=(eu+'fujamos ');
       PS_vos    :=(eu+'fujais ');
       PS_voces  :=(eu+'fujam ');
       PS_eles   :=(eu+'fujam ');
       PS_elas   :=(eu+'fujam ');

       IS_eu     :=(eu+'fugisse ');
       IS_tu     :=(eu+'fugisses ');
       IS_ele    :=(eu+'fugisse ');
       IS_ela    :=(eu+'fugisse ');
       IS_voce   :=(eu+'fugisse ');
       IS_nos    :=(eu+'fugissemos ');
       IS_vos    :=(eu+'fugisseis ');
       IS_voces  :=(eu+'fugissem ');
       IS_eles   :=(eu+'fugissem ');
       IS_elas   :=(eu+'fugissem ');

       FS_eu     :=(eu+'fugir ');
       FS_tu     :=(eu+'fugires ');
       FS_ele    :=(eu+'fugir ');
       FS_ela    :=(eu+'fugir ');
       FS_voce   :=(eu+'fugir ');
       FS_nos    :=(eu+'fugirmos ');
       FS_vos    :=(eu+'fugirdes ');
       FS_voces  :=(eu+'fugirem ');
       FS_eles   :=(eu+'fugirem ');
       FS_elas   :=(eu+'fugirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'foge ');
       IA_ele    :=(eu+'fuja ');
       IA_ela    :=(eu+'fuja ');
       IA_voce   :=(eu+'fuja ');
       IA_nos    :=(eu+'fujamos ');
       IA_vos    :=(eu+'fugi ');
       IA_voces  :=(eu+'fujam ');
       IA_eles   :=(eu+'fujam ');
       IA_elas   :=(eu+'fujam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'fujas ');
       IN_ele    :=(eu+'fuja ');
       IN_ela    :=(eu+'fuja ');
       IN_voce   :=(eu+'fuja ');
       IN_nos    :=(eu+'fujamos ');
       IN_vos    :=(eu+'fujais ');
       IN_voces  :=(eu+'fujam ');
       IN_eles   :=(eu+'fujam ');
       IN_elas   :=(eu+'fujam ');

     end//fugir meio  // eu tu ele//fugir      eles fogem   mugir eles mugem ? mogem
    else
     begin //fugir contin
      if (pos('ergir ',eu) > 1)and  (pos('ergir ',eu) < 20) then
       begin//r inicio
        // term c ergir // eu tu ele
       // memo1.lines.add ('ergir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'erso ');
       GERf      :=(eu+'ersa ');
       GERAm      :=(eu+'ergido ');
       GERAf      :=(eu+'ergida ');
       PART      :=(eu+'ergindo ');
       AGENTE1   :=(eu+'ergente ');
       AGENTE2   :=(eu+'ergidor ');
       AGENTE3   :=(eu+'ergidora ');
       ACAO1     :=(eu+'ergimento ');
       ACAO2     :=(eu+'ergição ');
       ACAO3     :=(eu+'ergimenta ');
       RESU1     :=(eu+'ergisso ');
       RESU2     :=(eu+'ergissa ');

       IP_eu     :=(eu+'ergir ');
       IP_tu     :=(eu+'ergires ');
       IP_ele    :=(eu+'ergir ');
       IP_ela    :=(eu+'ergir ');
       IP_voce   :=(eu+'ergir ');
       IP_nos    :=(eu+'ergirmos ');
       IP_vos    :=(eu+'ergirdes ');
       IP_voces  :=(eu+'ergirem ');
       IP_eles   :=(eu+'ergirem ');
       IP_elas   :=(eu+'ergirem ');

       PI_eu     :=(eu+'irjo ');
       PI_tu     :=(eu+'erges ');
       PI_ele    :=(eu+'erge ');
       PI_ela    :=(eu+'erge ');
       PI_voce   :=(eu+'erge ');
       PI_nos    :=(eu+'ergimos ');
       PI_vos    :=(eu+'ergis ');
       PI_voces  :=(eu+'ergem ');
       PI_eles   :=(eu+'ergem ');
       PI_elas   :=(eu+'ergem ');

       PP_eu     :=(eu+'ergi ');
       PP_tu     :=(eu+'ergiste ');
       PP_ele    :=(eu+'ergiu ');
       PP_ela    :=(eu+'ergiu ');
       PP_voce   :=(eu+'ergiu ');         //EI
       PP_nos    :=(eu+'ergimos ');
       PP_vos    :=(eu+'ergistes ');
       PP_voces  :=(eu+'ergiram ');
       PP_eles   :=(eu+'ergiram ');
       PP_elas   :=(eu+'ergiram ');

       II_eu     :=(eu+'ergia ');
       II_tu     :=(eu+'ergias ');
       II_ele    :=(eu+'ergia ');
       II_ela    :=(eu+'ergia ');
       II_voce   :=(eu+'ergia ');
       II_nos    :=(eu+'ergiamos ');
       II_vos    :=(eu+'ergieis ');
       II_voces  :=(eu+'ergiam ');
       II_eles   :=(eu+'ergiam ');
       II_elas   :=(eu+'ergiam ');

       MI_eu     :=(eu+'ergira ');
       MI_tu     :=(eu+'ergiras ');
       MI_ele    :=(eu+'ergira ');
       MI_ela    :=(eu+'ergira ');
       MI_voce   :=(eu+'ergira ');
       MI_nos    :=(eu+'ergiramos ');
       MI_vos    :=(eu+'ergireis ');
       MI_voces  :=(eu+'ergiram ');
       MI_eles   :=(eu+'ergiram ');
       MI_elas   :=(eu+'ergiram ');

       TI_eu     :=(eu+'ergiria ');
       TI_tu     :=(eu+'ergirias ');
       TI_ele    :=(eu+'ergiria ');
       TI_ela    :=(eu+'ergiria ');
       TI_voce   :=(eu+'ergiria ');
       TI_nos    :=(eu+'ergiriamos ');
       TI_vos    :=(eu+'ergirieis ');
       TI_voces  :=(eu+'ergiriam ');
       TI_eles   :=(eu+'ergiriam ');
       TI_elas   :=(eu+'ergiriam ');

       FI_eu     :=(eu+'ergirei ');
       FI_tu     :=(eu+'ergiras ');
       FI_ele    :=(eu+'ergira ');
       FI_ela    :=(eu+'ergira ');
       FI_voce   :=(eu+'ergira ');
       FI_nos    :=(eu+'ergiremos ');
       FI_vos    :=(eu+'ergireis ');
       FI_voces  :=(eu+'ergirão ');
       FI_eles   :=(eu+'ergirão ');
       FI_elas   :=(eu+'ergirão ');

       PS_eu     :=(eu+'erja ');
       PS_tu     :=(eu+'irjas ');
       PS_ele    :=(eu+'irja ');
       PS_ela    :=(eu+'irja ');
       PS_voce   :=(eu+'irja ');
       PS_nos    :=(eu+'erjamos ');
       PS_vos    :=(eu+'erjais ');
       PS_voces  :=(eu+'irjam ');
       PS_eles   :=(eu+'irjam ');
       PS_elas   :=(eu+'irjam ');

       IS_eu     :=(eu+'ergisse ');
       IS_tu     :=(eu+'ergisses ');
       IS_ele    :=(eu+'ergisse ');
       IS_ela    :=(eu+'ergisse ');
       IS_voce   :=(eu+'ergisse ');
       IS_nos    :=(eu+'ergissemos ');
       IS_vos    :=(eu+'ergisseis ');
       IS_voces  :=(eu+'ergissem ');
       IS_eles   :=(eu+'ergissem ');
       IS_elas   :=(eu+'ergissem ');

       FS_eu     :=(eu+'ergir ');
       FS_tu     :=(eu+'ergires ');
       FS_ele    :=(eu+'ergir ');
       FS_ela    :=(eu+'ergir ');
       FS_voce   :=(eu+'ergir ');
       FS_nos    :=(eu+'ergirmos ');
       FS_vos    :=(eu+'ergirdes ');
       FS_voces  :=(eu+'ergirem ');
       FS_eles   :=(eu+'ergirem ');
       FS_elas   :=(eu+'ergirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ergerge ');
       IA_ele    :=(eu+'irja ');
       IA_ela    :=(eu+'irja ');
       IA_voce   :=(eu+'irja ');
       IA_nos    :=(eu+'irjamos ');
       IA_vos    :=(eu+'ergi ');
       IA_voces  :=(eu+'irjam ');
       IA_eles   :=(eu+'irjam ');
       IA_elas   :=(eu+'irjam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'irjas ');
       IN_ele    :=(eu+'irja ');
       IN_ela    :=(eu+'irja ');
       IN_voce   :=(eu+'irja ');
       IN_nos    :=(eu+'irjamos ');
       IN_vos    :=(eu+'irjais ');
       IN_voces  :=(eu+'irjam ');
       IN_eles   :=(eu+'irjam ');
       IN_elas   :=(eu+'irjam ');

       end//ergir meio  // eu tu ele//ergir
      else
       begin//ergir contin
        if (pos('gir ',eu) > 1)and  (pos('gir ',eu) < 20) then
         begin//gir inicio
          // term c gir // eu tu ele
          //memo1.lines.add ('gir');
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'gido ');
       GERf      :=(eu+'gida ');
       GERAm     :=(eu+'gito');
       GERAf     :=(eu+'gita');
       PART      :=(eu+'gindo ');
       AGENTE1   :=(eu+'ginte ');
       AGENTE2   :=(eu+'gidor ');
       AGENTE3   :=(eu+'gidora ');
       ACAO1     :=(eu+'gimento ');
       ACAO2     :=(eu+'ção ');
       ACAO3     :=(eu+'gimenta ');
       RESU1     :=(eu+'gisso ');
       RESU2     :=(eu+'gissa ');

       IP_eu     :=(eu+'gir ');
       IP_tu     :=(eu+'gires ');
       IP_ele    :=(eu+'gir ');
       IP_ela    :=(eu+'gir ');
       IP_voce   :=(eu+'gir ');
       IP_nos    :=(eu+'girmos ');
       IP_vos    :=(eu+'girdes ');
       IP_voces  :=(eu+'girem ');
       IP_eles   :=(eu+'girem ');
       IP_elas   :=(eu+'girem ');

       PI_eu     :=(eu+'jo ');
       PI_tu     :=(eu+'ges ');
       PI_ele    :=(eu+'ge ');
       PI_ela    :=(eu+'ge ');
       PI_voce   :=(eu+'ge ');
       PI_nos    :=(eu+'gimos ');
       PI_vos    :=(eu+'gis ');
       PI_voces  :=(eu+'gem ');
       PI_eles   :=(eu+'gem ');
       PI_elas   :=(eu+'gem ');

       PP_eu     :=(eu+'gi ');
       PP_tu     :=(eu+'giste ');
       PP_ele    :=(eu+'giu ');
       PP_ela    :=(eu+'giu ');
       PP_voce   :=(eu+'giu ');         //EI
       PP_nos    :=(eu+'gimos ');
       PP_vos    :=(eu+'gistes ');
       PP_voces  :=(eu+'giram ');
       PP_eles   :=(eu+'giram ');
       PP_elas   :=(eu+'giram ');

       II_eu     :=(eu+'gia ');
       II_tu     :=(eu+'gias ');
       II_ele    :=(eu+'gia ');
       II_ela    :=(eu+'gia ');
       II_voce   :=(eu+'gia ');
       II_nos    :=(eu+'giamos ');
       II_vos    :=(eu+'gieis ');
       II_voces  :=(eu+'giam ');
       II_eles   :=(eu+'giam ');
       II_elas   :=(eu+'giam ');

       MI_eu     :=(eu+'gira ');
       MI_tu     :=(eu+'giras ');
       MI_ele    :=(eu+'gira ');
       MI_ela    :=(eu+'gira ');
       MI_voce   :=(eu+'gira ');
       MI_nos    :=(eu+'giramos ');
       MI_vos    :=(eu+'gireis ');
       MI_voces  :=(eu+'giram ');
       MI_eles   :=(eu+'giram ');
       MI_elas   :=(eu+'giram ');

       TI_eu     :=(eu+'giria ');
       TI_tu     :=(eu+'girias ');
       TI_ele    :=(eu+'giria ');
       TI_ela    :=(eu+'giria ');
       TI_voce   :=(eu+'giria ');
       TI_nos    :=(eu+'giriamos ');
       TI_vos    :=(eu+'girieis ');
       TI_voces  :=(eu+'giriam ');
       TI_eles   :=(eu+'giriam ');
       TI_elas   :=(eu+'giriam ');

       FI_eu     :=(eu+'girei ');
       FI_tu     :=(eu+'giras ');
       FI_ele    :=(eu+'gira ');
       FI_ela    :=(eu+'gira ');
       FI_voce   :=(eu+'gira ');
       FI_nos    :=(eu+'giremos ');
       FI_vos    :=(eu+'gireis ');
       FI_voces  :=(eu+'girão ');
       FI_eles   :=(eu+'girão ');
       FI_elas   :=(eu+'girão ');

       PS_eu     :=(eu+'ja ');
       PS_tu     :=(eu+'jas ');
       PS_ele    :=(eu+'ja ');
       PS_ela    :=(eu+'ja ');
       PS_voce   :=(eu+'ja ');
       PS_nos    :=(eu+'jamos ');
       PS_vos    :=(eu+'jais ');
       PS_voces  :=(eu+'jam ');
       PS_eles   :=(eu+'jam ');
       PS_elas   :=(eu+'jam ');

       IS_eu     :=(eu+'gisse ');
       IS_tu     :=(eu+'gisses ');
       IS_ele    :=(eu+'gisse ');
       IS_ela    :=(eu+'gisse ');
       IS_voce   :=(eu+'gisse ');
       IS_nos    :=(eu+'gissemos ');
       IS_vos    :=(eu+'gisseis ');
       IS_voces  :=(eu+'gissem ');
       IS_eles   :=(eu+'gissem ');
       IS_elas   :=(eu+'gissem ');

       FS_eu     :=(eu+'gir ');
       FS_tu     :=(eu+'gires ');
       FS_ele    :=(eu+'gir ');
       FS_ela    :=(eu+'gir ');
       FS_voce   :=(eu+'gir ');
       FS_nos    :=(eu+'girmos ');
       FS_vos    :=(eu+'girdes ');
       FS_voces  :=(eu+'girem ');
       FS_eles   :=(eu+'girem ');
       FS_elas   :=(eu+'girem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ge ');
       IA_ele    :=(eu+'ja ');
       IA_ela    :=(eu+'ja ');
       IA_voce   :=(eu+'ja ');
       IA_nos    :=(eu+'jamos ');
       IA_vos    :=(eu+'gi ');
       IA_voces  :=(eu+'jam ');
       IA_eles   :=(eu+'jam ');
       IA_elas   :=(eu+'jam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'jas ');
       IN_ele    :=(eu+'ja ');
       IN_ela    :=(eu+'ja ');
       IN_voce   :=(eu+'ja ');
       IN_nos    :=(eu+'jamos ');
       IN_vos    :=(eu+'jais ');
       IN_voces  :=(eu+'jam ');
       IN_eles   :=(eu+'jam ');
       IN_elas   :=(eu+'jam ');

         end;//gir fim  // eu tu ele//gir
       end;//ergir fim
     end;//fugir fim

    if (pos('ormir ',eu) > 1)and  (pos('ormir ',eu) < 20) then
     begin//ormir inicio
      // term c ormir // eu tu ele
      //memo1.lines.add ('ormir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'ormido ');
       GERf      :=(eu+'ormida ');
       GERAm     :=(eu+'ormo '); //gerundio abundante geralm so irregulares
       GERAf     :=(eu+'orma ');
       PART      :=(eu+'ormindo ');
       AGENTE1   :=(eu+'orminte ');
       AGENTE2   :=(eu+'ormidor ');
       AGENTE3   :=(eu+'ormidora ');
       ACAO1     :=(eu+'ormimento ');
       ACAO2     :=(eu+'ormição ');
       ACAO3     :=(eu+'ormimenta ');
       RESU1     :=(eu+'ormisso ');
       RESU2     :=(eu+'ormissa ');

       IP_eu     :=(eu+'ormir ');
       IP_tu     :=(eu+'ormires ');
       IP_ele    :=(eu+'ormir ');
       IP_ela    :=(eu+'ormir ');
       IP_voce   :=(eu+'ormir ');
       IP_nos    :=(eu+'ormirmos ');
       IP_vos    :=(eu+'ormirdes ');
       IP_voces  :=(eu+'ormirem ');
       IP_eles   :=(eu+'ormirem ');
       IP_elas   :=(eu+'ormirem ');

       PI_eu     :=(eu+'urmo ');
       PI_tu     :=(eu+'ormes ');
       PI_ele    :=(eu+'orme ');
       PI_ela    :=(eu+'orme ');
       PI_voce   :=(eu+'orme ');
       PI_nos    :=(eu+'ormimos ');
       PI_vos    :=(eu+'ormis ');
       PI_voces  :=(eu+'ormem ');
       PI_eles   :=(eu+'ormem ');
       PI_elas   :=(eu+'ormem ');

       PP_eu     :=(eu+'ormi ');
       PP_tu     :=(eu+'ormiste ');
       PP_ele    :=(eu+'ormiu ');
       PP_ela    :=(eu+'ormiu ');
       PP_voce   :=(eu+'ormiu ');         //EI
       PP_nos    :=(eu+'ormimos ');
       PP_vos    :=(eu+'ormistes ');
       PP_voces  :=(eu+'ormiram ');
       PP_eles   :=(eu+'ormiram ');
       PP_elas   :=(eu+'ormiram ');

       II_eu     :=(eu+'ormia ');
       II_tu     :=(eu+'ormias ');
       II_ele    :=(eu+'ormia ');
       II_ela    :=(eu+'ormia ');
       II_voce   :=(eu+'ormia ');
       II_nos    :=(eu+'ormiamos ');
       II_vos    :=(eu+'ormieis ');
       II_voces  :=(eu+'ormiam ');
       II_eles   :=(eu+'ormiam ');
       II_elas   :=(eu+'ormia ');

       MI_eu     :=(eu+'ormira ');
       MI_tu     :=(eu+'ormiras ');
       MI_ele    :=(eu+'ormira ');
       MI_ela    :=(eu+'ormira ');
       MI_voce   :=(eu+'ormira ');
       MI_nos    :=(eu+'ormiramos ');
       MI_vos    :=(eu+'ormireis ');
       MI_voces  :=(eu+'ormiram ');
       MI_eles   :=(eu+'ormiram ');
       MI_elas   :=(eu+'ormiram ');

       TI_eu     :=(eu+'ormiria ');
       TI_tu     :=(eu+'ormirias ');
       TI_ele    :=(eu+'ormiria ');
       TI_ela    :=(eu+'ormiria ');
       TI_voce   :=(eu+'ormiria ');
       TI_nos    :=(eu+'ormiriamos ');
       TI_vos    :=(eu+'ormirieis ');
       TI_voces  :=(eu+'ormiriam ');
       TI_eles   :=(eu+'ormiriam ');
       TI_elas   :=(eu+'ormiriam ');

       FI_eu     :=(eu+'ormirei ');
       FI_tu     :=(eu+'ormiras ');
       FI_ele    :=(eu+'ormira ');
       FI_ela    :=(eu+'ormira ');
       FI_voce   :=(eu+'ormira ');
       FI_nos    :=(eu+'ormiremos ');
       FI_vos    :=(eu+'ormireis ');
       FI_voces  :=(eu+'ormirão ');
       FI_eles   :=(eu+'ormirão ');
       FI_elas   :=(eu+'ormirão ');

       PS_eu     :=(eu+'urma ');
       PS_tu     :=(eu+'urmas ');
       PS_ele    :=(eu+'urma ');
       PS_ela    :=(eu+'urma ');
       PS_voce   :=(eu+'urma ');
       PS_nos    :=(eu+'urmamos ');
       PS_vos    :=(eu+'urmais ');
       PS_voces  :=(eu+'urmam ');
       PS_eles   :=(eu+'urmam ');
       PS_elas   :=(eu+'urmam ');

       IS_eu     :=(eu+'ormisse ');
       IS_tu     :=(eu+'ormisses ');
       IS_ele    :=(eu+'ormisse ');
       IS_ela    :=(eu+'ormisse ');
       IS_voce   :=(eu+'ormisse ');
       IS_nos    :=(eu+'ormissemos ');
       IS_vos    :=(eu+'ormisseis ');
       IS_voces  :=(eu+'ormissem ');
       IS_eles   :=(eu+'ormissem ');
       IS_elas   :=(eu+'ormissem ');

       FS_eu     :=(eu+'ormir ');
       FS_tu     :=(eu+'ormires ');
       FS_ele    :=(eu+'ormir ');
       FS_ela    :=(eu+'ormir ');
       FS_voce   :=(eu+'ormir ');
       FS_nos    :=(eu+'ormirmos ');
       FS_vos    :=(eu+'ormirdes ');
       FS_voces  :=(eu+'ormirem ');
       FS_eles   :=(eu+'ormirem ');
       FS_elas   :=(eu+'ormirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'orme ');
       IA_ele    :=(eu+'urma ');
       IA_ela    :=(eu+'urma ');
       IA_voce   :=(eu+'urma ');
       IA_nos    :=(eu+'urmamos ');
       IA_vos    :=(eu+'ormi ');
       IA_voces  :=(eu+'urmam ');
       IA_eles   :=(eu+'urmam ');
       IA_elas   :=(eu+'urmam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'urmas ');
       IN_ele    :=(eu+'urma ');
       IN_ela    :=(eu+'urma ');
       IN_voce   :=(eu+'urma ');
       IN_nos    :=(eu+'urmamos ');
       IN_vos    :=(eu+'urmais ');
       IN_voces  :=(eu+'urmam ');
       IN_eles   :=(eu+'urmam ');
       IN_elas   :=(eu+'urmam ');


     end;//ormir fim  // eu tu ele//ormir
    if (pos('obrir ',eu) > 1)and  (pos('obrir ',eu) < 20) then
     begin//obrir inicio
      // term c obrir // eu tu ele
      // memo1.lines.add ('obrir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'obrido ');
       GERf      :=(eu+'obrida ');
       GERAm     :=(eu+'obro '); //gerundio abundante geralm so irregulares
       GERAf     :=(eu+'obra ');
       PART      :=(eu+'obrindo ');
       AGENTE1   :=(eu+'obrinte ');
       AGENTE2   :=(eu+'obridor ');
       AGENTE3   :=(eu+'obridora ');
       ACAO1     :=(eu+'obrimento ');
       ACAO2     :=(eu+'obrição ');
       ACAO3     :=(eu+'obrimenta ');
       RESU1     :=(eu+'obrisso ');
       RESU2     :=(eu+'obrissa ');

       IP_eu     :=(eu+'obrir ');
       IP_tu     :=(eu+'obrires ');
       IP_ele    :=(eu+'obrir ');
       IP_ela    :=(eu+'obrir ');
       IP_voce   :=(eu+'obrir ');
       IP_nos    :=(eu+'obrirmos ');
       IP_vos    :=(eu+'obrirdes ');
       IP_voces  :=(eu+'obrirem ');
       IP_eles   :=(eu+'obrirem ');
       IP_elas   :=(eu+'obrirem ');

       PI_eu     :=(eu+'ubro ');
       PI_tu     :=(eu+'obres ');
       PI_ele    :=(eu+'obre ');
       PI_ela    :=(eu+'obre ');
       PI_voce   :=(eu+'obre ');
       PI_nos    :=(eu+'obrimos ');
       PI_vos    :=(eu+'obris ');
       PI_voces  :=(eu+'obrem ');
       PI_eles   :=(eu+'obrem ');
       PI_elas   :=(eu+'obrem ');

       PP_eu     :=(eu+'obri ');
       PP_tu     :=(eu+'obriste ');
       PP_ele    :=(eu+'obriu ');
       PP_ela    :=(eu+'obriu ');
       PP_voce   :=(eu+'obriu ');         //EI
       PP_nos    :=(eu+'obrimos ');
       PP_vos    :=(eu+'obristes ');
       PP_voces  :=(eu+'ormiram ');
       PP_eles   :=(eu+'obriram ');
       PP_elas   :=(eu+'obriram ');

       II_eu     :=(eu+'obria ');
       II_tu     :=(eu+'obrias ');
       II_ele    :=(eu+'obria ');
       II_ela    :=(eu+'obria ');
       II_voce   :=(eu+'obria ');
       II_nos    :=(eu+'obriamos ');
       II_vos    :=(eu+'obrieis ');
       II_voces  :=(eu+'obriam ');
       II_eles   :=(eu+'obriam ');
       II_elas   :=(eu+'obria ');

       MI_eu     :=(eu+'obrira ');
       MI_tu     :=(eu+'obriras ');
       MI_ele    :=(eu+'obrira ');
       MI_ela    :=(eu+'obrira ');
       MI_voce   :=(eu+'obrira ');
       MI_nos    :=(eu+'obriramos ');
       MI_vos    :=(eu+'obrireis ');
       MI_voces  :=(eu+'obriram ');
       MI_eles   :=(eu+'obriram ');
       MI_elas   :=(eu+'obriram ');

       TI_eu     :=(eu+'obriria ');
       TI_tu     :=(eu+'obririas ');
       TI_ele    :=(eu+'obriria ');
       TI_ela    :=(eu+'obriria ');
       TI_voce   :=(eu+'obriria ');
       TI_nos    :=(eu+'obririamos ');
       TI_vos    :=(eu+'obririeis ');
       TI_voces  :=(eu+'obririam ');
       TI_eles   :=(eu+'obririam ');
       TI_elas   :=(eu+'obririam ');

       FI_eu     :=(eu+'obrirei ');
       FI_tu     :=(eu+'obriras ');
       FI_ele    :=(eu+'obrira ');
       FI_ela    :=(eu+'obrira ');
       FI_voce   :=(eu+'obrira ');
       FI_nos    :=(eu+'obriremos ');
       FI_vos    :=(eu+'obrireis ');
       FI_voces  :=(eu+'obrirão ');
       FI_eles   :=(eu+'obrirão ');
       FI_elas   :=(eu+'obrirão ');

       PS_eu     :=(eu+'ubra');
       PS_tu     :=(eu+'ubras ');
       PS_ele    :=(eu+'ubra ');
       PS_ela    :=(eu+'ubra ');
       PS_voce   :=(eu+'ubra ');
       PS_nos    :=(eu+'ubramos ');
       PS_vos    :=(eu+'ubrais ');
       PS_voces  :=(eu+'ubram ');
       PS_eles   :=(eu+'ubram ');
       PS_elas   :=(eu+'ubram ');

       IS_eu     :=(eu+'obrisse ');
       IS_tu     :=(eu+'obrisses ');
       IS_ele    :=(eu+'obrisse ');
       IS_ela    :=(eu+'obrisse ');
       IS_voce   :=(eu+'orbisse ');
       IS_nos    :=(eu+'obrissemos ');
       IS_vos    :=(eu+'obrisseis ');
       IS_voces  :=(eu+'obrissem ');
       IS_eles   :=(eu+'obrissem ');
       IS_elas   :=(eu+'obrissem ');

       FS_eu     :=(eu+'obrir ');
       FS_tu     :=(eu+'obrires ');
       FS_ele    :=(eu+'obrir ');
       FS_ela    :=(eu+'obrir ');
       FS_voce   :=(eu+'obrir ');
       FS_nos    :=(eu+'obrirmos ');
       FS_vos    :=(eu+'obrirdes ');
       FS_voces  :=(eu+'obrirem ');
       FS_eles   :=(eu+'obrirem ');
       FS_elas   :=(eu+'obrirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'obre ');
       IA_ele    :=(eu+'ubra ');
       IA_ela    :=(eu+'ubra ');
       IA_voce   :=(eu+'ubra ');
       IA_nos    :=(eu+'ubramos ');
       IA_vos    :=(eu+'obri ');
       IA_voces  :=(eu+'ubram ');
       IA_eles   :=(eu+'ubram ');
       IA_elas   :=(eu+'ubram ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ubras ');
       IN_ele    :=(eu+'ubra ');
       IN_ela    :=(eu+'ubra ');
       IN_voce   :=(eu+'ubra ');
       IN_nos    :=(eu+'ubramos ');
       IN_vos    :=(eu+'ubrais ');
       IN_voces  :=(eu+'ubram ');
       IN_eles   :=(eu+'ubram ');
       IN_elas   :=(eu+'ubram ');

     end;//obrir fim  // eu tu ele//obrir
    if (pos('ossir ',eu) > 1)and  (pos('ossir ',eu) < 20) then
     begin//ossir inicio
      // term c ossir // eu tu ele
        delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));
       //memo1.lines.add ('ossir');

       GERm      :=(eu+'ossido ');
       GERf      :=(eu+'ossida ');
       GERAm     :=(eu+'osso '); //gerundio abundante geralm so irregulares
       GERAf     :=(eu+'ossa ');
       PART      :=(eu+'ossindo ');
       AGENTE1   :=(eu+'ossinte ');
       AGENTE2   :=(eu+'ossidor ');
       AGENTE3   :=(eu+'ossidora ');
       ACAO1     :=(eu+'ossimento ');
       ACAO2     :=(eu+'ossição ');
       ACAO3     :=(eu+'ossimenta ');
       RESU1     :=(eu+'ossizo ');
       RESU2     :=(eu+'ossiza ');

       IP_eu     :=(eu+'ossir ');
       IP_tu     :=(eu+'ossires ');
       IP_ele    :=(eu+'ossir ');
       IP_ela    :=(eu+'ossir ');
       IP_voce   :=(eu+'ossir ');
       IP_nos    :=(eu+'ossirmos ');
       IP_vos    :=(eu+'ossirdes ');
       IP_voces  :=(eu+'ossirem ');
       IP_eles   :=(eu+'ossirem ');
       IP_elas   :=(eu+'ossirem ');

       PI_eu     :=(eu+'usso ');
       PI_tu     :=(eu+'osses ');
       PI_ele    :=(eu+'osse ');
       PI_ela    :=(eu+'osse ');
       PI_voce   :=(eu+'osse ');
       PI_nos    :=(eu+'ossimos ');
       PI_vos    :=(eu+'ossis ');
       PI_voces  :=(eu+'ossem ');
       PI_eles   :=(eu+'ossem ');
       PI_elas   :=(eu+'ossem ');

       PP_eu     :=(eu+'ossi ');
       PP_tu     :=(eu+'ossiste ');
       PP_ele    :=(eu+'ossiu ');
       PP_ela    :=(eu+'ossiu ');
       PP_voce   :=(eu+'ossiu ');         //EI
       PP_nos    :=(eu+'ossimos ');
       PP_vos    :=(eu+'ossistes ');
       PP_voces  :=(eu+'ossiram ');
       PP_eles   :=(eu+'ossiram ');
       PP_elas   :=(eu+'ossiram ');

       II_eu     :=(eu+'ossia ');
       II_tu     :=(eu+'ossias ');
       II_ele    :=(eu+'ossia ');
       II_ela    :=(eu+'ossia ');
       II_voce   :=(eu+'ossia ');
       II_nos    :=(eu+'ossiamos ');
       II_vos    :=(eu+'ossieis ');
       II_voces  :=(eu+'ossiam ');
       II_eles   :=(eu+'ossiam ');
       II_elas   :=(eu+'ossia ');

       MI_eu     :=(eu+'ossira ');
       MI_tu     :=(eu+'ossiras ');
       MI_ele    :=(eu+'ossira ');
       MI_ela    :=(eu+'ossira ');
       MI_voce   :=(eu+'ossira ');
       MI_nos    :=(eu+'ossiramos ');
       MI_vos    :=(eu+'ossireis ');
       MI_voces  :=(eu+'ossiram ');
       MI_eles   :=(eu+'ossiram ');
       MI_elas   :=(eu+'ossiram ');

       TI_eu     :=(eu+'ossiria ');
       TI_tu     :=(eu+'ossirias ');
       TI_ele    :=(eu+'ossiria ');
       TI_ela    :=(eu+'ossiria ');
       TI_voce   :=(eu+'ossiria ');
       TI_nos    :=(eu+'ossiriamos ');
       TI_vos    :=(eu+'ossirieis ');
       TI_voces  :=(eu+'ossiriam ');
       TI_eles   :=(eu+'ossiriam ');
       TI_elas   :=(eu+'ossiriam ');

       FI_eu     :=(eu+'ossirei ');
       FI_tu     :=(eu+'ossiras ');
       FI_ele    :=(eu+'ossira ');
       FI_ela    :=(eu+'ossira ');
       FI_voce   :=(eu+'ossira ');
       FI_nos    :=(eu+'ossiremos ');
       FI_vos    :=(eu+'ossireis ');
       FI_voces  :=(eu+'ossirão ');
       FI_eles   :=(eu+'ossirão ');
       FI_elas   :=(eu+'ossirão ');

       PS_eu     :=(eu+'ussa ');
       PS_tu     :=(eu+'ussas ');
       PS_ele    :=(eu+'ussa ');
       PS_ela    :=(eu+'ussa ');
       PS_voce   :=(eu+'ussa ');
       PS_nos    :=(eu+'ussamos ');
       PS_vos    :=(eu+'ussais ');
       PS_voces  :=(eu+'ussam ');
       PS_eles   :=(eu+'ussam ');
       PS_elas   :=(eu+'ussam ');

       IS_eu     :=(eu+'ossisse ');
       IS_tu     :=(eu+'ossisses ');
       IS_ele    :=(eu+'ossisse ');
       IS_ela    :=(eu+'ossisse ');
       IS_voce   :=(eu+'ossisse ');
       IS_nos    :=(eu+'ossissemos ');
       IS_vos    :=(eu+'ossisseis ');
       IS_voces  :=(eu+'ossissem ');
       IS_eles   :=(eu+'ossissem ');
       IS_elas   :=(eu+'ossissem ');

       FS_eu     :=(eu+'ossir ');
       FS_tu     :=(eu+'ossires ');
       FS_ele    :=(eu+'ossir ');
       FS_ela    :=(eu+'ossir ');
       FS_voce   :=(eu+'ossir ');
       FS_nos    :=(eu+'ossirmos ');
       FS_vos    :=(eu+'ossirdes ');
       FS_voces  :=(eu+'ossirem ');
       FS_eles   :=(eu+'ossirem ');
       FS_elas   :=(eu+'ossirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'osse ');
       IA_ele    :=(eu+'ussa ');
       IA_ela    :=(eu+'ussa ');
       IA_voce   :=(eu+'ussa ');
       IA_nos    :=(eu+'ussamos ');
       IA_vos    :=(eu+'ossi ');
       IA_voces  :=(eu+'ussam ');
       IA_eles   :=(eu+'ussam ');
       IA_elas   :=(eu+'ussam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ussas ');
       IN_ele    :=(eu+'ussa ');
       IN_ela    :=(eu+'ussa ');
       IN_voce   :=(eu+'ussa ');
       IN_nos    :=(eu+'ussamos ');
       IN_vos    :=(eu+'ussais ');
       IN_voces  :=(eu+'ussam ');
       IN_eles   :=(eu+'ussam ');
       IN_elas   :=(eu+'ussam ');

     end;//ossir fim  // eu tu ele//ossir
    if (pos('ortir ',eu) > 1)and  (pos('ortir ',eu) < 20) then
     begin//ortir inicio
      // term c ortir // eu tu ele
      //memo1.lines.add ('ortir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'ortido ');
       GERf      :=(eu+'ortida ');
       GERAm     :=(eu+'ortido '); //gerundio abundante geralm so irregulares
       GERAf     :=(eu+'ortida ');
       PART      :=(eu+'ortindo ');
       AGENTE1   :=(eu+'urtinte ');
       AGENTE2   :=(eu+'urtidor ');
       AGENTE3   :=(eu+'urtidora ');
       ACAO1     :=(eu+'urtimento ');
       ACAO2     :=(eu+'urtição ');
       ACAO3     :=(eu+'urtimenta ');
       RESU1     :=(eu+'urtisso ');
       RESU2     :=(eu+'urtissa ');

       IP_eu     :=(eu+'ortir ');
       IP_tu     :=(eu+'ortires ');
       IP_ele    :=(eu+'ortir ');
       IP_ela    :=(eu+'ortir ');
       IP_voce   :=(eu+'ortir ');
       IP_nos    :=(eu+'ortirmos ');
       IP_vos    :=(eu+'ortirdes ');
       IP_voces  :=(eu+'ortirem ');
       IP_eles   :=(eu+'ortirem ');
       IP_elas   :=(eu+'ortirem ');

       PI_eu     :=(eu+'urto ');
       PI_tu     :=(eu+'urtes ');
       PI_ele    :=(eu+'urte ');
       PI_ela    :=(eu+'urte ');
       PI_voce   :=(eu+'urte ');
       PI_nos    :=(eu+'ortimos ');
       PI_vos    :=(eu+'ortis ');
       PI_voces  :=(eu+'urtem ');
       PI_eles   :=(eu+'urtem ');
       PI_elas   :=(eu+'urtem ');

       PP_eu     :=(eu+'orti ');
       PP_tu     :=(eu+'ortiste ');
       PP_ele    :=(eu+'ortiu ');
       PP_ela    :=(eu+'ortiu ');
       PP_voce   :=(eu+'ortiu ');         //EI
       PP_nos    :=(eu+'ortimos ');
       PP_vos    :=(eu+'ortistes ');
       PP_voces  :=(eu+'ortiram ');
       PP_eles   :=(eu+'ortiram ');
       PP_elas   :=(eu+'ortiram ');

       II_eu     :=(eu+'ortia ');
       II_tu     :=(eu+'ortias ');
       II_ele    :=(eu+'ortia ');
       II_ela    :=(eu+'ortia ');
       II_voce   :=(eu+'ortia ');
       II_nos    :=(eu+'ortiamos ');
       II_vos    :=(eu+'ortieis ');
       II_voces  :=(eu+'ortiam ');
       II_eles   :=(eu+'ortiam ');
       II_elas   :=(eu+'ortiam ');

       MI_eu     :=(eu+'ortira ');
       MI_tu     :=(eu+'ortiras ');
       MI_ele    :=(eu+'ortira ');
       MI_ela    :=(eu+'ortira ');
       MI_voce   :=(eu+'ortira ');
       MI_nos    :=(eu+'ortiramos ');
       MI_vos    :=(eu+'ortireis ');
       MI_voces  :=(eu+'ortiram ');
       MI_eles   :=(eu+'ortiram ');
       MI_elas   :=(eu+'ortiram ');

       TI_eu     :=(eu+'ortiria ');
       TI_tu     :=(eu+'ortirias ');
       TI_ele    :=(eu+'ortiria ');
       TI_ela    :=(eu+'ortiria ');
       TI_voce   :=(eu+'ortiria ');
       TI_nos    :=(eu+'ortiriamos ');
       TI_vos    :=(eu+'ortirieis ');
       TI_voces  :=(eu+'ortiriam ');
       TI_eles   :=(eu+'ortiriam ');
       TI_elas   :=(eu+'ortiriam ');

       FI_eu     :=(eu+'ortirei ');
       FI_tu     :=(eu+'ortiras ');
       FI_ele    :=(eu+'ortira ');
       FI_ela    :=(eu+'ortira ');
       FI_voce   :=(eu+'ortira ');
       FI_nos    :=(eu+'ortiremos ');
       FI_vos    :=(eu+'ortireis ');
       FI_voces  :=(eu+'ortirão ');
       FI_eles   :=(eu+'ortirão ');
       FI_elas   :=(eu+'ortirão ');

       PS_eu     :=(eu+'urta ');
       PS_tu     :=(eu+'urtas ');
       PS_ele    :=(eu+'urta ');
       PS_ela    :=(eu+'urta ');
       PS_voce   :=(eu+'urta ');
       PS_nos    :=(eu+'urtamos ');
       PS_vos    :=(eu+'urtais ');
       PS_voces  :=(eu+'urtam ');
       PS_eles   :=(eu+'urtam ');
       PS_elas   :=(eu+'urtam ');

       IS_eu     :=(eu+'ortisse ');
       IS_tu     :=(eu+'ortisses ');
       IS_ele    :=(eu+'ortisse ');
       IS_ela    :=(eu+'ortisse ');
       IS_voce   :=(eu+'ortisse ');
       IS_nos    :=(eu+'ortissemos ');
       IS_vos    :=(eu+'ortisseis ');
       IS_voces  :=(eu+'ortissem ');
       IS_eles   :=(eu+'ortissem ');
       IS_elas   :=(eu+'ortissem ');

       FS_eu     :=(eu+'ortir ');
       FS_tu     :=(eu+'ortires ');
       FS_ele    :=(eu+'ortir ');
       FS_ela    :=(eu+'ortir ');
       FS_voce   :=(eu+'ortir ');
       FS_nos    :=(eu+'ortirmos ');
       FS_vos    :=(eu+'ortirdes ');
       FS_voces  :=(eu+'ortirem ');
       FS_eles   :=(eu+'ortirem ');
       FS_elas   :=(eu+'ortirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'urte ');
       IA_ele    :=(eu+'urta ');
       IA_ela    :=(eu+'urta ');
       IA_voce   :=(eu+'urta ');
       IA_nos    :=(eu+'urtamos ');
       IA_vos    :=(eu+'orti ');
       IA_voces  :=(eu+'urtam ');
       IA_eles   :=(eu+'urtam ');
       IA_elas   :=(eu+'urtam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'urtas ');
       IN_ele    :=(eu+'urta ');
       IN_ela    :=(eu+'urta ');
       IN_voce   :=(eu+'urta ');
       IN_nos    :=(eu+'urtamos ');
       IN_vos    :=(eu+'urtais ');
       IN_voces  :=(eu+'urtam ');
       IN_eles   :=(eu+'urtam ');
       IN_elas   :=(eu+'urtam ');

     end;//ortir fim  // eu tu ele///s ortir
    if (pos('edir ',eu) > 1)and  (pos('edir ',eu) < 20) then
     begin//edir inicio
      // term c edir // eu tu ele
      //memo1.lines.add ('edir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'edido ');
       GERf      :=(eu+'edida ');
       GERAm     :=(eu+'esso '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'essa ');
       PART      :=(eu+'edindo ');
       AGENTE1   :=(eu+'edinte ');
       AGENTE2   :=(eu+'edidor ');
       AGENTE3   :=(eu+'edidora ');
       ACAO1     :=(eu+'edimento ');
       ACAO2     :=(eu+'eção ');
       ACAO3     :=(eu+'edimenta ');
       RESU1     :=(eu+'edisso ');
       RESU2     :=(eu+'edissa ');

       IP_eu     :=(eu+'edir ');
       IP_tu     :=(eu+'edires ');
       IP_ele    :=(eu+'edir ');
       IP_ela    :=(eu+'edir ');
       IP_voce   :=(eu+'edir ');
       IP_nos    :=(eu+'edirmos ');
       IP_vos    :=(eu+'edirdes ');
       IP_voces  :=(eu+'edirem ');
       IP_eles   :=(eu+'edirem ');
       IP_elas   :=(eu+'edirem ');

       PI_eu     :=(eu+'ido ');
       PI_tu     :=(eu+'ides ');
       PI_ele    :=(eu+'ide ');
       PI_ela    :=(eu+'ide ');
       PI_voce   :=(eu+'ide ');
       PI_nos    :=(eu+'edimos ');
       PI_vos    :=(eu+'edis ');
       PI_voces  :=(eu+'idem ');
       PI_eles   :=(eu+'idem ');
       PI_elas   :=(eu+'idem ');

       PP_eu     :=(eu+'edi ');
       PP_tu     :=(eu+'ediste ');
       PP_ele    :=(eu+'ediu ');
       PP_ela    :=(eu+'ediu ');
       PP_voce   :=(eu+'ediu ');         //EI
       PP_nos    :=(eu+'edimos ');
       PP_vos    :=(eu+'edistes ');
       PP_voces  :=(eu+'ediram ');
       PP_eles   :=(eu+'ediram ');
       PP_elas   :=(eu+'ediram ');

       II_eu     :=(eu+'edia ');
       II_tu     :=(eu+'edias ');
       II_ele    :=(eu+'edia ');
       II_ela    :=(eu+'edia ');
       II_voce   :=(eu+'edia ');
       II_nos    :=(eu+'ediamos ');
       II_vos    :=(eu+'edieis ');
       II_voces  :=(eu+'ediam ');
       II_eles   :=(eu+'ediam ');
       II_elas   :=(eu+'ediam ');

       MI_eu     :=(eu+'edira ');
       MI_tu     :=(eu+'ediras ');
       MI_ele    :=(eu+'edira ');
       MI_ela    :=(eu+'edira ');
       MI_voce   :=(eu+'edira ');
       MI_nos    :=(eu+'ediramos ');
       MI_vos    :=(eu+'edireis ');
       MI_voces  :=(eu+'ediram ');
       MI_eles   :=(eu+'ediram ');
       MI_elas   :=(eu+'ediram ');

       TI_eu     :=(eu+'ediria ');
       TI_tu     :=(eu+'edirias ');
       TI_ele    :=(eu+'ediria ');
       TI_ela    :=(eu+'ediria ');
       TI_voce   :=(eu+'ediria ');
       TI_nos    :=(eu+'ediriamos ');
       TI_vos    :=(eu+'edirieis ');
       TI_voces  :=(eu+'ediriam ');
       TI_eles   :=(eu+'ediriam ');
       TI_elas   :=(eu+'ediriam ');

       FI_eu     :=(eu+'edirei ');
       FI_tu     :=(eu+'ediras ');
       FI_ele    :=(eu+'edira ');
       FI_ela    :=(eu+'edira ');
       FI_voce   :=(eu+'edira ');
       FI_nos    :=(eu+'ediremos ');
       FI_vos    :=(eu+'edireis ');
       FI_voces  :=(eu+'edirão ');
       FI_eles   :=(eu+'edirão ');
       FI_elas   :=(eu+'edirão ');

       PS_eu     :=(eu+'ida ');
       PS_tu     :=(eu+'idas ');
       PS_ele    :=(eu+'ida ');
       PS_ela    :=(eu+'ida ');
       PS_voce   :=(eu+'ida ');
       PS_nos    :=(eu+'idamos ');
       PS_vos    :=(eu+'idais ');
       PS_voces  :=(eu+'idam ');
       PS_eles   :=(eu+'idam ');
       PS_elas   :=(eu+'idam ');

       IS_eu     :=(eu+'edisse ');
       IS_tu     :=(eu+'edisses ');
       IS_ele    :=(eu+'edisse ');
       IS_ela    :=(eu+'edisse ');
       IS_voce   :=(eu+'edisse ');
       IS_nos    :=(eu+'edissemos ');
       IS_vos    :=(eu+'edisseis ');
       IS_voces  :=(eu+'edissem ');
       IS_eles   :=(eu+'edissem ');
       IS_elas   :=(eu+'edissem ');

       FS_eu     :=(eu+'edir ');
       FS_tu     :=(eu+'edires ');
       FS_ele    :=(eu+'edir ');
       FS_ela    :=(eu+'edir ');
       FS_voce   :=(eu+'edir ');
       FS_nos    :=(eu+'edirmos ');
       FS_vos    :=(eu+'edirdes ');
       FS_voces  :=(eu+'edirem ');
       FS_eles   :=(eu+'edirem ');
       FS_elas   :=(eu+'edirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ide ');
       IA_ele    :=(eu+'ida ');
       IA_ela    :=(eu+'ida ');
       IA_voce   :=(eu+'ida ');
       IA_nos    :=(eu+'idamos ');
       IA_vos    :=(eu+'edi ');
       IA_voces  :=(eu+'idam ');
       IA_eles   :=(eu+'idam ');
       IA_elas   :=(eu+'idam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'idas ');
       IN_ele    :=(eu+'ida ');
       IN_ela    :=(eu+'ida ');
       IN_voce   :=(eu+'ida ');
       IN_nos    :=(eu+'idamos ');
       IN_vos    :=(eu+'idais ');
       IN_voces  :=(eu+'idam ');
       IN_eles   :=(eu+'idam ');
       IN_elas   :=(eu+'idam ');

     end;//edir fim  // eu tu ele//edir
    if (pos('enir ',eu) > 1)and  (pos('enir ',eu) < 20) then
     begin//enir inicio
      // term c enir // eu tu ele
      //memo1.lines.add ('enir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'enido ');
       GERf      :=(eu+'enida ');
       GERAm     :=(eu+'esso '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'esso ');
       PART      :=(eu+'enindo ');
       AGENTE1   :=(eu+'eninte ');
       AGENTE2   :=(eu+'enidor ');
       AGENTE3   :=(eu+'enidora ');
       ACAO1     :=(eu+'enimento ');
       ACAO2     :=(eu+'enção ');
       ACAO3     :=(eu+'enimenta ');
       RESU1     :=(eu+'enisso ');
       RESU2     :=(eu+'enissa ');

       IP_eu     :=(eu+'enir ');
       IP_tu     :=(eu+'enires ');
       IP_ele    :=(eu+'enir ');
       IP_ela    :=(eu+'enir ');
       IP_voce   :=(eu+'enir ');
       IP_nos    :=(eu+'enirmos ');
       IP_vos    :=(eu+'enirdes ');
       IP_voces  :=(eu+'enirem ');
       IP_eles   :=(eu+'enirem ');
       IP_elas   :=(eu+'enirem ');

       PI_eu     :=(eu+'ino ');
       PI_tu     :=(eu+'ines ');
       PI_ele    :=(eu+'ine ');
       PI_ela    :=(eu+'ine ');
       PI_voce   :=(eu+'ine ');
       PI_nos    :=(eu+'enimos ');
       PI_vos    :=(eu+'enis ');
       PI_voces  :=(eu+'inem ');
       PI_eles   :=(eu+'inem ');
       PI_elas   :=(eu+'inem ');

       PP_eu     :=(eu+'eni ');
       PP_tu     :=(eu+'eniste ');
       PP_ele    :=(eu+'eniu ');
       PP_ela    :=(eu+'eniu ');
       PP_voce   :=(eu+'eniu ');         //EI
       PP_nos    :=(eu+'enimos ');
       PP_vos    :=(eu+'enistes ');
       PP_voces  :=(eu+'eniram ');
       PP_eles   :=(eu+'eniram ');
       PP_elas   :=(eu+'eniram ');

       II_eu     :=(eu+'enia ');
       II_tu     :=(eu+'enias ');
       II_ele    :=(eu+'enia ');
       II_ela    :=(eu+'enia ');
       II_voce   :=(eu+'enia ');
       II_nos    :=(eu+'eniamos ');
       II_vos    :=(eu+'enieis ');
       II_voces  :=(eu+'eniam ');
       II_eles   :=(eu+'eniam ');
       II_elas   :=(eu+'eniam ');

       MI_eu     :=(eu+'enira ');
       MI_tu     :=(eu+'eniras ');
       MI_ele    :=(eu+'enira ');
       MI_ela    :=(eu+'enira ');
       MI_voce   :=(eu+'enira ');
       MI_nos    :=(eu+'eniramos ');
       MI_vos    :=(eu+'enireis ');
       MI_voces  :=(eu+'eniram ');
       MI_eles   :=(eu+'eniram ');
       MI_elas   :=(eu+'eniram ');

       TI_eu     :=(eu+'eniria ');
       TI_tu     :=(eu+'enirias ');
       TI_ele    :=(eu+'eniria ');
       TI_ela    :=(eu+'eniria ');
       TI_voce   :=(eu+'eniria ');
       TI_nos    :=(eu+'eniriamos ');
       TI_vos    :=(eu+'enirieis ');
       TI_voces  :=(eu+'eniriam ');
       TI_eles   :=(eu+'eniriam ');
       TI_elas   :=(eu+'eniriam ');

       FI_eu     :=(eu+'enirei ');
       FI_tu     :=(eu+'eniras ');
       FI_ele    :=(eu+'enira ');
       FI_ela    :=(eu+'enira ');
       FI_voce   :=(eu+'enira ');
       FI_nos    :=(eu+'eniremos ');
       FI_vos    :=(eu+'enireis ');
       FI_voces  :=(eu+'enirão ');
       FI_eles   :=(eu+'enirão ');
       FI_elas   :=(eu+'enirão ');

       PS_eu     :=(eu+'ina ');
       PS_tu     :=(eu+'inas ');
       PS_ele    :=(eu+'ina ');
       PS_ela    :=(eu+'ina ');
       PS_voce   :=(eu+'ina ');
       PS_nos    :=(eu+'inamos ');
       PS_vos    :=(eu+'inais ');
       PS_voces  :=(eu+'inam ');
       PS_eles   :=(eu+'inam ');
       PS_elas   :=(eu+'inam ');

       IS_eu     :=(eu+'enisse ');
       IS_tu     :=(eu+'enisses ');
       IS_ele    :=(eu+'enisse ');
       IS_ela    :=(eu+'enisse ');
       IS_voce   :=(eu+'enisse ');
       IS_nos    :=(eu+'enissemos ');
       IS_vos    :=(eu+'enisseis ');
       IS_voces  :=(eu+'enissem ');
       IS_eles   :=(eu+'enissem ');
       IS_elas   :=(eu+'enissem ');

       FS_eu     :=(eu+'enir ');
       FS_tu     :=(eu+'enires ');
       FS_ele    :=(eu+'enir ');
       FS_ela    :=(eu+'enir ');
       FS_voce   :=(eu+'enir ');
       FS_nos    :=(eu+'enirmos ');
       FS_vos    :=(eu+'enirdes ');
       FS_voces  :=(eu+'enirem ');
       FS_eles   :=(eu+'enirem ');
       FS_elas   :=(eu+'enirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ine ');
       IA_ele    :=(eu+'ina ');
       IA_ela    :=(eu+'ina ');
       IA_voce   :=(eu+'ina ');
       IA_nos    :=(eu+'inamos ');
       IA_vos    :=(eu+'eni ');
       IA_voces  :=(eu+'inam ');
       IA_eles   :=(eu+'inam ');
       IA_elas   :=(eu+'inam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'inas ');
       IN_ele    :=(eu+'ina ');
       IN_ela    :=(eu+'ina ');
       IN_voce   :=(eu+'ina ');
       IN_nos    :=(eu+'inamos ');
       IN_vos    :=(eu+'inais ');
       IN_voces  :=(eu+'inam ');
       IN_eles   :=(eu+'inam ');
       IN_elas   :=(eu+'inam ');

     end;//enir fim  // eu tu ele//enir

    if (pos('ubir ',eu) > 1)and  (pos('ubir ',eu) < 20) then
     begin//ubir inicio
      // term c ubir // eu tu ele
      //memo1.lines.add ('ubir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'ubido ');
       GERf      :=(eu+'ubida ');
       GERAm     :=(eu+'ubido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'ubida ');
       PART      :=(eu+'ubindo ');
       AGENTE1   :=(eu+'ubinte ');
       AGENTE2   :=(eu+'ubidor ');
       AGENTE3   :=(eu+'ubidora ');
       ACAO1     :=(eu+'ubimento ');
       ACAO2     :=(eu+'ubição ');
       ACAO3     :=(eu+'ubimenta ');
       RESU1     :=(eu+'ubisso ');
       RESU2     :=(eu+'ubissa ');

       IP_eu     :=(eu+'ubir ');
       IP_tu     :=(eu+'ubires ');
       IP_ele    :=(eu+'ubir ');
       IP_ela    :=(eu+'ubir ');
       IP_voce   :=(eu+'ubir ');
       IP_nos    :=(eu+'ubirmos ');
       IP_vos    :=(eu+'ubirdes ');
       IP_voces  :=(eu+'ubirem ');
       IP_eles   :=(eu+'ubirem ');
       IP_elas   :=(eu+'ubirem ');

       PI_eu     :=(eu+'ubo ');
       PI_tu     :=(eu+'obes ');
       PI_ele    :=(eu+'obe ');
       PI_ela    :=(eu+'obe ');
       PI_voce   :=(eu+'obe ');
       PI_nos    :=(eu+'ubimos ');
       PI_vos    :=(eu+'ubis ');
       PI_voces  :=(eu+'obem ');
       PI_eles   :=(eu+'obem ');
       PI_elas   :=(eu+'obem ');

       PP_eu     :=(eu+'ubi ');
       PP_tu     :=(eu+'ubiste ');
       PP_ele    :=(eu+'ubiu ');
       PP_ela    :=(eu+'ubiu ');
       PP_voce   :=(eu+'ubiu ');         //EI
       PP_nos    :=(eu+'ubimos ');
       PP_vos    :=(eu+'ubistes ');
       PP_voces  :=(eu+'ubiram ');
       PP_eles   :=(eu+'ubiram ');
       PP_elas   :=(eu+'ubiram ');

       II_eu     :=(eu+'ubia ');
       II_tu     :=(eu+'ubias ');
       II_ele    :=(eu+'ubia ');
       II_ela    :=(eu+'ubia ');
       II_voce   :=(eu+'ubia ');
       II_nos    :=(eu+'ubiamos ');
       II_vos    :=(eu+'ubieis ');
       II_voces  :=(eu+'ubiam ');
       II_eles   :=(eu+'ubiam ');
       II_elas   :=(eu+'ubiam ');

       MI_eu     :=(eu+'ubira ');
       MI_tu     :=(eu+'ubiras ');
       MI_ele    :=(eu+'ubira ');
       MI_ela    :=(eu+'ubira ');
       MI_voce   :=(eu+'ubira ');
       MI_nos    :=(eu+'ubiramos ');
       MI_vos    :=(eu+'ubireis ');
       MI_voces  :=(eu+'ubiram ');
       MI_eles   :=(eu+'ubiram ');
       MI_elas   :=(eu+'ubiram ');

       TI_eu     :=(eu+'ubiria ');
       TI_tu     :=(eu+'ubirias ');
       TI_ele    :=(eu+'ubiria ');
       TI_ela    :=(eu+'ubiria ');
       TI_voce   :=(eu+'ubiria ');
       TI_nos    :=(eu+'ubiriamos ');
       TI_vos    :=(eu+'ubirieis ');
       TI_voces  :=(eu+'ubiriam ');
       TI_eles   :=(eu+'ubiriam ');
       TI_elas   :=(eu+'ubiriam ');

       FI_eu     :=(eu+'ubirei ');
       FI_tu     :=(eu+'ubiras ');
       FI_ele    :=(eu+'ubira ');
       FI_ela    :=(eu+'ubira ');
       FI_voce   :=(eu+'ubira ');
       FI_nos    :=(eu+'ubiremos ');
       FI_vos    :=(eu+'ubireis ');
       FI_voces  :=(eu+'ubirão ');
       FI_eles   :=(eu+'ubirão ');
       FI_elas   :=(eu+'ubirão ');

       PS_eu     :=(eu+'uba ');
       PS_tu     :=(eu+'ubas ');
       PS_ele    :=(eu+'uba ');
       PS_ela    :=(eu+'uba ');
       PS_voce   :=(eu+'uba ');
       PS_nos    :=(eu+'ubamos ');
       PS_vos    :=(eu+'ubais ');
       PS_voces  :=(eu+'ubam ');
       PS_eles   :=(eu+'ubam ');
       PS_elas   :=(eu+'ubam ');

       IS_eu     :=(eu+'ubisse ');
       IS_tu     :=(eu+'ubisses ');
       IS_ele    :=(eu+'ubisse ');
       IS_ela    :=(eu+'ubisse ');
       IS_voce   :=(eu+'ubisse ');
       IS_nos    :=(eu+'ubissemos ');
       IS_vos    :=(eu+'ubisseis ');
       IS_voces  :=(eu+'ubissem ');
       IS_eles   :=(eu+'ubissem ');
       IS_elas   :=(eu+'ubissem ');

       FS_eu     :=(eu+'ubir ');
       FS_tu     :=(eu+'ubires ');
       FS_ele    :=(eu+'ubir ');
       FS_ela    :=(eu+'ubir ');
       FS_voce   :=(eu+'ubir ');
       FS_nos    :=(eu+'ubirmos ');
       FS_vos    :=(eu+'ubirdes ');
       FS_voces  :=(eu+'ubirem ');
       FS_eles   :=(eu+'ubirem ');
       FS_elas   :=(eu+'ubirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'obe ');
       IA_ele    :=(eu+'uba ');
       IA_ela    :=(eu+'uba ');
       IA_voce   :=(eu+'uba ');
       IA_nos    :=(eu+'ubamos ');
       IA_vos    :=(eu+'ubi ');
       IA_voces  :=(eu+'ubam ');
       IA_eles   :=(eu+'ubam ');
       IA_elas   :=(eu+'ubam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ubas ');
       IN_ele    :=(eu+'uba ');
       IN_ela    :=(eu+'uba ');
       IN_voce   :=(eu+'uba ');
       IN_nos    :=(eu+'ubamos ');
       IN_vos    :=(eu+'ubais ');
       IN_voces  :=(eu+'ubam ');
       IN_eles   :=(eu+'ubam ');
       IN_elas   :=(eu+'ubam ');

     end;//ubir fim  // eu tu ele//ubir
    if (pos('ulir ',eu) > 1)and  (pos('ulir ',eu) < 20) then
     begin//ulir inicio
      // term c ulir // eu tu ele
      //memo1.lines.add ('ulir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'ulido ');
       GERf      :=(eu+'ulida ');
       GERAm     :=(eu+'ulido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'ulida ');
       PART      :=(eu+'ulindo ');
       AGENTE1   :=(eu+'ulinte ');
       AGENTE2   :=(eu+'ulidor ');
       AGENTE3   :=(eu+'ulidora ');
       ACAO1     :=(eu+'ulimento ');
       ACAO2     :=(eu+'ulição ');
       ACAO3     :=(eu+'ulimenta ');
       RESU1     :=(eu+'ulisso ');
       RESU2     :=(eu+'ulissa ');

       IP_eu     :=(eu+'ulir ');
       IP_tu     :=(eu+'ulires ');
       IP_ele    :=(eu+'ulir ');
       IP_ela    :=(eu+'ulir ');
       IP_voce   :=(eu+'ulir ');
       IP_nos    :=(eu+'ulirmos ');
       IP_vos    :=(eu+'ulirdes ');
       IP_voces  :=(eu+'ulirem ');
       IP_eles   :=(eu+'ulirem ');
       IP_elas   :=(eu+'ulirem ');

       PI_eu     :=(eu+'ulo ');
       PI_tu     :=(eu+'oles ');
       PI_ele    :=(eu+'ole ');
       PI_ela    :=(eu+'ole ');
       PI_voce   :=(eu+'ole ');
       PI_nos    :=(eu+'ulimos ');
       PI_vos    :=(eu+'ulis ');
       PI_voces  :=(eu+'olem ');
       PI_eles   :=(eu+'olem ');
       PI_elas   :=(eu+'olem ');

       PP_eu     :=(eu+'uli ');
       PP_tu     :=(eu+'uliste ');
       PP_ele    :=(eu+'uliu ');
       PP_ela    :=(eu+'uliu ');
       PP_voce   :=(eu+'uliu ');         //EI
       PP_nos    :=(eu+'ulimos ');
       PP_vos    :=(eu+'ulistes ');
       PP_voces  :=(eu+'uliram ');
       PP_eles   :=(eu+'uliram ');
       PP_elas   :=(eu+'uliram ');

       II_eu     :=(eu+'ulia ');
       II_tu     :=(eu+'ulias ');
       II_ele    :=(eu+'ulia ');
       II_ela    :=(eu+'ulia ');
       II_voce   :=(eu+'ulia ');
       II_nos    :=(eu+'uliamos ');
       II_vos    :=(eu+'ulieis ');
       II_voces  :=(eu+'uliam ');
       II_eles   :=(eu+'uliam ');
       II_elas   :=(eu+'uliam ');

       MI_eu     :=(eu+'ulira ');
       MI_tu     :=(eu+'uliras ');
       MI_ele    :=(eu+'ulira ');
       MI_ela    :=(eu+'ulira ');
       MI_voce   :=(eu+'ulira ');
       MI_nos    :=(eu+'uliramos ');
       MI_vos    :=(eu+'ulireis ');
       MI_voces  :=(eu+'uliram ');
       MI_eles   :=(eu+'uliram ');
       MI_elas   :=(eu+'uliram ');

       TI_eu     :=(eu+'uliria ');
       TI_tu     :=(eu+'ulirias ');
       TI_ele    :=(eu+'uliria ');
       TI_ela    :=(eu+'uliria ');
       TI_voce   :=(eu+'uliria ');
       TI_nos    :=(eu+'uliriamos ');
       TI_vos    :=(eu+'ulirieis ');
       TI_voces  :=(eu+'uliriam ');
       TI_eles   :=(eu+'uliriam ');
       TI_elas   :=(eu+'uliriam ');

       FI_eu     :=(eu+'ulirei ');
       FI_tu     :=(eu+'uliras ');
       FI_ele    :=(eu+'ulira ');
       FI_ela    :=(eu+'ulira ');
       FI_voce   :=(eu+'ulira ');
       FI_nos    :=(eu+'uliremos ');
       FI_vos    :=(eu+'ulireis ');
       FI_voces  :=(eu+'ulirão ');
       FI_eles   :=(eu+'ulirão ');
       FI_elas   :=(eu+'ulirão ');

       PS_eu     :=(eu+'ula ');
       PS_tu     :=(eu+'ulas ');
       PS_ele    :=(eu+'ula ');
       PS_ela    :=(eu+'ula ');
       PS_voce   :=(eu+'ula ');
       PS_nos    :=(eu+'ulamos ');
       PS_vos    :=(eu+'ulais ');
       PS_voces  :=(eu+'ulam ');
       PS_eles   :=(eu+'ulam ');
       PS_elas   :=(eu+'ulam ');

       IS_eu     :=(eu+'ulisse ');
       IS_tu     :=(eu+'ulisses ');
       IS_ele    :=(eu+'ulisse ');
       IS_ela    :=(eu+'ulisse ');
       IS_voce   :=(eu+'ulisse ');
       IS_nos    :=(eu+'ulissemos ');
       IS_vos    :=(eu+'ulisseis ');
       IS_voces  :=(eu+'ulissem ');
       IS_eles   :=(eu+'ulissem ');
       IS_elas   :=(eu+'ulissem ');

       FS_eu     :=(eu+'ulir ');
       FS_tu     :=(eu+'ulires ');
       FS_ele    :=(eu+'ulir ');
       FS_ela    :=(eu+'ulir ');
       FS_voce   :=(eu+'ulir ');
       FS_nos    :=(eu+'ulirmos ');
       FS_vos    :=(eu+'ulirdes ');
       FS_voces  :=(eu+'ulirem ');
       FS_eles   :=(eu+'ulirem ');
       FS_elas   :=(eu+'ulirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ole ');
       IA_ele    :=(eu+'ula ');
       IA_ela    :=(eu+'ula ');
       IA_voce   :=(eu+'ula ');
       IA_nos    :=(eu+'ulamos ');
       IA_vos    :=(eu+'uli ');
       IA_voces  :=(eu+'ulam ');
       IA_eles   :=(eu+'ulam ');
       IA_elas   :=(eu+'ulam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ulas ');
       IN_ele    :=(eu+'ula ');
       IN_ela    :=(eu+'ula ');
       IN_voce   :=(eu+'ula ');
       IN_nos    :=(eu+'ulamos ');
       IN_vos    :=(eu+'ulais ');
       IN_voces  :=(eu+'ulam ');
       IN_eles   :=(eu+'ulam ');
       IN_elas   :=(eu+'ulam ');

     end;//bulir fim  // eu tu ele//ulir
    if (pos('uspir ',eu) > 1)and  (pos('uspir ',eu) < 20) then
     begin//uspir inicio
      // term c uspir // eu tu ele
      //memo1.lines.add ('uspir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'uspido ');
       GERf      :=(eu+'uspida ');
       GERAm     :=(eu+'uspido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'uspida ');
       PART      :=(eu+'uspindo ');
       AGENTE1   :=(eu+'uspinte ');
       AGENTE2   :=(eu+'uspidor ');
       AGENTE3   :=(eu+'uspidora ');
       ACAO1     :=(eu+'uspimento ');
       ACAO2     :=(eu+'uspição ');
       ACAO3     :=(eu+'uspimenta ');
       RESU1     :=(eu+'uspisso ');
       RESU2     :=(eu+'uspissa ');

       IP_eu     :=(eu+'uspir ');
       IP_tu     :=(eu+'uspires ');
       IP_ele    :=(eu+'uspir ');
       IP_ela    :=(eu+'uspir ');
       IP_voce   :=(eu+'uspir ');
       IP_nos    :=(eu+'uspirmos ');
       IP_vos    :=(eu+'uspirdes ');
       IP_voces  :=(eu+'uspirem ');
       IP_eles   :=(eu+'uspirem ');
       IP_elas   :=(eu+'uspirem ');

       PI_eu     :=(eu+'uspo ');
       PI_tu     :=(eu+'ospes ');
       PI_ele    :=(eu+'ospe ');
       PI_ela    :=(eu+'ospe ');
       PI_voce   :=(eu+'ospe ');
       PI_nos    :=(eu+'uspimos ');
       PI_vos    :=(eu+'uspis ');
       PI_voces  :=(eu+'ospem ');
       PI_eles   :=(eu+'ospem ');
       PI_elas   :=(eu+'ospem ');

       PP_eu     :=(eu+'uspi ');
       PP_tu     :=(eu+'uspiste ');
       PP_ele    :=(eu+'uspiu ');
       PP_ela    :=(eu+'uspiu ');
       PP_voce   :=(eu+'uspiu ');         //EI
       PP_nos    :=(eu+'uspimos ');
       PP_vos    :=(eu+'uspistes ');
       PP_voces  :=(eu+'uspiram ');
       PP_eles   :=(eu+'uspiram ');
       PP_elas   :=(eu+'uspiram ');

       II_eu     :=(eu+'uspia ');
       II_tu     :=(eu+'uspias ');
       II_ele    :=(eu+'uspia ');
       II_ela    :=(eu+'uspia ');
       II_voce   :=(eu+'uspia ');
       II_nos    :=(eu+'uspiamos ');
       II_vos    :=(eu+'uspieis ');
       II_voces  :=(eu+'uspiam ');
       II_eles   :=(eu+'uspiam ');
       II_elas   :=(eu+'uspiam ');

       MI_eu     :=(eu+'uspira ');
       MI_tu     :=(eu+'uspiras ');
       MI_ele    :=(eu+'uspira ');
       MI_ela    :=(eu+'uspira ');
       MI_voce   :=(eu+'uspira ');
       MI_nos    :=(eu+'uspiramos ');
       MI_vos    :=(eu+'uspireis ');
       MI_voces  :=(eu+'uspiram ');
       MI_eles   :=(eu+'uspiram ');
       MI_elas   :=(eu+'uspiram ');

       TI_eu     :=(eu+'uspiria ');
       TI_tu     :=(eu+'uspirias ');
       TI_ele    :=(eu+'uspiria ');
       TI_ela    :=(eu+'uspiria ');
       TI_voce   :=(eu+'uspiria ');
       TI_nos    :=(eu+'uspiriamos ');
       TI_vos    :=(eu+'uspirieis ');
       TI_voces  :=(eu+'uspiriam ');
       TI_eles   :=(eu+'uspiriam ');
       TI_elas   :=(eu+'uspiriam ');

       FI_eu     :=(eu+'uspirei ');
       FI_tu     :=(eu+'uspiras ');
       FI_ele    :=(eu+'uspira ');
       FI_ela    :=(eu+'uspira ');
       FI_voce   :=(eu+'uspira ');
       FI_nos    :=(eu+'uspiremos ');
       FI_vos    :=(eu+'uspireis ');
       FI_voces  :=(eu+'uspirão ');
       FI_eles   :=(eu+'uspirão ');
       FI_elas   :=(eu+'uspirão ');

       PS_eu     :=(eu+'uspa ');
       PS_tu     :=(eu+'uspas ');
       PS_ele    :=(eu+'uspa ');
       PS_ela    :=(eu+'uspa ');
       PS_voce   :=(eu+'uspa ');
       PS_nos    :=(eu+'uspamos ');
       PS_vos    :=(eu+'uspais ');
       PS_voces  :=(eu+'uspam ');
       PS_eles   :=(eu+'uspam ');
       PS_elas   :=(eu+'uspam ');

       IS_eu     :=(eu+'uspisse ');
       IS_tu     :=(eu+'uspisses ');
       IS_ele    :=(eu+'uspisse ');
       IS_ela    :=(eu+'uspisse ');
       IS_voce   :=(eu+'uspisse ');
       IS_nos    :=(eu+'uspissemos ');
       IS_vos    :=(eu+'uspisseis ');
       IS_voces  :=(eu+'uspissem ');
       IS_eles   :=(eu+'uspissem ');
       IS_elas   :=(eu+'uspissem ');

       FS_eu     :=(eu+'uspir ');
       FS_tu     :=(eu+'uspires ');
       FS_ele    :=(eu+'uspir ');
       FS_ela    :=(eu+'uspir ');
       FS_voce   :=(eu+'uspir ');
       FS_nos    :=(eu+'uspirmos ');
       FS_vos    :=(eu+'uspirdes ');
       FS_voces  :=(eu+'uspirem ');
       FS_eles   :=(eu+'uspirem ');
       FS_elas   :=(eu+'uspirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ospe ');
       IA_ele    :=(eu+'uspa ');
       IA_ela    :=(eu+'uspa ');
       IA_voce   :=(eu+'uspa ');
       IA_nos    :=(eu+'uspamos ');
       IA_vos    :=(eu+'uspi ');
       IA_voces  :=(eu+'uspam ');
       IA_eles   :=(eu+'uspam ');
       IA_elas   :=(eu+'uspam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'uspas ');
       IN_ele    :=(eu+'uspa ');
       IN_ela    :=(eu+'uspa ');
       IN_voce   :=(eu+'uspa ');
       IN_nos    :=(eu+'uspamos ');
       IN_vos    :=(eu+'uspais ');
       IN_voces  :=(eu+'uspam ');
       IN_eles   :=(eu+'uspam ');
       IN_elas   :=(eu+'uspam ');

     end;//uspir fim  // eu tu ele//uspir
    if (pos('udir ',eu) > 1)and  (pos('udir ',eu) < 20) then
     begin//udir inicio
      // term c udir // eu tu ele
      //memo1.lines.add ('udir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'udido ');
       GERf      :=(eu+'udida ');
       GERAm     :=(eu+'udido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'udida ');
       PART      :=(eu+'udindo ');
       AGENTE1   :=(eu+'udinte ');
       AGENTE2   :=(eu+'udidor ');
       AGENTE3   :=(eu+'udidora ');
       ACAO1     :=(eu+'udimento ');
       ACAO2     :=(eu+'udição ');
       ACAO3     :=(eu+'udimenta ');
       RESU1     :=(eu+'udisso ');
       RESU2     :=(eu+'udissa ');

       IP_eu     :=(eu+'udir ');
       IP_tu     :=(eu+'udires ');
       IP_ele    :=(eu+'udir ');
       IP_ela    :=(eu+'udir ');
       IP_voce   :=(eu+'udir ');
       IP_nos    :=(eu+'udirmos ');
       IP_vos    :=(eu+'udirdes ');
       IP_voces  :=(eu+'udirem ');
       IP_eles   :=(eu+'udirem ');
       IP_elas   :=(eu+'udirem ');

       PI_eu     :=(eu+'udo ');
       PI_tu     :=(eu+'odes ');
       PI_ele    :=(eu+'ode ');
       PI_ela    :=(eu+'ode ');
       PI_voce   :=(eu+'ode ');
       PI_nos    :=(eu+'udimos ');
       PI_vos    :=(eu+'udis ');
       PI_voces  :=(eu+'odem ');
       PI_eles   :=(eu+'odem ');
       PI_elas   :=(eu+'odem ');

       PP_eu     :=(eu+'udi ');
       PP_tu     :=(eu+'udiste ');
       PP_ele    :=(eu+'udiu ');
       PP_ela    :=(eu+'udiu ');
       PP_voce   :=(eu+'udiu ');         //EI
       PP_nos    :=(eu+'udimos ');
       PP_vos    :=(eu+'udistes ');
       PP_voces  :=(eu+'udiram ');
       PP_eles   :=(eu+'udiram ');
       PP_elas   :=(eu+'udiram ');

       II_eu     :=(eu+'udia ');
       II_tu     :=(eu+'udias ');
       II_ele    :=(eu+'udia ');
       II_ela    :=(eu+'udia ');
       II_voce   :=(eu+'udia ');
       II_nos    :=(eu+'udiamos ');
       II_vos    :=(eu+'udieis ');
       II_voces  :=(eu+'udiam ');
       II_eles   :=(eu+'udiam ');
       II_elas   :=(eu+'udiam ');

       MI_eu     :=(eu+'udira ');
       MI_tu     :=(eu+'udiras ');
       MI_ele    :=(eu+'udira ');
       MI_ela    :=(eu+'udira ');
       MI_voce   :=(eu+'udira ');
       MI_nos    :=(eu+'udiramos ');
       MI_vos    :=(eu+'udireis ');
       MI_voces  :=(eu+'udiram ');
       MI_eles   :=(eu+'udiram ');
       MI_elas   :=(eu+'udiram ');

       TI_eu     :=(eu+'udiria ');
       TI_tu     :=(eu+'udirias ');
       TI_ele    :=(eu+'udiria ');
       TI_ela    :=(eu+'udiria ');
       TI_voce   :=(eu+'udiria ');
       TI_nos    :=(eu+'udiriamos ');
       TI_vos    :=(eu+'udirieis ');
       TI_voces  :=(eu+'udiriam ');
       TI_eles   :=(eu+'udiriam ');
       TI_elas   :=(eu+'udiriam ');

       FI_eu     :=(eu+'udirei ');
       FI_tu     :=(eu+'udiras ');
       FI_ele    :=(eu+'udira ');
       FI_ela    :=(eu+'udira ');
       FI_voce   :=(eu+'udira ');
       FI_nos    :=(eu+'udiremos ');
       FI_vos    :=(eu+'udireis ');
       FI_voces  :=(eu+'udirão ');
       FI_eles   :=(eu+'udirão ');
       FI_elas   :=(eu+'udirão ');

       PS_eu     :=(eu+'uda ');
       PS_tu     :=(eu+'udas ');
       PS_ele    :=(eu+'uda ');
       PS_ela    :=(eu+'uda ');
       PS_voce   :=(eu+'uda ');
       PS_nos    :=(eu+'udamos ');
       PS_vos    :=(eu+'udais ');
       PS_voces  :=(eu+'udam ');
       PS_eles   :=(eu+'udam ');
       PS_elas   :=(eu+'udam ');

       IS_eu     :=(eu+'udisse ');
       IS_tu     :=(eu+'udisses ');
       IS_ele    :=(eu+'udisse ');
       IS_ela    :=(eu+'udisse ');
       IS_voce   :=(eu+'udisse ');
       IS_nos    :=(eu+'udissemos ');
       IS_vos    :=(eu+'udisseis ');
       IS_voces  :=(eu+'udissem ');
       IS_eles   :=(eu+'udissem ');
       IS_elas   :=(eu+'udissem ');

       FS_eu     :=(eu+'udir ');
       FS_tu     :=(eu+'udires ');
       FS_ele    :=(eu+'udir ');
       FS_ela    :=(eu+'udir ');
       FS_voce   :=(eu+'udir ');
       FS_nos    :=(eu+'udirmos ');
       FS_vos    :=(eu+'udirdes ');
       FS_voces  :=(eu+'udirem ');
       FS_eles   :=(eu+'udirem ');
       FS_elas   :=(eu+'udirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ode ');
       IA_ele    :=(eu+'uda ');
       IA_ela    :=(eu+'uda ');
       IA_voce   :=(eu+'uda ');
       IA_nos    :=(eu+'udamos ');
       IA_vos    :=(eu+'udi ');
       IA_voces  :=(eu+'udam ');
       IA_eles   :=(eu+'udam ');
       IA_elas   :=(eu+'udam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'udas ');
       IN_ele    :=(eu+'uda ');
       IN_ela    :=(eu+'uda ');
       IN_voce   :=(eu+'uda ');
       IN_nos    :=(eu+'udamos ');
       IN_vos    :=(eu+'udais ');
       IN_voces  :=(eu+'udam ');
       IN_eles   :=(eu+'udam ');
       IN_elas   :=(eu+'udam ');

     end;//udir fim  // eu tu ele//udir
    if (pos('umir ',eu) > 1)and  (pos('umir ',eu) < 20) then
     begin//umir inicio
      // term c umir // eu tu ele
      //memo1.lines.add ('umir');
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'umido ');
       GERf      :=(eu+'umida ');
       GERAm     :=(eu+'umido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'umida ');
       PART      :=(eu+'umindo ');
       AGENTE1   :=(eu+'uminte ');
       AGENTE2   :=(eu+'umidor ');
       AGENTE3   :=(eu+'umidora ');
       ACAO1     :=(eu+'umimento ');
       ACAO2     :=(eu+'umição ');
       ACAO3     :=(eu+'umimenta ');
       RESU1     :=(eu+'umisso ');
       RESU2     :=(eu+'umissa ');

       IP_eu     :=(eu+'umir ');
       IP_tu     :=(eu+'umires ');
       IP_ele    :=(eu+'umir ');
       IP_ela    :=(eu+'umir ');
       IP_voce   :=(eu+'umir ');
       IP_nos    :=(eu+'umirmos ');
       IP_vos    :=(eu+'umirdes ');
       IP_voces  :=(eu+'umirem ');
       IP_eles   :=(eu+'umirem ');
       IP_elas   :=(eu+'umirem ');

       PI_eu     :=(eu+'umo ');
       PI_tu     :=(eu+'omes ');
       PI_ele    :=(eu+'ome ');
       PI_ela    :=(eu+'ome ');
       PI_voce   :=(eu+'ome ');
       PI_nos    :=(eu+'umimos ');
       PI_vos    :=(eu+'umis ');
       PI_voces  :=(eu+'omem ');
       PI_eles   :=(eu+'omem ');
       PI_elas   :=(eu+'omem ');

       PP_eu     :=(eu+'umi ');
       PP_tu     :=(eu+'umiste ');
       PP_ele    :=(eu+'umiu ');
       PP_ela    :=(eu+'umiu ');
       PP_voce   :=(eu+'umiu ');         //EI
       PP_nos    :=(eu+'umimos ');
       PP_vos    :=(eu+'umistes ');
       PP_voces  :=(eu+'umiram ');
       PP_eles   :=(eu+'umiram ');
       PP_elas   :=(eu+'umiram ');

       II_eu     :=(eu+'umia ');
       II_tu     :=(eu+'umias ');
       II_ele    :=(eu+'umia ');
       II_ela    :=(eu+'umia ');
       II_voce   :=(eu+'umia ');
       II_nos    :=(eu+'umiamos ');
       II_vos    :=(eu+'umieis ');
       II_voces  :=(eu+'umiam ');
       II_eles   :=(eu+'umiam ');
       II_elas   :=(eu+'umiam ');

       MI_eu     :=(eu+'umira ');
       MI_tu     :=(eu+'umiras ');
       MI_ele    :=(eu+'umira ');
       MI_ela    :=(eu+'umira ');
       MI_voce   :=(eu+'umira ');
       MI_nos    :=(eu+'umiramos ');
       MI_vos    :=(eu+'umireis ');
       MI_voces  :=(eu+'umiram ');
       MI_eles   :=(eu+'umiram ');
       MI_elas   :=(eu+'umiram ');

       TI_eu     :=(eu+'umiria ');
       TI_tu     :=(eu+'umirias ');
       TI_ele    :=(eu+'umiria ');
       TI_ela    :=(eu+'umiria ');
       TI_voce   :=(eu+'umiria ');
       TI_nos    :=(eu+'umiriamos ');
       TI_vos    :=(eu+'umirieis ');
       TI_voces  :=(eu+'umiriam ');
       TI_eles   :=(eu+'umiriam ');
       TI_elas   :=(eu+'umiriam ');

       FI_eu     :=(eu+'umirei ');
       FI_tu     :=(eu+'umiras ');
       FI_ele    :=(eu+'umira ');
       FI_ela    :=(eu+'umira ');
       FI_voce   :=(eu+'umira ');
       FI_nos    :=(eu+'umiremos ');
       FI_vos    :=(eu+'umireis ');
       FI_voces  :=(eu+'umirão ');
       FI_eles   :=(eu+'umirão ');
       FI_elas   :=(eu+'umirão ');

       PS_eu     :=(eu+'uma ');
       PS_tu     :=(eu+'umas ');
       PS_ele    :=(eu+'uma ');
       PS_ela    :=(eu+'uma ');
       PS_voce   :=(eu+'uma ');
       PS_nos    :=(eu+'umamos ');
       PS_vos    :=(eu+'umais ');
       PS_voces  :=(eu+'umam ');
       PS_eles   :=(eu+'umam ');
       PS_elas   :=(eu+'umam ');

       IS_eu     :=(eu+'umisse ');
       IS_tu     :=(eu+'umisses ');
       IS_ele    :=(eu+'umisse ');
       IS_ela    :=(eu+'umisse ');
       IS_voce   :=(eu+'umisse ');
       IS_nos    :=(eu+'umissemos ');
       IS_vos    :=(eu+'umisseis ');
       IS_voces  :=(eu+'umissem ');
       IS_eles   :=(eu+'umissem ');
       IS_elas   :=(eu+'umissem ');

       FS_eu     :=(eu+'umir ');
       FS_tu     :=(eu+'umires ');
       FS_ele    :=(eu+'umir ');
       FS_ela    :=(eu+'umir ');
       FS_voce   :=(eu+'umir ');
       FS_nos    :=(eu+'umirmos ');
       FS_vos    :=(eu+'umirdes ');
       FS_voces  :=(eu+'umirem ');
       FS_eles   :=(eu+'umirem ');
       FS_elas   :=(eu+'umirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ome ');
       IA_ele    :=(eu+'uma ');
       IA_ela    :=(eu+'uma ');
       IA_voce   :=(eu+'uma ');
       IA_nos    :=(eu+'umamos ');
       IA_vos    :=(eu+'umi ');
       IA_voces  :=(eu+'umam ');
       IA_eles   :=(eu+'umam ');
       IA_elas   :=(eu+'umam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'umas ');
       IN_ele    :=(eu+'uma ');
       IN_ela    :=(eu+'uma ');
       IN_voce   :=(eu+'uma ');
       IN_nos    :=(eu+'umamos ');
       IN_vos    :=(eu+'umais ');
       IN_voces  :=(eu+'umam ');
       IN_eles   :=(eu+'umam ');
       IN_elas   :=(eu+'umam ');

     end;//umir fim  // eu tu ele//umir
    if (pos('ouvir ',eu) > 0)and  (pos('ouvir ',eu) < 20) then
     begin//ouvir inicio
      // term c ouvir // eu tu ele
      //memo1.lines.add ('ouvir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'ouvido ');
       GERf      :=(eu+'ouvida ');
       GERAm     :=(eu+'ouvido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'ouvida ');
       PART      :=(eu+'ouvindo ');
       AGENTE1   :=(eu+'ouvinte ');
       AGENTE2   :=(eu+'ouvidor ');
       AGENTE3   :=(eu+'ouidora ');
       ACAO1     :=(eu+'ouvimento ');
       ACAO2     :=(eu+'ouvição ');
       ACAO3     :=(eu+'ouvimenta ');
       RESU1     :=(eu+'ouvisso ');
       RESU2     :=(eu+'ouvissa ');

       IP_eu     :=(eu+'ouvir ');
       IP_tu     :=(eu+'ouvires ');
       IP_ele    :=(eu+'ouvir ');
       IP_ela    :=(eu+'ouvir ');
       IP_voce   :=(eu+'ouvir ');
       IP_nos    :=(eu+'ouvirmos ');
       IP_vos    :=(eu+'ouvirdes ');
       IP_voces  :=(eu+'ouvirem ');
       IP_eles   :=(eu+'ouvirem ');
       IP_elas   :=(eu+'ouvirem ');

       PI_eu     :=(eu+'ouço ');
       PI_tu     :=(eu+'oues ');
       PI_ele    :=(eu+'ouve ');
       PI_ela    :=(eu+'ouve ');
       PI_voce   :=(eu+'ouve ');
       PI_nos    :=(eu+'ouvimos ');
       PI_vos    :=(eu+'ouvis ');
       PI_voces  :=(eu+'ouvem ');
       PI_eles   :=(eu+'ouvem ');
       PI_elas   :=(eu+'ouvem ');

       PP_eu     :=(eu+'ouvi ');
       PP_tu     :=(eu+'ouviste ');
       PP_ele    :=(eu+'ouviu ');
       PP_ela    :=(eu+'ouviu ');
       PP_voce   :=(eu+'ouviu ');         //EI
       PP_nos    :=(eu+'ouvimos ');
       PP_vos    :=(eu+'ouvistes ');
       PP_voces  :=(eu+'ouviram ');
       PP_eles   :=(eu+'ouviram ');
       PP_elas   :=(eu+'ouviram ');

       II_eu     :=(eu+'ouvia ');
       II_tu     :=(eu+'ouvias ');
       II_ele    :=(eu+'ouvia ');
       II_ela    :=(eu+'ouvia ');
       II_voce   :=(eu+'ouvia ');
       II_nos    :=(eu+'ouviamos ');
       II_vos    :=(eu+'ouvieis ');
       II_voces  :=(eu+'ouviam ');
       II_eles   :=(eu+'ouviam ');
       II_elas   :=(eu+'ouviam ');

       MI_eu     :=(eu+'ouvira ');
       MI_tu     :=(eu+'ouviras ');
       MI_ele    :=(eu+'ouvira ');
       MI_ela    :=(eu+'ouvira ');
       MI_voce   :=(eu+'ouvira ');
       MI_nos    :=(eu+'ouviramos ');
       MI_vos    :=(eu+'ouvireis ');
       MI_voces  :=(eu+'ouviram ');
       MI_eles   :=(eu+'ouviram ');
       MI_elas   :=(eu+'ouviram ');

       TI_eu     :=(eu+'ouviria ');
       TI_tu     :=(eu+'ouvirias ');
       TI_ele    :=(eu+'ouviria ');
       TI_ela    :=(eu+'ouviria ');
       TI_voce   :=(eu+'ouviria ');
       TI_nos    :=(eu+'ouviriamos ');
       TI_vos    :=(eu+'ouvirieis ');
       TI_voces  :=(eu+'ouviriam ');
       TI_eles   :=(eu+'ouviriam ');
       TI_elas   :=(eu+'ouviriam ');

       FI_eu     :=(eu+'ouvirei ');
       FI_tu     :=(eu+'ouviras ');
       FI_ele    :=(eu+'ouvira ');
       FI_ela    :=(eu+'ouvira ');
       FI_voce   :=(eu+'ouvira ');
       FI_nos    :=(eu+'ouviremos ');
       FI_vos    :=(eu+'ouvireis ');
       FI_voces  :=(eu+'ouvirão ');
       FI_eles   :=(eu+'ouvirão ');
       FI_elas   :=(eu+'ouvirão ');

       PS_eu     :=(eu+'ouça ');
       PS_tu     :=(eu+'ouças ');
       PS_ele    :=(eu+'ouça ');
       PS_ela    :=(eu+'ouça ');
       PS_voce   :=(eu+'ouça ');
       PS_nos    :=(eu+'ouçamos ');
       PS_vos    :=(eu+'ouçais ');
       PS_voces  :=(eu+'ouçam ');
       PS_eles   :=(eu+'ouçam ');
       PS_elas   :=(eu+'ouçam ');

       IS_eu     :=(eu+'ouvisse ');
       IS_tu     :=(eu+'ouvisses ');
       IS_ele    :=(eu+'ouvisse ');
       IS_ela    :=(eu+'ouvisse ');
       IS_voce   :=(eu+'ouvisse ');
       IS_nos    :=(eu+'ouvissemos ');
       IS_vos    :=(eu+'ouvisseis ');
       IS_voces  :=(eu+'ouvissem ');
       IS_eles   :=(eu+'ouvissem ');
       IS_elas   :=(eu+'ouvissem ');

       FS_eu     :=(eu+'ouvir ');
       FS_tu     :=(eu+'ouvires ');
       FS_ele    :=(eu+'ouvir ');
       FS_ela    :=(eu+'ouvir ');
       FS_voce   :=(eu+'ouvir ');
       FS_nos    :=(eu+'ouvirmos ');
       FS_vos    :=(eu+'ouvirdes ');
       FS_voces  :=(eu+'ouvirem ');
       FS_eles   :=(eu+'ouvirem ');
       FS_elas   :=(eu+'ouvirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ouve ');
       IA_ele    :=(eu+'ouça ');
       IA_ela    :=(eu+'ouça ');
       IA_voce   :=(eu+'ouça ');
       IA_nos    :=(eu+'ouçamos ');
       IA_vos    :=(eu+'ouvi ');
       IA_voces  :=(eu+'ouçam ');
       IA_eles   :=(eu+'ouçam ');
       IA_elas   :=(eu+'ouçam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ouças ');
       IN_ele    :=(eu+'ouça ');
       IN_ela    :=(eu+'ouça ');
       IN_voce   :=(eu+'ouça ');
       IN_nos    :=(eu+'ouçamos ');
       IN_vos    :=(eu+'ouçais ');
       IN_voces  :=(eu+'ouçam ');
       IN_eles   :=(eu+'ouçam ');
       IN_elas   :=(eu+'ouçam ');

     end//ouvir meio  // eu tu ele//ouvir
    else
     begin //ouvir contin
      if (pos('ervir ',eu) > 1)and  (pos('ervir ',eu) < 20) then
       begin//ervir inicio
          // term c ervir // eu tu ele
       //   f.lines.add ('ervir');
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'ervido ');
       GERf      :=(eu+'ervida ');
       GERAm     :=(eu+'ervido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'ervida ');
       PART      :=(eu+'ervindo ');
       AGENTE1   :=(eu+'ervente ');
       AGENTE2   :=(eu+'ervidor ');
       AGENTE3   :=(eu+'ervidora ');
       ACAO1     :=(eu+'ervimento ');
       ACAO2     :=(eu+'ervição ');
       ACAO3     :=(eu+'ervimenta ');
       RESU1     :=(eu+'ervisso ');
       RESU2     :=(eu+'ervissa ');

       IP_eu     :=(eu+'ervir ');
       IP_tu     :=(eu+'ervires ');
       IP_ele    :=(eu+'ervir ');
       IP_ela    :=(eu+'ervir ');
       IP_voce   :=(eu+'ervir ');
       IP_nos    :=(eu+'ervirmos ');
       IP_vos    :=(eu+'ervirdes ');
       IP_voces  :=(eu+'ervirem ');
       IP_eles   :=(eu+'ervirem ');
       IP_elas   :=(eu+'ervirem ');

       PI_eu     :=(eu+'irvo ');
       PI_tu     :=(eu+'erves ');
       PI_ele    :=(eu+'erve ');
       PI_ela    :=(eu+'erve ');
       PI_voce   :=(eu+'erve ');
       PI_nos    :=(eu+'ervimos ');
       PI_vos    :=(eu+'ervis ');
       PI_voces  :=(eu+'ervem ');
       PI_eles   :=(eu+'ervem ');
       PI_elas   :=(eu+'ervem ');

       PP_eu     :=(eu+'ervi ');
       PP_tu     :=(eu+'erviste ');
       PP_ele    :=(eu+'erviu ');
       PP_ela    :=(eu+'erviu ');
       PP_voce   :=(eu+'erviu ');         //EI
       PP_nos    :=(eu+'ervimos ');
       PP_vos    :=(eu+'ervistes ');
       PP_voces  :=(eu+'erviram ');
       PP_eles   :=(eu+'erviram ');
       PP_elas   :=(eu+'erviram ');

       II_eu     :=(eu+'ervia ');
       II_tu     :=(eu+'ervias ');
       II_ele    :=(eu+'ervia ');
       II_ela    :=(eu+'ervia ');
       II_voce   :=(eu+'ervia ');
       II_nos    :=(eu+'erviamos ');
       II_vos    :=(eu+'ervieis ');
       II_voces  :=(eu+'erviam ');
       II_eles   :=(eu+'erviam ');
       II_elas   :=(eu+'erviam ');

       MI_eu     :=(eu+'ervervira ');
       MI_tu     :=(eu+'erverviras ');
       MI_ele    :=(eu+'ervira ');
       MI_ela    :=(eu+'ervira ');
       MI_voce   :=(eu+'ervira ');
       MI_nos    :=(eu+'erviramos ');
       MI_vos    :=(eu+'ervireis ');
       MI_voces  :=(eu+'erviram ');
       MI_eles   :=(eu+'erviram ');
       MI_elas   :=(eu+'erviram ');

       TI_eu     :=(eu+'erviria ');
       TI_tu     :=(eu+'ervirias ');
       TI_ele    :=(eu+'erviria ');
       TI_ela    :=(eu+'erviria ');
       TI_voce   :=(eu+'erviria ');
       TI_nos    :=(eu+'erviriamos ');
       TI_vos    :=(eu+'ervirieis ');
       TI_voces  :=(eu+'erviriam ');
       TI_eles   :=(eu+'erviriam ');
       TI_elas   :=(eu+'erviriam ');

       FI_eu     :=(eu+'ervirei ');
       FI_tu     :=(eu+'erviras ');
       FI_ele    :=(eu+'ervira ');
       FI_ela    :=(eu+'ervira ');
       FI_voce   :=(eu+'ervira ');
       FI_nos    :=(eu+'erviremos ');
       FI_vos    :=(eu+'ervireis ');
       FI_voces  :=(eu+'ervirão ');
       FI_eles   :=(eu+'ervirão ');
       FI_elas   :=(eu+'ervirão ');

       PS_eu     :=(eu+'irvaa ');
       PS_tu     :=(eu+'irvas ');
       PS_ele    :=(eu+'irva ');
       PS_ela    :=(eu+'irva ');
       PS_voce   :=(eu+'irva ');
       PS_nos    :=(eu+'irvamos ');
       PS_vos    :=(eu+'irvais ');
       PS_voces  :=(eu+'irvam ');
       PS_eles   :=(eu+'irvam ');
       PS_elas   :=(eu+'irvam ');

       IS_eu     :=(eu+'ervisse ');
       IS_tu     :=(eu+'ervisses ');
       IS_ele    :=(eu+'ervisse ');
       IS_ela    :=(eu+'ervisse ');
       IS_voce   :=(eu+'ervisse ');
       IS_nos    :=(eu+'ervissemos ');
       IS_vos    :=(eu+'ervisseis ');
       IS_voces  :=(eu+'ervissem ');
       IS_eles   :=(eu+'ervissem ');
       IS_elas   :=(eu+'ervissem ');

       FS_eu     :=(eu+'ervir ');
       FS_tu     :=(eu+'ervires ');
       FS_ele    :=(eu+'ervir ');
       FS_ela    :=(eu+'ervir ');
       FS_voce   :=(eu+'ervir ');
       FS_nos    :=(eu+'ervirmos ');
       FS_vos    :=(eu+'ervirdes ');
       FS_voces  :=(eu+'ervirem ');
       FS_eles   :=(eu+'ervirem ');
       FS_elas   :=(eu+'ervirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'erve ');
       IA_ele    :=(eu+'irva ');
       IA_ela    :=(eu+'irva ');
       IA_voce   :=(eu+'irva ');
       IA_nos    :=(eu+'irvamos ');
       IA_vos    :=(eu+'ervi ');
       IA_voces  :=(eu+'irvam ');
       IA_eles   :=(eu+'irvam ');
       IA_elas   :=(eu+'irvam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'irvas ');
       IN_ele    :=(eu+'irva ');
       IN_ela    :=(eu+'irva ');
       IN_voce   :=(eu+'irva ');
       IN_nos    :=(eu+'irvamos ');
       IN_vos    :=(eu+'irvais ');
       IN_voces  :=(eu+'irvam ');
       IN_eles   :=(eu+'irvam ');
       IN_elas   :=(eu+'irvam ');

       end//ervir meio  // eu tu ele//ervir
      else
       begin//ervir continuaçao
       if (pos('vir ',eu) > 1)and  (pos('vir ',eu) < 20) then
        begin// vir inicio
         // term  vir // eu tu ele
      //   memo1.lines.add ('vir');
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'vido ');
       GERf      :=(eu+'vida ');
       GERAm     :=(eu+'vido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'vido ');
       PART      :=(eu+'vindo ');
       AGENTE1   :=(eu+'vinte ');
       AGENTE2   :=(eu+'vedor ');
       AGENTE3   :=(eu+'vedora ');
       ACAO1     :=(eu+'vimento ');
       ACAO2     :=(eu+'vicção ');
       ACAO3     :=(eu+'vimenta ');
       RESU1     :=(eu+'visso ');
       RESU2     :=(eu+'vissa ');

       IP_eu     :=(eu+'vir ');
       IP_tu     :=(eu+'vires ');
       IP_ele    :=(eu+'vir ');
       IP_ela    :=(eu+'vir ');
       IP_voce   :=(eu+'vir ');
       IP_nos    :=(eu+'virmos ');
       IP_vos    :=(eu+'virdes ');
       IP_voces  :=(eu+'virem ');
       IP_eles   :=(eu+'virem ');
       IP_elas   :=(eu+'virem ');

       PI_eu     :=(eu+'venho ');
       PI_tu     :=(eu+'vens ');
       PI_ele    :=(eu+'vem ');
       PI_ela    :=(eu+'vem ');
       PI_voce   :=(eu+'vem ');
       PI_nos    :=(eu+'vimos ');
       PI_vos    :=(eu+'vindes ');
       PI_voces  :=(eu+'vem ');
       PI_eles   :=(eu+'vem ');
       PI_elas   :=(eu+'vem ');

       PP_eu     :=(eu+'vim ');
       PP_tu     :=(eu+'vieste ');
       PP_ele    :=(eu+'veio ');
       PP_ela    :=(eu+'veio ');
       PP_voce   :=(eu+'veio ');         //EI
       PP_nos    :=(eu+'viemos ');
       PP_vos    :=(eu+'viestes ');
       PP_voces  :=(eu+'vieram ');
       PP_eles   :=(eu+'vieram ');
       PP_elas   :=(eu+'vieram ');

       II_eu     :=(eu+'vinha ');
       II_tu     :=(eu+'vinhas ');
       II_ele    :=(eu+'vinha ');
       II_ela    :=(eu+'vinha ');
       II_voce   :=(eu+'vinha ');
       II_nos    :=(eu+'vinhamos ');
       II_vos    :=(eu+'vinheis ');
       II_voces  :=(eu+'vinham ');
       II_eles   :=(eu+'vinham ');
       II_elas   :=(eu+'vinham ');

       MI_eu     :=(eu+'viera ');
       MI_tu     :=(eu+'vieras ');
       MI_ele    :=(eu+'viera ');
       MI_ela    :=(eu+'viera ');
       MI_voce   :=(eu+'viera ');
       MI_nos    :=(eu+'vieramos ');
       MI_vos    :=(eu+'viereis ');
       MI_voces  :=(eu+'vieram ');
       MI_eles   :=(eu+'vieram ');
       MI_elas   :=(eu+'vieram ');

       TI_eu     :=(eu+'viria ');
       TI_tu     :=(eu+'virias ');
       TI_ele    :=(eu+'viria ');
       TI_ela    :=(eu+'viria ');
       TI_voce   :=(eu+'viria ');
       TI_nos    :=(eu+'viriamos ');
       TI_vos    :=(eu+'virieis ');
       TI_voces  :=(eu+'viriam ');
       TI_eles   :=(eu+'viriam ');
       TI_elas   :=(eu+'viriam ');

       FI_eu     :=(eu+'virei ');
       FI_tu     :=(eu+'viras ');
       FI_ele    :=(eu+'vira ');
       FI_ela    :=(eu+'vira ');
       FI_voce   :=(eu+'vira ');
       FI_nos    :=(eu+'viremos ');
       FI_vos    :=(eu+'vireis ');
       FI_voces  :=(eu+'virão ');
       FI_eles   :=(eu+'virão ');
       FI_elas   :=(eu+'virão ');

       PS_eu     :=(eu+'venha ');
       PS_tu     :=(eu+'venhas ');
       PS_ele    :=(eu+'venha ');
       PS_ela    :=(eu+'venha ');
       PS_voce   :=(eu+'venha ');
       PS_nos    :=(eu+'venhamos ');
       PS_vos    :=(eu+'venhais ');
       PS_voces  :=(eu+'venham ');
       PS_eles   :=(eu+'venham ');
       PS_elas   :=(eu+'venham ');

       IS_eu     :=(eu+'viesse ');
       IS_tu     :=(eu+'viesses ');
       IS_ele    :=(eu+'viesse ');
       IS_ela    :=(eu+'viesse ');
       IS_voce   :=(eu+'viesse ');
       IS_nos    :=(eu+'viessemos ');
       IS_vos    :=(eu+'viesseis ');
       IS_voces  :=(eu+'viessem ');
       IS_eles   :=(eu+'viessem ');
       IS_elas   :=(eu+'viessem ');

       FS_eu     :=(eu+'vier ');
       FS_tu     :=(eu+'vieres ');
       FS_ele    :=(eu+'vier ');
       FS_ela    :=(eu+'vier ');
       FS_voce   :=(eu+'vier ');
       FS_nos    :=(eu+'viermos ');
       FS_vos    :=(eu+'vierdes ');
       FS_voces  :=(eu+'vierem ');
       FS_eles   :=(eu+'vierem ');
       FS_elas   :=(eu+'vierem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'vem ');
       IA_ele    :=(eu+'venha ');
       IA_ela    :=(eu+'venha ');
       IA_voce   :=(eu+'venha ');
       IA_nos    :=(eu+'venhamos ');
       IA_vos    :=(eu+'vinde ');
       IA_voces  :=(eu+'venham ');
       IA_eles   :=(eu+'venham ');
       IA_elas   :=(eu+'venham ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'venhas ');
       IN_ele    :=(eu+'venha ');
       IN_ela    :=(eu+'venha ');
       IN_voce   :=(eu+'venha ');
       IN_nos    :=(eu+'venhamos ');
       IN_vos    :=(eu+'venhais ');
       IN_voces  :=(eu+'venham ');
       IN_eles   :=(eu+'venham ');
       IN_elas   :=(eu+'venham ');

        end// vir meio  // eu tu ele//vir uma regra so pra si
       else //verbo vir  eu venho etc
        begin// vir continu
        if (pos('vir ',eu) =1 ) then
         begin//verbo vir inicio
          // term so vir // eu tu ele
        //  memo1.lines.add ('verbo vir');
        if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'vido ');
       GERf      :=(eu+'vida ');
       GERAm     :=(eu+'vindo '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'vinda ');
       PART      :=(eu+'vindo ');
       AGENTE1   :=(eu+'vinte ');
       AGENTE2   :=(eu+'vedor ');
       AGENTE3   :=(eu+'vidora ');
       ACAO1     :=(eu+'vimento ');
       ACAO2     :=(eu+'vição ');
       ACAO3     :=(eu+'vimenta ');
       RESU1     :=(eu+'visso ');
       RESU2     :=(eu+'vissa ');

       IP_eu     :=(eu+'vir ');
       IP_tu     :=(eu+'vires ');
       IP_ele    :=(eu+'vir ');
       IP_ela    :=(eu+'vir ');
       IP_voce   :=(eu+'vir ');
       IP_nos    :=(eu+'virmos ');
       IP_vos    :=(eu+'virdes ');
       IP_voces  :=(eu+'virem ');
       IP_eles   :=(eu+'virem ');
       IP_elas   :=(eu+'virem ');

       PI_eu     :=(eu+'venho ');
       PI_tu     :=(eu+'vens ');
       PI_ele    :=(eu+'vem ');
       PI_ela    :=(eu+'vem ');
       PI_voce   :=(eu+'vem ');
       PI_nos    :=(eu+'vimos ');
       PI_vos    :=(eu+'vindes ');
       PI_voces  :=(eu+'vem ');
       PI_eles   :=(eu+'vem ');
       PI_elas   :=(eu+'vem ');

       PP_eu     :=(eu+'vim ');
       PP_tu     :=(eu+'vieste ');
       PP_ele    :=(eu+'veio ');
       PP_ela    :=(eu+'veio ');
       PP_voce   :=(eu+'veio ');         //EI
       PP_nos    :=(eu+'viemos ');
       PP_vos    :=(eu+'viestes ');
       PP_voces  :=(eu+'vieram ');
       PP_eles   :=(eu+'vieram ');
       PP_elas   :=(eu+'vieram ');

       II_eu     :=(eu+'vinha ');
       II_tu     :=(eu+'vinhas ');
       II_ele    :=(eu+'vinha ');
       II_ela    :=(eu+'vinha ');
       II_voce   :=(eu+'vinha ');
       II_nos    :=(eu+'vinhamos ');
       II_vos    :=(eu+'vinheis ');
       II_voces  :=(eu+'vinham ');
       II_eles   :=(eu+'vinham ');
       II_elas   :=(eu+'vinham ');

       MI_eu     :=(eu+'viera ');
       MI_tu     :=(eu+'vieras ');
       MI_ele    :=(eu+'viera ');
       MI_ela    :=(eu+'viera ');
       MI_voce   :=(eu+'viera ');
       MI_nos    :=(eu+'vieramos ');
       MI_vos    :=(eu+'viereis ');
       MI_voces  :=(eu+'vieram ');
       MI_eles   :=(eu+'vieram ');
       MI_elas   :=(eu+'vieram ');

       TI_eu     :=(eu+'viria ');
       TI_tu     :=(eu+'virias ');
       TI_ele    :=(eu+'viria ');
       TI_ela    :=(eu+'viria ');
       TI_voce   :=(eu+'viria ');
       TI_nos    :=(eu+'viriamos ');
       TI_vos    :=(eu+'virieis ');
       TI_voces  :=(eu+'viriam ');
       TI_eles   :=(eu+'viriam ');
       TI_elas   :=(eu+'viriam ');

       FI_eu     :=(eu+'virei ');
       FI_tu     :=(eu+'viras ');
       FI_ele    :=(eu+'vira ');
       FI_ela    :=(eu+'vira ');
       FI_voce   :=(eu+'vira ');
       FI_nos    :=(eu+'viremos ');
       FI_vos    :=(eu+'vireis ');
       FI_voces  :=(eu+'virão ');
       FI_eles   :=(eu+'virão ');
       FI_elas   :=(eu+'virão ');

       PS_eu     :=(eu+'venha ');
       PS_tu     :=(eu+'venhas ');
       PS_ele    :=(eu+'venha ');
       PS_ela    :=(eu+'venha ');
       PS_voce   :=(eu+'venha ');
       PS_nos    :=(eu+'venhamos ');
       PS_vos    :=(eu+'venhais ');
       PS_voces  :=(eu+'venham ');
       PS_eles   :=(eu+'venham ');
       PS_elas   :=(eu+'venham ');

       IS_eu     :=(eu+'viesse ');
       IS_tu     :=(eu+'viesses ');
       IS_ele    :=(eu+'viesse ');
       IS_ela    :=(eu+'viesse ');
       IS_voce   :=(eu+'viesse ');
       IS_nos    :=(eu+'viessemos ');
       IS_vos    :=(eu+'viesseis ');
       IS_voces  :=(eu+'viessem ');
       IS_eles   :=(eu+'viessem ');
       IS_elas   :=(eu+'viessem ');

       FS_eu     :=(eu+'vier ');
       FS_tu     :=(eu+'vieres ');
       FS_ele    :=(eu+'vier ');
       FS_ela    :=(eu+'vier ');
       FS_voce   :=(eu+'vier ');
       FS_nos    :=(eu+'viermos ');
       FS_vos    :=(eu+'vierdes ');
       FS_voces  :=(eu+'vierem ');
       FS_eles   :=(eu+'vierem ');
       FS_elas   :=(eu+'vierem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'vem ');
       IA_ele    :=(eu+'venha ');
       IA_ela    :=(eu+'venha ');
       IA_voce   :=(eu+'venha ');
       IA_nos    :=(eu+'venhamos ');
       IA_vos    :=(eu+'vinde ');
       IA_voces  :=(eu+'venham ');
       IA_eles   :=(eu+'venham ');
       IA_elas   :=(eu+'venham ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'venhas ');
       IN_ele    :=(eu+'venha ');
       IN_ela    :=(eu+'venha ');
       IN_voce   :=(eu+'venha ');
       IN_nos    :=(eu+'venhamos ');
       IN_vos    :=(eu+'venhais ');
       IN_voces  :=(eu+'venham ');
       IN_eles   :=(eu+'venham ');
       IN_elas   :=(eu+'venham ');

         end;//verbo vir fim  // eu tu ele//advir  rera p outros vir
        end;// vir fim
       end;//ervir fim
     end;//ouvir fim
    if (pos('ir ',eu) = 1) then
     begin//verbo ir inicio
      // o verbo ir  // eu tu ele
     // memo1.lines.add ('verbo ir');
      if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;

       delete(eu,pos('ir ',eu),(length(eu)- pos('ir ',eu)+1));

       GERm      :=(eu+'ido ');
       GERf      :=(eu+'ido ');
       GERAm     :=(eu+'ido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'ido ');
       PART      :=(eu+'indo ');
       AGENTE1   :=(eu+'inte ');
       AGENTE2   :=(eu+'idor ');
       AGENTE3   :=(eu+'idora ');
       ACAO1     :=(eu+'imento ');
       ACAO2     :=(eu+'ição ');
       ACAO3     :=(eu+'imenta ');
       RESU1     :=(eu+'isso ');
       RESU2     :=(eu+'issa ');

       IP_eu     :=(eu+'ir ');
       IP_tu     :=(eu+'ires ');
       IP_ele    :=(eu+'ir ');
       IP_ela    :=(eu+'ir ');
       IP_voce   :=(eu+'ir ');
       IP_nos    :=(eu+'irmos ');
       IP_vos    :=(eu+'irdes ');
       IP_voces  :=(eu+'irem ');
       IP_eles   :=(eu+'irem ');
       IP_elas   :=(eu+'irem ');

       PI_eu     :=(eu+'vou ');
       PI_tu     :=(eu+'vais ');
       PI_ele    :=(eu+'vai ');
       PI_ela    :=(eu+'vai ');
       PI_voce   :=(eu+'vai ');
       PI_nos    :=(eu+'vamos ');
       PI_vos    :=(eu+'ides ');
       PI_voces  :=(eu+'vão ');
       PI_eles   :=(eu+'vão ');
       PI_elas   :=(eu+'vão ');

       PP_eu     :=(eu+'fui ');
       PP_tu     :=(eu+'foste ');
       PP_ele    :=(eu+'foi ');
       PP_ela    :=(eu+'foi ');
       PP_voce   :=(eu+'foi ');         //EI
       PP_nos    :=(eu+'fomos ');
       PP_vos    :=(eu+'fostes ');
       PP_voces  :=(eu+'foram ');
       PP_eles   :=(eu+'foram ');
       PP_elas   :=(eu+'foram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'fora ');
       MI_tu     :=(eu+'foras ');
       MI_ele    :=(eu+'fora ');
       MI_ela    :=(eu+'fora ');
       MI_voce   :=(eu+'fora ');
       MI_nos    :=(eu+'foramos ');
       MI_vos    :=(eu+'foreis ');
       MI_voces  :=(eu+'foram ');
       MI_eles   :=(eu+'foram ');
       MI_elas   :=(eu+'foram ');

       TI_eu     :=(eu+'iria ');
       TI_tu     :=(eu+'irias ');
       TI_ele    :=(eu+'iria ');
       TI_ela    :=(eu+'iria ');
       TI_voce   :=(eu+'iria ');
       TI_nos    :=(eu+'iriamos ');
       TI_vos    :=(eu+'irieis ');
       TI_voces  :=(eu+'iriam ');
       TI_eles   :=(eu+'iriam ');
       TI_elas   :=(eu+'iriam ');

       FI_eu     :=(eu+'irei ');
       FI_tu     :=(eu+'iras ');
       FI_ele    :=(eu+'ira ');
       FI_ela    :=(eu+'ira ');
       FI_voce   :=(eu+'ira ');
       FI_nos    :=(eu+'iremos ');
       FI_vos    :=(eu+'ireis ');
       FI_voces  :=(eu+'irão ');
       FI_eles   :=(eu+'irão ');
       FI_elas   :=(eu+'irão ');

       PS_eu     :=(eu+'va ');
       PS_tu     :=(eu+'vas ');
       PS_ele    :=(eu+'va ');
       PS_ela    :=(eu+'va ');
       PS_voce   :=(eu+'va ');
       PS_nos    :=(eu+'vamos ');
       PS_vos    :=(eu+'vades ');
       PS_voces  :=(eu+'vão ');
       PS_eles   :=(eu+'vão ');
       PS_elas   :=(eu+'vão ');

       IS_eu     :=(eu+'fosse ');
       IS_tu     :=(eu+'fosses ');
       IS_ele    :=(eu+'fosse ');
       IS_ela    :=(eu+'fosse ');
       IS_voce   :=(eu+'fosse ');
       IS_nos    :=(eu+'fossemos ');
       IS_vos    :=(eu+'fosseis ');
       IS_voces  :=(eu+'fossem ');
       IS_eles   :=(eu+'fossem ');
       IS_elas   :=(eu+'fossem ');

       FS_eu     :=(eu+'for ');
       FS_tu     :=(eu+'fores ');
       FS_ele    :=(eu+'for ');
       FS_ela    :=(eu+'for ');
       FS_voce   :=(eu+'for ');
       FS_nos    :=(eu+'formos ');
       FS_vos    :=(eu+'fordes ');
       FS_voces  :=(eu+'forem ');
       FS_eles   :=(eu+'forem ');
       FS_elas   :=(eu+'forem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'vai ');
       IA_ele    :=(eu+'va ');
       IA_ela    :=(eu+'va ');
       IA_voce   :=(eu+'va ');
       IA_nos    :=(eu+'vamos ');
       IA_vos    :=(eu+'ide ');
       IA_voces  :=(eu+'vão ');
       IA_eles   :=(eu+'vão ');
       IA_elas   :=(eu+'vão ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'vas ');
       IN_ele    :=(eu+'va ');
       IN_ela    :=(eu+'va ');
       IN_voce   :=(eu+'va ');
       IN_nos    :=(eu+'vamos ');
       IN_vos    :=(eu+'vades ');
       IN_voces  :=(eu+'vão ');
       IN_eles   :=(eu+'vão ');
       IN_elas   :=(eu+'vão ');

     end;//verbo ir fim  // eu tu ele//ir  vou vais

    if (pos('rir ',eu) = 1) then
     begin//rir inicio
      // verbo rir // eu tu ele
      //memo1.lines.add ('verbo rir');
      if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'rido ');
       GERf      :=(eu+'rido ');
       GERAm     :=(eu+'rido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'rido ');
       PART      :=(eu+'rindo ');
       AGENTE1   :=(eu+'rinte ');
       AGENTE2   :=(eu+'ridor ');
       AGENTE3   :=(eu+'ridora ');
       ACAO1     :=(eu+'rimento ');
       ACAO2     :=(eu+'rição ');
       ACAO3     :=(eu+'rimenta ');
       RESU1     :=(eu+'rizo ');
       RESU2     :=(eu+'riza ');

       IP_eu     :=(eu+'rir ');
       IP_tu     :=(eu+'rires ');
       IP_ele    :=(eu+'rir ');
       IP_ela    :=(eu+'rir ');
       IP_voce   :=(eu+'rir ');
       IP_nos    :=(eu+'rirmos ');
       IP_vos    :=(eu+'rirdes ');
       IP_voces  :=(eu+'rirem ');
       IP_eles   :=(eu+'rirem ');
       IP_elas   :=(eu+'rirem ');

       PI_eu     :=(eu+'rio ');
       PI_tu     :=(eu+'ris ');
       PI_ele    :=(eu+'ri ');
       PI_ela    :=(eu+'ri ');
       PI_voce   :=(eu+'ri ');
       PI_nos    :=(eu+'rimos ');
       PI_vos    :=(eu+'rides ');
       PI_voces  :=(eu+'riem ');
       PI_eles   :=(eu+'riem ');
       PI_elas   :=(eu+'riem ');

       PP_eu     :=(eu+'ri ');
       PP_tu     :=(eu+'riste ');
       PP_ele    :=(eu+'riu ');
       PP_ela    :=(eu+'riu ');
       PP_voce   :=(eu+'riu ');         //EI
       PP_nos    :=(eu+'rimos ');
       PP_vos    :=(eu+'ristes ');
       PP_voces  :=(eu+'riram ');
       PP_eles   :=(eu+'riram ');
       PP_elas   :=(eu+'riram ');

       II_eu     :=(eu+'ria ');
       II_tu     :=(eu+'rias ');
       II_ele    :=(eu+'ria ');
       II_ela    :=(eu+'ria ');
       II_voce   :=(eu+'ria ');
       II_nos    :=(eu+'riamos ');
       II_vos    :=(eu+'rieis ');
       II_voces  :=(eu+'riam ');
       II_eles   :=(eu+'riam ');
       II_elas   :=(eu+'riam ');

       MI_eu     :=(eu+'rira ');
       MI_tu     :=(eu+'riras ');
       MI_ele    :=(eu+'rira ');
       MI_ela    :=(eu+'rira ');
       MI_voce   :=(eu+'rira ');
       MI_nos    :=(eu+'riramos ');
       MI_vos    :=(eu+'rireis ');
       MI_voces  :=(eu+'riram ');
       MI_eles   :=(eu+'riram ');
       MI_elas   :=(eu+'riram ');

       TI_eu     :=(eu+'riria ');
       TI_tu     :=(eu+'ririas ');
       TI_ele    :=(eu+'riria ');
       TI_ela    :=(eu+'riria ');
       TI_voce   :=(eu+'riria ');
       TI_nos    :=(eu+'ririamos ');
       TI_vos    :=(eu+'ririeis ');
       TI_voces  :=(eu+'ririam ');
       TI_eles   :=(eu+'ririam ');
       TI_elas   :=(eu+'ririam ');

       FI_eu     :=(eu+'rirei ');
       FI_tu     :=(eu+'riras ');
       FI_ele    :=(eu+'rira ');
       FI_ela    :=(eu+'rira ');
       FI_voce   :=(eu+'rira ');
       FI_nos    :=(eu+'riremos ');
       FI_vos    :=(eu+'rireis ');
       FI_voces  :=(eu+'rirão ');
       FI_eles   :=(eu+'rirão ');
       FI_elas   :=(eu+'rirão ');

       PS_eu     :=(eu+'ria ');
       PS_tu     :=(eu+'rias ');
       PS_ele    :=(eu+'ria ');
       PS_ela    :=(eu+'ria ');
       PS_voce   :=(eu+'ria ');
       PS_nos    :=(eu+'riamos ');
       PS_vos    :=(eu+'riais ');
       PS_voces  :=(eu+'riam ');
       PS_eles   :=(eu+'riam ');
       PS_elas   :=(eu+'riam ');

       IS_eu     :=(eu+'risse ');
       IS_tu     :=(eu+'risses ');
       IS_ele    :=(eu+'risse ');
       IS_ela    :=(eu+'risse ');
       IS_voce   :=(eu+'risse ');
       IS_nos    :=(eu+'rissemos ');
       IS_vos    :=(eu+'risseis ');
       IS_voces  :=(eu+'rissem ');
       IS_eles   :=(eu+'rissem ');
       IS_elas   :=(eu+'rissem ');

       FS_eu     :=(eu+'rir ');
       FS_tu     :=(eu+'rires ');
       FS_ele    :=(eu+'rir ');
       FS_ela    :=(eu+'rir ');
       FS_voce   :=(eu+'rir ');
       FS_nos    :=(eu+'rirmos ');
       FS_vos    :=(eu+'rirdes ');
       FS_voces  :=(eu+'rirem ');
       FS_eles   :=(eu+'rirem ');
       FS_elas   :=(eu+'rirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ri ');
       IA_ele    :=(eu+'ria ');
       IA_ela    :=(eu+'ria ');
       IA_voce   :=(eu+'ria ');
       IA_nos    :=(eu+'riamos ');
       IA_vos    :=(eu+'ride ');
       IA_voces  :=(eu+'riam ');
       IA_eles   :=(eu+'riam ');
       IA_elas   :=(eu+'riam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'rias ');
       IN_ele    :=(eu+'ria ');
       IN_ela    :=(eu+'ria ');
       IN_voce   :=(eu+'ria ');
       IN_nos    :=(eu+'riamos ');
       IN_vos    :=(eu+'riais ');
       IN_voces  :=(eu+'riam ');
       IN_eles   :=(eu+'riam ');
       IN_elas   :=(eu+'riam ');

     end;//rir fim  // eu tu ele//rir

    if (pos('egrir ',eu) > 1)and  (pos('egrir ',eu) < 20) then
     begin//egrir inicio
      // term c egrir // eu tu ele
     // memo1.lines.add ('egrir');
       if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-3,(length(eu)- pos('ir ',eu)+4));

       GERm      :=(eu+'egrido ');
       GERf      :=(eu+'egrida ');
       GERAm     :=(eu+'egrido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'egrida ');
       PART      :=(eu+'egrindo ');
       AGENTE1   :=(eu+'egrinte ');
       AGENTE2   :=(eu+'egridor ');
       AGENTE3   :=(eu+'egridora ');
       ACAO1     :=(eu+'egrimento ');
       ACAO2     :=(eu+'egrição ');
       ACAO3     :=(eu+'egrimenta ');
       RESU1     :=(eu+'egrisso ');
       RESU2     :=(eu+'egrissa ');

       IP_eu     :=(eu+'egrir ');
       IP_tu     :=(eu+'egrires ');
       IP_ele    :=(eu+'egrir ');
       IP_ela    :=(eu+'egrir ');
       IP_voce   :=(eu+'egrir ');
       IP_nos    :=(eu+'egrirmos ');
       IP_vos    :=(eu+'egrirdes ');
       IP_voces  :=(eu+'egrirem ');
       IP_eles   :=(eu+'egrirem ');
       IP_elas   :=(eu+'egrirem ');

       PI_eu     :=(eu+'igro ');
       PI_tu     :=(eu+'igres ');
       PI_ele    :=(eu+'igre ');
       PI_ela    :=(eu+'igre ');
       PI_voce   :=(eu+'igre ');
       PI_nos    :=(eu+'egrimos ');
       PI_vos    :=(eu+'egris ');
       PI_voces  :=(eu+'igrem ');
       PI_eles   :=(eu+'igrem ');
       PI_elas   :=(eu+'igrem ');

       PP_eu     :=(eu+'egri ');
       PP_tu     :=(eu+'egriste ');
       PP_ele    :=(eu+'egriu ');
       PP_ela    :=(eu+'egriu ');
       PP_voce   :=(eu+'egriu ');         //EI
       PP_nos    :=(eu+'egrimos ');
       PP_vos    :=(eu+'egristes ');
       PP_voces  :=(eu+'egriram ');
       PP_eles   :=(eu+'egriram ');
       PP_elas   :=(eu+'egriram ');

       II_eu     :=(eu+'egria ');
       II_tu     :=(eu+'egrias ');
       II_ele    :=(eu+'egria ');
       II_ela    :=(eu+'egria ');
       II_voce   :=(eu+'egria ');
       II_nos    :=(eu+'egriamos ');
       II_vos    :=(eu+'egrieis ');
       II_voces  :=(eu+'egriam ');
       II_eles   :=(eu+'egriam ');
       II_elas   :=(eu+'egriam ');

       MI_eu     :=(eu+'egrira ');
       MI_tu     :=(eu+'egriras ');
       MI_ele    :=(eu+'egrira ');
       MI_ela    :=(eu+'egrira ');
       MI_voce   :=(eu+'egrira ');
       MI_nos    :=(eu+'egriramos ');
       MI_vos    :=(eu+'egrireis ');
       MI_voces  :=(eu+'egriram ');
       MI_eles   :=(eu+'egriram ');
       MI_elas   :=(eu+'egriram ');

       TI_eu     :=(eu+'egriria ');
       TI_tu     :=(eu+'egririas ');
       TI_ele    :=(eu+'egriria ');
       TI_ela    :=(eu+'egriria ');
       TI_voce   :=(eu+'egriria ');
       TI_nos    :=(eu+'egririamos ');
       TI_vos    :=(eu+'egririeis ');
       TI_voces  :=(eu+'egririam ');
       TI_eles   :=(eu+'egririam ');
       TI_elas   :=(eu+'egririam ');

       FI_eu     :=(eu+'egrirei ');
       FI_tu     :=(eu+'egriras ');
       FI_ele    :=(eu+'egrira ');
       FI_ela    :=(eu+'egrira ');
       FI_voce   :=(eu+'egrira ');
       FI_nos    :=(eu+'egriremos ');
       FI_vos    :=(eu+'egrireis ');
       FI_voces  :=(eu+'egrirão ');
       FI_eles   :=(eu+'egrirão ');
       FI_elas   :=(eu+'egrirão ');

       PS_eu     :=(eu+'igra ');
       PS_tu     :=(eu+'igras ');
       PS_ele    :=(eu+'igra ');
       PS_ela    :=(eu+'igra ');
       PS_voce   :=(eu+'igra ');
       PS_nos    :=(eu+'igramos ');
       PS_vos    :=(eu+'igrais ');
       PS_voces  :=(eu+'igram ');
       PS_eles   :=(eu+'igram ');
       PS_elas   :=(eu+'igram ');

       IS_eu     :=(eu+'egrisse ');
       IS_tu     :=(eu+'egrisses ');
       IS_ele    :=(eu+'egrisse ');
       IS_ela    :=(eu+'egrisse ');
       IS_voce   :=(eu+'egrisse ');
       IS_nos    :=(eu+'egrissemos ');
       IS_vos    :=(eu+'egrisseis ');
       IS_voces  :=(eu+'egrissem ');
       IS_eles   :=(eu+'egrissem ');
       IS_elas   :=(eu+'egrissem ');

       FS_eu     :=(eu+'egrir ');
       FS_tu     :=(eu+'egrires ');
       FS_ele    :=(eu+'egrir ');
       FS_ela    :=(eu+'egrir ');
       FS_voce   :=(eu+'egrir ');
       FS_nos    :=(eu+'egrirmos ');
       FS_vos    :=(eu+'egrirdes ');
       FS_voces  :=(eu+'egrirem ');
       FS_eles   :=(eu+'egrirem ');
       FS_elas   :=(eu+'egrirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'igre ');
       IA_ele    :=(eu+'igra ');
       IA_ela    :=(eu+'igra ');
       IA_voce   :=(eu+'igra ');
       IA_nos    :=(eu+'igramos ');
       IA_vos    :=(eu+'egri ');
       IA_voces  :=(eu+'igram ');
       IA_eles   :=(eu+'igram ');
       IA_elas   :=(eu+'igram ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'igras ');
       IN_ele    :=(eu+'igra ');
       IN_ela    :=(eu+'igra ');
       IN_voce   :=(eu+'igra ');
       IN_nos    :=(eu+'igramos ');
       IN_vos    :=(eu+'igrais ');
       IN_voces  :=(eu+'igram ');
       IN_eles   :=(eu+'igram ');
       IN_elas   :=(eu+'igram ');

     end//egrir meio  // eu tu ele//egrir
    else
     begin//egrir cont
      if (pos('erir ',eu) > 1)and  (pos('erir ',eu) < 20) then
       begin//erir inicio
        // term c erir // eu tu ele
     //   memo1.lines.add ('erir');
     if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-2,(length(eu)- pos('ir ',eu)+3));

       GERm      :=(eu+'erido ');
       GERf      :=(eu+'erida ');
       PART      :=(eu+'erindo ');
       AGENTE1   :=(eu+'erente ');
       AGENTE2   :=(eu+'eridor ');
       AGENTE3   :=(eu+'eridora ');
       ACAO1     :=(eu+'erimento ');
       ACAO2     :=(eu+'erição ');
       ACAO3     :=(eu+'erimenta ');
       RESU1     :=(eu+'erisso ');
       RESU2     :=(eu+'erissa ');

       IP_eu     :=(eu+'erir ');
       IP_tu     :=(eu+'erires ');
       IP_ele    :=(eu+'erir ');
       IP_ela    :=(eu+'erir ');
       IP_voce   :=(eu+'erir ');
       IP_nos    :=(eu+'erirmos ');
       IP_vos    :=(eu+'erirdes ');
       IP_voces  :=(eu+'erirem ');
       IP_eles   :=(eu+'erirem ');
       IP_elas   :=(eu+'erirem ');

       PI_eu     :=(eu+'iro ');
       PI_tu     :=(eu+'eres ');
       PI_ele    :=(eu+'ere ');
       PI_ela    :=(eu+'ere ');
       PI_voce   :=(eu+'ere ');
       PI_nos    :=(eu+'erimos ');
       PI_vos    :=(eu+'eris ');
       PI_voces  :=(eu+'erem ');
       PI_eles   :=(eu+'erem ');
       PI_elas   :=(eu+'erem ');

       PP_eu     :=(eu+'eri ');
       PP_tu     :=(eu+'eriste ');
       PP_ele    :=(eu+'eriu ');
       PP_ela    :=(eu+'eriu ');
       PP_voce   :=(eu+'eriu ');         //EI
       PP_nos    :=(eu+'erimos ');
       PP_vos    :=(eu+'eristes ');
       PP_voces  :=(eu+'eriram ');
       PP_eles   :=(eu+'eriram ');
       PP_elas   :=(eu+'eriram ');

       II_eu     :=(eu+'eria ');
       II_tu     :=(eu+'erias ');
       II_ele    :=(eu+'eria ');
       II_ela    :=(eu+'eria ');
       II_voce   :=(eu+'eria ');
       II_nos    :=(eu+'eriamos ');
       II_vos    :=(eu+'erieis ');
       II_voces  :=(eu+'eriam ');
       II_eles   :=(eu+'eriam ');
       II_elas   :=(eu+'eriam ');

       MI_eu     :=(eu+'erira ');
       MI_tu     :=(eu+'eriras ');
       MI_ele    :=(eu+'erira ');
       MI_ela    :=(eu+'erira ');
       MI_voce   :=(eu+'erira ');
       MI_nos    :=(eu+'eriramos ');
       MI_vos    :=(eu+'erireis ');
       MI_voces  :=(eu+'eriram ');
       MI_eles   :=(eu+'eriram ');
       MI_elas   :=(eu+'eriram ');

       TI_eu     :=(eu+'eriria ');
       TI_tu     :=(eu+'eririas ');
       TI_ele    :=(eu+'eriria ');
       TI_ela    :=(eu+'eriria ');
       TI_voce   :=(eu+'eriria ');
       TI_nos    :=(eu+'eririamos ');
       TI_vos    :=(eu+'eririeis ');
       TI_voces  :=(eu+'eririam ');
       TI_eles   :=(eu+'eririam ');
       TI_elas   :=(eu+'eririam ');

       FI_eu     :=(eu+'erirei ');
       FI_tu     :=(eu+'eriras ');
       FI_ele    :=(eu+'erira ');
       FI_ela    :=(eu+'erira ');
       FI_voce   :=(eu+'erira ');
       FI_nos    :=(eu+'eriremos ');
       FI_vos    :=(eu+'erireis ');
       FI_voces  :=(eu+'erirão ');
       FI_eles   :=(eu+'erirão ');
       FI_elas   :=(eu+'erirão ');

       PS_eu     :=(eu+'ira ');
       PS_tu     :=(eu+'iras ');
       PS_ele    :=(eu+'ira ');
       PS_ela    :=(eu+'ira ');
       PS_voce   :=(eu+'ira ');
       PS_nos    :=(eu+'iramos ');
       PS_vos    :=(eu+'irais ');
       PS_voces  :=(eu+'iram ');
       PS_eles   :=(eu+'iram ');
       PS_elas   :=(eu+'iram ');

       IS_eu     :=(eu+'erisse ');
       IS_tu     :=(eu+'erisses ');
       IS_ele    :=(eu+'erisse ');
       IS_ela    :=(eu+'erisse ');
       IS_voce   :=(eu+'erisse ');
       IS_nos    :=(eu+'erissemos ');
       IS_vos    :=(eu+'erisseis ');
       IS_voces  :=(eu+'erissem ');
       IS_eles   :=(eu+'erissem ');
       IS_elas   :=(eu+'erissem ');

       FS_eu     :=(eu+'erir ');
       FS_tu     :=(eu+'erires ');
       FS_ele    :=(eu+'erir ');
       FS_ela    :=(eu+'erir ');
       FS_voce   :=(eu+'erir ');
       FS_nos    :=(eu+'erirmos ');
       FS_vos    :=(eu+'erirdes ');
       FS_voces  :=(eu+'erirem ');
       FS_eles   :=(eu+'erirem ');
       FS_elas   :=(eu+'erirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ere ');
       IA_ele    :=(eu+'ira ');
       IA_ela    :=(eu+'ira ');
       IA_voce   :=(eu+'ira ');
       IA_nos    :=(eu+'iramos ');
       IA_vos    :=(eu+'eri ');
       IA_voces  :=(eu+'iram ');
       IA_eles   :=(eu+'iram ');
       IA_elas   :=(eu+'iram ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'iras ');
       IN_ele    :=(eu+'ira ');
       IN_ela    :=(eu+'ira ');
       IN_voce   :=(eu+'ira ');
       IN_nos    :=(eu+'iramos ');
       IN_vos    :=(eu+'irais ');
       IN_voces  :=(eu+'iram ');
       IN_eles   :=(eu+'iram ');
       IN_elas   :=(eu+'iram ');

       end//erir meio
      else
       begin//erir contin
        if (pos('rrir ',eu) > 1)and(pos('rrir ',eu)<20)  then
         begin//rrir inicio
          // term c rir // eu tu ele
      //    memo1.lines.add ('rrir');
      if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'rido ');
       GERf      :=(eu+'rida ');
       GERAm     :=(eu+'rizo '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'riza ');
       PART      :=(eu+'rindo ');
       AGENTE1   :=(eu+'rinte ');
       AGENTE2   :=(eu+'ridor ');
       AGENTE3   :=(eu+'ridora ');
       ACAO1     :=(eu+'rimento ');
       ACAO2     :=(eu+'rição ');
       ACAO3     :=(eu+'rimenta ');
       RESU1     :=(eu+'risso ');
       RESU2     :=(eu+'rissa ');

       IP_eu     :=(eu+'rir ');
       IP_tu     :=(eu+'rires ');
       IP_ele    :=(eu+'rir ');
       IP_ela    :=(eu+'rir ');
       IP_voce   :=(eu+'rir ');
       IP_nos    :=(eu+'rirmos ');
       IP_vos    :=(eu+'rirdes ');
       IP_voces  :=(eu+'rirem ');
       IP_eles   :=(eu+'rirem ');
       IP_elas   :=(eu+'rirem ');

       PI_eu     :=(eu+'rio ');
       PI_tu     :=(eu+'ris ');
       PI_ele    :=(eu+'ri ');
       PI_ela    :=(eu+'ri ');
       PI_voce   :=(eu+'ri ');
       PI_nos    :=(eu+'rimos ');
       PI_vos    :=(eu+'ides ');
       PI_voces  :=(eu+'riem ');
       PI_eles   :=(eu+'riem ');
       PI_elas   :=(eu+'riem ');

       PP_eu     :=(eu+'ri ');
       PP_tu     :=(eu+'riste ');
       PP_ele    :=(eu+'riu ');
       PP_ela    :=(eu+'riu ');
       PP_voce   :=(eu+'riu ');         //EI
       PP_nos    :=(eu+'rimos ');
       PP_vos    :=(eu+'ristes ');
       PP_voces  :=(eu+'riram ');
       PP_eles   :=(eu+'riram ');
       PP_elas   :=(eu+'riram ');

       II_eu     :=(eu+'ria ');
       II_tu     :=(eu+'rias ');
       II_ele    :=(eu+'ria ');
       II_ela    :=(eu+'ria ');
       II_voce   :=(eu+'ria ');
       II_nos    :=(eu+'riamos ');
       II_vos    :=(eu+'rieis ');
       II_voces  :=(eu+'riam ');
       II_eles   :=(eu+'riam ');
       II_elas   :=(eu+'riam ');

       MI_eu     :=(eu+'rira ');
       MI_tu     :=(eu+'riras ');
       MI_ele    :=(eu+'rira ');
       MI_ela    :=(eu+'rira ');
       MI_voce   :=(eu+'rira ');
       MI_nos    :=(eu+'riramos ');
       MI_vos    :=(eu+'rireis ');
       MI_voces  :=(eu+'riram ');
       MI_eles   :=(eu+'riram ');
       MI_elas   :=(eu+'riram ');

       TI_eu     :=(eu+'riria ');
       TI_tu     :=(eu+'ririas ');
       TI_ele    :=(eu+'riria ');
       TI_ela    :=(eu+'riria ');
       TI_voce   :=(eu+'riria ');
       TI_nos    :=(eu+'ririamos ');
       TI_vos    :=(eu+'ririeis ');
       TI_voces  :=(eu+'ririam ');
       TI_eles   :=(eu+'ririam ');
       TI_elas   :=(eu+'ririam ');

       FI_eu     :=(eu+'rirei ');
       FI_tu     :=(eu+'riras ');
       FI_ele    :=(eu+'rira ');
       FI_ela    :=(eu+'rira ');
       FI_voce   :=(eu+'rira ');
       FI_nos    :=(eu+'riremos ');
       FI_vos    :=(eu+'rireis ');
       FI_voces  :=(eu+'rirão ');
       FI_eles   :=(eu+'rirão ');
       FI_elas   :=(eu+'rirão ');

       PS_eu     :=(eu+'ria ');
       PS_tu     :=(eu+'rias ');
       PS_ele    :=(eu+'ria ');
       PS_ela    :=(eu+'ria ');
       PS_voce   :=(eu+'ria ');
       PS_nos    :=(eu+'riamos ');
       PS_vos    :=(eu+'riais ');
       PS_voces  :=(eu+'riam ');
       PS_eles   :=(eu+'riam ');
       PS_elas   :=(eu+'riam ');

       IS_eu     :=(eu+'risse ');
       IS_tu     :=(eu+'risses ');
       IS_ele    :=(eu+'risse ');
       IS_ela    :=(eu+'risse ');
       IS_voce   :=(eu+'risse ');
       IS_nos    :=(eu+'rissemos ');
       IS_vos    :=(eu+'risseis ');
       IS_voces  :=(eu+'rissem ');
       IS_eles   :=(eu+'rissem ');
       IS_elas   :=(eu+'rissem ');

       FS_eu     :=(eu+'rir ');
       FS_tu     :=(eu+'rires ');
       FS_ele    :=(eu+'rir ');
       FS_ela    :=(eu+'rir ');
       FS_voce   :=(eu+'rir ');
       FS_nos    :=(eu+'rirmos ');
       FS_vos    :=(eu+'rirdes ');
       FS_voces  :=(eu+'rirem ');
       FS_eles   :=(eu+'rirem ');
       FS_elas   :=(eu+'rirem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ri ');
       IA_ele    :=(eu+'ria ');
       IA_ela    :=(eu+'ria ');
       IA_voce   :=(eu+'ria ');
       IA_nos    :=(eu+'riamos ');
       IA_vos    :=(eu+'ride ');
       IA_voces  :=(eu+'riam ');
       IA_eles   :=(eu+'riam ');
       IA_elas   :=(eu+'riam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'rias ');
       IN_ele    :=(eu+'ria ');
       IN_ela    :=(eu+'ria ');
       IN_voce   :=(eu+'ria ');
       IN_nos    :=(eu+'riamos ');
       IN_vos    :=(eu+'riais ');
       IN_voces  :=(eu+'riam ');
       IN_eles   :=(eu+'riam ');
       IN_elas   :=(eu+'riam ');

         end;//rir fim  // eu tu ele//rir
       end;//erir fim
    end;//egrir fim


    if (pos('air ',eu) > 1)and  (pos('air ',eu) < 20) then
     begin//air inicio
      // term c air // eu tu ele
      //memo1.lines.add ('air');
      if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu)-1,(length(eu)- pos('ir ',eu)+2));

       GERm      :=(eu+'aido ');
       GERf      :=(eu+'aida ');
       GERAm     :=(eu+'aido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'aida ');
       PART      :=(eu+'aindo ');
       AGENTE1   :=(eu+'ainte ');
       AGENTE2   :=(eu+'aidor ');
       AGENTE3   :=(eu+'aidora ');
       ACAO1     :=(eu+'aimento ');
       ACAO2     :=(eu+'aição ');
       ACAO3     :=(eu+'aimenta ');
       RESU1     :=(eu+'aisso ');
       RESU2     :=(eu+'aissa ');

       IP_eu     :=(eu+'air ');
       IP_tu     :=(eu+'aires ');
       IP_ele    :=(eu+'air ');
       IP_ela    :=(eu+'air ');
       IP_voce   :=(eu+'air ');
       IP_nos    :=(eu+'airmos ');
       IP_vos    :=(eu+'airdes ');
       IP_voces  :=(eu+'airem ');
       IP_eles   :=(eu+'airem ');
       IP_elas   :=(eu+'airem ');

       PI_eu     :=(eu+'aio ');
       PI_tu     :=(eu+'ais ');
       PI_ele    :=(eu+'ai ');
       PI_ela    :=(eu+'ai ');
       PI_voce   :=(eu+'ai ');
       PI_nos    :=(eu+'aimos ');
       PI_vos    :=(eu+'ais ');
       PI_voces  :=(eu+'aem ');
       PI_eles   :=(eu+'aem ');
       PI_elas   :=(eu+'aem ');

       PP_eu     :=(eu+'ai ');
       PP_tu     :=(eu+'aiste ');
       PP_ele    :=(eu+'aiu ');
       PP_ela    :=(eu+'aiu ');
       PP_voce   :=(eu+'aiu ');         //EI
       PP_nos    :=(eu+'aimos ');
       PP_vos    :=(eu+'aistes ');
       PP_voces  :=(eu+'airam ');
       PP_eles   :=(eu+'airam ');
       PP_elas   :=(eu+'airam ');

       II_eu     :=(eu+'aia ');
       II_tu     :=(eu+'aias ');
       II_ele    :=(eu+'aia ');
       II_ela    :=(eu+'aia ');
       II_voce   :=(eu+'aia ');
       II_nos    :=(eu+'aiamos ');
       II_vos    :=(eu+'aieis ');
       II_voces  :=(eu+'aiam ');
       II_eles   :=(eu+'aiam ');
       II_elas   :=(eu+'aiam ');

       MI_eu     :=(eu+'aira ');
       MI_tu     :=(eu+'airas ');
       MI_ele    :=(eu+'aira ');
       MI_ela    :=(eu+'aira ');
       MI_voce   :=(eu+'aira ');
       MI_nos    :=(eu+'airamos ');
       MI_vos    :=(eu+'aireis ');
       MI_voces  :=(eu+'airam ');
       MI_eles   :=(eu+'airam ');
       MI_elas   :=(eu+'airam ');

       TI_eu     :=(eu+'airia ');
       TI_tu     :=(eu+'airias ');
       TI_ele    :=(eu+'airia ');
       TI_ela    :=(eu+'airia ');
       TI_voce   :=(eu+'airia ');
       TI_nos    :=(eu+'airiamos ');
       TI_vos    :=(eu+'airieis ');
       TI_voces  :=(eu+'airiam ');
       TI_eles   :=(eu+'airiam ');
       TI_elas   :=(eu+'airiam ');

       FI_eu     :=(eu+'airei ');
       FI_tu     :=(eu+'airas ');
       FI_ele    :=(eu+'aira ');
       FI_ela    :=(eu+'aira ');
       FI_voce   :=(eu+'aira ');
       FI_nos    :=(eu+'airemos ');
       FI_vos    :=(eu+'aireis ');
       FI_voces  :=(eu+'airão ');
       FI_eles   :=(eu+'airão ');
       FI_elas   :=(eu+'airão ');

       PS_eu     :=(eu+'aia ');
       PS_tu     :=(eu+'aias ');
       PS_ele    :=(eu+'aia ');
       PS_ela    :=(eu+'aia ');
       PS_voce   :=(eu+'aia ');
       PS_nos    :=(eu+'aiamos ');
       PS_vos    :=(eu+'aiais ');
       PS_voces  :=(eu+'aiam ');
       PS_eles   :=(eu+'aiam ');
       PS_elas   :=(eu+'aiam ');

       IS_eu     :=(eu+'aisse ');
       IS_tu     :=(eu+'aisses ');
       IS_ele    :=(eu+'aisse ');
       IS_ela    :=(eu+'aisse ');
       IS_voce   :=(eu+'aisse ');
       IS_nos    :=(eu+'aissemos ');
       IS_vos    :=(eu+'aisseis ');
       IS_voces  :=(eu+'aissem ');
       IS_eles   :=(eu+'aissem ');
       IS_elas   :=(eu+'aissem ');

       FS_eu     :=(eu+'air ');
       FS_tu     :=(eu+'aires ');
       FS_ele    :=(eu+'air ');
       FS_ela    :=(eu+'air ');
       FS_voce   :=(eu+'air ');
       FS_nos    :=(eu+'airmos ');
       FS_vos    :=(eu+'airdes ');
       FS_voces  :=(eu+'airem ');
       FS_eles   :=(eu+'airem ');
       FS_elas   :=(eu+'airem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'ai ');
       IA_ele    :=(eu+'aia ');
       IA_ela    :=(eu+'aia ');
       IA_voce   :=(eu+'aia ');
       IA_nos    :=(eu+'aiamos ');
       IA_vos    :=(eu+'aí ');
       IA_voces  :=(eu+'aiam ');
       IA_eles   :=(eu+'aiam ');
       IA_elas   :=(eu+'aiam ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'aias ');
       IN_ele    :=(eu+'aia ');
       IN_ela    :=(eu+'aia ');
       IN_voce   :=(eu+'aia ');
       IN_nos    :=(eu+'aiamos ');
       IN_vos    :=(eu+'aiais ');
       IN_voces  :=(eu+'aiam ');
       IN_eles   :=(eu+'aiam ');
       IN_elas   :=(eu+'aiam ');

     end;//air fim  // eu tu ele//air
    //

    if not ((pos('erir ',eu) > 1) or (pos('ertir ',eu) > 1)or (pos('elir ',eu) > 1) or
     (pos('entir ',eu) > 1)or(pos('etir ',eu) > 1) or (pos('ervir ',eu) > 1)or
    (pos('estir ',eu) > 1) or (pos('erzir ',eu) > 1)or(pos('eguir ',eu) > 1) or (pos('gir ',eu) > 1)or
    (pos('ergir ',eu) > 1) or (pos('ormir ',eu) > 1)or(pos('obrir ',eu) > 1) or (pos('ossir ',eu) > 1)or
    (pos('ortir ',eu) > 1) or (pos('edir ',eu) > 1)or(pos('enir ',eu) > 1) or (pos('egrir ',eu) > 1)or
    (pos('ubir ',eu) > 1) or (pos('ulir ',eu) > 1)or(pos('uspir ',eu) > 1) or (pos('udir ',eu) > 1)or
    (pos('umir ',eu) > 1) or (pos('fugir ',eu) > 0)or(pos('ouvir ',eu) > 1) or (pos('uir ',eu) > 1)or
    (pos('rir ',eu) = 1) or (pos('vir ',eu) > 0)or(pos('guir ',eu) > 1) or
     (pos('air ',eu) > 1)or (pos('ir ',eu) = 1) or (pos('rrir ',eu) > 1))then
    begin //desaninhamento de ifs do ir inicio
    if (pos('ir ',eu) > 1)and  (pos('ir ',eu) < 20) then
     begin // sobro ir regular inic
      ///delete(eu,pos('ir ',eu),(length(eu)- pos('ir ',eu)+1));
      //    memo1.Lines.add ('ir regular');
        if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('ir ',eu),(length(eu)- pos('ir ',eu)+1));

       GERm      :=(eu+'ido ');
       GERf      :=(eu+'ida ');
       GERAm     :=(eu+'ido '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'ida ');
       PART      :=(eu+'indo ');
       AGENTE1   :=(eu+'inte ');
       AGENTE2   :=(eu+'idor ');
       AGENTE3   :=(eu+'idora ');
       ACAO1     :=(eu+'imento ');
       ACAO2     :=(eu+'ição ');
       ACAO3     :=(eu+'imenta ');
       RESU1     :=(eu+'isso ');
       RESU2     :=(eu+'issa ');

       IP_eu     :=(eu+'ir ');
       IP_tu     :=(eu+'ires ');
       IP_ele    :=(eu+'ir ');
       IP_ela    :=(eu+'ir ');
       IP_voce   :=(eu+'ir ');
       IP_nos    :=(eu+'irmos ');
       IP_vos    :=(eu+'irdes ');
       IP_voces  :=(eu+'irem ');
       IP_eles   :=(eu+'irem ');
       IP_elas   :=(eu+'irem ');

       PI_eu     :=(eu+'o ');
       PI_tu     :=(eu+'es ');
       PI_ele    :=(eu+'e ');
       PI_ela    :=(eu+'e ');
       PI_voce   :=(eu+'e ');
       PI_nos    :=(eu+'imos ');
       PI_vos    :=(eu+'is ');
       PI_voces  :=(eu+'em ');
       PI_eles   :=(eu+'em ');
       PI_elas   :=(eu+'em ');

       PP_eu     :=(eu+'i ');
       PP_tu     :=(eu+'iste ');
       PP_ele    :=(eu+'iu ');
       PP_ela    :=(eu+'iu ');
       PP_voce   :=(eu+'iu ');         //EI
       PP_nos    :=(eu+'imos ');
       PP_vos    :=(eu+'istes ');
       PP_voces  :=(eu+'iram ');
       PP_eles   :=(eu+'iram ');
       PP_elas   :=(eu+'iram ');

       II_eu     :=(eu+'ia ');
       II_tu     :=(eu+'ias ');
       II_ele    :=(eu+'ia ');
       II_ela    :=(eu+'ia ');
       II_voce   :=(eu+'ia ');
       II_nos    :=(eu+'iamos ');
       II_vos    :=(eu+'ieis ');
       II_voces  :=(eu+'iam ');
       II_eles   :=(eu+'iam ');
       II_elas   :=(eu+'iam ');

       MI_eu     :=(eu+'ira ');
       MI_tu     :=(eu+'iras ');
       MI_ele    :=(eu+'ira ');
       MI_ela    :=(eu+'ira ');
       MI_voce   :=(eu+'ira ');
       MI_nos    :=(eu+'iramos ');
       MI_vos    :=(eu+'ireis ');
       MI_voces  :=(eu+'iram ');
       MI_eles   :=(eu+'iram ');
       MI_elas   :=(eu+'iram ');

       TI_eu     :=(eu+'iria ');
       TI_tu     :=(eu+'irias ');
       TI_ele    :=(eu+'iria ');
       TI_ela    :=(eu+'iria ');
       TI_voce   :=(eu+'iria ');
       TI_nos    :=(eu+'iriamos ');
       TI_vos    :=(eu+'irieis ');
       TI_voces  :=(eu+'iriam ');
       TI_eles   :=(eu+'iriam ');
       TI_elas   :=(eu+'iriam ');

       FI_eu     :=(eu+'irei ');
       FI_tu     :=(eu+'iras ');
       FI_ele    :=(eu+'ira ');
       FI_ela    :=(eu+'ira ');
       FI_voce   :=(eu+'ira ');
       FI_nos    :=(eu+'iremos ');
       FI_vos    :=(eu+'ireis ');
       FI_voces  :=(eu+'irão ');
       FI_eles   :=(eu+'irão ');
       FI_elas   :=(eu+'irão ');

       PS_eu     :=(eu+'a ');
       PS_tu     :=(eu+'as ');
       PS_ele    :=(eu+'a ');
       PS_ela    :=(eu+'a ');
       PS_voce   :=(eu+'a ');
       PS_nos    :=(eu+'amos ');
       PS_vos    :=(eu+'ais ');
       PS_voces  :=(eu+'am ');
       PS_eles   :=(eu+'am ');
       PS_elas   :=(eu+'am ');

       IS_eu     :=(eu+'isse ');
       IS_tu     :=(eu+'isses ');
       IS_ele    :=(eu+'isse ');
       IS_ela    :=(eu+'isse ');
       IS_voce   :=(eu+'isse ');
       IS_nos    :=(eu+'issemos ');
       IS_vos    :=(eu+'isseis ');
       IS_voces  :=(eu+'issem ');
       IS_eles   :=(eu+'issem ');
       IS_elas   :=(eu+'issem ');

       FS_eu     :=(eu+'ir ');
       FS_tu     :=(eu+'ires ');
       FS_ele    :=(eu+'ir ');
       FS_ela    :=(eu+'ir ');
       FS_voce   :=(eu+'ir ');
       FS_nos    :=(eu+'irmos ');
       FS_vos    :=(eu+'irdes ');
       FS_voces  :=(eu+'irem ');
       FS_eles   :=(eu+'irem ');
       FS_elas   :=(eu+'irem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'e ');
       IA_ele    :=(eu+'a ');
       IA_ela    :=(eu+'a ');
       IA_voce   :=(eu+'a ');
       IA_nos    :=(eu+'amos ');
       IA_vos    :=(eu+'i ');
       IA_voces  :=(eu+'am ');
       IA_eles   :=(eu+'am ');
       IA_elas   :=(eu+'am ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'as ');
       IN_ele    :=(eu+'a ');
       IN_ela    :=(eu+'a ');
       IN_voce   :=(eu+'a ');
       IN_nos    :=(eu+'amos ');
       IN_vos    :=(eu+'ais ');
       IN_voces  :=(eu+'am ');
       IN_eles   :=(eu+'am ');
       IN_elas   :=(eu+'am ');




     end;//sobro ir regular fim
     end;//desaninhamento de ifs do ir fim
    end;//ir fim





        //####################///

                   //###### por


   if (pos('por ',eu) > 0)and  (pos('por ',eu) < 20) then
    begin//por inicio
    //memo1.lines.Add('por');
    if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;
       delete(eu,pos('or ',eu)-1,(length(eu)- pos('or ',eu)+2));

       GERm      :=(eu+'posto ');
       GERf      :=(eu+'posta ');
       GERAm     :=(eu+'posto '); //gerundio abundante geralm só irregulares tem
       GERAf     :=(eu+'posta ');
       PART      :=(eu+'pondo ');
       AGENTE1   :=(eu+'posinte ');
       AGENTE2   :=(eu+'positor ');
       AGENTE3   :=(eu+'positora ');
       ACAO1     :=(eu+'posimento ');
       ACAO2     :=(eu+'posição ');
       ACAO3     :=(eu+'posmenta ');
       RESU1     :=(eu+'posisso ');
       RESU2     :=(eu+'posissa ');

       IP_eu     :=(eu+'por ');
       IP_tu     :=(eu+'pores ');
       IP_ele    :=(eu+'por ');
       IP_ela    :=(eu+'por ');
       IP_voce   :=(eu+'por ');
       IP_nos    :=(eu+'pormos ');
       IP_vos    :=(eu+'pordes ');
       IP_voces  :=(eu+'porem ');
       IP_eles   :=(eu+'porem ');
       IP_elas   :=(eu+'porem ');

       PI_eu     :=(eu+'ponho ');
       PI_tu     :=(eu+'pões ');
       PI_ele    :=(eu+'põe ');
       PI_ela    :=(eu+'põe ');
       PI_voce   :=(eu+'põe ');
       PI_nos    :=(eu+'pomos ');
       PI_vos    :=(eu+'pordes ');
       PI_voces  :=(eu+'põem ');
       PI_eles   :=(eu+'põem ');
       PI_elas   :=(eu+'põem ');

       PP_eu     :=(eu+'pus ');
       PP_tu     :=(eu+'puseste ');
       PP_ele    :=(eu+'pos ');
       PP_ela    :=(eu+'pos ');
       PP_voce   :=(eu+'pos ');         //EI
       PP_nos    :=(eu+'pusemos ');
       PP_vos    :=(eu+'pusestes ');
       PP_voces  :=(eu+'puseram ');
       PP_eles   :=(eu+'puseram ');
       PP_elas   :=(eu+'puseram ');

       II_eu     :=(eu+'punha ');
       II_tu     :=(eu+'punhas ');
       II_ele    :=(eu+'punha ');
       II_ela    :=(eu+'punha ');
       II_voce   :=(eu+'punha ');
       II_nos    :=(eu+'punhamos ');
       II_vos    :=(eu+'punheis ');
       II_voces  :=(eu+'punham ');
       II_eles   :=(eu+'punham ');
       II_elas   :=(eu+'punham ');

       MI_eu     :=(eu+'pusera ');
       MI_tu     :=(eu+'puseras ');
       MI_ele    :=(eu+'pusera ');
       MI_ela    :=(eu+'pusera ');
       MI_voce   :=(eu+'pusera ');
       MI_nos    :=(eu+'puseramos ');
       MI_vos    :=(eu+'pusereis ');
       MI_voces  :=(eu+'puseram ');
       MI_eles   :=(eu+'puseram ');
       MI_elas   :=(eu+'puseram ');

       TI_eu     :=(eu+'poria ');
       TI_tu     :=(eu+'porias ');
       TI_ele    :=(eu+'poria ');
       TI_ela    :=(eu+'poria ');
       TI_voce   :=(eu+'poria ');
       TI_nos    :=(eu+'poriamos ');
       TI_vos    :=(eu+'porieis ');
       TI_voces  :=(eu+'poriam ');
       TI_eles   :=(eu+'poriam ');
       TI_elas   :=(eu+'poriam ');

       FI_eu     :=(eu+'porei ');
       FI_tu     :=(eu+'poras ');
       FI_ele    :=(eu+'pora ');
       FI_ela    :=(eu+'pora ');
       FI_voce   :=(eu+'pora ');
       FI_nos    :=(eu+'poremos ');
       FI_vos    :=(eu+'poreis ');
       FI_voces  :=(eu+'porão ');
       FI_eles   :=(eu+'porão ');
       FI_elas   :=(eu+'porão ');

       PS_eu     :=(eu+'ponha ');
       PS_tu     :=(eu+'ponhas ');
       PS_ele    :=(eu+'ponha ');
       PS_ela    :=(eu+'ponha ');
       PS_voce   :=(eu+'ponha ');
       PS_nos    :=(eu+'ponhamos ');
       PS_vos    :=(eu+'ponhais ');
       PS_voces  :=(eu+'ponham ');
       PS_eles   :=(eu+'ponham ');
       PS_elas   :=(eu+'ponham ');

       IS_eu     :=(eu+'pusesse ');
       IS_tu     :=(eu+'pusesses ');
       IS_ele    :=(eu+'pusesse ');
       IS_ela    :=(eu+'pusesse ');
       IS_voce   :=(eu+'pusesse ');
       IS_nos    :=(eu+'pusessemos ');
       IS_vos    :=(eu+'pusesseis ');
       IS_voces  :=(eu+'pusessem ');
       IS_eles   :=(eu+'pusessem ');
       IS_elas   :=(eu+'pusessem ');

       FS_eu     :=(eu+'puser ');
       FS_tu     :=(eu+'puseres ');
       FS_ele    :=(eu+'puser ');
       FS_ela    :=(eu+'puser ');
       FS_voce   :=(eu+'puser ');
       FS_nos    :=(eu+'pusermos ');
       FS_vos    :=(eu+'puserdes ');
       FS_voces  :=(eu+'puserem ');
       FS_eles   :=(eu+'puserem ');
       FS_elas   :=(eu+'puserem ');

       IA_eu     :=(eu+' ');
       IA_tu     :=(eu+'põe ');
       IA_ele    :=(eu+'ponha ');
       IA_ela    :=(eu+'ponha ');
       IA_voce   :=(eu+'ponha ');
       IA_nos    :=(eu+'ponhamos ');
       IA_vos    :=(eu+'ponde ');
       IA_voces  :=(eu+'ponham ');
       IA_eles   :=(eu+'ponham ');
       IA_elas   :=(eu+'ponham ');

       IN_eu     :=(eu+' ');
       IN_tu     :=(eu+'ponhas ');
       IN_ele    :=(eu+'ponha ');
       IN_ela    :=(eu+'ponha ');
       IN_voce   :=(eu+'ponha ');
       IN_nos    :=(eu+'ponhamos ');
       IN_vos    :=(eu+'ponhais ');
       IN_voces  :=(eu+'ponham ');
       IN_eles   :=(eu+'ponham ');
       IN_elas   :=(eu+'ponham ');

//variant var generica numero e char como em c++  para uso na hora do aperto
    end;//por fim
   end;//bloco_de_verbos fim

   //bloco_de_verbos enrola a cima ^^^^
        /////////

 begin//array_verbos ini


  aconjugado[1] :=GERm    ;//cantado
  aconjugado[2] :=GERAm   ;//   tazo
  aconjugado[3] :=AGENTE2 ;//cantador
  aconjugado[4] :=ACAO1   ;//cantamento
  aconjugado[5] :=RESU1   ;//cantasso

  aconjugado[6] :=PART     ;//cantando
  aconjugado[7] :=AGENTE1  ;//cantante

  aconjugado[8] :=GERf     ;//     da
  aconjugado[9] :=GERAf    ;//     za
  aconjugado[10] :=AGENTE3 ;//cantadora
  aconjugado[11] :=ACAO2   ;//cantação
  aconjugado[12] :=ACAO3   ;//cantamenta
  aconjugado[13] :=RESU2   ;//cantassa



  aconjugado[14] :=FI_eu     ;
  aconjugado[15] :=FI_tu     ;
  aconjugado[16] :=FI_ele    ;
  aconjugado[17] :=FI_ela    ;
  aconjugado[18] :=FI_voce   ;       //1
  aconjugado[19] :=FI_nos    ;
  aconjugado[20] :=FI_vos    ;
  aconjugado[21] :=FI_voces  ;
  aconjugado[22] :=FI_eles   ;
  aconjugado[23] :=FI_elas   ;

  aconjugado[24] :=PI_eu    ;
  aconjugado[25] :=PI_tu    ;
  aconjugado[26] :=PI_ele   ;
  aconjugado[27] :=PI_ela   ;
  aconjugado[28] :=PI_voce  ;          //2
  aconjugado[29] :=PI_nos   ;
  aconjugado[30] :=PI_vos   ;
  aconjugado[31] :=PI_voces ;
  aconjugado[32] :=PI_eles  ;
  aconjugado[33] :=PI_elas  ;

  aconjugado[34] :=PP_eu    ;
  aconjugado[35] :=PP_tu    ;
  aconjugado[36] :=PP_ele   ;
  aconjugado[37] :=PP_ela   ;
  aconjugado[38] :=PP_voce  ;             //3
  aconjugado[39] :=PP_nos   ;
  aconjugado[40] :=PP_vos   ;
  aconjugado[41] :=PP_voces ;
  aconjugado[42] :=PP_eles  ;
  aconjugado[43] :=PP_elas  ;

  aconjugado[44] :=II_eu    ;
  aconjugado[45] :=II_tu    ;
  aconjugado[46] :=II_ele   ;
  aconjugado[47] :=II_ela   ;
  aconjugado[48] :=II_voce  ;              //4
  aconjugado[49] :=II_nos   ;
  aconjugado[50] :=II_vos   ;
  aconjugado[51] :=II_voces ;
  aconjugado[52] :=II_eles  ;
  aconjugado[53] :=II_elas  ;


  aconjugado[54] :=MI_eu    ;
  aconjugado[55] :=MI_tu    ;
  aconjugado[56] :=MI_ele   ;
  aconjugado[57] :=MI_ela   ;
  aconjugado[58] :=MI_voce  ;
  aconjugado[59] :=MI_nos   ;                 //5
  aconjugado[60] :=MI_vos   ;
  aconjugado[61] :=MI_voces ;
  aconjugado[62] :=MI_eles  ;
  aconjugado[63] :=MI_elas  ;

  aconjugado[64] :=TI_eu     ;
  aconjugado[65] :=TI_tu     ;
  aconjugado[66] :=TI_ele    ;
  aconjugado[67] :=TI_ela    ;
  aconjugado[68] :=TI_voce   ;
  aconjugado[69] :=TI_nos    ;                  //6
  aconjugado[70] :=TI_vos    ;
  aconjugado[71] :=TI_voces  ;
  aconjugado[72] :=TI_eles   ;
  aconjugado[73] :=TI_elas   ;

  aconjugado[74] :=IP_eu    ;
  aconjugado[75] :=IP_tu    ;
  aconjugado[76] :=IP_ele   ;
  aconjugado[77] :=IP_ela   ;
  aconjugado[78] :=IP_voce  ;
  aconjugado[79] :=IP_nos   ;
  aconjugado[80] :=IP_vos   ;                     //7
  aconjugado[81] :=IP_voces ;
  aconjugado[82] :=IP_eles  ;
  aconjugado[83] :=IP_elas  ;

  aconjugado[84] :=PS_eu     ;
  aconjugado[85] :=PS_tu     ;
  aconjugado[86] :=PS_ele    ;
  aconjugado[87] :=PS_ela    ;
  aconjugado[88] :=PS_voce   ;
  aconjugado[89] :=PS_nos    ;                     //8
  aconjugado[90] :=PS_vos    ;
  aconjugado[91] :=PS_voces  ;
  aconjugado[92] :=PS_eles   ;
  aconjugado[93] :=PS_elas   ;

  aconjugado[94] :=IS_eu     ;
  aconjugado[95] :=IS_tu     ;
  aconjugado[96] :=IS_ele    ;
  aconjugado[97] :=IS_ela    ;
  aconjugado[98] :=IS_voce   ;                       //9
  aconjugado[99] :=IS_nos    ;
  aconjugado[100] :=IS_vos    ;
  aconjugado[101] :=IS_voces  ;
  aconjugado[102] :=IS_eles   ;
  aconjugado[103] :=IS_elas   ;

  aconjugado[104] :=FS_eu     ;
  aconjugado[105] :=FS_tu     ;
  aconjugado[106] :=FS_ele    ;
  aconjugado[107] :=FS_ela    ;
  aconjugado[108] :=FS_voce   ;
  aconjugado[109] :=FS_nos    ;                      //10
  aconjugado[110] :=FS_vos    ;
  aconjugado[111] :=FS_voces  ;
  aconjugado[112] :=FS_eles   ;
  aconjugado[113] :=FS_elas   ;

  aconjugado[114] :=IA_tu     ;
  aconjugado[115] :=IA_ele    ;
  aconjugado[116] :=IA_ela    ;
  aconjugado[117] :=IA_voce   ;                       //11
  aconjugado[118] :=IA_nos    ;
  aconjugado[119] :=IA_vos    ;
  aconjugado[120] :=IA_voces  ;
  aconjugado[121] :=IA_eles   ;
  aconjugado[122] :=IA_elas   ;

  aconjugado[123] :=IN_tu     ;
  aconjugado[124] :=IN_ele    ;
  aconjugado[125] :=IN_ela    ;
  aconjugado[126] :=IN_voce   ;
  aconjugado[127] :=IN_nos    ;                     //12
  aconjugado[128] :=IN_vos    ;
  aconjugado[129] :=IN_voces  ;
  aconjugado[130] :=IN_eles   ;
  aconjugado[131] :=IN_elas   ;

  aconjugado[132] := (trim(GERm     )+'s ')    ;//cantado s
  aconjugado[133] := (trim(GERAm   )+'s ')    ;//   tazo s
  aconjugado[134] := (trim(AGENTE2 )+'es ')    ;//cantador es
  aconjugado[135] := (trim(ACAO1   )+'s ')    ;//cantamento s
  aconjugado[136] := (trim(RESU1   )+'s ')    ;//cantasso s

  aconjugado[137] := (trim(AGENTE1 )+'s ')    ;//cantante s

  aconjugado[138] := (trim(GERf    )+'s ')    ;// cantada s
  aconjugado[139] := (trim(GERAf   )+'s ')    ;//     za s
  aconjugado[140] := (trim(AGENTE3 )+'s ')    ;//cantadora s
  delete(ACAO2,(pos('ão ',ACAO2)), 3 ) ; //a funçao delete concidera ã como ~a  //2 caraceres ou o ç
  aconjugado[141] := (trim(acao2)+'ões ')    ;//cantações
  aconjugado[142] := (trim(ACAO3   )+'s ')    ;//cantamenta s
  aconjugado[143] := (trim(RESU2   )+'s ')    ;//cantassa s


  aderivado[1] :=GERm    ;//cantado
  aderivado[2] :=GERAm   ;//   tazo
  aderivado[3] :=AGENTE2 ;//cantador
  aderivado[4] :=ACAO1   ;//cantamento
  aderivado[5] :=RESU1   ;//cantasso

  aderivado[6] :=PART     ;//cantando
  aderivado[7] :=AGENTE1  ;//cantante

  aderivado[8] :=GERf     ;//     da
  aderivado[9] :=GERAf    ;//     za
  aderivado[10] :=AGENTE3 ;//cantadora
  aderivado[11] :=ACAO2   ;//cantação
  aderivado[12] :=ACAO3   ;//cantamenta
  aderivado[13] :=RESU2   ;//cantassa


  aderivado[14] := (trim(GERm     )+'s ')    ;//cantado s
  aderivado[15] := (trim(GERAm   )+'s ')    ;//   tazo s
  aderivado[16] := (trim(AGENTE2 )+'es ')    ;//cantador es
  aderivado[17] := (trim(ACAO1   )+'s ')    ;//cantamento s
  aderivado[18] := (trim(RESU1   )+'s ')    ;//cantasso s

  aderivado[19] := (trim(AGENTE1 )+'s ')    ;//cantante s

  aderivado[20] := (trim(GERf    )+'s ')    ;// cantada s
  aderivado[21] := (trim(GERAf   )+'s ')    ;//     za s
  aderivado[22] := (trim(AGENTE3 )+'s ')    ;//cantadora s
  delete(ACAO2,(pos('ão ',ACAO2)), 3 ) ; //a funçao delete concidera ã como ~a  //2 caraceres ou o ç
  aderivado[23] := (trim(acao2)+'ões ')    ;//cantações
  aderivado[24] := (trim(ACAO3   )+'s ')    ;//cantamenta s
  aderivado[25] := (trim(RESU2   )+'s ')    ;//cantassa s

  verbo:=cj_str1;

  a_eu_tu_ele[1] := 'GERm      ';//cantado
  a_eu_tu_ele[2] := 'GERAm     ';//   tazo
  a_eu_tu_ele[3] := 'AGENTE2   ';//cantador
  a_eu_tu_ele[4] := 'ACAO1     ';//cantamento
  a_eu_tu_ele[5] := 'RESU1     ';//cantasso

  a_eu_tu_ele[6] := 'PART      ';//cantando
  a_eu_tu_ele[7] := 'AGENTE1   ';//cantante

  a_eu_tu_ele[8] := 'GERf      ';//     da
  a_eu_tu_ele[9] := 'GERAf     ';//     za
  a_eu_tu_ele[10] :='AGENTE3  ';//cantadora
  a_eu_tu_ele[11] :='ACAO2    ';//cantação
  a_eu_tu_ele[12] :='ACAO3    ';//cantamenta
  a_eu_tu_ele[13] :='RESU2    ';//cantassa

  a_eu_tu_ele[14] :='Futuro do presnte Indicativo_eu    ';
  a_eu_tu_ele[15] :='FI_tu    ';
  a_eu_tu_ele[16] :='FI_ele   ';
  a_eu_tu_ele[17] :='FI_ela   ';
  a_eu_tu_ele[18] :='FI_voce  ';       //1
  a_eu_tu_ele[19] :='FI_nos   ';
  a_eu_tu_ele[20] :='FI_vos   ';
  a_eu_tu_ele[21] :='FI_voces ';
  a_eu_tu_ele[22] :='FI_eles  ';
  a_eu_tu_ele[23] :='FI_elas  ';

  a_eu_tu_ele[24] :='Presente Indicativo_eu    ';
  a_eu_tu_ele[25] :='PI_tu    ';
  a_eu_tu_ele[26] :='PI_ele   ';
  a_eu_tu_ele[27] :='PI_ela   ';
  a_eu_tu_ele[28] :='PI_voce  ';          //2
  a_eu_tu_ele[29] :='PI_nos   ';
  a_eu_tu_ele[30] :='PI_vos   ';
  a_eu_tu_ele[31] :='PI_voces ';
  a_eu_tu_ele[32] :='PI_eles  ';
  a_eu_tu_ele[33] :='PI_elas  ';

  a_eu_tu_ele[34] :='Preterito Perfeito_eu    ';
  a_eu_tu_ele[35] :='PP_tu    ';
  a_eu_tu_ele[36] :='PP_ele   ';
  a_eu_tu_ele[37] :='PP_ela   ';
  a_eu_tu_ele[38] :='PP_voce  ';             //3
  a_eu_tu_ele[39] :='PP_nos   ';
  a_eu_tu_ele[40] :='PP_vos   ';
  a_eu_tu_ele[41] :='PP_voces ';
  a_eu_tu_ele[42] :='PP_eles  ';
  a_eu_tu_ele[43] :='PP_elas  ';

  a_eu_tu_ele[44] :='Imperfeito Indicativo_eu    ';
  a_eu_tu_ele[45] :='II_tu    ';
  a_eu_tu_ele[46] :='II_ele   ';
  a_eu_tu_ele[47] :='II_ela   ';
  a_eu_tu_ele[48] :='II_voce  ';              //4
  a_eu_tu_ele[49] :='II_nos   ';
  a_eu_tu_ele[50] :='II_vos   ';
  a_eu_tu_ele[51] :='II_voces ';
  a_eu_tu_ele[52] :='II_eles  ';
  a_eu_tu_ele[53] :='II_elas  ';


  a_eu_tu_ele[54] :='Mais que perfeito Indicativo_eu    ';
  a_eu_tu_ele[55] :='MI_tu    ';
  a_eu_tu_ele[56] :='MI_ele   ';
  a_eu_tu_ele[57] :='MI_ela   ';
  a_eu_tu_ele[58] :='MI_voce  ';
  a_eu_tu_ele[59] :='MI_nos   ';                 //5
  a_eu_tu_ele[60] :='MI_vos   ';
  a_eu_tu_ele[61] :='MI_voces ';
  a_eu_tu_ele[62] :='MI_eles  ';
  a_eu_tu_ele[63] :='MI_elas  ';

  a_eu_tu_ele[64] :='futuro do pretérito Indicativo_eu    ' ;
  a_eu_tu_ele[65] :='TI_tu    ' ;
  a_eu_tu_ele[66] :='TI_ele   ' ;
  a_eu_tu_ele[67] :='TI_ela   ' ;
  a_eu_tu_ele[68] :='TI_voce  ' ;
  a_eu_tu_ele[69] :='TI_nos   ' ;                  //6
  a_eu_tu_ele[70] :='TI_vos   ' ;
  a_eu_tu_ele[71] :='TI_voces ' ;
  a_eu_tu_ele[72] :='TI_eles  ' ;
  a_eu_tu_ele[73] :='TI_elas  ' ;

  a_eu_tu_ele[74] :='Imperativo_eu    ';
  a_eu_tu_ele[75] :='IP_tu    ';
  a_eu_tu_ele[76] :='IP_ele   ';
  a_eu_tu_ele[77] :='IP_ela   ';
  a_eu_tu_ele[78] :='IP_voce  ';
  a_eu_tu_ele[79] :='IP_nos   ';
  a_eu_tu_ele[80] :='IP_vos   ';                     //7
  a_eu_tu_ele[81] :='IP_voces ';
  a_eu_tu_ele[82] :='IP_eles  ';
  a_eu_tu_ele[83] :='IP_elas  ';

  a_eu_tu_ele[84] :='Presente Subjuntivo_eu    ';
  a_eu_tu_ele[85] :='PS_tu    ';
  a_eu_tu_ele[86] :='PS_ele   ';
  a_eu_tu_ele[87] :='PS_ela   ';
  a_eu_tu_ele[88] :='PS_voce  ';
  a_eu_tu_ele[89] :='PS_nos   ';                     //8
  a_eu_tu_ele[90] :='PS_vos   ';
  a_eu_tu_ele[91] :='PS_voces ';
  a_eu_tu_ele[92] :='PS_eles  ';
  a_eu_tu_ele[93] :='PS_elas  ';

  a_eu_tu_ele[94] :='Imprefeito Subjuntivo_eu    ';
  a_eu_tu_ele[95] :='IS_tu    ';
  a_eu_tu_ele[96] :='IS_ele   ';
  a_eu_tu_ele[97] :='IS_ela   ';
  a_eu_tu_ele[98] :='IS_voce  ';                       //9
  a_eu_tu_ele[99] :='IS_nos   ';
  a_eu_tu_ele[100]:='IS_vos   ';
  a_eu_tu_ele[101]:='IS_voces ';
  a_eu_tu_ele[102]:='IS_eles  ';
  a_eu_tu_ele[103]:='IS_elas  ';

  a_eu_tu_ele[104] :='Futuro Subjuntivo_eu    ';
  a_eu_tu_ele[105] :='FS_tu    ';
  a_eu_tu_ele[106] :='FS_ele   ';
  a_eu_tu_ele[107] :='FS_ela   ';
  a_eu_tu_ele[108] :='FS_voce  ';
  a_eu_tu_ele[109] :='FS_nos   ';                      //10
  a_eu_tu_ele[110] :='FS_vos   ';
  a_eu_tu_ele[111] :='FS_voces ';
  a_eu_tu_ele[112] :='FS_eles  ';
  a_eu_tu_ele[113] :='FS_elas  ';

  a_eu_tu_ele[114] :='Imperativo Afirmativo_tu    ' ;
  a_eu_tu_ele[115] :='IA_ele   ' ;
  a_eu_tu_ele[116] :='IA_ela   ' ;
  a_eu_tu_ele[117] :='IA_voce  ' ;                       //11
  a_eu_tu_ele[118] :='IA_nos   ' ;
  a_eu_tu_ele[119] :='IA_vos   ' ;
  a_eu_tu_ele[120] :='IA_voces ' ;
  a_eu_tu_ele[121] :='IA_eles  ' ;
  a_eu_tu_ele[122] :='IA_elas  ' ;

  a_eu_tu_ele[123] :='Imperativo Negativo_tu    '   ;
  a_eu_tu_ele[124] :='IN_ele   '   ;
  a_eu_tu_ele[125] :='IN_ela   '   ;
  a_eu_tu_ele[126] :='IN_voce  '  ;
  a_eu_tu_ele[127] :='IN_nos   '   ;                     //12
  a_eu_tu_ele[128] :='IN_vos   '   ;
  a_eu_tu_ele[129] :='IN_voces ' ;
  a_eu_tu_ele[130] :='IN_eles  '  ;
  a_eu_tu_ele[131] :='IN_elas  '  ;

  a_eu_tu_ele[132] := 'GERm  s   '  ;//cantado s
  a_eu_tu_ele[133] := 'GERAm s   '    ;//   tazo s
  a_eu_tu_ele[134] := 'AGENTE2 s '    ;//cantador es
  a_eu_tu_ele[135] := 'ACAO1  s  '    ;//cantamento s
  a_eu_tu_ele[136] := 'RESU1  s  '    ;//cantasso s

  a_eu_tu_ele[137] := 'AGENTE1s  '    ;//cantante s

  a_eu_tu_ele[138] := 'GERf   s  '    ;// cantada s
  a_eu_tu_ele[139] := 'GERAf   s '    ;//     za s
  a_eu_tu_ele[140] := 'AGENTE3s  '    ;//cantadora s
  a_eu_tu_ele[141] := 'acao2     '    ;//cantações
  a_eu_tu_ele[142] := 'ACAO3   s '    ;//cantamenta s
  a_eu_tu_ele[143] := 'RESU2   s '    ;//cantassa s


           if Pos('¨',eu)>0 then
           begin
             Insert('ç',eu,pos('¨',eu));
             delete(eu,pos('¨',eu),1);
           end;


   //fumcao trim()   tira os espacos em braco  do inicio e do fim da variavel
   // mas da pau no lazarus (muitas var locais)//ops quem tava dando pau era o delete com Ç´^ e otrasmerda ;

    end;//array_verbos fim

       //array_verbos enrol acima^^^^
 end
 else
 begin
  for icont :=0 to 150 do
   aconjugado[icont]:='';
  for icont :=0 to 30 do
   aderivado[icont]:='';
  verbo:='';
 end;

 end;//conjuga_verbo fim

constructor Tconjugador.Create;
var
  cont: Integer;
begin
     a_eu_tu_ele:=TStringList.Create;
     aconjugado:=TStringList.Create;
 for cont :=0 to 200 do
  begin
    a_eu_tu_ele.Add(' ');
    aconjugado.Add(' ');
  end;
end;

   destructor Tconjugador.Destroy;
begin
  a_eu_tu_ele.Destroy;
  aconjugado.Destroy;
  inherited Destroy;
end;

     //conjuga_verbo enrrol ^^^^

end.

