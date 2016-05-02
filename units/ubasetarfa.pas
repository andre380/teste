Unit Ubasetarfa;

{$mode objfpc}{$H+}

Interface

Uses
  Classes, SysUtils,Utarefa,Ubaseideia,Uideograma,Umanipulaideogramas;
type

{ Tbasetarefa }

Tbasetarefa=class
ideogramas:Tmanipulaideogramas;
//ideia 175
tarefas:array[0..250]of Ttarefa;
ideogrbase:array[0..250]of Tideograma;

procedure monta (baseideogramas:Tmanipulaideogramas);
procedure destroy; //override;
end;

Implementation

{ Tbasetarefa }

procedure Tbasetarefa.monta(baseideogramas:Tmanipulaideogramas);
begin

  ideogramas:=Tmanipulaideogramas( baseideogramas);
  ideogrbase:= ideogramas.baseideia.ideogramas;

  tarefas[0]:= Ttarefa.Create;
  tarefas[0].nome:='saber ';
  tarefas[0].tipo:= 1   ; // 1 interna 2 externa
  tarefas[0].addSubtarefa(tarefas[0]);
  //tarefas[0].status:=0;//1=cumprida 2=falhada 3=preparada 4=parte_feita 5=aguardando
  tarefas[0].categoria:=1; //1=normal 2=especialista
  tarefas[0].ideograma:= ideogrbase[185];

  tarefas[1]:= Ttarefa.Create;
  tarefas[1].nome:='quem ';
  tarefas[1].tipo:= 1;
  tarefas[1].addSubtarefa(tarefas[0]);
  tarefas[1].categoria:= 2;
  tarefas[1].ideograma:=ideogrbase[132] ;

  tarefas[2]:= Ttarefa.Create;
  tarefas[2].nome:='onde ';
  tarefas[2].addSubtarefa(tarefas[0]);
  tarefas[2].tipo:= 1;
  tarefas[2].categoria:= 2;
  tarefas[2].ideograma:=ideogrbase[167] ;

  tarefas[3]:= Ttarefa.Create;
  tarefas[3].nome:='mover ';
  tarefas[3].addSubtarefa(tarefas[3]);
  tarefas[3].addSubtarefa(tarefas[1]);//quem
  tarefas[3].addSubtarefa(tarefas[2]);//onde
  tarefas[3].tipo:= 1;
  tarefas[3].categoria:= 1;
  tarefas[3].ideograma:=ideogrbase[203] ;

  tarefas[4]:= Ttarefa.Create;
  tarefas[4].nome:='copiar ';
  tarefas[4].addSubtarefa(tarefas[4]);
  tarefas[4].addSubtarefa(tarefas[1]);//quem
  tarefas[4].addSubtarefa(tarefas[2]);//onde
  tarefas[4].tipo:= 1;
  tarefas[4].categoria:= 1;
  tarefas[4].ideograma:=ideogrbase[204] ;

  tarefas[5]:= Ttarefa.Create;
  tarefas[5].nome:='perceber ';
  tarefas[5].addSubtarefa(tarefas[5]);
  tarefas[3].addSubtarefa(tarefas[1]);//quem
  tarefas[5].tipo:= 1;
  tarefas[5].categoria:= 1;
  tarefas[5].ideograma:=ideogrbase[205] ;

  tarefas[6]:= Ttarefa.Create;
  tarefas[6].nome:='que ';
  tarefas[6].tipo:= 1;
  tarefas[6].addSubtarefa(tarefas[6]);
  tarefas[6].categoria:= 1;
  tarefas[6].ideograma:=ideogrbase[155] ;

  tarefas[7]:= Ttarefa.Create;
  tarefas[7].nome:='se ';
  tarefas[7].tipo:=1;
  tarefas[7].addSubtarefa(tarefas[7]);
  tarefas[7].categoria:=1;
  tarefas[7].ideograma:=ideogrbase[156] ;

  tarefas[8]:= Ttarefa.Create;
  tarefas[8].nome:='ou ';
  tarefas[8].tipo:= 1;
  tarefas[8].addSubtarefa(tarefas[8]);
  tarefas[8].categoria:= 1;
  tarefas[8].ideograma:=ideogrbase[157] ;

  tarefas[9]:= Ttarefa.Create;
  tarefas[9].nome:='e ';
  tarefas[9].tipo:= 1;
  tarefas[9].addSubtarefa(tarefas[9]);
  tarefas[9].categoria:= 1;
  tarefas[9].ideograma:=ideogrbase[158] ;

  tarefas[10]:= Ttarefa.Create;
  tarefas[10].nome:='quando ';
  tarefas[10].tipo:= 1;
  tarefas[10].addSubtarefa(tarefas[0]);
  tarefas[10].categoria:= 2;
  tarefas[10].ideograma:=ideogrbase[131] ;

  tarefas[11]:= Ttarefa.Create;
  tarefas[11].nome:='como ';
  tarefas[11].tipo:= 1;
  tarefas[11].addSubtarefa(tarefas[0]);
  tarefas[11].categoria:= 2;
  tarefas[11].ideograma:=ideogrbase[169] ;

  tarefas[12]:= Ttarefa.Create;
  tarefas[12].nome:='de ';
  tarefas[12].tipo:= 1;
  tarefas[12].addSubtarefa(tarefas[12]);
  tarefas[12].categoria:= 1;
  tarefas[12].ideograma:=ideogrbase[26] ;

  tarefas[13]:= Ttarefa.Create;
  tarefas[13].nome:='a ';
  tarefas[13].tipo:= 1;
  tarefas[13].addSubtarefa(tarefas[13]);
  tarefas[13].categoria:= 1;
  tarefas[13].ideograma:=ideogrbase[1] ;

  tarefas[14]:= Ttarefa.Create;
  tarefas[14].nome:='o ';
  tarefas[14].tipo:= 1;
  tarefas[14].addSubtarefa(tarefas[14]);
  tarefas[14].categoria:= 1;
  tarefas[14].ideograma:=ideogrbase[2] ;

  tarefas[15]:= Ttarefa.Create;
  tarefas[15].nome:='com ';
  tarefas[15].tipo:= 1;
  tarefas[15].addSubtarefa(tarefas[15]);
  tarefas[15].categoria:= 1;
  tarefas[15].ideograma:=ideogrbase[5] ;

  tarefas[16]:= Ttarefa.Create;
  tarefas[16].nome:='sem ';
  tarefas[16].tipo:= 1;
  tarefas[16].addSubtarefa(tarefas[16]);
  tarefas[16].categoria:= 1;
  tarefas[16].ideograma:=ideogrbase[6] ;

  tarefas[17]:= Ttarefa.Create;
  tarefas[17].nome:='em ';
  tarefas[17].tipo:= 1;
  tarefas[17].addSubtarefa(tarefas[17]);
  tarefas[17].categoria:= 1;
  tarefas[17].ideograma:=ideogrbase[7] ;

  tarefas[18]:= Ttarefa.Create;
  tarefas[18].nome:='por ';
  tarefas[18].tipo:= 1;
  tarefas[18].addSubtarefa(tarefas[18]);
  tarefas[18].categoria:= 1;
  tarefas[18].ideograma:=ideogrbase[8] ;

  tarefas[19]:= Ttarefa.Create;
  tarefas[19].nome:='para ';
  tarefas[19].tipo:= 1;
  tarefas[19].addSubtarefa(tarefas[19]);
  tarefas[19].categoria:= 1;
  tarefas[19].ideograma:=ideogrbase[9] ;

  tarefas[20]:= Ttarefa.Create;
  tarefas[20].nome:='meu ';
  tarefas[20].tipo:= 1;
  tarefas[20].addSubtarefa(tarefas[20]);
  tarefas[20].categoria:= 1;
  tarefas[20].ideograma:=ideogrbase[61] ;

  tarefas[21]:= Ttarefa.Create;
  tarefas[21].nome:='seu ';
  tarefas[21].tipo:= 1;
  tarefas[21].addSubtarefa(tarefas[21]);
  tarefas[21].categoria:= 1;
  tarefas[21].ideograma:=ideogrbase[62] ;

  tarefas[22]:= Ttarefa.Create;
  tarefas[22].nome:='entre ';
  tarefas[22].tipo:= 1;
  tarefas[22].addSubtarefa(tarefas[22]);
  tarefas[22].addSubtarefa(tarefas[18]);//por
  tarefas[22].addSubtarefa(tarefas[1]);//quem
  tarefas[22].categoria:= 1;
  tarefas[22].ideograma:=ideogrbase[174] ;

  tarefas[23]:= Ttarefa.Create;
  tarefas[23].nome:='ter ';
  tarefas[23].tipo:= 1;
  tarefas[23].addSubtarefa(tarefas[23]);
  tarefas[23].addSubtarefa(tarefas[1]);  // quem
  tarefas[23].categoria:= 1;
  tarefas[23].ideograma:=ideogrbase[177] ;

  tarefas[24]:= Ttarefa.Create;
  tarefas[24].nome:='poder ';
  tarefas[24].tipo:= 1;
  tarefas[24].addSubtarefa(tarefas[24]);
  tarefas[24].categoria:= 1;
  tarefas[24].ideograma:=ideogrbase[178] ;

  tarefas[25]:= Ttarefa.Create;
  tarefas[25].nome:='querer ';
  tarefas[25].tipo:= 1;
  tarefas[25].addSubtarefa(tarefas[25]);
  tarefas[25].categoria:= 1;
  tarefas[25].ideograma:=ideogrbase[179] ;

  tarefas[26]:= Ttarefa.Create;
  tarefas[26].nome:='fazer ';
  tarefas[26].tipo:= 1;
  tarefas[26].addSubtarefa(tarefas[26]);
  tarefas[26].categoria:= 1;
  tarefas[26].ideograma:=ideogrbase[191] ;

  tarefas[27]:= Ttarefa.Create;
  tarefas[27].nome:='Relacao_dissonancia ';
  tarefas[27].tipo:= 1;
  tarefas[27].addSubtarefa(tarefas[27]);
  tarefas[27].categoria:= 1;
  tarefas[27].ideograma:=ideogrbase[181] ;

  tarefas[28]:= Ttarefa.Create;
  tarefas[28].nome:='relacao_consonancia ';
  tarefas[28].tipo:= 1;
  tarefas[28].addSubtarefa(tarefas[28]);
  tarefas[28].categoria:= 1;
  tarefas[28].ideograma:=ideogrbase[181] ;

  tarefas[29]:= Ttarefa.Create;
  tarefas[29].nome:='talvez_consonante ';
  tarefas[29].tipo:= 1;
  tarefas[29].addSubtarefa(tarefas[29]);
  tarefas[29].categoria:= 1;
  tarefas[29].ideograma:=ideogrbase[181] ;


end;



procedure Tbasetarefa.destroy;
begin

  inherited destroy;
end;

End.

