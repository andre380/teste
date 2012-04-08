unit Uclassificador;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ShellCtrls, ComCtrls,
  Uintencidade, Upronverbo, Uarrays, uacessorios,
  DOM, XMLRead, XMLWrite;

type

  { Tclassificador }

  Tclassificador = class
    matriz: Tmatriz500x20;
    status: integer;
    Listasujeitos: Tmariz_stl;
  private
    imatriz, ixfrase: integer;
    frase: string;
    domtolls: Tdomtools;
    intencidade, intencidadeFigurada, intencidadeExclusiva: Tintencidade;
    pronverbo: TpronVerbo;
    vetfrase: Tarray500;
    utilitario: Tutilitarios;
    desembrulha, entrTeste: TStringList;
    indice:integer;
    oxmlOwner:TDOMDocument;
    raiz,
    sujeito,
      acao,
        qualificador,
        alvo,
        referencia,
        local,
      adjetivo:TDOMElement;
    procedure zermatriz;
    function StriToint(s: string): integer;


    procedure classifica(cl_str1, cl_str2: string);
    function tipopron(spalavra: string): string;

    function validaEntrePronomes: boolean;
    function validaSubstantivos: boolean;
    function validaEntrePronomesEverbos: boolean;
    function validaAdjetivos: boolean;
    function validaPrimeira_pessoa: boolean;
    function validaSegunda_pessoa: boolean;
    function validaTerceira_pessoa: boolean;
    function validaQuarta_pessoa: boolean;
    function validaQuinta_pessoa: boolean;
    function validaSexta_pessoa: boolean;
    function validaPronSemreferencia: boolean;
    function validaindefinidos: boolean;

  public

    procedure classificaEmArvore(stlTexto: TStringList;nodoRaiz:TDOMElement;
                                           progresso:TProgressBar=nil);
    procedure entrafrase(str1: string);
    function textoArvore(Text: TStringList): TXMLDocument;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

procedure Tclassificador.entrafrase(str1: string);
var
  cont: integer;
begin
  utilitario.frase_array(str1, vetfrase);
  imatriz := 0;
  ixfrase := 0;
  zermatriz;
  for cont := 0 to vetfrase.tamanho do
  begin
    classifica(vetfrase.lista[ixfrase], vetfrase.lista[ixfrase + 1]);
    ixfrase := ixfrase + 1;
  end;
end;

function Tclassificador.textoArvore(Text: TStringList): TXMLDocument;
var
  oXML: TXMLDocument;
  oRaiz: TDOMNode;
  fraseloc: Tarray500;
  cont: integer;
  cont2: integer;
begin
  oXML := domtolls.criaObjetoXML('raiz');
  oRaiz := oXML.FirstChild;
  for cont := 0 to Text.Count - 1 do
  begin
    utilitario.frase_array(Text.Strings[cont], fraseloc);
    for cont2 := 0 to fraseloc.tamanho - 1 do
    begin

    end;
  end;

  Result := oXML;
end;

procedure Tclassificador.zermatriz;
var
  cont, cont2: integer;
begin
  for cont := 0 to 500 do
  begin
    for cont2 := 0 to 20 do
    begin
      matriz.coluna[cont][cont2] := '';
    end;
  end;
end;

function Tclassificador.StriToint(s: string): integer;
begin
  if s = '' then
  begin
    Result := 0;
  end
  else
    try
      Result := StrToInt(s);
    except
      Result := 0
    end;
end;

procedure Tclassificador.classificaEmArvore(stlTexto: TStringList;nodoRaiz:TDOMElement;progresso:TProgressBar);
var
  cont,iprogr,icount: Integer;
begin
  raiz:=nodoRaiz;
  oxmlOwner:=raiz.OwnerDocument;
  icount:=stlTexto.Count;
  for cont:= 0 to stlTexto.Count-1 do
  Begin
    if progresso<>nil then
    begin
     iprogr:= round(cont*100/icount);
     progresso.Position:= iprogr;
     progresso.Update;
    end;
    indice:=cont;
    entrafrase(stlTexto.Strings[cont]);
  end;
  progresso.Position:=0;
end;



procedure Tclassificador.classifica(cl_str1, cl_str2: string);
var
  cont, cl_icont: integer;
  sdesmbrulha, sdesmbrulha2, entrada, entrada2, pronOculto, sverbo, temporario: string;
  pego, tapego: boolean;
