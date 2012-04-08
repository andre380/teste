unit Upronverbo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Upronomes,Uverbos,Uconjugador;
type

{ TpronVerbo }

TpronVerbo= class
 status:integer;
 resultado:string;
 pvstr1:string;
 pvstr2:string;
 pronomes:Tpronomes;
 verbos:Tverbos;
 apron:TStringList;
 function entrTeste(tstr1,tstr2:string):string;
 function pron_verb(pv_str1,pv_str2:string): string;
 function dif_pronverb(str1:string):string;
 constructor create;
 destructor Destroy; override;
end;
implementation

function TpronVerbo.entrTeste(tstr1, tstr2: string): string;
var
strpron:string;
begin
 Result:='';
 strpron:=pronomes.compativeis(tstr1,tstr2)+' ';
 if strpron>' 'then
 begin
 pvstr1:=tstr1;
 pvstr2:=tstr2;
 Result:=strpron+'pronomes ';
 end
 else// é um else n esquecer
 begin
 Result:=pron_verb(tstr1,tstr2);
 if Result<>''then
 begin
 pvstr1:=tstr1;
 pvstr2:=tstr2;
 Result:= Result+'pronverbo ';
 end
 else
 begin
 pvstr1:='';
 pvstr2:='';
 result:='';
 end;

 end;

end;

