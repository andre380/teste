unit Upronomes; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uarrays;
type

{ Tpronomes }

Tpronomes= class 
 status:integer;
 vetor:Tarray30k;
 lista,apron,apron2:TStringList ;
 function compativeis(str1,str2:string):string;
 function tipo_pron(str1:string):string;
 constructor Create;
 destructor Destroy; override;
end;
implementation


function Tpronomes.tipo_pron(str1:string):string;
var
   tp_pron :TStringList;
   tp_cont : integer ;
   cont: Integer;
begin
    tp_pron :=TStringList.Create;
    for cont:=0 to 200 do tp_pron.Add(' ');
    str1:=Trim(str1)+' ';
    tp_pron[0]  :=  'a '      ; //alvo
    tp_pron[1]  :=  'a '      ;
    tp_pron[2]  :=  'o '      ;
    tp_pron[3]  :=  'as '     ;
    tp_pron[4]  :=  'os '     ; //alvo\
    tp_pron[5]  :=  'com '    ; //referencia
    tp_pron[6]  :=  'sem '    ;
    tp_pron[7]  :=  'em '     ;
    tp_pron[8]  :=  'por '    ;
    tp_pron[9]  :=  'para '   ;
    tp_pron[10]  := 'pra '    ;
    //              "para o" = pro

    tp_pron[11] :=  'pelo '    ;
    tp_pron[12] :=  'pela '    ;
    tp_pron[13] :=  'pelos '   ;
    tp_pron[14] :=  'pelas '   ;//referencia\
    tp_pron[15] :=  'comigo '  ;//alvoOculto
    tp_pron[16] :=  'contigo ' ;
    tp_pron[17] :=  'consigo ' ;
    tp_pron[18] :=  'conosco ' ;
    tp_pron[19] :=  'convosco '; //alvoOculto\
    tp_pron[20] :=  'nem '   ; //verbal
    tp_pron[21] :=  'nen '   ; //verbal\
    tp_pron[22] :=  'à '     ;        //referencia
    tp_pron[23] :=  'ao '    ;        //
    tp_pron[24] :=  'às '    ;        //
    tp_pron[25] :=  'aos '   ;        //
    tp_pron[26] :=  'de '    ;        //
    tp_pron[27] :=  'da '    ;        //
    tp_pron[28] :=  'do '    ;        //
    tp_pron[29] :=  'das '   ;        //
    tp_pron[30] :=  'dos '   ;        //
     tp_pron[31] :='neste '       ;   //
     tp_pron[32] :='nestes '      ;   //
     tp_pron[33] :='nesta '       ;   //
     tp_pron[34] :='nestas '      ;   //
     tp_pron[35] :='nisto '       ;   //
     tp_pron[36] :='nesse '       ;   //
     tp_pron[37] :='nesses '      ;   //
     tp_pron[38] :='nessa '       ;   //
     tp_pron[39] :='nessas '      ;   //
     tp_pron[40] :='nisso '       ;   //
     tp_pron[41] :='naquele '     ;   //
     tp_pron[42] :='naqueles '    ;   //
     tp_pron[43] :='naquela '     ;   //
     tp_pron[44] :='naquelas '    ;   //referencia\
     tp_pron[45] :='naquilo '     ;   //referenciaOculta\/

     tp_pron[46] :='deste '       ;   //referencia
     tp_pron[47] :='destes '      ;   //
     tp_pron[48] :='desta '       ;   //
     tp_pron[49] :='destas '      ;   //
     tp_pron[50] :='disto '       ;   //
     tp_pron[51] :='desse '       ;   //
     tp_pron[52] :='desses '      ;   //
     tp_pron[53] :='dessa '       ;   //
     tp_pron[54] :='dessas '      ;   //
     tp_pron[55] :='disso '       ;   //
     tp_pron[56] :='daquele '     ;   //
     tp_pron[57] :='daqueles '    ;   //
     tp_pron[58] :='daquela '     ;   //
     tp_pron[59] :='daquelas '    ;   //referencia\
     tp_pron[60] :='daquilo '     ;  //referenciaOculta\/
     tp_pron[61] :='meu '         ;  //alvo
     tp_pron[62] :='seu '         ;  //
     tp_pron[63] :='teu '         ;  //
     tp_pron[64] :='nosso '       ;  //
     tp_pron[65] :='vosso '       ;  //
     tp_pron[66] :='minha '       ;  //
     tp_pron[67] :='sua '         ;  //
     tp_pron[68] :='tua '         ;  //
     tp_pron[69] :='nossa '       ;  //
     tp_pron[70] :='vossa '       ;  //
     tp_pron[71] :='meus '        ;  //
     tp_pron[72] :='seus '        ;  //
     tp_pron[73] :='teus '        ;  //
     tp_pron[74] :='nossos '      ;  //
     tp_pron[75] :='vossos '      ;  //
     tp_pron[76] :='minhas '      ;  //
     tp_pron[77] :='suas '        ;  //
     tp_pron[78] :='tuas '        ;  //
     tp_pron[79] :='nossas '      ;  //
     tp_pron[80] :='vossas '      ;  //
                                     //
     tp_pron[81] :='um '          ;  //
     tp_pron[82] :='algum '       ;  //
     tp_pron[83] :='nenhum '      ;  //
     tp_pron[84] :='uma '         ;  //
     tp_pron[85] :='alguma '      ;  //
     tp_pron[86] :='nenhuma '     ;  //
     tp_pron[87] :='uns '         ;  //
     tp_pron[88] :='alguns '      ;  //
     tp_pron[89] :='nenhuns '     ;  //
     tp_pron[90] :='umas '        ;  //
     tp_pron[91] :='algumas '     ;  //
     tp_pron[92] :='nenhumas '    ;  //
           ///                       //
     tp_pron[93] :='todo '        ;  //
     tp_pron[94] :='muito '       ;  //
     tp_pron[95] :='pouco '       ;  //
     tp_pron[96] :='certo '       ;  //
     tp_pron[97] :='vario '       ;  //
     tp_pron[98] :='outro '       ;  //
     tp_pron[99] :='quanto '      ;  //
     tp_pron[100] :='tanto '       ; //
     tp_pron[101] :='tal '         ; //
     tp_pron[102] :='qual '        ; //
     tp_pron[103] :='qualquer '    ; //
     tp_pron[104] :='toda '        ; //
     tp_pron[105] :='muita '       ; //
     tp_pron[106] :='pouca '       ; //
     tp_pron[107] :='certa '       ; //
     tp_pron[108] :='vária '       ; //
     tp_pron[109] :='outra '       ; //
     tp_pron[110] :='quanta '      ; //
     tp_pron[111] :='tanta '       ; //
     tp_pron[112] :='todos '       ; //
     tp_pron[113] :='muitos '      ; //
     tp_pron[114] :='poucos '      ; //
     tp_pron[115] :='certos '      ; //
     tp_pron[116] :='vários '      ; //
     tp_pron[117] :='outros '      ; //
     tp_pron[118] :='quantos '     ; //
     tp_pron[119] :='tantos '      ; //
     tp_pron[120] :='tais '        ; //
     tp_pron[121] :='quais '       ; //
     tp_pron[122] :='quaisquer '   ; //
     tp_pron[123] :='todas '       ; //
     tp_pron[124] :='muitas '      ; //
     tp_pron[125] :='poucas '      ; //
     tp_pron[126] :='certas '      ; //
     tp_pron[127] :='várias '      ; //
     tp_pron[128] :='outras '      ; //
     tp_pron[129] :='quantas '     ; //
     tp_pron[130] :='tantas '      ;//alvo\
     tp_pron[131] :='quando '      ;//verbal
     tp_pron[132] :='quem '        ;//verbal\
     tp_pron[133] :='alguem '      ;//alvoIndefinido
     tp_pron[134] :='ninguem '     ;//
     tp_pron[135] :='outrem '      ;//alvoIndefinido
     tp_pron[136] :='cada '        ;//alvo\/
     tp_pron[137] :='algo '        ;//alvoIndefinido
     tp_pron[138] :='tudo '        ;//
     tp_pron[139] :='nada '        ;//alvoIndefinido\
             ////////
     tp_pron[140] :='este '       ;   //alvo
     tp_pron[141] :='esse '       ;   //
     tp_pron[142] :='aquele '     ;   //
     tp_pron[143] :='isto '       ;   //
     tp_pron[144] :='isso '       ;   //
     tp_pron[145] :='aquilo '     ;   //
     tp_pron[146] :='esta '       ;   //
     tp_pron[147] :='essa '       ;   //
     tp_pron[148] :='aquela '     ;   //
     tp_pron[149] :='estes '      ;   //
     tp_pron[150] :='esses '      ;   //
     tp_pron[151] :='aqueles '    ;   //
     tp_pron[152] :='estas '      ;   //
     tp_pron[153] :='essas '      ;   //
     tp_pron[154] :='aquelas '    ;   //alvo\

     tp_pron[155] :='que '        ;//verbal
     tp_pron[156] :='se '         ;
     tp_pron[157] :='ou '         ;
     tp_pron[158] :='e '          ;//verbal\

     tp_pron[159] :='noutro '     ;//referencia
     tp_pron[160] :='num '        ;
     tp_pron[161] :='numa '       ;
     tp_pron[162] :='noutra '     ;
     tp_pron[163] :='noutros '    ;
     tp_pron[164] :='nuns '       ;
     tp_pron[165] :='numas '      ;
     tp_pron[166] :='noutras '    ;//referencia\

     tp_pron[167] :='onde '       ;//verbal
     tp_pron[168] :='aonde '      ;
     tp_pron[169] :='como '       ;//verbal\


     tp_pron [170] :='min '    ; //pessoal
     tp_pron [171] :='mim '    ; //
     tp_pron [172] :='ti '     ; //
     tp_pron [173] :='voce '   ; //
     tp_pron [174] :='ele '    ; //
     tp_pron [175] :='ela '    ; //
     tp_pron [176] :='eu '     ; //
     tp_pron [177] :='tu '     ; //
     tp_pron [178] :='nós '    ; //
     tp_pron [179] :='vós '    ; //
     tp_pron [180] :='voces '  ; //
     tp_pron [181] :='eles '   ; //
     tp_pron [182] :='elas '   ; //
     tp_pron [183] :='si '     ; //pessoal\

     tp_pron [184] :='no '     ;  //
     tp_pron [185] :='na '     ;
     tp_pron [186] :='nos '     ;
     tp_pron [187] :='nas '     ;
     tp_pron [188] :='entre ';    //referencia
  for tp_cont := 0  to 188 do
  begin
   case tp_cont of
      1..4,61..130,140..154:   if str1 = tp_pron[tp_cont] then
                              begin result := '|alvo '; break  end;
      5..14,22..44,46..59,159..166,184..188:   if str1 = tp_pron[tp_cont] then
                                      begin result := '|referencia '; break  end;
      15..19 :  if str1 = tp_pron[tp_cont] then
                                      begin result := '|alvoOculto '; break  end;
      20..21,131..132,155..158,167..169 :if str1 = tp_pron[tp_cont] then
                                      begin result := '|verbal '; break  end;
      45,60: if str1 = tp_pron[tp_cont] then begin result := '|referenciaOculta '; break  end;
      133..135,137..139:if str1 = tp_pron[tp_cont] then
                                      begin result := '|alvoIndefinido '; break  end;
      170..183: if str1 = tp_pron[tp_cont] then begin result := '|pessoal '; break end;
      end;
   end;
  tp_pron.Destroy;