begin//clasifica(ini);
  entrTeste.Clear;
  desembrulha.Clear;
  for cont := 0 to 10 do
  begin
    entrTeste.Add(' ');
    desembrulha.Add(' ');
  end;
  pego := False;
  // entrateste[0] = cl_str1  e entrTeste[3] = cl_str2;
  if not ((cl_str1 = '') and (cl_str2 = '')) then
  begin
    entrada := pronverbo.entrTeste(cl_str1, cl_str2);
    if entrada > ' ' then
    begin
      for cont := 0 to 6 do
      begin
        repeat
          entrada2 := entrada;
          Delete(entrada2, (pos(' ', entrada) + 1),
            (length(entrada) - pos(' ', entrada)));
          entrTeste[Cont] := entrada2;
          //del tudo depois da 1ª palavra
          Delete(entrada, 1, pos(' ', entrada)); //del a 1ª palavra
        until entrTeste[cont] <> ' '; //ate n ter mais espaços
      end;
    end
    else
    begin
      entrada := pronverbo.dif_pronverb(cl_str1);
      for cont := 0 to 1 do
      begin
        repeat
          entrada2 := entrada;
          Delete(entrada2, (pos(' ', entrada) + 1),
            (length(entrada) - pos(' ', entrada)));
          entrTeste[Cont] := entrada2;
          //del tudo depois da 1ª palavra
          Delete(entrada, 1, pos(' ', entrada)); //del a 1ª palavra
        until entrTeste[cont] <> ' '; //ate n ter mais espaços
      end;
      entrada := pronverbo.dif_pronverb(cl_str2);
      for cont := 2 to 3 do
      begin
        repeat
          entrada2 := entrada;
          Delete(entrada2, (pos(' ', entrada) + 1),
            (length(entrada) - pos(' ', entrada)));
          entrTeste[Cont] := entrada2;
          //del tudo depois da 1ª palavra
          Delete(entrada, 1, pos(' ', entrada)); //del a 1ª palavra
        until entrTeste[cont] <> ' '; //ate n ter mais espaços
      end;
    end;
    if (entrTeste[0]='')
      and (cl_str1<>'') then
      entrTeste[0]:=cl_str1;
    entrTeste[5] := cl_str1;
    entrTeste[6] := cl_str2;
    if ((entrTeste[4] = 'pronomes '))////////////////////////////////////////////
    then
    begin//valida_pron(ini);

      if (pego = False) and (imatriz > 0) and
        (matriz.coluna[imatriz - 1][1] = 'pronome_composto') and
        (matriz.coluna[imatriz][0] <> 'usado') and
        (StriToint(matriz.coluna[imatriz - 1][3]) < 15) then
      begin

        matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]));
        matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := cl_str1;
        matriz.coluna[imatriz - 1][5 + StriToint(matriz.coluna[imatriz - 1][3])] := cl_str2;
        matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 2);

        pego := True;
        exit;
      end
      else
      begin
        if (pego = False) and (matriz.coluna[imatriz][0] <> 'usado') then
        begin
          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'pronome_composto';
          matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := cl_str1;
          matriz.coluna[imatriz][5 + StriToint(matriz.coluna[imatriz][3])] := cl_str2;
          matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 2);
          pego := True;
          ixfrase := ixfrase + 1;
          imatriz := imatriz + 1;
          exit;
        end;
      end;

    end;//valida_pron(fim);
    if (pego = False) and (cl_str1 = '? ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pergunta';
      matriz.coluna[imatriz][4] := cl_str1;
      imatriz := imatriz + 1;
      pego := True;
      exit;
    end;
    if (pego = False) and (cl_str1 = '! ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'esclama';
      matriz.coluna[imatriz][4] := cl_str1;
      imatriz := imatriz + 1;
      pego := True;
      exit;
    end;
    if (pego = False) and (cl_str1 = '. ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'ponto';
      matriz.coluna[imatriz][4] := cl_str1;
      imatriz := imatriz + 1;
      pego := True;
      exit;
    end;
    if (pego = False) and (cl_str1 = ': ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'doispontos';
      matriz.coluna[imatriz][4] := cl_str1;
      imatriz := imatriz + 1;
      pego := True;
      exit;
    end;
    if (pego = False) and (cl_str1 = 'não ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'negacao';
      matriz.coluna[imatriz][4] := cl_str1;
      imatriz := imatriz + 1;
      pego := True;
      exit;
    end;

    if validaSubstantivos then
    begin
      matriz.tamanho := imatriz;
      exit;
    end;

    if (pego = False)
      and (imatriz > 0)
      and (matriz.coluna[imatriz - 1][1] = 'pronome_composto')
      and (matriz.coluna[imatriz][0] <> 'usado') then
    begin//1
      for cl_icont := 4 to (StriToint(matriz.coluna[imatriz - 1][3]) + 4) do
      begin//2
        if pronverbo.pron_verb(matriz.coluna[imatriz - 1][cl_icont], cl_str1) >
          ' ' then
        begin//3
          if tipopron(matriz.coluna[imatriz - 1][cl_icont])= '|pessoal ' then
          begin
            sujeito:=oxmlOwner.CreateElement('SUJEITO');
            sujeito.SetAttribute('nome', matriz.coluna[imatriz - 1][cl_icont]);
            sujeito.SetAttribute('indice',IntToStr(indice));
            raiz.AppendChild(sujeito);
            acao:=oxmlOwner.CreateElement('ACAO');
            acao.SetAttribute('nome',entrTeste[0]);
            acao.SetAttribute('indice',IntToStr(indice));
            sujeito.AppendChild(acao);
//            @
          end;
          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'verbo';
          matriz.coluna[imatriz][2] := entrTeste[1];
          matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
          matriz.coluna[imatriz][3] :=IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
          pego := True;
          imatriz := imatriz + 1;
          //ixfrase:=ixfrase+1;
          break;
        end;//3
      end;//2
    end;//1

    //if validaEntrePronomesEverbos then
    //begin
    //  matriz.tamanho := imatriz;
    //  exit;
    //end;

    if validaAdjetivos then
    begin
      matriz.tamanho := imatriz;
      exit;
    end;
    begin

      if (pego = False)
        and (utilitario.casestr(entrTeste[1], '|1ia ',
        '|1in ', '|2ia ', '|2in ', '|3ia ', '|3in ', '|4ia ', '|4in ', '|5ia ',
        '|5in ', '|6ia ', '|6in ')) then
      begin
          if sujeito <> nil then
          begin
          acao:=oxmlOwner.CreateElement('ACAO');
          acao.SetAttribute('nome',entrTeste[0]);
          acao.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(acao);
          end;
        matriz.coluna[imatriz][0] := 'usado';
        matriz.coluna[imatriz][1] := 'verbo';
        matriz.coluna[imatriz][2] := entrTeste[1];
        matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
        matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz][3]) + 1);
        imatriz := imatriz + 1;

        pego := True;
        if entrTeste[3] = '|pessoal ' then
        begin
          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'pronome';
          matriz.coluna[imatriz][2] := entrTeste[3];
          matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[6];
          matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz][3]) + 1);
          imatriz := imatriz + 1;

        end;
      end;


      if validaPrimeira_pessoa then
      begin
        matriz.tamanho := imatriz;
        exit;
      end;

      if validaSegunda_pessoa then
      begin
        matriz.tamanho := imatriz;
        exit;
      end;

      if validaTerceira_pessoa then
      begin
        matriz.tamanho := imatriz;
        exit;
      end;

      if validaQuarta_pessoa then
      begin
        matriz.tamanho := imatriz;
        exit;
      end;

      if validaQuinta_pessoa then
      begin
        matriz.tamanho := imatriz;
        exit;
      end;

      if validaSexta_pessoa then
      begin
        matriz.tamanho := imatriz;
        exit;
      end;

    end;/////////////############

    if (imatriz > 0) then
    begin
      sverbo := pronverbo.dif_pronverb(matriz.coluna[imatriz - 1][4]);
      for cont := 0 to 1 do
      begin
        repeat
          entrada2 := sverbo;
          Delete(entrada2, (pos(' ', sverbo) + 1),
            (length(sverbo) - pos(' ', sverbo)));
          desembrulha[Cont] := entrada2;
          //del tudo depois da 1ª palavra
          Delete(entrada, 1, pos(' ', entrada)); //del a 1ª palavra
        until desembrulha[cont] <> ' '; //ate n ter mais espaços
      end;
      if (matriz.coluna[imatriz - 1][1] = 'verbo') then
        if (desembrulha[1] = '|acao ')
          or (desembrulha[1] = '|resultado ') then
          if (imatriz > 2)
            and (matriz.coluna[imatriz - 3][1] = 'verbo') then
          begin
            for cl_icont := 4 to (StriToint(matriz.coluna[imatriz - 2][3]) + 4) do
            begin
              temporario := tipopron(matriz.coluna[imatriz - 2][cl_icont]);
              if temporario = '|alvo ' then
              begin
                matriz.coluna[imatriz - 2][1] := 'preposicaoAlvo';
                matriz.coluna[imatriz - 1][1] := 'sujeitopassivo';
                break;
              end;
              if pronverbo.dif_pronverb(matriz.coluna[imatriz - 2][cl_icont]) =
                'referencia' then
              begin
                matriz.coluna[imatriz - 2][1] := 'preposicaoreferncia';
                matriz.coluna[imatriz - 1][1] := 'substantivoReferencia';
              end;
            end;
          end;
    end;


    // e, nem, mas, porém, todavia, contudo, entretanto, ou,
    // porque, porquanto, pois, portanto, se, ora, apesar e como.

    if validaPronSemreferencia then
    begin
      matriz.tamanho := imatriz;
      exit;
    end;

    if validaindefinidos then
    begin
      matriz.tamanho := imatriz;
      exit;
    end;

    cl_str1 := cl_str1;  //debug
    if (pego = False)
      and (matriz.coluna[imatriz][0] = 'usado') then
      imatriz := imatriz + 1;// passa adiante
    matriz.tamanho := imatriz;
  end;