function TpronVerbo.pron_verb(pv_str1,pv_str2:string): string;
 var
  pv_xipron, pv_ipron,pv_xiverbo,pv_iverbo: integer;
  pv_spron, pv_spron2,resuverbo: string;
  pv_bvalido, pv_bachou: boolean;
  cont: Integer;
 begin//pron_verb
    Result:='';
    pv_str1:= Trim(pv_str1)+' ';
    pv_str2:= Trim(pv_str2)+' ';
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


     apron [170] :='min '    ; //..>74<
     apron [171] :='mim '    ; //  >74<
     apron [172] :='ti '     ; //    >74<
     apron [173] :='voce '   ; //  (16.+10) x  10
     apron [174] :='ele '    ; //   (16.+10) x  10
     apron [175] :='ela '    ; //   (16.+10) x  10
     apron [176] :='eu '     ; //    (14.+10) x  10
     apron [177] :='tu '     ; //    (15.+10) x  10
     apron [178] :='nós '    ; //   (19.+10) x  10
     apron [179] :='vós '    ; //   (20.+10) x  10
     apron [180] :='voces '  ; // (21.+10) x  10
     apron [181] :='eles '   ; //  (21.+10) x  10
     apron [182] :='elas '   ; //  (21.+10) x  10
     apron [183] :='si '     ;

     apron[184] :='na '       ;
     apron[185] :='no '       ;
     apron[186] :='nas '       ;
     apron[187] :='nos '       ;
 pv_bachou:= false;
  for cont:= 0 to 183 do
  if pv_str1 = apron[Cont] then
  begin
  for pv_xipron := 0 to 183 do
   begin//pv_ipronverb ini
    pv_ipron:=pv_xipron;
     pv_bachou:= false;
     pv_bvalido:= false;
  
   if (pv_str1=apron[pv_ipron])and(pv_str1<>'')then
   begin
    resuverbo:= verbos.isola_verbo(pv_str2);

   for pv_xiverbo := 1 to 144  do
   begin//for_verbos ini
     pv_iverbo:=pv_xiverbo;
     pv_bvalido:= false;
    begin;//embrulha_ifsverbo ini
     if (pv_ipron = 1)and (not ((pv_iverbo <6) or(pv_iverbo > 131)))
                                                         then//[1]
      begin//valida_a ini
       pv_bvalido := true;
      end;//valida_a fim
     if (pv_ipron = 2)and (not ((pv_iverbo > 131)  or
      ((pv_iverbo >7)and(pv_iverbo < 14))or(pv_iverbo <1)))
                                                         then//[2]
      begin//valida_o ini
       pv_bvalido := true;
      end;//valida_o fim
     if (pv_ipron = 3)and (not ((pv_iverbo < 6)  or
      ((pv_iverbo >6)and(pv_iverbo <14))or
      ((pv_iverbo>131) and(pv_iverbo <137))))             then//[3]
      begin//valida_as ini
       pv_bvalido := true;
      end;//valida_as fim
     if (pv_ipron = 4)and (not ((pv_iverbo <6)or
     ((pv_iverbo >6 )and(pv_iverbo <14)) or
      (pv_iverbo >137)))                                                   then//[4]
      begin//valida_os ini
       pv_bvalido := true;
      end;//valida_os fim
     if (pv_ipron = 5)and((pv_iverbo=74)or(not((pv_iverbo=0)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))  then//[5]
      begin//valida_com ini
       pv_bvalido := true;
      end;//valida_comm fim
     if (pv_ipron = 6)and ((pv_iverbo=74)or(not((pv_iverbo=0)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))then//[6]
      begin//valida_sem ini
       pv_bvalido := true;
      end;//valida_sem fim
     if (pv_ipron = 7)and((pv_iverbo=74)or(not((pv_iverbo=0)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))                      then//[7]
      begin//valida_em ini
       pv_bvalido := true;
      end;//valida_em fim
     if (pv_ipron = 8)and ((pv_iverbo=74)or(not((pv_iverbo=0)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))then//[8]
      begin//valida_por ini
       pv_bvalido := true;
      end;//valida_por fim
     if (pv_ipron = 9)and ((pv_iverbo=74)or(not((pv_iverbo=0)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))        then//[9]
      begin//valida_para ini
       pv_bvalido := true;
      end;//valida_para fim
     if (pv_ipron = 10)and ((pv_iverbo=74)or(not((pv_iverbo=0)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))        then//[10]
      begin//valida_pra ini
       pv_bvalido := true;
      end;//valida_pra fim
     if (pv_ipron = 11)and ((pv_iverbo=74) or(not (pv_iverbo > 7)))                                                   then//[11]
      begin//valida_pelo ini
       pv_bvalido := true;
      end;//valida_pelo fim
     if (pv_ipron = 12)and ((pv_iverbo=74)or(not ((pv_iverbo < 13)  or
      (pv_iverbo < 7))))                                                  then//[12]
      begin//valida_pela ini
       pv_bvalido := true;
      end;//valida_pela fim
     if (pv_ipron = 13)and ((pv_iverbo=74)or(not ((pv_iverbo <132)  or
      (pv_iverbo >137))))                         then//[13]
      begin//valida_pelos ini
       pv_bvalido := true;
      end;//valida_pelos fim
     if (pv_ipron = 14)and ((pv_iverbo=74)or(not ((pv_iverbo < 137))))  then//[14]
      begin//valida_pelas ini
       pv_bvalido := true;
      end;//valida_pelas fim
     if ((pv_ipron >14)and (pv_ipron<22))and(not (pv_iverbo <1))        then//[15a21]
      begin//valida_comigo ini
       pv_bvalido := true;
      end;//valida_comigo fim
     if (pv_ipron = 22)and (not ((pv_iverbo < 6)  or(pv_iverbo >131)))   then//[22]
      begin//valida_à ini
       pv_bvalido := true;
      end;//valida_à fim
     if (pv_ipron = 23)and (not ((pv_iverbo < 1)  or
      ((pv_iverbo >7)and(pv_iverbo < 14))or
      (pv_iverbo >131)))                                                  then//[23]
      begin//valida_ao ini
       pv_bvalido := true;
      end;//valida_ao fim
     if (pv_ipron = 24)and ((pv_iverbo=6)or(not ((pv_iverbo < 14)  or
      ((pv_iverbo >131)and(pv_iverbo < 137)))))             then//[24]
      begin//valida_às ini
       pv_bvalido := true;
      end;//valida_às fim
     if (pv_ipron = 25)and ((pv_iverbo=6)or(not((pv_iverbo < 14)or
     (pv_iverbo >137))))                                     then//[25]
      begin//valida_aos ini
       pv_bvalido := true;
      end;//valida_aos fim
     if (pv_ipron = 26)and ((pv_iverbo=74)or(not ((pv_iverbo <1)or
     ((pv_iverbo >13)and(pv_iverbo<132)))))    then//[26]
      begin//valida_de ini
       pv_bvalido := true;
      end;//valida_de fim
     if (pv_ipron = 27)and (not ((pv_iverbo < 7)  or
      (pv_iverbo >13)))                    then//[27]
      begin//valida_da ini
       pv_bvalido := true;
      end;//valida_da fim
     if (pv_ipron = 28)and ((pv_iverbo=74)or(not ((pv_iverbo <1)or
     (pv_iverbo >7))))                                            then//[28]
      begin//valida_do ini
       pv_bvalido := true;
      end;//valida_do fim
     if (pv_ipron = 29)and (not (pv_iverbo >135))   then//[29]
      begin//valida_das ini
       pv_bvalido := true;
      end;//valida_das fim
     if (pv_ipron = 30)and (not ((pv_iverbo <132) or(pv_iverbo >137))) then//[30]
      begin//valida_dos ini
       pv_bvalido := true;
      end;//valida_dos fim

     if ((pv_ipron >30)and(pv_ipron <61))and (not (pv_iverbo <1))     then//[31a60]
      begin//valida_destedaqu ini
       pv_bvalido := true;
      end;//valida_destedaqu fim
     if ((pv_ipron >60)and(pv_ipron <66))and (not ((pv_iverbo <1)or
     ((pv_iverbo >7)and(pv_iverbo <14) )or
     (pv_iverbo >131)))                              then//[61a65]
      begin//valida_meuteu ini
       pv_bvalido := true;
      end;//valida_meuteu fim
     if ((pv_ipron >65)and(pv_ipron <71))and (not ((pv_iverbo <7)or
     (pv_iverbo <131)))                              then//[66a70]
      begin//valida_minhatua ini
       pv_bvalido := true;
      end;//valida_minhatua fim
     if ((pv_ipron >70)and(pv_ipron <76))and ((pv_iverbo=6)or(not ((pv_iverbo <14)or
     (pv_iverbo >137))))                              then//[71a75]
      begin//valida_meus ini
       pv_bvalido := true;
      end;//valida_meus fim
     if ((pv_ipron >75)and(pv_ipron <81))and ((pv_iverbo=6)or(not ((pv_iverbo <14)or
     ((pv_iverbo >131)and(pv_iverbo <137)))))                              then//[76a80]
      begin//valida_minhas ini
       pv_bvalido := true;
      end;//valida_minhas fim
     if ((pv_ipron >80)and(pv_ipron <84))and (not (((pv_iverbo >7)and (pv_iverbo<16)) or
      ((pv_iverbo >18)and(pv_iverbo <26))or ((pv_iverbo >28)and(pv_iverbo <36))or
      ((pv_iverbo >38)and(pv_iverbo <36))or ((pv_iverbo >48)and(pv_iverbo <46))or
      ((pv_iverbo >58)and(pv_iverbo <56))or ((pv_iverbo >68)and(pv_iverbo <66))or
      ((pv_iverbo >78)and(pv_iverbo <76))or ((pv_iverbo >88)and(pv_iverbo <96))or
      ((pv_iverbo >98)and(pv_iverbo <115))or((pv_iverbo >117)and(pv_iverbo <124))or
       (pv_iverbo >126) ))then//[81a83]
      begin//valida_um ini
       pv_bvalido := true;
      end;//valida_um fim
     if ((pv_ipron >83)and(pv_ipron <87))and (not( (pv_ipron<6)or((pv_iverbo >13)and (pv_iverbo<16)) or
      ((pv_iverbo >18)and(pv_iverbo <26))or ((pv_iverbo >28)and(pv_iverbo <36))or
      ((pv_iverbo >38)and(pv_iverbo <36))or ((pv_iverbo >48)and(pv_iverbo <46))or
      ((pv_iverbo >58)and(pv_iverbo <56))or ((pv_iverbo >68)and(pv_iverbo <66))or
      ((pv_iverbo >78)and(pv_iverbo <76))or ((pv_iverbo >88)and(pv_iverbo <96))or
      ((pv_iverbo >98)and(pv_iverbo <115))or((pv_iverbo >117)and(pv_iverbo <124))or
       (pv_iverbo >126) ))then//[84a86]
      begin//valida_uma ini
       pv_bvalido := true;
      end;//valida_uma fim
     if ((pv_ipron >86)and(pv_ipron <90))and ((pv_iverbo = 6)or(not ((pv_iverbo <21)or
      ((pv_iverbo >23)and(pv_iverbo <31))or ((pv_iverbo >33)and(pv_iverbo <41))or
      ((pv_iverbo >43)and(pv_iverbo <51))or ((pv_iverbo >53)and(pv_iverbo <51))or
      ((pv_iverbo >63)and(pv_iverbo <71))or ((pv_iverbo >73)and(pv_iverbo <81))or
      ((pv_iverbo >83)and(pv_iverbo <91))or ((pv_iverbo >93)and(pv_iverbo <101))or
      ((pv_iverbo >103)and(pv_iverbo <111))or((pv_iverbo >113)and(pv_iverbo <120))or
       ((pv_iverbo >122)and (pv_iverbo<129 )) or (pv_iverbo >137)     )))then//[87a89]
      begin//valida_uns ini
       pv_bvalido := true;
      end;//valida_uns fim
     if ((pv_ipron >89)and(pv_ipron <93))and ((pv_iverbo = 6)or(not ((pv_iverbo <21)or
      ((pv_iverbo >23)and(pv_iverbo <31))or ((pv_iverbo >33)and(pv_iverbo <41))or
      ((pv_iverbo >43)and(pv_iverbo <51))or ((pv_iverbo >53)and(pv_iverbo <51))or
      ((pv_iverbo >63)and(pv_iverbo <71))or ((pv_iverbo >73)and(pv_iverbo <81))or
      ((pv_iverbo >83)and(pv_iverbo <91))or ((pv_iverbo >93)and(pv_iverbo <101))or
      ((pv_iverbo >103)and(pv_iverbo <111))or((pv_iverbo >113)and(pv_iverbo <120))or
      ((pv_iverbo >122)and(pv_iverbo <129))or((pv_iverbo >131)and(pv_iverbo <137))
                                                                     )))then//[90a92]
      begin//valida_umas ini
      pv_bvalido := true;
      end;//valida_umas fim

     if ((pv_ipron >92)and(pv_ipron <100))and (not ((pv_iverbo <1)or((pv_iverbo >7)and(pv_iverbo<14))or
      ((pv_iverbo >43)and(pv_iverbo<56))or((pv_iverbo >48)and(pv_iverbo<56))or
      ((pv_iverbo >68)and(pv_iverbo<76))or((pv_iverbo >78)and(pv_iverbo<86))or
      ((pv_iverbo >88)and(pv_iverbo<96))or((pv_iverbo >98)and(pv_iverbo<114))or
      ((pv_iverbo >117)and(pv_iverbo<124))or((pv_iverbo >126)and(pv_iverbo<144))
           ))   then//[93a100]
      begin//valida_todo ini
      pv_bvalido := true;
      end;//valida_todo fim

     if ((pv_ipron >100)and(pv_ipron<104))and (not ((pv_iverbo <1)or
      ((pv_iverbo >43)and(pv_iverbo<56))or((pv_iverbo >48)and(pv_iverbo<56))or
      ((pv_iverbo >68)and(pv_iverbo<76))or((pv_iverbo >78)and(pv_iverbo<86))or
      ((pv_iverbo >88)and(pv_iverbo<96))or((pv_iverbo >98)and(pv_iverbo<114))or
      ((pv_iverbo >117)and(pv_iverbo<124))or((pv_iverbo >126)and(pv_iverbo<144))
                                                        ))then//[101a103]
      begin//valida_tal ini
      pv_bvalido := true;
      end;//valida_tal fim

     if ((pv_ipron >103)and(pv_ipron <112))and (not ((pv_iverbo <6)or
      ((pv_iverbo >43)and(pv_iverbo<56))or((pv_iverbo >48)and(pv_iverbo<56))or
      ((pv_iverbo >68)and(pv_iverbo<76))or((pv_iverbo >78)and(pv_iverbo<86))or
      ((pv_iverbo >88)and(pv_iverbo<96))or((pv_iverbo >98)and(pv_iverbo<114))or
      ((pv_iverbo >117)and(pv_iverbo<124))or((pv_iverbo >126)and(pv_iverbo<144))
           ))   then//[104a111]
      begin//valida_toda ini
      pv_bvalido := true;
      end;//valida_toda fim

    if ((pv_ipron >111)and(pv_ipron<120))and  ((pv_iverbo =6)or(not( (pv_iverbo < 21)or
      ((pv_iverbo >43)and(pv_iverbo<51))or((pv_iverbo >53)and(pv_iverbo<61))or
      ((pv_iverbo >63)and(pv_iverbo<71))or((pv_iverbo >83)and(pv_iverbo<91))or
      ((pv_iverbo >93)and(pv_iverbo<101))or((pv_iverbo >103)and(pv_iverbo<111))or
      ((pv_iverbo >113)and(pv_iverbo<120))or((pv_iverbo >122)and(pv_iverbo<129))
           )))   then//[112a119]
      begin//valida_todos   ini
      pv_bvalido := true;
      end;//valida_todos   fim
     if ((pv_ipron >119)and(pv_ipron<123)) and ((pv_iverbo =6)or(not( (pv_iverbo<21)or
      ((pv_iverbo >43)and(pv_iverbo<51))or((pv_iverbo >53)and(pv_iverbo<61))or
      ((pv_iverbo >63)and(pv_iverbo<71))or((pv_iverbo >83)and(pv_iverbo<91))or
      ((pv_iverbo >93)and(pv_iverbo<101))or((pv_iverbo >103)and(pv_iverbo<111))or
      ((pv_iverbo >113)and(pv_iverbo<120))or((pv_iverbo >122)and(pv_iverbo<129))
           )))    then//[120a122]
      begin//valida_tais   ini
      //pv_bvalido := true;
      end;//valida_tais   fim


     if ((pv_ipron >122)and(pv_ipron<131)) and ((pv_iverbo =6)or(not( (pv_iverbo<21)or
      ((pv_iverbo >43)and(pv_iverbo<51))or((pv_iverbo >53)and(pv_iverbo<61))or
      ((pv_iverbo >63)and(pv_iverbo<71))or((pv_iverbo >83)and(pv_iverbo<91))or
      ((pv_iverbo >93)and(pv_iverbo<101))or((pv_iverbo >103)and(pv_iverbo<111))or
      ((pv_iverbo >113)and(pv_iverbo<120))or((pv_iverbo >122)and(pv_iverbo<129))or
      ((pv_iverbo >131)and(pv_iverbo<137))     ))) then// [123a130]
      begin//valida_todas ini
      pv_bvalido := true;
      end;//valida_todas   fim

     if (pv_ipron =131)and (not ( pv_iverbo<1 ))           then//[131]
      begin//valida_quando   ini
      pv_bvalido := true;
      end;//valida_quando    fim
      if (pv_ipron =132)and (not ((pv_iverbo<14)or(pv_iverbo >131)) )          then//[132]
      begin//valida_quem     ini
      pv_bvalido := true;
      end;//valida_quem      fim

     if ((pv_ipron >132)and(pv_ipron <136))and (not( (pv_iverbo<1)or
      ((pv_iverbo >3)and(pv_iverbo<6))or  ((pv_iverbo >11)and(pv_iverbo<16))or
      ((pv_iverbo >28)and(pv_iverbo<36))or((pv_iverbo >38)and(pv_iverbo<46))or
      ((pv_iverbo >48)and(pv_iverbo<56))or
      ((pv_iverbo >58)and(pv_iverbo<66))or((pv_iverbo >68)and(pv_iverbo<76))or
      ((pv_iverbo >78)and(pv_iverbo<86 ))or((pv_iverbo >88 )and(pv_iverbo<96 ))or
      ((pv_iverbo >98)and(pv_iverbo<114))or((pv_iverbo >117)and(pv_iverbo<124))or
      (pv_iverbo >127)     ))   then//[133]
      begin//valida_alguem   ini
      pv_bvalido := true;
      end;//valida_alguem    fim

     if (pv_ipron >135)and(pv_ipron<140) and (not  ((pv_iverbo<1)or(pv_iverbo>14)) )           then//[136]
      begin//valida_cada     ini
      pv_bvalido := true;
      end;//valida_cada      fim

     if (pv_ipron >139)and(pv_ipron <146)and (not( (pv_iverbo<1)or
      ((pv_iverbo >8)and(pv_iverbo<16))or  ((pv_iverbo >18)and(pv_iverbo<26))or
      ((pv_iverbo >38)and(pv_iverbo<46))or ((pv_iverbo >48)and(pv_iverbo<56))or
      ((pv_iverbo >58)and(pv_iverbo<66))or((pv_iverbo >68)and(pv_iverbo<76))or
      ((pv_iverbo >78)and(pv_iverbo<86 ))or((pv_iverbo >88 )and(pv_iverbo<96 ))or
      ((pv_iverbo >98)and(pv_iverbo<115))or((pv_iverbo >117)and(pv_iverbo<124))or
      (pv_iverbo >126)     ))       then//[140a145]
      begin//valida_este_aquilo   ini
      pv_bvalido := true;
      end;//valida_este_aquilo    fim
      if (pv_ipron >145)and(pv_ipron <149)and (not( (pv_iverbo<1)or
      ((pv_iverbo >8)and(pv_iverbo<16))or  ((pv_iverbo >18)and(pv_iverbo<26))or
      ((pv_iverbo >38)and(pv_iverbo<46))or ((pv_iverbo >48)and(pv_iverbo<56))or
      ((pv_iverbo >58)and(pv_iverbo<66))or((pv_iverbo >68)and(pv_iverbo<76))or
      ((pv_iverbo >78)and(pv_iverbo<86 ))or((pv_iverbo >88 )and(pv_iverbo<96 ))or
      ((pv_iverbo >98)and(pv_iverbo<115))or((pv_iverbo >117)and(pv_iverbo<124))or
      (pv_iverbo >126)     ))       then//[146a148]
      begin//valida_esta_aquela   ini
      pv_bvalido := true;
      end;//valida_esta_aquela    fim
      if (pv_ipron >148)and(pv_ipron <152)and ((pv_iverbo=6)or(not( (pv_iverbo<20)or
      ((pv_iverbo >23)and(pv_iverbo<31))or  ((pv_iverbo >33)and(pv_iverbo<41))or
       ((pv_iverbo >43)and(pv_iverbo<51))or
      ((pv_iverbo >53)and(pv_iverbo<61))or((pv_iverbo >63)and(pv_iverbo<71))or
      ((pv_iverbo >72)and(pv_iverbo<81 ))or((pv_iverbo >83 )and(pv_iverbo<91 ))or
      ((pv_iverbo >93)and(pv_iverbo<101))or((pv_iverbo >103)and(pv_iverbo<112))or
      ((pv_iverbo >113)and(pv_iverbo<120))or ((pv_iverbo >122)and(pv_iverbo<129))or
      (pv_iverbo>137)    )))       then//[149a152]
      begin//valida_estes_aqueles   ini
      pv_bvalido := true;
      end;//valida_estes_aqueles    fim
      if (pv_ipron >151)and(pv_ipron <155)and ((pv_iverbo=6)or(not( (pv_iverbo<20)or
      ((pv_iverbo >23)and(pv_iverbo<31))or  ((pv_iverbo >33)and(pv_iverbo<41))or
      ((pv_iverbo >43)and(pv_iverbo<51))or
      ((pv_iverbo >53)and(pv_iverbo<61))or((pv_iverbo >63)and(pv_iverbo<71))or
      ((pv_iverbo >72)and(pv_iverbo<81 ))or((pv_iverbo >83 )and(pv_iverbo<91 ))or
      ((pv_iverbo >93)and(pv_iverbo<101))or((pv_iverbo >103)and(pv_iverbo<112))or
      ((pv_iverbo >113)and(pv_iverbo<120))or ((pv_iverbo >122)and(pv_iverbo<129))or
      ((pv_iverbo >131)and(pv_iverbo<137))     )))       then//[152a154]
      begin//valida_esta_aquela   ini
      pv_bvalido := true;
      end;//valida_esta_aquela    fim
      if ((pv_ipron >154)and(pv_ipron <170))and (pv_iverbo >0)  then//[155a169]
      begin//valida_mim   ini
      pv_bvalido := true;
      end;//valida_mim    fim
     if ((pv_ipron >169)and(pv_ipron <173))and (pv_iverbo = 74)  then//[170a172]
      begin//valida_mim   ini
      pv_bvalido := true;
      end;//valida_mim    fim

     if ((pv_ipron >172)and(pv_ipron <176))and ( (pv_iverbo=16)or (pv_iverbo=(16+10))or
  (pv_iverbo=(16+20))or  (pv_iverbo=(16+30))or (pv_iverbo=(16+40))or
  (pv_iverbo=(16+50))or  (pv_iverbo=(16+60))or (pv_iverbo=(16+70))or
  (pv_iverbo=(16+80))or  (pv_iverbo=(16+90)))               then//[173a175]
      begin//valida_vocele   ini
      pv_bvalido := true;
      end;//valida_vocele    fim

     if (pv_ipron =176)and ( ( (pv_iverbo=14)or (pv_iverbo=14+10)or
  (pv_iverbo=14+20)or  (pv_iverbo=14+30)or (pv_iverbo=14+40)or
  (pv_iverbo=14+50)or  (pv_iverbo=14+60)or  (pv_iverbo=14+70)or
  (pv_iverbo=14+80)or  (pv_iverbo=14+90)))               then//[176]
      begin//valida_eu   ini
      pv_bvalido := true;
      end;//valida_eu    fim
     if (pv_ipron =177)and ( ( (pv_iverbo=15)or (pv_iverbo=15+10)or
  (pv_iverbo=15+20)or  (pv_iverbo=15+30)or (pv_iverbo=15+40)or
  (pv_iverbo=15+50)or (pv_iverbo=15+60)or  (pv_iverbo=15+70)or
  (pv_iverbo=15+80)or (pv_iverbo=15+90)))               then//[177]
      begin//valida_tu   ini
      pv_bvalido := true;
      end;//valida_tu    fim
     if (pv_ipron =178)and ( ( (pv_iverbo=19)or (pv_iverbo=19+10)or
  (pv_iverbo=19+20)or  (pv_iverbo=19+30)or (pv_iverbo=19+40)or
  (pv_iverbo=19+50)or (pv_iverbo=19+60)or  (pv_iverbo=19+70)or
  (pv_iverbo=19+80)or (pv_iverbo=19+90)))               then//[178]
      begin//valida_nos   ini
      pv_bvalido := true;
      end;//valida_nos    fim
     if (pv_ipron =179)and ( ( (pv_iverbo=20)or (pv_iverbo=20+10)or
  (pv_iverbo=20+20)or  (pv_iverbo=20+30)or (pv_iverbo=20+40)or
  (pv_iverbo=20+50)or (pv_iverbo=20+60)or  (pv_iverbo=20+70)or
  (pv_iverbo=20+80)or (pv_iverbo=20+90)) )              then//[179]
      begin//valida_vos   ini
      pv_bvalido := true;
      end;//valida_vos    fim
    if ((pv_ipron >179)and(pv_ipron <183))and ( ( (pv_iverbo=21)or (pv_iverbo=21+10)or
  (pv_iverbo=21+20)or  (pv_iverbo=21+30)or (pv_iverbo=21+40)or
  (pv_iverbo=21+50)or (pv_iverbo=21+60)or  (pv_iverbo=21+70)or
  (pv_iverbo=21+80)or (pv_iverbo=21+90)))               then//[180a182]
      begin//valida_voceseles   ini
      pv_bvalido := true;
      end;//valida_voceseles    fim
     end;//embrulha_ifsverbo fim

          //embrulha_ifsverbo ^^^^^^
    if pv_bvalido = true then
    begin//válido ini
      pv_spron2:= verbos.conjugador.aconjugado[pv_iverbo];
      pv_bachou:=false;
      if (pv_str2 = pv_spron2)and (pv_str2<>'')  then
      begin
        pv_bachou := true;
        break;
      end;

    end;//válido fim



        pv_spron:=''; pv_spron2:='';
     end;//for_verbos

         //for_verbos ^^^^^^
   end;
       if pv_bachou= true then
       begin
       result:=pv_str1 +pronomes.tipo_pron(pv_str1)+' '+resuverbo;

       break;
       end
     end;//pv_ipronverb fim

           //pv_ipronverb ^^^^
  end;
end;//pron_verb

function TpronVerbo.dif_pronverb(str1: string): string;
var strpron:string ;
begin
str1:= Trim(str1)+' ';
 strpron:=pronomes.tipo_pron(str1);
 if strpron<>''then
 begin
 Result:=str1+ strpron;
 end
 else// é um else n esquecer
 begin
 Result:=verbos.isola_verbo(str1);
 end;

end;

constructor TpronVerbo.create;
var
  cont: Integer;
begin
 inherited Create;
 self.apron:=TStringList.Create;
 for cont:=0 to 200 do self.apron.Add(' ');
 self.pronomes:=Tpronomes.Create;
  self.verbos:=Tverbos.Create;
end;

destructor TpronVerbo.Destroy;
begin
  pronomes.Destroy;
  verbos.Destroy;
  self.apron.Destroy;
  inherited Destroy;

end;



end.