end;

function Tpronomes.compativeis(str1, str2: string): string;
  var cont,vp_ipron,vp_ipron2:integer;
  vp_spron, vp_spron2: string;
   vp_bachou,vp_bvalido : boolean;
  begin//valida_pron ini



   begin///validacao_pronomes  ini   vp_ipron1; vp_ipron2
   vp_bachou := False;    Result:='';

   cont:=0;
    str1:=Trim(str1)+' ';
    str2:=Trim(str2)+' ';
   for vp_ipron := 0 to 174 do
   begin //forprep ini
    vp_bachou := false ;
   if apron[vp_ipron]= str1 then
   for vp_ipron2:= 0 to 174 do
    begin//forpron2  ini
     vp_bvalido:= false;

     if (vp_ipron = 1)and (not (((vp_ipron2 <1) or((vp_ipron2 < 18)and(vp_ipron2 >13 ))) or
      (vp_ipron2 =88)))                                                    then//[1]
      begin//valida_a ini
       vp_bvalido := true;
      end;//valida_a fim
     if (vp_ipron = 2)and (not ((vp_ipron2 < 18)  or
      ((vp_ipron2 >22)and(vp_ipron2 < 50))or((vp_ipron2 >60)and(vp_ipron2 < 88))or
      (vp_ipron2 >96)))                                                   then//[2]
      begin//valida_o ini
       vp_bvalido := true;
      end;//valida_o fim
     if (vp_ipron = 3)and (not ((vp_ipron2 < 33)  or
      ((vp_ipron2 >37)and(vp_ipron2 <77))or
       (vp_ipron2 >87)))                                                  then//[3]
      begin//valida_as ini
       vp_bvalido := true;
      end;//valida_as fim
     if (vp_ipron = 4)and (not ((vp_ipron2 < 28)or
     ((vp_ipron2 >32 )and(vp_ipron2 <69)) or
      (vp_ipron2 >79)))                                                   then//[4]
      begin//valida_os ini
       vp_bvalido := true;
      end;//valida_os fim
     if (vp_ipron = 5)and(not(vp_ipron2 <3))                                 then//[5]
      begin//valida_com ini
       vp_bvalido := true;
      end;//valida_comm fim
     if (vp_ipron = 6)and (not (vp_ipron2 <1))                               then//[6]
      begin//valida_sem ini
       vp_bvalido := true;
      end;//valida_sem fim
     if (vp_ipron = 7)and (not (((vp_ipron2 <1) or((vp_ipron2 >13 )and(vp_ipron2 <18))) or
      (vp_ipron2 >96)))                                                   then//[7]
      begin//valida_em ini
       vp_bvalido := true;
      end;//valida_em fim
     if (vp_ipron = 8)and (not ((vp_ipron2 <1) or((vp_ipron2 >13 )and(vp_ipron2 <18))))            then//[8]
      begin//valida_por ini
       vp_bvalido := true;
      end;//valida_por fim
     if (vp_ipron = 9)and (not (vp_ipron2 <1))                               then//[9]
      begin//valida_para ini
       vp_bvalido := true;
      end;//valida_para fim
     if (vp_ipron = 10)and (not (vp_ipron2 <1))                             then//[10]
      begin//valida_pra ini
       vp_bvalido := true;
      end;//valida_pra fim
     if (vp_ipron = 11)and (not ((vp_ipron2 < 18)  or
      ((vp_ipron2 >22)and(vp_ipron2 < 50))or
      (vp_ipron2 >60)))                                                  then//[11]
      begin//valida_pelo ini
       vp_bvalido := true;
      end;//valida_pelo fim
     if (vp_ipron = 12)and (not ((vp_ipron2 < 23)  or
      ((vp_ipron2 >27)and(vp_ipron2 < 58))or
      (vp_ipron2 >68)))                                                  then//[12]
      begin//valida_pela ini
       vp_bvalido := true;
      end;//valida_pela fim
     if (vp_ipron = 13)and (not ((vp_ipron2 < 28)  or
      ((vp_ipron2 >32)and(vp_ipron2 < 69))or
      (vp_ipron2 >79)))                                                  then//[13]
      begin//valida_pelos ini
       vp_bvalido := true;
      end;//valida_pelos fim
     if (vp_ipron = 14)and (not ((vp_ipron2 < 33)  or
      ((vp_ipron2 >37)and(vp_ipron2 < 76))or
      (vp_ipron2 >87)))                                                  then//[14]
      begin//valida_pelas ini
       vp_bvalido := true;
      end;//valida_pelas fim
     if (vp_ipron = 15)and (not (vp_ipron2 <3))                             then//[15]
      begin//valida_comigo ini
       vp_bvalido := true;
      end;//valida_comigo fim
     if (vp_ipron = 16)and (not (vp_ipron2 < 3 ))                           then//[16]
      begin//valida_contigo ini
       vp_bvalido := true;
      end;//valida_contigo fim
     if (vp_ipron = 17)and (not (vp_ipron2 <3) )                            then//[17]
      begin//valida_consigo ini
       vp_bvalido := true;
      end;//valida_consigo fim
     if (vp_ipron = 18)and (not (vp_ipron2 <3) )                            then//[18]
      begin//valida_conosco ini
       vp_bvalido := true;
      end;//valida_conosco fim
     if (vp_ipron = 19)and (not (vp_ipron2 <3) )                            then//[19]
      begin//valida_convosco ini
       vp_bvalido := true;
      end;//valida_convosco fim
     if (vp_ipron = 20)and (not (vp_ipron2 <3) )                            then//[20]
      begin//valida_nem ini
       vp_bvalido := true;
      end;//valida_nem fim
     if (vp_ipron = 21)and (not (vp_ipron2 <3))                             then//[21]
      begin//valida_nen ini
       vp_bvalido := true;
      end;//valida_nen fim
     if (vp_ipron = 22)and (not ((vp_ipron2 < 23)  or
      ((vp_ipron2 >27)and(vp_ipron2 < 58))or
      (vp_ipron2 >68)))                                                  then//[22]
      begin//valida_à ini
       vp_bvalido := true;
      end;//valida_à fim
     if (vp_ipron = 23)and (not ((vp_ipron2 < 18)  or
      ((vp_ipron2 >22)and(vp_ipron2 < 50))or
      (vp_ipron2 >60)))                                                  then//[23]
      begin//valida_ao ini
       vp_bvalido := true;
      end;//valida_ao fim
     if (vp_ipron = 24)and (not ((vp_ipron2 < 33)  or
      ((vp_ipron2 >37)and(vp_ipron2 < 77))or
      (vp_ipron2 >87)))                                                  then//[24]
      begin//valida_às ini
       vp_bvalido := true;
      end;//valida_às fim
     if (vp_ipron = 25)and (not ((vp_ipron2 < 28)  or
      ((vp_ipron2 >32)and(vp_ipron2 < 69))or
      (vp_ipron2 >79)))                                                  then//[25]
      begin//valida_aos ini
       vp_bvalido := true;
      end;//valida_aos fim
     if (vp_ipron = 26)and (not (((vp_ipron2 <1) or((vp_ipron2 >13 )
     and(vp_ipron2 <18))) or (vp_ipron2 >96)))                                                  then//[26]
      begin//valida_de ini
       vp_bvalido := true;
      end;//valida_de fim
     if (vp_ipron = 27)and (not ((vp_ipron2 < 23)  or
      ((vp_ipron2 >27)and(vp_ipron2 < 58))or
      (vp_ipron2 >68)))                                                  then//[27]
      begin//valida_da ini
       vp_bvalido := true;
      end;//valida_da fim
     if (vp_ipron = 28)and (not ((vp_ipron2 < 18)  or
      ((vp_ipron2 >22)and(vp_ipron2 < 50))or
      (vp_ipron2 >60)))                                                  then//[28]
      begin//valida_do ini
       vp_bvalido := true;
      end;//valida_do fim
     if (vp_ipron = 29)and (not ((vp_ipron2 < 33)  or
      ((vp_ipron2 >37)and(vp_ipron2 < 76))or
      (vp_ipron2 >87)))                                                  then//[29]
      begin//valida_das ini
       vp_bvalido := true;
      end;//valida_das fim
     if (vp_ipron = 30)and (not ((vp_ipron2 < 28)  or
      ((vp_ipron2 >32)and(vp_ipron2 < 69))or
      (vp_ipron2 >79)))                                                  then//[30]
      begin//valida_dos ini
       vp_bvalido := true;
      end;//valida_dos fim
     if ((vp_ipron >30)and(vp_ipron <46))and (not ((vp_ipron2 <3)or
     ((vp_ipron2 >96)and(vp_ipron2 <112) )or
     ((vp_ipron2 >137)and(vp_ipron2 <153))))                              then//[31a45]
      begin//valida_nestenaqu ini
       vp_bvalido := true;
      end;//valida_nestenaqu fim
     if ((vp_ipron >45)and(vp_ipron <61))and (not ((vp_ipron2 <3)or
     ((vp_ipron2 >96)and(vp_ipron2 <112) )or
     ((vp_ipron2 >152)and(vp_ipron2 <168))))                              then//[46a60]
      begin//valida_destedaqu ini
       vp_bvalido := true;
      end;//valida_destedaqu fim
     if ((vp_ipron >60)and(vp_ipron <66))and (not ((vp_ipron2 <50)or
     ((vp_ipron2 >60)and(vp_ipron2 <88) )or
     ((vp_ipron2 >96)and(vp_ipron2 <112))))                              then//[61a65]
      begin//valida_meuteu ini
       vp_bvalido := true;
      end;//valida_meuteu fim
     if ((vp_ipron >65)and(vp_ipron <71))and (not ((vp_ipron2 <58)or
     ((vp_ipron2 >68)and(vp_ipron2 <88) )or
     ((vp_ipron2 >96)and(vp_ipron2 <112))))                              then//[66a70]
      begin//valida_minhatua ini
       vp_bvalido := true;
      end;//valida_minhatua fim
     if ((vp_ipron >70)and(vp_ipron <76))and (not ((vp_ipron2 <69)or
     ((vp_ipron2 >79)and(vp_ipron2 <88) )or
     ((vp_ipron2 >96)and(vp_ipron2 <112))))                              then//[71a75]
      begin//valida_meus ini
       vp_bvalido := true;
      end;//valida_meus fim
     if ((vp_ipron >75)and(vp_ipron <81))and (not ((vp_ipron2 <77)or
     ((vp_ipron2 >96)and(vp_ipron2 <112))))                              then//[76a80]
      begin//valida_minhas ini
       vp_bvalido := true;
      end;//valida_minhas fim
     if ((vp_ipron >80)and(vp_ipron <84))and (not ((vp_ipron2 <18)or
     ((vp_ipron2 >22)and(vp_ipron2 <50) )or
     ((vp_ipron2 >60)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2<112))))then//[81a83]
      begin//valida_um ini
       vp_bvalido := true;
      end;//valida_um fim
     if ((vp_ipron >83)and(vp_ipron <87))and (not ((vp_ipron2 <23)or
     ((vp_ipron2 >27)and(vp_ipron2 <58) )or
     ((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2<112))))then//[84a86]
      begin//valida_uma ini
       vp_bvalido := true;
      end;//valida_uma fim
     if ((vp_ipron >86)and(vp_ipron <90))and (not ((vp_ipron2 <28)or
     ((vp_ipron2 >32)and(vp_ipron2 <69) )or
     ((vp_ipron2 >79)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2<112))))then//[87a89]
      begin//valida_uns ini
       vp_bvalido := true;
      end;//valida_uns fim
     if ((vp_ipron >89)and(vp_ipron <93))and (not ((vp_ipron2 <33)or
     ((vp_ipron2 >37)and(vp_ipron2 <77) )or
     ((vp_ipron2 >96)and(vp_ipron2<112))))                               then//[90a92]
      begin//valida_umas ini
       vp_bvalido := true;
      end;//valida_umas fim

     if (vp_ipron =93)and (not ((vp_ipron2 =50)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or     ((vp_ipron2 >22)and(vp_ipron2 <50))or
     ((vp_ipron2 >60)and(vp_ipron2<88))or((vp_ipron2 >102)and(vp_ipron2<112))))   then//[93]
      begin//valida_todo ini
       vp_bvalido := true;
      end;//valida_todo fim
     if (vp_ipron =94)and (not ((vp_ipron2 =51)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[94]
      begin//valida_muito ini
       vp_bvalido := true;
      end;//valida_muito fim
     if (vp_ipron =95)and (not ((vp_ipron2 =52)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or ((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[95]
      begin//valida_pouco ini
       vp_bvalido := true;
      end;//valida_pouco fim
     if (vp_ipron =96)and (not ((vp_ipron2 =53)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or ((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[96]
      begin//valida_certo ini
       vp_bvalido := true;
      end;//valida_certo fim
     if (vp_ipron =97)and (not ((vp_ipron2 =54)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or ((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[97]
      begin//valida_vario ini
       vp_bvalido := true;
      end;//valida_vario fim
     if (vp_ipron =98)and (not ((vp_ipron2 =55)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or ((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[98]
      begin//valida_outro ini
       vp_bvalido := true;
      end;//valida_outro fim
     if (vp_ipron =99)and (not ((vp_ipron2 =56)or(vp_ipron2 <15)or((vp_ipron2 >15)
     and(vp_ipron2 <18) )or ((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[99]
      begin//valida_quanto ini
       vp_bvalido := true;
      end;//valida_quanto fim
     if (vp_ipron =100)and (not ((vp_ipron2 =57)or(vp_ipron2 <15)or((vp_ipron2 >36)
     and(vp_ipron2 <51) )or ((vp_ipron2 >102)and(vp_ipron2<112)) or
     ((vp_ipron2 >22)and(vp_ipron2 <50))or((vp_ipron2 >60)and(vp_ipron2<88))))   then//[100]
      begin//valida_tanto ini
       vp_bvalido := true;
      end;//valida_tanto fim
     if (vp_ipron =101)and (not ( (vp_ipron2 =58)or( vp_ipron2 < 14)or
     ((vp_ipron2 >68)and(vp_ipron2 <88)) ))                                then//[101]
      begin//valida_tal ini
      vp_bvalido := true;
      end;//valida_tal fim
     if (vp_ipron =102)and (not ((vp_ipron2 = 59)or(vp_ipron2 < 14 )or
     ((vp_ipron2 >68)and(vp_ipron2 <88)) ))                                then//[102]
      begin//valida_qual ini
       vp_bvalido := true;
      end;//valida_qual fim
     if (vp_ipron =103)and(not ((vp_ipron2 <39)or((vp_ipron2 >59)and(vp_ipron2 <88) )or
     ((vp_ipron2 >96)and(vp_ipron2 <112)) ))                               then//[103]
      begin//valida_qualquer ini
       vp_bvalido := true;
      end;//valida_qualquer fim
     if (vp_ipron =104)and (not ( (vp_ipron2 =61)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[104]
      begin//valida_toda ini
      vp_bvalido := true;
      end;//valida_toda fim
     if (vp_ipron =105)and (not ( (vp_ipron2 =62)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[105]
      begin//valida_muita ini
      vp_bvalido := true;
      end;//valida_muita fim
    if (vp_ipron =106)and (not ( (vp_ipron2 =63)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[106]
      begin//valida_pouca  ini
      vp_bvalido := true;
      end;//valida_pouca  fim
    if (vp_ipron =107)and (not ( (vp_ipron2 =64)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[107]
      begin//valida_certa  ini
      vp_bvalido := true;
      end;//valida_certa  fim
    if (vp_ipron =108)and (not ( (vp_ipron2 =65)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[108]
      begin//valida_vária  ini
      vp_bvalido := true;
      end;//valida_vária  fim
    if (vp_ipron =109)and (not ( (vp_ipron2 =66)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[109]
      begin//valida_outra ini
      vp_bvalido := true;
      end;//valida_outra  fim
    if (vp_ipron =110)and (not ( (vp_ipron2 =67)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[110]
      begin//valida_quanta  ini
      vp_bvalido := true;
      end;//valida_quanta  fim
    if (vp_ipron =111)and (not ( (vp_ipron2 =68)or( vp_ipron2 < 14)or
     ((vp_ipron2 >14)and(vp_ipron2 <23))or((vp_ipron2 >27)and(vp_ipron2 <58))
     or((vp_ipron2 >68)and(vp_ipron2 <88))or((vp_ipron2 >96)and(vp_ipron2 <100))
     or((vp_ipron2 >105)and(vp_ipron2 <112)) ))                            then//[111]
      begin//valida_tanta   ini
      vp_bvalido := true;
      end;//valida_tanta   fim
    if (vp_ipron =112)and (not ( (vp_ipron2 =69)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[112]
      begin//valida_todos   ini
      vp_bvalido := true;
      end;//valida_todos   fim
     if (vp_ipron =113)and (not ( (vp_ipron2 =70)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[113]
      begin//valida_muitos  ini
      vp_bvalido := true;
      end;//valida_muitos  fim
    if (vp_ipron =114)and (not ( (vp_ipron2 =71)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[114]
      begin//valida_poucos  ini
      vp_bvalido := true;
      end;//valida_poucos  fim
    if (vp_ipron =115)and (not ( (vp_ipron2 =72)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[115]
      begin//valida_certos  ini
      vp_bvalido := true;
      end;//valida_certos  fim
    if (vp_ipron =116)and (not ( (vp_ipron2 =73)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[116]
      begin//valida_vários ini
      vp_bvalido := true;
      end;//valida_vários  fim
    if (vp_ipron =117)and (not ( (vp_ipron2 =74)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[117]
      begin//valida_outros  ini
      vp_bvalido := true;
      end;//valida_outros  fim
    if (vp_ipron =118)and (not ( (vp_ipron2 =75)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[118]
      begin//valida_quantos ini
      vp_bvalido := true;
      end;//valida_quantos fim
    if (vp_ipron =119)and (not ( (vp_ipron2 =76)or( vp_ipron2 < 17)or
     ((vp_ipron2 >17)and(vp_ipron2 <28))or((vp_ipron2 >32)and(vp_ipron2 <44))
     or((vp_ipron2 >46)and(vp_ipron2 <51))or((vp_ipron2 >52)and(vp_ipron2 <70))or((vp_ipron2 >79)and(vp_ipron2 <88))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[119]
      begin//valida_tantos  ini
      vp_bvalido := true;
      end;//valida_tantos  fim
     if (vp_ipron =120)and (not ( (vp_ipron2 =50)or(vp_ipron2 =77)or( vp_ipron2 < 17)or
      ((vp_ipron2 >37)and(vp_ipron2 <44))or((vp_ipron2 >52)and(vp_ipron2 <69))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[120]
      begin//valida_tais   ini
      vp_bvalido := true;
      end;//valida_tais   fim
     if (vp_ipron =121)and (not ( (vp_ipron2 =50)or(vp_ipron2 =78)or( vp_ipron2 < 17)or
      ((vp_ipron2 >37)and(vp_ipron2 <44))or((vp_ipron2 >52)and(vp_ipron2 <69))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[121]
      begin//valida_quais  ini
      vp_bvalido := true;
      end;//valida_quais  fim
     if (vp_ipron =122)and (not ( (vp_ipron2 =50)or(vp_ipron2 =79)or( vp_ipron2 < 17)or
      ((vp_ipron2 >37)and(vp_ipron2 <44))or((vp_ipron2 >52)and(vp_ipron2 <69))
     or((vp_ipron2 >96)and(vp_ipron2 <100))or((vp_ipron2 >102)and(vp_ipron2 <106))
     or((vp_ipron2 >108)and(vp_ipron2 <111)) ))                            then//[122]
      begin//valida_quaisquer ini
      vp_bvalido := true;
      end;//valida_quaisquer  fim
     if (vp_ipron =123)and (not ( (vp_ipron2 =50)or(vp_ipron2 =80)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[123]
      begin//valida_todas ini
      vp_bvalido := true;
      end;//valida_todas   fim
     if (vp_ipron =124)and (not ( (vp_ipron2 =50)or(vp_ipron2 =81)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[124]
      begin//valida_muitas   ini
      vp_bvalido := true;
      end;//valida_muitas    fim
      if (vp_ipron =125)and (not ( (vp_ipron2 =50)or(vp_ipron2 =82)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[125]
      begin//valida_poucas   ini
      vp_bvalido := true;
      end;//valida_poucas    fim
      if (vp_ipron =126)and (not ( (vp_ipron2 =50)or(vp_ipron2 =83)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[126]
      begin//valida_certas   ini
      vp_bvalido := true;
      end;//valida_certas    fim
      if (vp_ipron =127)and (not ( (vp_ipron2 =50)or(vp_ipron2 =84)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[127]
      begin//valida_várias   ini
      vp_bvalido := true;
      end;//valida_várias    fim
     if (vp_ipron =128)and (not ( (vp_ipron2 =50)or(vp_ipron2 =85)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[128]
      begin//valida_outras   ini
      vp_bvalido := true;
      end;//valida_outras    fim
     if (vp_ipron =129)and (not ( (vp_ipron2 =50)or(vp_ipron2 =86)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[129]
      begin//valida_quantas  ini
      vp_bvalido := true;
      end;//valida_quantas   fim
     if (vp_ipron =130)and (not ( (vp_ipron2 =50)or(vp_ipron2 =87)or( vp_ipron2 < 16)or
      ((vp_ipron2 >37)and(vp_ipron2 <47))or((vp_ipron2 >52)and(vp_ipron2 <77))     or
      ((vp_ipron2 >96)and(vp_ipron2<100))or((vp_ipron2>102)and(vp_ipron2<106)) ))then//[130]
      begin//valida_tantas   ini
      vp_bvalido := true;
      end;//valida_tantas    fim
     if (vp_ipron =131)and (not ( (vp_ipron2<3)or(vp_ipron2 =88) ))           then//[131]
      begin//valida_quando   ini
      vp_bvalido := true;
      end;//valida_quando    fim
      if (vp_ipron =132)and (not ( (vp_ipron2<3)or(vp_ipron2 =89) ))          then//[132]
      begin//valida_quem     ini
      vp_bvalido := true;
      end;//valida_quem      fim
     if (vp_ipron =133)and (not ( (vp_ipron2<3)or(vp_ipron2 =90) ))           then//[133]
      begin//valida_alguem   ini
      vp_bvalido := true;
      end;//valida_alguem    fim
     if (vp_ipron =134)and (not ( (vp_ipron2<3)or(vp_ipron2 =91) ))           then//[134]
      begin//valida_ninguem  ini
      vp_bvalido := true;
      end;//valida_ningem    fim
     if (vp_ipron =135)and (not ( (vp_ipron2<3)or(vp_ipron2 =92) ))           then//[135]
      begin//valida_outrem   ini
      vp_bvalido := true;
      end;//valida_outrem    fim
     if (vp_ipron =136)and (not ( (vp_ipron2<18)or(vp_ipron2 =93) ))           then//[136]
      begin//valida_cada     ini
      vp_bvalido := true;
      end;//valida_cada      fim
     if (vp_ipron =137)and (not ( (vp_ipron2<3)or(vp_ipron2 =94) ))           then//[137]
      begin//valida_algo     ini
      vp_bvalido := true;
      end;//valida_algo      fim
     if (vp_ipron =138)and (not ( (vp_ipron2<3)or(vp_ipron2 =95) ))           then//[138]
      begin//valida_tudo    ini
      vp_bvalido := true;
      end;//valida_tudo      fim
     if (vp_ipron =139)and (not ( (vp_ipron2<3)or(vp_ipron2 =96) ))           then//[139]
      begin//valida_nada     ini
      vp_bvalido := true;
      end;//valida_nada      fim
     if (vp_ipron >139)and(vp_ipron <155)and (not ( (vp_ipron2<3)or
     ((vp_ipron2 >96)and (vp_ipron2 <112))))                           then//[140a154]
      begin//valida_este_aquilo   ini
      vp_bvalido := true;
      end;//valida_este_aquilo    fim

     case vp_ipron of
     155..159,161..169: if vp_ipron2 > 2 then vp_bvalido := true;
     end;
     if vp_ipron= 160 then
     case vp_ipron2 of
     3..13,18..37,50..96,112..137,153..158,165..173:
                 vp_bvalido := true;
     end;
     if vp_ipron = 170 then
     case vp_ipron2 of
     23..27,58..68,112..113,133..137,153..158:
                 vp_bvalido := true;
     end;
     if vp_ipron= 171 then
     case vp_ipron2 of
     18..22,50..60,88..96,112..113,133..137,153..158:
                 vp_bvalido := true;
     end;
     if vp_ipron= 172 then
     case vp_ipron2 of
     33..39,77..87,112..113,133..137,153..158:
                 vp_bvalido := true;
     end;
     if vp_ipron= 173 then
     case vp_ipron2 of
     27..32,69..79,112..113,133..137,153..158:
                 vp_bvalido := true;
     end;
     if vp_ipron= 174 then
     case vp_ipron2 of
     0..111:
                 vp_bvalido := true;
     end;


     if vp_bvalido  = true then
      begin//válido ini
      if str2= apron2[vp_ipron2]then
      begin
        vp_bachou:= true;
        break;
      end;

      end;//válido fim

    end;//forpron2 fim

      //forpron2  ^^^^
           ////

    if vp_bachou = true then
     begin//sailaço ini
       Result:=str1+ tipo_pron(str1) + str2+ tipo_pron(str2);
       break;
     end;//sailaço fim
   cont:=cont;
   end;//forprep fim

        //forprep ^^^^
      //////////////

   end;//validacao_pronomes fim

         ///validacao_pronomes enrol acima^^^^
                 ///////


 end;//valida_pron fim  da function

constructor Tpronomes.Create;
var
  cont: Integer;
begin
  lista:=TStringList.Create;
  apron:=TStringList.Create;
  apron2:=TStringList.Create;

  for cont:=0 to 200 do
   begin
   lista.Add(' ');
   apron.Add(' ');
   apron2.add(' ');
   end;
 //vetor:= Tarray30k.Create;
   begin//pronomes_artigos ini
    apron[0]  :=  'a '      ;
    apron[1]  :=  'a '      ;
    apron[2]  :=  'o '      ;
    apron[3]  :=  'as '     ;
    apron[4]  :=  'os '     ;
    apron[5]  :=  'com '    ;
    apron[6]  :=  'sem '    ;
    apron[7]  :=  'em '     ;
    apron[8]  :=  'por '    ;
    apron[9]  :=  'para '   ;
    apron[10]  :=  'pra '   ;

    apron[11] :=  'pelo '    ;
    apron[12] :=  'pela '    ;
    apron[13] :=  'pelos '   ;
    apron[14] :=  'pelas '   ;
    apron[15] :=  'comigo '  ;
    apron[16] :=  'contigo ' ;
    apron[17] :=  'consigo ' ;
    apron[18] :=  'conosco ' ;
    apron[19] :=  'convosco ';
    apron[20] :=  'nem '   ;
    apron[21] :=  'nen '   ;
    apron[22] :=  'à '     ;
    apron[23] :=  'ao '    ;
    apron[24] :=  'às '    ;
    apron[25] :=  'aos '   ;
    apron[26] :=  'de '    ;
    apron[27] :=  'da '    ;
    apron[28] :=  'do '    ;
    apron[29] :=  'das '   ;
    apron[30] :=  'dos '   ;
     apron[31] :='neste '       ;   //+ em = neste  +de =deste
     apron[32] :='nestes '      ;   //                   destes
     apron[33] :='nesta '       ;   //
     apron[34] :='nestas '      ;   //
     apron[35] :='nisto '       ;   //
     apron[36] :='nesse '       ;   //
     apron[37] :='nesses '      ;   //
     apron[38] :='nessa '       ;   //
     apron[39] :='nessas '      ;   //
     apron[40] :='nisso '       ;   //
     apron[41] :='naquele '     ;   //
     apron[42] :='naqueles '    ;   //
     apron[43] :='naquela '     ;   //
     apron[44] :='naquelas '    ;   //
     apron[45] :='naquilo '     ;   //  naquilo        daquilo

      apron[46] :='deste '       ;   //+ em = neste  +de =deste
     apron[47] :='destes '      ;   //                   destes
     apron[48] :='desta '       ;   //
     apron[49] :='destas '      ;   //
     apron[50] :='disto '       ;   //
     apron[51] :='desse '       ;   //
     apron[52] :='desses '      ;   //
     apron[53] :='dessa '       ;   //
     apron[54] :='dessas '      ;   //
     apron[55] :='disso '       ;   //
     apron[56] :='daquele '     ;   //
     apron[57] :='daqueles '    ;   //
     apron[58] :='daquela '     ;   //
     apron[59] :='daquelas '    ;   //
     apron[60] :='daquilo '     ;   //  naquilo        daquilo
     apron[61] :='meu '         ;//aqui em diante a é artigo
     apron[62] :='seu '         ;
     apron[63] :='teu '         ;
     apron[64] :='nosso '       ;
     apron[65] :='vosso '       ;///22
     apron[66] :='minha '       ;
     apron[67] :='sua '         ;
     apron[68] :='tua '         ;
     apron[69] :='nossa '       ;
     apron[70] :='vossa '       ;/// 27
     apron[71] :='meus '        ;
     apron[72] :='seus '        ;
     apron[73] :='teus '        ;
     apron[74] :='nossos '      ;
     apron[75] :='vossos '      ;///32
     apron[76] :='minhas '      ;
     apron[77] :='suas '        ;
     apron[78] :='tuas '        ;
     apron[79] :='nossas '      ;
     apron[80] :='vossas '      ;

     apron[81] :='um '          ;
     apron[82] :='algum '       ;
     apron[83] :='nenhum '      ;
     apron[84] :='uma '         ;
     apron[85] :='alguma '      ;
     apron[86] :='nenhuma '     ;
     apron[87] :='uns '         ;
     apron[88] :='alguns '      ;
     apron[89] :='nenhuns '     ;
     apron[90] :='umas '        ;
     apron[91] :='algumas '     ;
     apron[92] :='nenhumas '    ;    ;//49
           ///
     apron[93] :='todo '        ;
     apron[94] :='muito '       ;
     apron[95] :='pouco '       ;
     apron[96] :='certo '       ;
     apron[97] :='vario '       ;
     apron[98] :='outro '       ;//noutro
     apron[99] :='quanto '      ;
     apron[100] :='tanto '       ;//// 57
     apron[101] :='tal '         ;
     apron[102] :='qual '        ;
     apron[103] :='qualquer '    ;//// 60
     apron[104] :='toda '        ;
     apron[105] :='muita '       ;
     apron[106] :='pouca '       ;
     apron[107] :='certa '       ;
     apron[108] :='vária '       ;
     apron[109] :='outra '       ;//noutra
     apron[110] :='quanta '      ;
     apron[111] :='tanta '       ;//// 68
     apron[112] :='todos '       ;
     apron[113] :='muitos '      ;
     apron[114] :='poucos '      ;
     apron[115] :='certos '      ;
     apron[116] :='vários '      ;
     apron[117] :='outros '      ;//noutros
     apron[118] :='quantos '     ;
     apron[119] :='tantos '      ;////76
     apron[120] :='tais '        ;
     apron[121] :='quais '       ;
     apron[122] :='quaisquer '   ;////79
     apron[123] :='todas '       ;
     apron[124] :='muitas '      ;
     apron[125] :='poucas '      ;
     apron[126] :='certas '      ;
     apron[127] :='várias '      ;
     apron[128] :='outras '      ;//noutras
     apron[129] :='quantas '     ;
     apron[130] :='tantas '      ;////87
     apron[131] :='quando '      ;
     apron[132] :='quem '        ;
     apron[133] :='alguem '      ;
     apron[134] :='ninguem '     ;// outrens ?
     apron[135] :='outrem '      ;
     apron[136] :='cada '        ;
     apron[137] :='algo '        ;
     apron[138] :='tudo '        ;
     apron[139] :='nada '        ;
             ////////
     apron[140] :='este '      ;   //+ em = neste  +de =deste
     apron[141] :='esse '      ;   //                   destes
     apron[142] :='aquele '    ;   //
     apron[143] :='isto '      ;   //
     apron[144] :='isso '      ;   //
     apron[145] :='aquilo '    ;   //
     apron[146] :='esta '      ;   //
     apron[147] :='essa '      ;   //
     apron[148] :='aquela '     ;   //
     apron[149] :='estes '      ;   //
     apron[150] :='esses '      ;   //
     apron[151] :='aqueles '    ;   //
     apron[152] :='estas '      ;   //
     apron[153] :='essas '      ;   //
     apron[154] :='aquelas '    ;   //  naquilo        daquilo

     apron[155] :='que '        ;
     apron[156] :='se '         ;
     apron[157] :='ou '         ;
     apron[158] :='e '          ;

     apron[159] :='noutro '     ;
     apron[160] :='num '        ;

     apron[161] :='numa '       ;
     apron[162] :='noutra '     ;
     apron[163] :='noutros '    ;
     apron[164] :='nuns '       ;

     apron[165] :='numas '      ;
     apron[166] :='noutras '    ;

     apron[167] :='onde '       ;
     apron[168] :='aonde '      ;
     apron[169] :='como '       ;

     apron[170] :='na '       ;
     apron[171] :='no '       ;
     apron[172] :='nas '       ;
     apron[173] :='nos '       ;
     apron[174] :='entre ';


    //////////////////////////////

    //////////////////////////////
     apron2[0] :='min '          ;
     apron2[1] :='mim '          ;//eu (a mim)  com eu (comigo)
     apron2[2] :='ti '           ;//tu (a ti)  com tu (contigo)
     apron2[3] :='voce '         ;
     apron2[4] :='ele '          ;
     apron2[5] :='ela '          ;
     apron2[6] :='eu '           ; // nem eu
     apron2[7] :='tu '           ; // nem tu devemos esquecer  o dialeto ...
     apron2[8] :='nos '          ;
     apron2[9] :='vos '          ;
     apron2[10] :='voces '       ;
     apron2[11] :='eles '        ;
     apron2[12] :='elas '        ;
     apron2[13] :='si '          ;  // com si (consigo)

     apron2[14] :='a '           ;//(à)  em a na
     apron2[15] :='o '           ;//(ao) em o no
     apron2[16] :='as '          ;//(às)      nas
     apron2[17] :='os '          ;//(aos) nos   até aqui a é preposicao

     apron2[18] :='meu '         ;//aqui em diante a é artigo
     apron2[19] :='seu '         ;
     apron2[20] :='teu '         ;
     apron2[21] :='nosso '       ;
     apron2[22] :='vosso '       ;///22
     apron2[23] :='minha '       ;
     apron2[24] :='sua '         ;
     apron2[25] :='tua '         ;
     apron2[26] :='nossa '       ;
     apron2[27] :='vossa '       ;/// 27
     apron2[28] :='meus '        ;
     apron2[29] :='seus '        ;
     apron2[30] :='teus '        ;
     apron2[31] :='nossos '      ;
     apron2[32] :='vossos '      ;///32
     apron2[33] :='minhas '      ;
     apron2[34] :='suas '        ;
     apron2[35] :='tuas '        ;
     apron2[36] :='nossas '      ;
     apron2[37] :='vossas '      ;

     apron2[38] :='um '          ;
     apron2[39] :='algum '       ;
     apron2[40] :='nenhum '      ;
     apron2[41] :='uma '         ;
     apron2[42] :='alguma '      ;
     apron2[43] :='nenhuma '     ;
     apron2[44] :='uns '         ;
     apron2[45] :='alguns '      ;
     apron2[46] :='nenhuns '     ;
     apron2[47] :='umas '        ;
     apron2[48] :='algumas '     ;
     apron2[49] :='nenhumas '    ;//49
           ///
     apron2[50] :='todo '        ;
     apron2[51] :='muito '       ;
     apron2[52] :='pouco '       ;
     apron2[53] :='certo '       ;
     apron2[54] :='vario '       ;
     apron2[55] :='outro '       ;//noutro
     apron2[56] :='quanto '      ;
     apron2[57] :='tanto '       ;//// 57
     apron2[58] :='tal '         ;
     apron2[59] :='qual '        ;
     apron2[60] :='qualquer '    ;//// 60
     apron2[61] :='toda '        ;
     apron2[62] :='muita '       ;
     apron2[63] :='pouca '       ;
     apron2[64] :='certa '       ;
     apron2[65] :='vária '       ;
     apron2[66] :='outra '       ;//noutra
     apron2[67] :='quanta '      ;
     apron2[68] :='tanta '       ;//// 68
     apron2[69] :='todos '       ;
     apron2[70] :='muitos '      ;
     apron2[71] :='poucos '      ;
     apron2[72] :='certos '      ;
     apron2[73] :='vários '      ;
     apron2[74] :='outros '      ;//noutros
     apron2[75] :='quantos '     ;
     apron2[76] :='tantos '      ;////76
     apron2[77] :='tais '        ;
     apron2[78] :='quais '       ;
     apron2[79] :='quaisquer '   ;////79
     apron2[80] :='todas '       ;
     apron2[81] :='muitas '      ;
     apron2[82] :='poucas '      ;
     apron2[83] :='certas '      ;
     apron2[84] :='várias '      ;
     apron2[85] :='outras '      ;//noutras
     apron2[86] :='quantas '     ;
     apron2[87] :='tantas '      ;////87
     apron2[88] :='quando '      ;
     apron2[89] :='quem '        ;
     apron2[90] :='alguem '      ;
     apron2[91] :='ninguem '     ;// outrens ?
     apron2[92] :='outrem '      ;
     apron2[93] :='cada '        ;
     apron2[94] :='algo '        ;
     apron2[95] :='tudo '        ;
     apron2[96] :='nada '        ;
             ////////
     apron2[97]  :='este '      ;   //+ em = neste  +de =deste
     apron2[98]  :='esse '      ;   //                   destes
     apron2[99]  :='aquele '    ;   //
     apron2[100] :='isto '      ;   //
     apron2[101] :='isso '      ;   //
     apron2[102] :='aquilo '    ;   //
     apron2[103] :='esta '      ;   //
     apron2[104] :='essa '      ;   //
     apron2[105] :='aquela '    ;   //
     apron2[106] :='estes '     ;   //
     apron2[107] :='esses '     ;   //
     apron2[108] :='aqueles '   ;   //
     apron2[109] :='estas '     ;   //
     apron2[110] :='essas '     ;   //
     apron2[111] :='aquelas '   ;   //  naquilo        daquilo
    apron2[112]  :=  'com '    ;
    apron2[113]  :=  'sem '    ;
    apron2[114]  :=  'em '     ;
    apron2[115]  :=  'por '    ;
    apron2[116]  :=  'para '   ;
    apron2[117]  :=  'pra '    ;
    apron2[118] :=  'pelo '    ;
    apron2[119] :=  'pela '    ;
    apron2[120] :=  'pelos '   ;
    apron2[121] :=  'pelas '   ;
    apron2[122] :=  'comigo '  ;
    apron2[123] :=  'contigo ' ;
    apron2[124] :=  'consigo ' ;
    apron2[125] :=  'conosco ' ;
    apron2[126] :=  'convosco ';
    apron2[127] :=  'nem '   ;
    apron2[128] :=  'nen '   ;
    apron2[129] :=  'à '     ;
    apron2[130] :=  'ao '    ;
    apron2[131] :=  'às '    ;
    apron2[132] :=  'aos '   ;
    apron2[133] :=  'de '    ;
    apron2[134] :=  'da '    ;
    apron2[135] :=  'do '    ;
    apron2[136] :=  'das '   ;
    apron2[137] :=  'dos '   ;
     apron2[138] :='neste '       ;   //+ em = neste  +de =deste
     apron2[139] :='nestes '      ;   //                   destes
     apron2[140] :='nesta '       ;   //
     apron2[141] :='nestas '      ;   //
     apron2[142] :='nisto '       ;   //
     apron2[143] :='nesse '       ;   //
     apron2[144] :='nesses '      ;   //
     apron2[145] :='nessa '       ;   //
     apron2[146] :='nessas '      ;   //
     apron2[147] :='nisso '       ;   //
     apron2[148] :='naquele '     ;   //
     apron2[149] :='naqueles '    ;   //
     apron2[150] :='naquela '     ;   //
     apron2[151] :='naquelas '    ;   //
     apron2[152] :='naquilo '     ;   //  naquilo        daquilo

     apron2[153] :='deste '       ;   //+ em = neste  +de =deste
     apron2[154] :='destes '      ;   //                   destes
     apron2[155] :='desta '       ;   //
     apron2[156] :='destas '      ;   //
     apron2[157] :='disto '       ;   //
     apron2[158] :='desse '       ;   //
     apron2[159] :='desses '      ;   //
     apron2[160] :='dessa '       ;   //
     apron2[161] :='dessas '      ;   //
     apron2[162] :='disso '       ;   //
     apron2[163] :='daquele '     ;   //
     apron2[164] :='daqueles '    ;   //
     apron2[165] :='daquela '     ;   //
     apron2[166] :='daquelas '    ;   //
     apron2[167] :='daquilo '     ;   //  naquilo        daquilo

     apron2[155] :='que '        ;
     apron2[156] :='se '         ;
     apron2[157] :='ou '         ;
     apron2[158] :='e '          ;

     apron2[159] :='noutro '     ;
     apron2[160] :='num '        ;

     apron2[161] :='numa '       ;
     apron2[162] :='noutra '     ;
     apron2[163] :='noutros '    ;
     apron2[164] :='nuns '       ;

     apron2[165] :='numas '      ;
     apron2[166] :='noutras '    ;

     apron2[167] :='onde '       ;
     apron2[168] :='aonde '      ;
     apron2[169] :='como '       ;
     apron2[170] :='na '       ;
     apron2[171] :='no '       ;
     apron2[172] :='nas '       ;
     apron2[173] :='nos '       ;
     apron2[174] :='entre ';

      end;//pronomes_artigos fim

end;

destructor Tpronomes.Destroy;
begin
  lista.Destroy;
  apron.Destroy;
  apron2.Destroy;
  //vetor.Destroy;
  inherited Destroy;
end;


          //valida_pron enrol ^^^^
           ////


end.