end;// clasifica(fim


//                 88888888888888888888888888888
// 8888888888888888




function Tclassificador.tipopron(spalavra: string): string;
var
  stipopron: string;
begin
  Result := pronverbo.pronomes.tipo_pron(spalavra);
end;

function Tclassificador.validaEntrePronomes: boolean;
begin

end;

function Tclassificador.validaSubstantivos: boolean;
var
  cl_str3: string;
  cl_icont: integer;
  sverbo: string;
begin
  Result := False;
  cl_str3 := '';
  if (imatriz > 0)
    and (matriz.coluna[imatriz - 1][1] = 'pronome_composto')
    and((entrTeste[1] = '')
      or (entrTeste[1] = '|acao ')
      or (entrTeste[1] = '|resultado '))
  then
  begin//substantivo2 ini
    if (imatriz > 0)
      and (matriz.coluna[imatriz - 1][1] = 'pronome_composto') then
      for cl_icont := 4 to (StriToint(matriz.coluna[imatriz - 1][3]) + 4) do
      begin
        if pronverbo.pronomes.tipo_pron(matriz.coluna[imatriz - 1][cl_icont]) = '|referencia ' then
        begin
          cl_str3 := '|referencia ';
          break;
        end;
        if pronverbo.pronomes.tipo_pron(matriz.coluna[imatriz - 1][cl_icont]) = '|alvo ' then
        begin
          cl_str3 := '|alvo ';
        end;
      end;
    if (imatriz > 1)
      and (matriz.coluna[imatriz - 1][1] = 'pronome_composto')
      and(matriz.coluna[imatriz - 2][1] = 'verbo') then
      for cl_icont := 4 to (StriToint(matriz.coluna[imatriz - 2][3]) + 4) do
      begin
        sverbo := pronverbo.dif_pronverb(matriz.coluna[imatriz - 2][cl_icont]);
        Delete(sverbo, Pos(' ', sverbo) + 1, Length(sverbo) - Pos(' ', sverbo));
        if ((sverbo = 'ser ')
          or (sverbo = 'estar ')
          or (sverbo = 'viver ')
          or (sverbo = 'ser')
          or (sverbo = 'estar')
          or (sverbo = 'viver'))
          and(cl_str3 = '|alvo ') then
        begin
          adjetivo:=oxmlOwner.CreateElement('ADJETIVO');
          adjetivo.SetAttribute('nome',entrTeste[0]);
          adjetivo.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(adjetivo);
//          @
          matriz.coluna[imatriz - 1][1] := 'preposicaoAlvo';
          Result := True;
          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'adjetivo';
          matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
          matriz.coluna[imatriz][3] :=
            IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
          imatriz := imatriz + 1;
        end;
      end;
    if (Result = False)
      and (imatriz > 1)
      and(((matriz.coluna[imatriz - 2][1] = 'verbo')
        and(cl_str3 = '|alvo '))) then
    begin
      alvo:=oxmlOwner.CreateElement('ALVO');
      alvo.SetAttribute('indice',IntToStr(indice));
      alvo.SetAttribute('nome',entrTeste[0]);
      acao.AppendChild(alvo);
      matriz.coluna[imatriz - 1][1] := 'preposicaoAlvo';
//       @
      Result := True;
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeitopassivo';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
    end;

    if (imatriz > 1)
      and ((matriz.coluna[imatriz - 2][1] = 'verbo')
        or(matriz.coluna[imatriz - 2][1] = 'sujeitopassivo')
        or(matriz.coluna[imatriz - 2][1] = 'sujeitopassivos'))
      and (cl_str3 = '|referencia ') then
    begin
      referencia:=oxmlOwner.CreateElement('REFERENCIA');
      referencia.SetAttribute('indice',IntToStr(indice));
      referencia.SetAttribute('nome',entrTeste[0]);;
      acao.AppendChild(referencia);
//        @
      matriz.coluna[imatriz - 1][1] := 'preposicaoreferncia';
      Result := True;
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'substantivoReferencia';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
    end;
    if (Result = False)
      and (imatriz > 1)
      and((matriz.coluna[imatriz - 2][1] = 'substantivoReferencia')
        or(matriz.coluna[imatriz - 2][1] = 'substantivoReferencias')) then
    begin
      referencia:=oxmlOwner.CreateElement('REFERENCIA');
      referencia.SetAttribute('indice',IntToStr(indice));
      referencia.SetAttribute('nome',entrTeste[0]);;
      acao.AppendChild(referencia);
//      @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'substantivoReferencia';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;

    end;
  end;//substantivo2 fim

  if (Result = False)
    and (entrTeste[1] = '|alvo ')
    and((entrTeste[3] = '')
      or (entrTeste[3] = '|acao ')
      or (entrTeste[3] = '|resultado '))
  then
  begin//substantivo ini
    if (imatriz > 0)
      and (matriz.coluna[imatriz - 1][1] = 'verbo') then
      for cl_icont := 4 to (StriToint(matriz.coluna[imatriz - 1][3]) + 4) do
      begin
        sverbo := pronverbo.dif_pronverb(matriz.coluna[imatriz - 1][cl_icont]);
        Delete(sverbo, Pos(' ', sverbo) + 1, Length(sverbo) - Pos(' ', sverbo));
        if (Result = False)
          and ((sverbo = 'ser ')
            or (sverbo = 'estar ')
            or(sverbo = 'viver ')
            or (sverbo = 'ser')
            or (sverbo = 'estar')
            or(sverbo = 'viver'))
          and ('|alvo ' = tipopron(entrTeste[0])) then
        begin
          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'preposicaoAlvo';
          matriz.coluna[imatriz][2] := entrTeste[1];
          matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
          matriz.coluna[imatriz][3] :=
            IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
          Result := True;
          ixfrase := ixfrase + 1;
          imatriz := imatriz + 1;
          adjetivo:=oxmlOwner.CreateElement('ADJETIVO');
          adjetivo.SetAttribute('nome',entrTeste[6]);
          adjetivo.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(adjetivo);
