unit Ubaseideia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uideograma;
 type

  Tideia= record  str1:string;tipo:integer;end;
 { Tbaseideia }

 Tbaseideia =class

 status:integer ;
 ideia:array[0..250]of Tideia; //Record  str1:string;tipo:integer;end;
 ideogramas:array[0..250]of Tideograma;
 function testaIdeia(teste:string):Tideograma;
 constructor create;
 destructor destroy;override;
 end;


implementation

{ Tbaseideia }

function Tbaseideia.testaIdeia(teste: string): Tideograma;
var
  cont: Integer;
begin
  Result:=nil;
  for cont :=0 to 200 do
  begin
    if teste=ideia[cont].str1 then
    begin
     Result:=ideogramas[cont];
     break;
    end;
  end;
end;

constructor Tbaseideia.create;
var
cont:integer;
begin //desambiguacao tem q criar ainda!!!como eu como ? = de que maneira eu como ?
 //tipo 1=acao 2=intencao 3=metodo   4=objeto
    //se a ideia nao pode ser montada com a base, entao referencia com o resultado
    //inherited Create;

     ideia[0 ].str1  :=  'a '            ; ideia[ 1 ].tipo:= 2   ;
     ideia[1 ].str1  :=  'a '            ; ideia[ 1 ].tipo:= 2   ;
     ideia[2 ].str1  :=  'o '            ; ideia[ 2 ].tipo:= 2   ;
     ideia[3 ].str1  :=  'as '           ; ideia[ 3 ].tipo:= 2   ;
     ideia[4 ].str1  :=  'os '           ; ideia[ 4 ].tipo:= 2   ;
     ideia[5 ].str1  :=  'com '          ; ideia[ 5 ].tipo:= 2   ;
     ideia[6 ].str1  :=  'sem '          ; ideia[ 6 ].tipo:= 2   ;
     ideia[7 ].str1  :=  'em '           ; ideia[ 7 ].tipo:= 2   ;
     ideia[8 ].str1  :=  'por '          ; ideia[ 8 ].tipo:= 2   ;
     ideia[9 ].str1  :=  'para '         ; ideia[ 9 ].tipo:= 2   ;
     ideia[10 ].str1  :=  'pra '         ; ideia[ 10].tipo:= 2   ;

     ideia[11 ].str1 :=  'pelo '         ; ideia[ 11].tipo:=  3  ;
     ideia[12 ].str1 :=  'pela '         ; ideia[ 12].tipo:=  3  ;
     ideia[13 ].str1 :=  'pelos '        ; ideia[ 13].tipo:=  3  ;
     ideia[14 ].str1 :=  'pelas '        ; ideia[ 14].tipo:=  3  ;
     ideia[15 ].str1 :=  'comigo '       ; ideia[ 15].tipo:=  3  ;
     ideia[16 ].str1 :=  'contigo '      ; ideia[ 16].tipo:=  3  ;
     ideia[17 ].str1 :=  'consigo '      ; ideia[ 17].tipo:=  3  ;
     ideia[18 ].str1 :=  'conosco '      ; ideia[ 18].tipo:=  3  ;
     ideia[19 ].str1 :=  'convosco '     ; ideia[ 19].tipo:=  3  ;
     ideia[20 ].str1 :=  'nem '          ; ideia[ 10].tipo:= 2   ;
     ideia[21 ].str1 :=  'nen '          ; ideia[ 21].tipo:= 2   ;
     ideia[22 ].str1 :=  'à '            ; ideia[ 22].tipo:=  3  ;
     ideia[23 ].str1 :=  'ao '           ; ideia[ 23].tipo:=  3  ;
     ideia[24 ].str1 :=  'às '           ; ideia[ 24].tipo:=  3  ;
     ideia[25 ].str1 :=  'aos '          ; ideia[ 25].tipo:=  3  ;
     ideia[26 ].str1 :=  'de '           ; ideia[ 26].tipo:= 2   ;
     ideia[27 ].str1 :=  'da '           ; ideia[ 27].tipo:=  3  ;
     ideia[28 ].str1 :=  'do '           ; ideia[ 28].tipo:=  3  ;
     ideia[29 ].str1 :=  'das '          ; ideia[ 29].tipo:=  3  ;
     ideia[30 ].str1 :=  'dos '          ; ideia[ 30].tipo:=  3  ;
      ideia[31 ].str1 :='neste '         ; ideia[ 31].tipo:=  3  ;   //+ em = neste  +de =deste
      ideia[32 ].str1 :='nestes '        ; ideia[ 32].tipo:=  3  ;   //                   destes
      ideia[33 ].str1 :='nesta '         ; ideia[ 33].tipo:=  3  ;   //
      ideia[34 ].str1 :='nestas '        ; ideia[ 34].tipo:=  3  ;   //
      ideia[35 ].str1 :='nisto '         ; ideia[ 35].tipo:=  3  ;   //
      ideia[36 ].str1 :='nesse '         ; ideia[ 36].tipo:=  3  ;   //
      ideia[37 ].str1 :='nesses '        ; ideia[ 37].tipo:=  3  ;   //
      ideia[38 ].str1 :='nessa '         ; ideia[ 38].tipo:=  3  ;   //
      ideia[39 ].str1 :='nessas '        ; ideia[ 39].tipo:=  3  ;   //
      ideia[40 ].str1 :='nisso '         ; ideia[ 40].tipo:=  3  ;   //
      ideia[41 ].str1 :='naquele '       ; ideia[ 41].tipo:=  3  ;   //
      ideia[42 ].str1 :='naqueles '      ; ideia[ 42].tipo:=  3  ;   //
      ideia[43 ].str1 :='naquela '       ; ideia[ 43].tipo:=  3  ;   //
      ideia[44 ].str1 :='naquelas '      ; ideia[ 44].tipo:=  3  ;   //
      ideia[45 ].str1 :='naquilo '       ; ideia[ 45].tipo:=  3  ;   //  naquilo        daquilo
                                                 
      ideia[46 ].str1 :='deste '         ; ideia[ 46].tipo:=  3  ;   //+ em = neste  +de =deste
      ideia[47 ].str1 :='destes '        ; ideia[ 47].tipo:=  3  ;   //                   destes
      ideia[48 ].str1 :='desta '         ; ideia[ 48].tipo:=  3  ;   //
      ideia[49 ].str1 :='destas '        ; ideia[ 49].tipo:=  3  ;   //
      ideia[50 ].str1 :='disto '         ; ideia[ 50].tipo:=  3  ;   //
      ideia[51 ].str1 :='desse '         ; ideia[ 51].tipo:=  3  ;   //
      ideia[52 ].str1 :='desses '        ; ideia[ 52].tipo:=  3  ;   //
      ideia[53 ].str1 :='dessa '         ; ideia[ 53].tipo:=  3  ;   //
      ideia[54 ].str1 :='dessas '        ; ideia[ 54].tipo:=  3  ;   //
      ideia[55 ].str1 :='disso '         ; ideia[ 55].tipo:=  3  ;   //
      ideia[56 ].str1 :='daquele '       ; ideia[ 56].tipo:=  3  ;   //
      ideia[57 ].str1 :='daqueles '      ; ideia[ 57].tipo:=  3  ;   //
      ideia[58 ].str1 :='daquela '       ; ideia[ 58].tipo:=  3  ;   //
      ideia[59 ].str1 :='daquelas '      ; ideia[ 59].tipo:=  3  ;   //
      ideia[60 ].str1 :='daquilo '       ; ideia[ 60].tipo:=  3  ;   //  naquilo        daquilo
      ideia[61 ].str1 :='meu '           ; ideia[ 61].tipo:= 2   ;//aqui em diante a é artigo
      ideia[62 ].str1 :='seu '           ; ideia[ 62].tipo:= 2   ;
      ideia[63 ].str1 :='teu '           ; ideia[ 63].tipo:= 2   ;
      ideia[64 ].str1 :='nosso '         ; ideia[ 64].tipo:= 2   ;
      ideia[65 ].str1 :='vosso '         ; ideia[ 65].tipo:= 2   ;///22
      ideia[66 ].str1 :='minha '         ; ideia[ 66].tipo:= 2   ;
      ideia[67 ].str1 :='sua '           ; ideia[ 67].tipo:= 2   ;
      ideia[68 ].str1 :='tua '           ; ideia[ 68].tipo:= 2   ;
      ideia[69 ].str1 :='nossa '         ; ideia[ 69].tipo:= 2   ;
      ideia[70 ].str1 :='vossa '         ; ideia[ 70].tipo:= 2   ;/// 27
      ideia[71 ].str1 :='meus '          ; ideia[ 71].tipo:= 2   ;
      ideia[72 ].str1 :='seus '          ; ideia[ 72].tipo:= 2   ;
      ideia[73 ].str1 :='teus '          ; ideia[ 73].tipo:= 2   ;
      ideia[74 ].str1 :='nossos '        ; ideia[ 74].tipo:= 2   ;
      ideia[75 ].str1 :='vossos '        ; ideia[ 75].tipo:= 2   ;///32
      ideia[76 ].str1 :='minhas '        ; ideia[ 76].tipo:= 2   ;
      ideia[77 ].str1 :='suas '          ; ideia[ 77].tipo:= 2   ;
      ideia[78 ].str1 :='tuas '          ; ideia[ 78].tipo:= 2   ;
      ideia[79 ].str1 :='nossas '        ; ideia[ 79].tipo:= 2   ;
      ideia[80 ].str1 :='vossas '        ; ideia[ 80].tipo:= 2   ;
                                                 
      ideia[81 ].str1 :='um '             ; ideia[ 81].tipo:= 2   ;
      ideia[82 ].str1 :='algum '         ; ideia[ 82].tipo:= 2   ;
      ideia[83 ].str1 :='nenhum '        ; ideia[ 83].tipo:= 2   ;
      ideia[84 ].str1 :='uma '           ; ideia[ 84].tipo:= 2   ;
      ideia[85 ].str1 :='alguma '        ; ideia[ 85].tipo:= 2   ;
      ideia[86 ].str1 :='nenhuma '       ; ideia[ 86].tipo:= 2   ;
      ideia[87 ].str1 :='uns '           ; ideia[ 87].tipo:= 2   ;
      ideia[88 ].str1 :='alguns '        ; ideia[ 88].tipo:= 2   ;
      ideia[89 ].str1 :='nenhuns '       ; ideia[ 89].tipo:= 2   ;
      ideia[90 ].str1 :='umas '          ; ideia[ 80].tipo:= 2   ;
      ideia[91 ].str1 :='algumas '       ; ideia[ 91].tipo:= 2   ;
      ideia[92 ].str1 :='nenhumas '      ; ideia[ 92].tipo:= 2   ; //49
           ///
      ideia[93 ].str1 :='todo '          ; ideia[ 93].tipo:= 2   ;
      ideia[94 ].str1 :='muito '         ; ideia[ 94].tipo:= 2   ;
      ideia[95 ].str1 :='pouco '         ; ideia[ 95].tipo:= 2   ;
      ideia[96 ].str1 :='certo '         ; ideia[ 96].tipo:= 2   ;
      ideia[97 ].str1 :='vario '         ; ideia[ 97].tipo:= 2   ;
      ideia[98 ].str1 :='outro '         ; ideia[ 98].tipo:= 2   ;//noutro
      ideia[99 ].str1 :='quanto '        ; ideia[ 99].tipo:= 2   ;
      ideia[100 ].str1 :='tanto '        ; ideia[100].tipo:= 2   ;//// 57
      ideia[101 ].str1 :='tal '          ; ideia[101].tipo:= 2   ;
      ideia[102 ].str1 :='qual '         ; ideia[102].tipo:= 2   ;
      ideia[103 ].str1 :='qualquer '     ; ideia[103].tipo:= 2   ;//// 60
      ideia[104 ].str1 :='toda '         ; ideia[104].tipo:= 2   ;
      ideia[105 ].str1 :='muita '        ; ideia[105].tipo:= 2   ;
      ideia[106 ].str1 :='pouca '        ; ideia[106].tipo:= 2   ;
      ideia[107 ].str1 :='certa '        ; ideia[107].tipo:= 2   ;
      ideia[108 ].str1 :='vária '        ; ideia[108].tipo:= 2   ;
      ideia[109 ].str1 :='outra '        ; ideia[109].tipo:= 2   ;//noutra
      ideia[110 ].str1 :='quanta '       ; ideia[110].tipo:= 2   ;
      ideia[111 ].str1 :='tanta '        ; ideia[111].tipo:= 2   ;//// 68
      ideia[112 ].str1 :='todos '        ; ideia[112].tipo:= 2   ;
      ideia[113 ].str1 :='muitos '       ; ideia[113].tipo:= 2   ;
      ideia[114 ].str1 :='poucos '       ; ideia[114].tipo:= 2   ;
      ideia[115 ].str1 :='certos '       ; ideia[115].tipo:= 2   ;
      ideia[116 ].str1 :='vários '       ; ideia[116].tipo:= 2   ;
      ideia[117 ].str1 :='outros '       ; ideia[117].tipo:= 2   ;//noutros
      ideia[118 ].str1 :='quantos '      ; ideia[118].tipo:= 2   ;
      ideia[119 ].str1 :='tantos '       ; ideia[119].tipo:= 2   ;////76
      ideia[120 ].str1 :='tais '         ; ideia[120].tipo:= 2   ;
      ideia[121 ].str1 :='quais '        ; ideia[121].tipo:= 2   ;
      ideia[122 ].str1 :='quaisquer '    ; ideia[122].tipo:= 2   ;////79
      ideia[123 ].str1 :='todas '        ; ideia[123].tipo:= 2   ;
      ideia[124 ].str1 :='muitas '       ; ideia[124].tipo:= 2   ;
      ideia[125 ].str1 :='poucas '       ; ideia[125].tipo:= 2   ;
      ideia[126 ].str1 :='certas '       ; ideia[126].tipo:= 2   ;
      ideia[127 ].str1 :='várias '       ; ideia[127].tipo:= 2   ;
      ideia[128 ].str1 :='outras '       ; ideia[128].tipo:= 2   ;//noutras
      ideia[129 ].str1 :='quantas '      ; ideia[129].tipo:= 2   ;
      ideia[130 ].str1 :='tantas '       ; ideia[130].tipo:= 2   ;////87
      ideia[131 ].str1 :='quando '       ; ideia[131].tipo:= 2   ;
      ideia[132 ].str1 :='quem '         ; ideia[132].tipo:= 2   ;
      ideia[133 ].str1 :='alguem '       ; ideia[133].tipo:= 2   ;
      ideia[134 ].str1 :='ninguem '      ; ideia[134].tipo:= 2   ;// outrens ?
      ideia[135 ].str1 :='outrem '       ; ideia[135].tipo:= 2   ;
      ideia[136 ].str1 :='cada '         ; ideia[136].tipo:= 2   ;
      ideia[137 ].str1 :='algo '         ; ideia[137].tipo:= 2   ;
      ideia[138 ].str1 :='tudo '         ; ideia[138].tipo:= 2   ;
      ideia[139 ].str1 :='nada '         ; ideia[139].tipo:= 2   ;
             ////////
      ideia[140 ].str1 :='este '         ; ideia[140].tipo:= 2   ;   //+ em = neste  +de =deste
      ideia[141 ].str1 :='esse '         ; ideia[141].tipo:= 2   ;   //                   destes
      ideia[142 ].str1 :='aquele '       ; ideia[142].tipo:= 2   ;   //
      ideia[143 ].str1 :='isto '         ; ideia[143].tipo:= 2   ;   //
      ideia[144 ].str1 :='isso '         ; ideia[144].tipo:= 2   ;   //
      ideia[145 ].str1 :='aquilo '       ; ideia[145].tipo:= 2   ;   //
      ideia[146 ].str1 :='esta '         ; ideia[146].tipo:= 2   ;   //
      ideia[147 ].str1 :='essa '         ; ideia[147].tipo:= 2   ;   //
      ideia[148 ].str1 :='aquela '       ; ideia[148].tipo:= 2   ;   //
      ideia[149 ].str1 :='estes '        ; ideia[149].tipo:= 2   ;   //
      ideia[150 ].str1 :='esses '        ; ideia[150].tipo:= 2   ;   //
      ideia[151 ].str1 :='aqueles '      ; ideia[151].tipo:= 2   ;   //
      ideia[152 ].str1 :='estas '        ; ideia[152].tipo:= 2   ;   //
      ideia[153 ].str1 :='essas '        ; ideia[153].tipo:= 2   ;   //
      ideia[154 ].str1 :='aquelas '      ; ideia[154].tipo:= 2   ;   //  naquilo        daquilo

      ideia[155 ].str1 :='que '          ; ideia[155].tipo:= 2   ;
      ideia[156 ].str1 :='se '           ; ideia[156].tipo:= 2   ;
      ideia[157 ].str1 :='ou '           ; ideia[157].tipo:= 2   ;
      ideia[158 ].str1 :='e '            ; ideia[158].tipo:= 2   ;

      ideia[159 ].str1 :='noutro '       ; ideia[159].tipo:=  3  ;
      ideia[160 ].str1 :='num '          ; ideia[160].tipo:=  3  ;

      ideia[161 ].str1 :='numa '         ; ideia[161].tipo:=  3  ;
      ideia[162 ].str1 :='noutra '       ; ideia[162].tipo:=  3  ;
      ideia[163 ].str1 :='noutros '      ; ideia[163].tipo:=  3  ;
      ideia[164 ].str1 :='nuns '         ; ideia[164].tipo:=  3  ;

      ideia[165 ].str1 :='numas '        ; ideia[165].tipo:=  3  ;
      ideia[166 ].str1 :='noutras '      ; ideia[166].tipo:=  3  ;

      ideia[167 ].str1 :='onde '         ; ideia[167].tipo:= 2   ;
      ideia[168 ].str1 :='aonde '        ; ideia[168].tipo:= 2   ;
      ideia[169 ].str1 :='como '         ; ideia[169].tipo:= 2   ;

      ideia[170 ].str1 :='na '           ; ideia[170].tipo:=  3  ;
      ideia[171 ].str1 :='no '           ; ideia[171].tipo:=  3  ;
      ideia[172 ].str1 :='nas '          ; ideia[172].tipo:=  3  ;
      ideia[173 ].str1 :='nos '          ; ideia[173].tipo:=  3  ;
      ideia[174].str1 :='entre '         ; ideia[174].tipo:= 2   ;
   //##########################################################
      ideia[175].str1:='ser '       ; ideia[175].tipo:=1    ;
      ideia[176].str1:='estar '     ; ideia[176].tipo:=1    ;
      ideia[177].str1:='ter '       ; ideia[177].tipo:=1    ;
      ideia[178].str1:='poder '     ; ideia[178].tipo:=1    ;
      ideia[179].str1:='querer '    ; ideia[179].tipo:=1    ;
      ideia[180].str1:='agir '      ; ideia[180].tipo:=1    ;
      ideia[181].str1:='saber '     ; ideia[181].tipo:=1    ;
      ideia[182].str1:='viver '     ; ideia[182].tipo:=1    ;
      ideia[183].str1:='dizer '     ; ideia[183].tipo:=1    ;
      ideia[184].str1:='ouvir '     ; ideia[184].tipo:=1    ;
      ideia[185].str1:='saber '     ; ideia[185].tipo:=1    ;
      ideia[186].str1:='querer '    ; ideia[186].tipo:=1    ;
      ideia[187].str1:='dar '       ; ideia[187].tipo:=1    ;
      ideia[188].str1:='haver '     ; ideia[188].tipo:=1    ;
      ideia[189].str1:='pedir '     ; ideia[189].tipo:=1    ;
      ideia[190].str1:='caber '     ; ideia[190].tipo:=1    ;
      ideia[191].str1:='fazer '     ; ideia[191].tipo:=1    ;
      ideia[192].str1:='ir '        ; ideia[192].tipo:=1    ;
      ideia[193].str1:='vir '       ; ideia[193].tipo:=1    ;
      ideia[194].str1:='criar '     ; ideia[194].tipo:=1    ;
    //########################################################
      ideia[195].str1:='eu '        ; ideia[195].tipo:=   4 ;
      ideia[196].str1:='tu '        ; ideia[196].tipo:=   4 ;
      ideia[197].str1:='ele '       ; ideia[197].tipo:=   4 ;
      ideia[198].str1:='ela '       ; ideia[198].tipo:=   4 ;
      ideia[199].str1:='nós '       ; ideia[199].tipo:=   4 ;
      ideia[200].str1:='vós '       ; ideia[200].tipo:=   4 ;
      ideia[201].str1:='eles '      ; ideia[201].tipo:=   4 ;
      ideia[202].str1:='elas '      ; ideia[202].tipo:=   4 ;

      ideia[203].str1:='mover '     ; ideia[203].tipo:=1    ;
      ideia[204].str1:='copiar '    ; ideia[204].tipo:=1    ;
      ideia[205].str1:='perceber '  ; ideia[205].tipo:=1    ;

  //    * ler    * saber    * caber    * querer    * poder    * dizer,    * fazer    * trazer
//    * aprazer    * crer    * dar    * estar    * haver    * ser    * ter
//    * ver    * vir    * rir    * ir    * pôr

     for cont:= 1 to 205 do
     begin
      ideogramas[cont]           := Tideograma.create;
      ideogramas[cont].ideia     := ideia[cont].str1;
      ideogramas[cont].tipo      := ideia[cont].tipo;
      ideogramas[cont].tamanho   := 0;
      ideogramas[cont].categoria := 1;
     end;

end;

destructor Tbaseideia.destroy;
begin

  inherited destroy;
end;

end.