//          @
          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'adjetivo';
          matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[6];
          matriz.coluna[imatriz][3] :=
            IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
          imatriz := imatriz + 1;
        end;
      end;
    if (Result = False)
      and (imatriz > 0)
      and(((matriz.coluna[imatriz - 1][1] = 'verbo')
        and(entrTeste[1] = '|alvo '))
        or((entrTeste[1] = '|alvo ')
          and((matriz.coluna[imatriz - 1][1] = 'substantivoReferencia')
            or(matriz.coluna[imatriz - 1][1] = 'substantivoReferencias'))))
    then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'preposicaoAlvo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      Result := True;
      ixfrase := ixfrase + 1;
      imatriz := imatriz + 1;
      alvo:=oxmlOwner.CreateElement('ALVO');
      alvo.SetAttribute('indice',IntToStr(indice));
      alvo.SetAttribute('nome',entrTeste[0]);
      acao.AppendChild(alvo);
//        @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeitopassivo';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[6];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
    end;
    if (Result = False)
      and (imatriz > 0)
      and((matriz.coluna[imatriz - 1][1] = 'sujeitopassivo')
      or(matriz.coluna[imatriz - 1][1] = 'sujeitopassivos')) then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'preposicaoAlvo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      Result := True;
      ixfrase := ixfrase + 1;
      imatriz := imatriz + 1;
      alvo:=oxmlOwner.CreateElement('ALVO');
      alvo.SetAttribute('indice',IntToStr(indice));
      alvo.SetAttribute('nome',entrTeste[6]);
      acao.AppendChild(alvo);
//        @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeitopassivo';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[6];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
    end;

    if (imatriz > 0)
      and ((matriz.coluna[imatriz - 1][1] = 'verbo')
        or(matriz.coluna[imatriz - 1][1] = 'sujeitopassivo')
        or(matriz.coluna[imatriz - 1][1] = 'sujeitopassivos'))
      and(entrTeste[1] = '|referencia ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'preposicaoreferncia';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      Result := True;
      ixfrase := ixfrase + 1;
      imatriz := imatriz + 1;
      referencia:=oxmlOwner.CreateElement('REFERENCIA');
      referencia.SetAttribute('indice',IntToStr(indice));
      referencia.SetAttribute('nome',entrTeste[6]);;
      acao.AppendChild(referencia);
//      @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'substantivoReferencia';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[6];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
    end;
    if (Result = False)
      and (imatriz > 0)
      and (entrTeste[1] = '|referencia ')
      and((matriz.coluna[imatriz - 1][1] = 'substantivoReferencia')
        or(matriz.coluna[imatriz - 1][1] = 'substantivoReferencias'))
    then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'preposicaoreferncia';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      Result := True;
      ixfrase := ixfrase + 1;
      imatriz := imatriz + 1;
//      @
      referencia:=oxmlOwner.CreateElement('REFERENCIA');
      referencia.SetAttribute('indice',IntToStr(indice));
      referencia.SetAttribute('nome',entrTeste[6]);;
      acao.AppendChild(referencia);

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'substantivoReferencia';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[6];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
    end;
  end;//substantivo fim
  ///////////////
end;

function Tclassificador.validaEntrePronomesEverbos: boolean;
var
  temporario: string;
begin
  result:=false ;
  if entrTeste[4] > ' '      ////////////////////////////////////////
  then
  begin//pron_verb ini
    temporario := entrTeste[4];
    if (entrTeste[4] = 'pronverbo ') then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pronome';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4] := entrTeste[0];
      matriz.coluna[imatriz][3] := (IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1));
      imatriz := imatriz + 1;
      acao:=oxmlOwner.CreateElement('ACAO');
          acao.SetAttribute('nome',entrTeste[6]);
          acao.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(acao);
//          @

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[3];
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz + 1][3])] := entrTeste[6];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz + 1][3]) + 1);
      Result := True;
      imatriz := imatriz + 1;
      ixfrase := ixfrase + 1;
    end;

  end;//pronverbo.pron_verb fim
end;

function Tclassificador.validaAdjetivos: boolean;
var
  cl_icont: integer;
  sverbo: string;
  int1: LongInt;
begin
  // bloco de adjetivos
  Result := False;
  if (imatriz > 0)
    and ((entrTeste[1] = '|resultado ')
        or(entrTeste[1] = '|gerundio ')    //radicais de verbos
        or (entrTeste[1] = '|agente ')
        or (entrTeste[1] = '')) //indefinido
      //or((entrTeste[1] = '')
      //  and ((matriz.coluna[imatriz - 1][1] = 'adjetivo')
      //    or(matriz.coluna[imatriz - 1][1] = 'adjetivos')
      //    or(intencidadeFigurada.compativel(entrTeste[0])))))
  then
  begin//adjetivo ini
    if matriz.coluna[imatriz - 1][1] = 'verbo' then
    int1:=(StriToint(matriz.coluna[imatriz - 1][3]));
      for cl_icont := 4 to 4 + (StriToint(matriz.coluna[imatriz - 1][3])) do
      begin//for  varre a tabela anterior em busca de verbos basicos
        sverbo := pronverbo.dif_pronverb(matriz.coluna[imatriz - 1][cl_icont]);
        Delete(sverbo, Pos(' ', sverbo) + 1, Length(sverbo) - Pos(' ', sverbo));
        if   (sverbo = 'ser ')
          or (sverbo = 'estar ')
          or (sverbo = 'viver ')
          or (sverbo = 'ser')
          or (sverbo = 'estar')
          or (sverbo = 'viver') then
        begin
          adjetivo:=oxmlOwner.CreateElement('ADJETIVO');
          adjetivo.SetAttribute('nome',entrTeste[0]);
          adjetivo.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(adjetivo);
//          @

          matriz.coluna[imatriz][0] := 'usado';
          matriz.coluna[imatriz][1] := 'adjetivo';
          matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
          matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);

          Result := True;
          imatriz := imatriz + 1;
          break;
        end;
      end;//for

    if (Result = False)
      and (imatriz > 0)
      and((matriz.coluna[imatriz - 1][1] = 'adjetivo')
        or(matriz.coluna[imatriz - 1][1] = 'adjetivos'))
      and((entrTeste[0] = ', ')
        or (entrTeste[0] = '; ')
        or (entrTeste[0] = 'e ')
        or (entrTeste[0] = 'ou '))
      and ((entrTeste[1] = '|resultado ')
        or (entrTeste[1] = '|gerundio ')
        or(entrTeste[1] = '|agente ')
        or(intencidadeFigurada.compativel(entrTeste[2]))
        or((entrTeste[1] = '')
          and ((entrTeste[0] <> ',')
            or (entrTeste[0] <> ';')
            or (entrTeste[0] <> ':')
            or (entrTeste[0] <> '.'))))
      and (StriToint(matriz.coluna[imatriz - 1][3]) < 15)
    then
    begin//adjetivos1
      adjetivo:=oxmlOwner.CreateElement('ADJETIVO');
          adjetivo.SetAttribute('nome',entrTeste[0]);
          adjetivo.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(adjetivo);
//          @
      matriz.coluna[imatriz - 1][1] := 'adjetivos';
      matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := entrTeste[5];
      matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);

      matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := entrTeste[6];
      matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);
      Result := True;
      ixfrase := ixfrase + 1;
      //imatriz:=imatriz+1;
    end;//adjetivos1

    if (Result = False)
      and (imatriz > 0)
      and((matriz.coluna[imatriz - 1][1] = 'adjetivo')
        or(matriz.coluna[imatriz - 1][1] = 'adjetivos'))
      and((entrTeste[1] = '|gerundio ')
        or (entrTeste[1] = '|agente ')
        or(entrTeste[1] = '|resultado ')
        or(intencidadeFigurada.compativel(entrTeste[3]))
        or(entrTeste[1] = '')
        and ((entrTeste[0] <> ',')
          or(entrTeste[0] <> ';')
          or (entrTeste[0] <> ':')
          or (entrTeste[0] <> '.')))
    then
    begin
      matriz.coluna[imatriz - 1][1] := 'adjetivos';
      matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := entrTeste[0];
      matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);
      // imatriz:=imatriz+1; grava na tab anterior
      Result := True;
    end;
  end;//adjetivo fim

  if (Result = False)
    and (imatriz > 0)
    and((intencidade.compativel(entrTeste[0]))
      or(intencidadeExclusiva.compativel(entrTeste[0]))) then
  begin//adjetivo_do_verbo
    if (matriz.coluna[imatriz - 1][1] = 'adjetivo_do_verbo')
      or(matriz.coluna[imatriz - 1][1] = 'adjetivos_do_verbo')
      and(StriToint(matriz.coluna[imatriz - 1][3]) < 15) then
    begin
      qualificador:=oxmlOwner.CreateElement('QUALIFICADOR');
          qualificador.SetAttribute('nome',entrTeste[0]);
          qualificador.SetAttribute('indice',IntToStr(indice));
          acao.AppendChild(qualificador);
//          @
      matriz.coluna[imatriz - 1][0] := 'usado';
      matriz.coluna[imatriz - 1][1] := 'adjetivos_do_verbo';
      matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] :=entrTeste[0];
      matriz.coluna[imatriz - 1][3] :=IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);
      Result := True;
    end;

    if (Result = False)
      and (matriz.coluna[imatriz - 1][1] = 'verbo') then
      // nao pode ser estar viver
    begin
      qualificador:=oxmlOwner.CreateElement('QUALIFICADOR');
          qualificador.SetAttribute('nome',entrTeste[0]);
          qualificador.SetAttribute('indice',IntToStr(indice));
          acao.AppendChild(qualificador);
//          @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'adjetivo_do_verbo';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
      Result := True;
      imatriz := imatriz + 1;
    end;
  end; //adjetivo_do_verbo
end;

function Tclassificador.validaPrimeira_pessoa: boolean;
begin
  Result := False;
  if (utilitario.casestr(entrTeste[1], '|1fi ', '|1pi ', '|1pp ', '|1ii ',
    '|1mi ', '|1ti ', '|1ip ', '|1ps ', '|1is ', '|1fs '))/////////////////////////////
  then
  begin//prim_pessoa(ini);
    if (imatriz > 0) and (utilitario.casestr(matriz.coluna[imatriz - 1][2],
      '|1fi ', '|1pi ', '|1pp ', '|1ii ', '|1mi ', '|1ti ', '|1ip ', '|1ps ', '|1is ', '|1fs '))
    then
    begin//1
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeito_herdado';
      matriz.coluna[imatriz][2] := matriz.coluna[imatriz - 1][2];
      matriz.coluna[imatriz][4] := matriz.coluna[imatriz - 1][4];
      matriz.coluna[imatriz][5] := matriz.coluna[imatriz - 1][5];
      matriz.coluna[imatriz][6] := matriz.coluna[imatriz - 1][6];
      matriz.coluna[imatriz][7] := matriz.coluna[imatriz - 1][7];
      matriz.coluna[imatriz][8] := matriz.coluna[imatriz - 1][8];
      matriz.coluna[imatriz][9] := matriz.coluna[imatriz - 1][9];
      matriz.coluna[imatriz][10] := matriz.coluna[imatriz - 1][10];
      matriz.coluna[imatriz][11] := matriz.coluna[imatriz - 1][11];
      matriz.coluna[imatriz][12] := matriz.coluna[imatriz - 1][12];
      imatriz := imatriz + 1;
          acao:=oxmlOwner.CreateElement('ACAO');
          acao.SetAttribute('nome',entrTeste[0]);
          acao.SetAttribute('indice',IntToStr(indice));
          sujeito.AppendChild(acao);
//          @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
      imatriz := imatriz + 1;
      Result := True;
    end//1
    else
    begin//1b
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pronome_oculto';
      matriz.coluna[imatriz][2] := '';
      matriz.coluna[imatriz][4] := 'eu ';
      imatriz := imatriz + 1;
      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome', 'eu');
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('A');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//          @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      Result := True;
      if (imatriz > 2) and (matriz.coluna[imatriz - 3][1] = 'negacao') then
      begin
        matriz.coluna[imatriz - 2][2] := 'negado';
      end;
    end;//1b
  end;//prim_pessoa(fim);
end;

function Tclassificador.validaSegunda_pessoa: boolean;
var
  cl_icont: Integer;
begin
  Result:=False;
  if  (utilitario.casestr(entrTeste[1], '|2fi ', '|2pi ', '|2pp ', '|2ii ',
    '|2mi ', '|2ti ', '|2ip ', '|2ps ', '|2is ', '|2fs '))
  then
  begin//segu_pessoa(ini);
    if (imatriz > 2) and (matriz.coluna[imatriz - 1][1] = 'indefinido') and
      (matriz.coluna[imatriz - 3][1] <> 'indefinido') then
    begin//0
      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome', matriz.coluna[imatriz - 1][4]);
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz - 1][1] := 'sujeito';
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      Result := True;
    end//0
    else
    begin//0b
      if (imatriz > 0) and (utilitario.casestr(matriz.coluna[imatriz - 1]
        [2], '|2fi ', '|2pi ', '|2pp ', '|2ii ', '|2mi ', '|2ti ', '|2ip ', '|2ps ', '|2is ', '|2fs '))
      then
      begin//1
        matriz.coluna[imatriz][0] := 'usado';
        matriz.coluna[imatriz][1] := 'sujeito_herdado';
        matriz.coluna[imatriz][2] := matriz.coluna[imatriz - 1][2];
        matriz.coluna[imatriz][4] := matriz.coluna[imatriz - 1][4];
        matriz.coluna[imatriz][5] := matriz.coluna[imatriz - 1][5];
        matriz.coluna[imatriz][6] := matriz.coluna[imatriz - 1][6];
        matriz.coluna[imatriz][7] := matriz.coluna[imatriz - 1][7];
        matriz.coluna[imatriz][8] := matriz.coluna[imatriz - 1][8];
        matriz.coluna[imatriz][9] := matriz.coluna[imatriz - 1][9];
        matriz.coluna[imatriz][10] := matriz.coluna[imatriz - 1][10];
        matriz.coluna[imatriz][11] := matriz.coluna[imatriz - 1][11];
        matriz.coluna[imatriz][12] := matriz.coluna[imatriz - 1][12];
        imatriz := imatriz + 1;

        acao:=oxmlOwner.CreateElement('ACAO');
        acao.SetAttribute('nome',entrTeste[0]);
        acao.SetAttribute('indice',IntToStr(indice));
        sujeito.AppendChild(acao);
//          @
        matriz.coluna[imatriz][0] := 'usado';
        matriz.coluna[imatriz][1] := 'verbo';
        matriz.coluna[imatriz][2] := entrTeste[1];
        matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
        matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
        imatriz := imatriz + 1;
        Result := True;

      end//1
      else
      begin//1b
        if (imatriz > 0) then
          for cl_icont := 4 to (stritoint(matriz.coluna[imatriz - 1][3]) + 4) do
          begin//for
            if pronverbo.pron_verb(matriz.coluna[imatriz - 1][cl_icont], entrTeste[5]) >
              ' ' then
            begin
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//          @
              matriz.coluna[imatriz][0] := 'usado';
              matriz.coluna[imatriz][1] := 'verbo';
              matriz.coluna[imatriz][2] := entrTeste[1];
              matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
              matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
              Result := True;
              imatriz := imatriz + 1;
              break;
            end;
          end;//for
      end;//1b
      if Result = False then
      begin
        matriz.coluna[imatriz][0] := 'usado';
        matriz.coluna[imatriz][1] := 'pronome_oculto';
        matriz.coluna[imatriz][2] := '';
        matriz.coluna[imatriz][4] := 'tu ';
        imatriz := imatriz + 1;
        sujeito:=oxmlOwner.CreateElement('SUJEITO');
        sujeito.SetAttribute('nome', 'tu');
        sujeito.SetAttribute('indice',IntToStr(indice));
        raiz.AppendChild(sujeito);
        acao:=oxmlOwner.CreateElement('ACAO');
        acao.SetAttribute('nome',entrTeste[0]);
        acao.SetAttribute('indice',IntToStr(indice));
        sujeito.AppendChild(acao);
  //          @

        matriz.coluna[imatriz][0] := 'usado';
        matriz.coluna[imatriz][2] := entrTeste[1];
        matriz.coluna[imatriz][1] := 'verbo';
        matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
        matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
        imatriz := imatriz + 1;
        Result := True;
        if (imatriz > 2) and (matriz.coluna[imatriz - 3][1] = 'negacao') then
        begin
          matriz.coluna[imatriz - 2][2] := 'negado';
        end;
      end;
    end;//0b
  end;//segu_pessoa(fim);
end;

function Tclassificador.validaTerceira_pessoa: boolean;
begin
  if  (utilitario.casestr(entrTeste[1], '|3fi ', '|3pi ', '|3pp ', '|3ii ',
    '|3mi ', '|3ti ', '|3ip ', '|3ps ', '|3is ', '|3fs ')) then //////////////////////////
  begin//terc_pessoa(ini);
    if (imatriz > 0) and (utilitario.casestr(matriz.coluna[imatriz - 1][4],
      '|3fi ', '|3pi ', '|3pp ', '|3ii ', '|3mi ', '|3ti ', '|3ip ', '|3ps ', '|3is ', '|3fs '))
    then
    begin//1
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeito_herdado';
      matriz.coluna[imatriz][2] := matriz.coluna[imatriz - 1][2];
      matriz.coluna[imatriz][4] := matriz.coluna[imatriz - 1][4];
      matriz.coluna[imatriz][5] := matriz.coluna[imatriz - 1][5];
      matriz.coluna[imatriz][6] := matriz.coluna[imatriz - 1][6];
      matriz.coluna[imatriz][7] := matriz.coluna[imatriz - 1][7];
      matriz.coluna[imatriz][8] := matriz.coluna[imatriz - 1][8];
      matriz.coluna[imatriz][9] := matriz.coluna[imatriz - 1][9];
      matriz.coluna[imatriz][10] := matriz.coluna[imatriz - 1][10];
      matriz.coluna[imatriz][11] := matriz.coluna[imatriz - 1][11];
      matriz.coluna[imatriz][12] := matriz.coluna[imatriz - 1][12];
      imatriz := imatriz + 1;
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//          @

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
      imatriz := imatriz + 1;
      Result := True;
    end;//1
    if (imatriz > 0) and (matriz.coluna[imatriz - 1][1] = 'indefinido') then
    begin
      matriz.coluna[imatriz - 1][1] := 'sujeito';
      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome', matriz.coluna[imatriz-1][4]);
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//          @

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      Result := True;
    end;
    if (Result = False) then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pronome_oculto';
      matriz.coluna[imatriz][2] := '';
      matriz.coluna[imatriz][3] := '3';
      matriz.coluna[imatriz][4] := 'voce ';
      matriz.coluna[imatriz][5] := 'ele ';
      matriz.coluna[imatriz][6] := 'ela ';
      imatriz := imatriz + 1;

      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome','voce');
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
      if (imatriz > 2) and (matriz.coluna[imatriz - 3][1] = 'negacao') then
      begin
        matriz.coluna[imatriz - 2][2] := 'negado';
      end;
    end;
  end;//terc_pessoa(fim);
end;

function Tclassificador.validaQuarta_pessoa: boolean;
begin
  if (result = False) and (utilitario.casestr(entrTeste[1], '|4fi ', '|4pi ', '|4pp ', '|4ii ',
    '|4mi ', '|4ti ', '|4ip ', '|4ps ', '|4is ', '|4fs ')) then ////////////////////////

  begin//quar_pessoa(ini);
    if (imatriz > 0) and (utilitario.casestr(matriz.coluna[imatriz - 1][4],
      '|4fi ', '|4pi ', '|4pp ', '|4ii ', '|4mi ', '|4ti ', '|4ip ', '|4ps ', '|4is ', '|4fs ')) then
    begin//1
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeito_herdado';
      matriz.coluna[imatriz][2] := matriz.coluna[imatriz - 1][2];
      matriz.coluna[imatriz][4] := matriz.coluna[imatriz - 1][4];
      matriz.coluna[imatriz][5] := matriz.coluna[imatriz - 1][5];
      matriz.coluna[imatriz][6] := matriz.coluna[imatriz - 1][6];
      matriz.coluna[imatriz][7] := matriz.coluna[imatriz - 1][7];
      matriz.coluna[imatriz][8] := matriz.coluna[imatriz - 1][8];
      matriz.coluna[imatriz][9] := matriz.coluna[imatriz - 1][9];
      matriz.coluna[imatriz][10] := matriz.coluna[imatriz - 1][10];
      matriz.coluna[imatriz][11] := matriz.coluna[imatriz - 1][11];
      matriz.coluna[imatriz][12] := matriz.coluna[imatriz - 1][12];
      imatriz := imatriz + 1;

      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
    end;//1

    if result = False then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pronome_oculto';
      matriz.coluna[imatriz][2] := '';
      matriz.coluna[imatriz][4] := 'nós ';
      imatriz := imatriz + 1;
      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome','nós');
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
      if (imatriz > 2) and (matriz.coluna[imatriz - 3][1] = 'negacao') then
      begin
        matriz.coluna[imatriz - 2][2] := 'negado';
      end;
    end;
  end;//quar_pessoa(fim);

end;

function Tclassificador.validaQuinta_pessoa: boolean;
begin
  if (imatriz > 0)
    and(utilitario.casestr(entrTeste[1], '|5fi ', '|5pi ', '|5pp ', '|5ii ',
    '|5mi ', '|5ti ', '|5ip ', '|5ps ', '|5is ', '|5fs ')
    and(matriz.coluna[imatriz - 1][1] <> 'verbo'))
  then
  begin//quin_pessoa(ini);
    if (imatriz > 0) and (utilitario.casestr(matriz.coluna[imatriz - 1]
      [4], '|5fi ', '|5pi ', '|5pp ', '|5ii ', '|5mi ', '|5ti ', '|5ip ',
      '|5ps ', '|5is ', '|5fs ')) then
    begin//1
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeito_herdado';
      matriz.coluna[imatriz][2] := matriz.coluna[imatriz - 1][2];
      matriz.coluna[imatriz][4] := matriz.coluna[imatriz - 1][4];
      matriz.coluna[imatriz][5] := matriz.coluna[imatriz - 1][5];
      matriz.coluna[imatriz][6] := matriz.coluna[imatriz - 1][6];
      matriz.coluna[imatriz][7] := matriz.coluna[imatriz - 1][7];
      matriz.coluna[imatriz][8] := matriz.coluna[imatriz - 1][8];
      matriz.coluna[imatriz][9] := matriz.coluna[imatriz - 1][9];
      matriz.coluna[imatriz][10] := matriz.coluna[imatriz - 1][10];
      matriz.coluna[imatriz][11] := matriz.coluna[imatriz - 1][11];
      matriz.coluna[imatriz][12] := matriz.coluna[imatriz - 1][12];
      imatriz := imatriz + 1;

      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
    end;//1
    if (Result = False) and (imatriz > 0) and
      (matriz.coluna[imatriz - 1][1] = 'indefinidos') then
    begin//0
      matriz.coluna[imatriz - 1][1] := 'sujeito_composto';

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
    end//0
    else
    begin//0b
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pronome_oculto';
      matriz.coluna[imatriz][2] := '';
      matriz.coluna[imatriz][4] := 'vós';
      imatriz := imatriz + 1;

      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome','vós');
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
      if (imatriz > 2) and (matriz.coluna[imatriz - 3][1] = 'negacao') then
      begin
        matriz.coluna[imatriz - 2][2] := 'negado';
      end;
    end;//0b
  end;//quin_pessoa(fim);

end;

function Tclassificador.validaSexta_pessoa: boolean;
begin
  Result:=False;
  if(imatriz > 0)
    and(utilitario.casestr(entrTeste[1], '|6fi ', '|6pi ', '|6pp ', '|6ii ',
    '|6mi ', '|6ti ', '|6ip ', '|6ps ', '|6is ', '|6fs ')
    and(matriz.coluna[imatriz - 1][1] <> 'verbo'))
  then
  begin//sext_pessoa(ini);
    if (imatriz > 0)
      and (utilitario.casestr(matriz.coluna[imatriz - 1]
      [4], '|6fi ', '|6pi ', '|6pp ', '|6ii ', '|6mi ', '|6ti ', '|6ip ',
      '|6ps ', '|6is ', '|6fs '))
    then
    begin//1
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'sujeito_herdado';
      matriz.coluna[imatriz][2] := matriz.coluna[imatriz - 1][2];
      matriz.coluna[imatriz][4] := matriz.coluna[imatriz - 1][4];
      matriz.coluna[imatriz][5] := matriz.coluna[imatriz - 1][5];
      matriz.coluna[imatriz][6] := matriz.coluna[imatriz - 1][6];
      matriz.coluna[imatriz][7] := matriz.coluna[imatriz - 1][7];
      matriz.coluna[imatriz][8] := matriz.coluna[imatriz - 1][8];
      matriz.coluna[imatriz][9] := matriz.coluna[imatriz - 1][9];
      matriz.coluna[imatriz][10] := matriz.coluna[imatriz - 1][10];
      matriz.coluna[imatriz][11] := matriz.coluna[imatriz - 1][11];
      matriz.coluna[imatriz][12] := matriz.coluna[imatriz - 1][12];
      imatriz := imatriz + 1;

      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz - 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
    end;//1
    if (result = False) and (imatriz > 0) and (matriz.coluna[imatriz - 1][1] = 'indefinidos') then
    begin//0
      matriz.coluna[imatriz - 1][1] := 'sujeito_composto';

      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome',matriz.coluna[imatriz - 1][4]);
      sujeito.SetAttribute('nome2',matriz.coluna[imatriz - 1][6]);
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz][3]) + 1);
      result := True;
      imatriz := imatriz + 1;
    end//0
    else
    begin//0b
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'pronome_oculto';
      matriz.coluna[imatriz][2] := '';
      matriz.coluna[imatriz][4] := 'voces';
      matriz.coluna[imatriz][5] := 'eles';
      matriz.coluna[imatriz][6] := 'elas';
      imatriz := imatriz + 1;

      sujeito:=oxmlOwner.CreateElement('SUJEITO');
      sujeito.SetAttribute('nome','voces');
      sujeito.SetAttribute('indice',IntToStr(indice));
      raiz.AppendChild(sujeito);
      acao:=oxmlOwner.CreateElement('ACAO');
      acao.SetAttribute('nome',entrTeste[0]);
      acao.SetAttribute('tipo','negado');
      acao.SetAttribute('tempo',entrTeste[1]);
      acao.SetAttribute('indice',IntToStr(indice));
      sujeito.AppendChild(acao);
//            @
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + stritoint(matriz.coluna[imatriz + 1][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(stritoint(matriz.coluna[imatriz + 1][3]) + 1);
      imatriz := imatriz + 1;
      result := True;
      if (imatriz > 2) and (matriz.coluna[imatriz - 3][1] = 'negacao') then
      begin
        matriz.coluna[imatriz - 2][2] := 'negado';
      end;
    end;
  end;//sext_pessoa(fim);

end;

function Tclassificador.validaPronSemreferencia: boolean;
begin
  Result:=False;
  //if(matriz.coluna[imatriz-1][3+StriToint(matriz.coluna[imatriz-1][3])]<>(cl_str1) )then
  begin//pron sem ref(ini);
    if (imatriz > 0)
      and ((matriz.coluna[imatriz - 1][1] = 'indefinido')
        or (matriz.coluna[imatriz - 1][1] = 'indefinidos'))
      and ((entrTeste[0] = ', ')
        or (entrTeste[0] = '; ')
        or (entrTeste[0] = 'e ')
        or (entrTeste[0] = 'ou '))
      and(pronverbo.dif_pronverb(entrTeste[3]) = 'true')
    then
    begin
      matriz.coluna[imatriz - 1][1] := 'indefinidos';
      matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := entrTeste[0];
      matriz.coluna[imatriz - 1][3] :=IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);
      result := True;
    end;
    if (result = False) and (utilitario.casestr(entrTeste[1], '|alvo ',
      '|referencia ', '|alvoOculto ', '|verbal ', '|referenciaOculta ',
      '|alvoIndefinido ', '|pessoal ')) then
    begin
      if (imatriz > 0) and ((matriz.coluna[imatriz - 1][1] = 'pron_sem_referencias') or
        (matriz.coluna[imatriz - 1][1] = 'pron_sem_referencia')) and
        (StriToint(matriz.coluna[imatriz - 1][3]) < 15) then
      begin
        matriz.coluna[imatriz - 1][1] := 'pron_sem_referencias';
        matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := entrTeste[0];
        matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);
        result := True;
      end
      else
      begin
        matriz.coluna[imatriz][0] := 'usado';
        matriz.coluna[imatriz][1] := 'pron_sem_referencia';
        matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
        matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);
        result := True;
        imatriz := imatriz + 1;
      end;
    end;
    if (result = False) and (utilitario.casestr(
      entrTeste[1], '|gerundio ', '|agente ', '|acao ', '|resultado ', '|participio '))
    then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'verbo_sem_referencia';
      matriz.coluna[imatriz][2] := entrTeste[1];
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);

      result := True;
      imatriz := imatriz + 1;
    end;
  end;//_pron sem ref(fim);

end;

function Tclassificador.validaindefinidos: boolean;
var
  temporario: String;
begin
  Result:=False;
  if (entrTeste[1] = '') and (matriz.coluna[imatriz][0] <> 'usado') then
    //////////////////
  begin//pronverbo.dif_pronverb(ini);

    if (imatriz > 0) and ((matriz.coluna[imatriz - 1][1] = 'indefinido') or
      (matriz.coluna[imatriz - 1][1] = 'indefinidos')) and
      (StriToint(matriz.coluna[imatriz - 1][3]) < 15) then
    begin
      matriz.coluna[imatriz - 1][4 + StriToint(matriz.coluna[imatriz - 1][3])] := entrTeste[0];
      matriz.coluna[imatriz - 1][3] := IntToStr(StriToint(matriz.coluna[imatriz - 1][3]) + 1);
      result := True;
    end;
    if (result = False)
      and (imatriz > 0)
      and(matriz.coluna[imatriz - 1][1] = 'pron_sem_referencia')
    then
    begin
      matriz.coluna[imatriz - 1][1] := 'pronome';

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'indefinido';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);

      result := True;
      imatriz := imatriz + 1;
    end;
    if (result = False)
      and (imatriz > 0)
      and(matriz.coluna[imatriz - 1][1] = 'pron_sem_referencias')
      and(StriToint(matriz.coluna[imatriz - 1][3]) < 15) then
    begin
      matriz.coluna[imatriz - 1][1] := 'pronomes';

      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'indefinido';
      matriz.coluna[imatriz][4 + StriToint(matriz.coluna[imatriz][3])] := entrTeste[0];
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);

      result := True;
      imatriz := imatriz + 1;

    end;
    if (result = False) then
    begin
      matriz.coluna[imatriz][0] := 'usado';
      matriz.coluna[imatriz][1] := 'indefinido';
      matriz.coluna[imatriz][4] := entrTeste[0];// +StriToint(matriz.coluna[imatriz][3])
      temporario := matriz.coluna[imatriz][3];//+StriToint(matriz.coluna[imatriz][3])
      StriToint((temporario));
      matriz.coluna[imatriz][3] := IntToStr(StriToint(matriz.coluna[imatriz][3]) + 1);

      result := True;
      imatriz := imatriz + 1;
    end;
  end;//pronverbo.dif_pronverb(fim);

end;

constructor Tclassificador.Create;
var
  cont: Integer;
begin
  domtolls := Tdomtools.Create;
  Listasujeitos := Tmariz_stl.Create;
  pronverbo := TpronVerbo.Create;
  //vetfrase:=Tarray500.Create;
  //matriz:=Tmatriz500x20.Create;
  utilitario := Tutilitarios.Create;

  intencidadeFigurada := Tintencidade.Create('intencidadeFigurada.txt');
  intencidade := Tintencidade.Create('intencidade.txt');
  intencidadeExclusiva := Tintencidade.Create('intencidadeExclusiva.txt');
  entrTeste := TStringList.Create;
  desembrulha := TStringList.Create;
  for cont := 0 to 10 do
  begin
    entrTeste.Add(' ');
    desembrulha.Add(' ');
  end;
end;

destructor Tclassificador.Destroy;
begin
  domtolls.Destroy;
  pronverbo.Destroy;
  //vetfrase.Destroy;
  //matriz.Destroy;
  utilitario.Destroy;
  intencidadeExclusiva.Destroy;
  intencidade.Destroy;
  intencidadeFigurada.Destroy;
  inherited Destroy;
end;



end.

