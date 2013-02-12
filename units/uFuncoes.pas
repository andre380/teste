unit uFuncoes;
{$mode delphi}
interface
Uses
  SysUtils,  Messages, Classes, Graphics, Controls,md5,
  Dialogs, ExtCtrls, StdCtrls,LCLType,Windows,Forms,TypInfo,
  Winsock,SHellAPI,ShlObj,DBCtrls, StrUtils,Registry;

type
  PProgressData = ^TProgressData;
  TProgressData = record
    LastFile, CurFile : Cardinal;
    Progress, TotalSize, LastProg  : int64;
  end;
function BlockInput( fBlockIt:boolean):Boolean;  StdCall; External 'User32.dll';
Function AllTrim(OQue : String) : String;{Retira todos os espaços em brancos da string}
function CalcularFatorVencimento(DataDesejada : TDateTime) : string;
Function CodigoBarrasValido(sCBarras:string):Boolean;
Function Confirma(sMensagem: string;sBotaoDefault:string='N'):Boolean;
Function ConfirmaOuCancela(sMensagem: string;sBotaoDefault:string='N'):Integer;
function ContaArq(Dir, Extencao: String): Integer;
Function CopiaArquivo(sArqOrigem,sArqDestino:string;bSobrepor:boolean=False;iTamanhoArquivo:Integer=-2):boolean;
Function CriaDiretorio(sNomePasta:string):boolean;
Function Criptografia(sStr:string;sChave: string=''): string;
function DigitoModulo11(sString:string):Integer;
Function EnviaArquivoLixeira(sFileName : string ) : boolean;
function escreveNoWinRegistry(RootKey : HKEY;sCaminhoChave,sPropriedade : String;valor : Variant):boolean;
function ExececutaEsperaFechamentoAplicativoExterno(const FileName, Params: string;const WindowState: Word): boolean;
Function ExecutaProgramaExterno(sPrograma, sParametros: String):boolean;
Function ExtraiMsgFireBird(sMensagemOriginal:string):string;
function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
Function FormJaCriado(Frm :TForm;bTrazerparafrente:boolean=True):Boolean;
function F_GetBuildInfo(exeName: String):string;overload;
function F_GetBuildInfo:string;overload;
Function GeraCodigoBarras(iCodigo:Longint):String;
Function isFolderEmpty(const directory : string;bIgnoraSubPastas : boolean=true): Boolean;
function leWinRegistry(RootKey : HKEY;sCaminhoChave,sPropriedade : String;sTipoValor : String):Variant;
Function MesExtenso(iMes:integer;bMaiusculo:boolean=True):string;
function Modulo10(Valor: String) : string;
function Modulo10BoletosBancarios(Valor: String;Banco: String) : string;
function Modulo11BoletosBancarios(Valor: string;Banco: String; Base:Integer=0): string;
Function NomedoComputador:string;
function NumLinhasArq(Arqtexto:String): integer;
Function PadCenter(StrToPad: string; LenToPad: integer; StrFill: string): string;
Function PadLeft(StrToPad: string; LenToPad: integer; StrFill: string): string;
Function PadRight(StrToPad: string; LenToPad: integer; StrFill: string): string;
function ProcessArquivo(const Origem, Destino : string; Operacao, Modo:Integer) : Boolean;
function procuraSimbolo(sSimbolo,sStringProcurar: String; iOcorrencia: Integer=1): Integer;
Function RenomeiaArquivo(sArquivoOrigem,sNovaExtensao:string):Boolean;
function RetiraNumerosTracos(sTexto:string):string;
function tbFileSize(const FileName: string): integer;
function TiraEnter(sTexto:string):string;
function TiraEspacoInicioFinal(sTexto:string;iInicioFinal:integer):string;
Function TiraMascaraCNPJCPF(sCNPJCPF:string):string;
Function TiraMascaraFloat(sValor :String):String;
Function TiraMascaraIE(sIE:string):string;
function TiraMascaraTelefone(sTelefone : string;tiraZeroInicial : Boolean=True):string;
function tiraPontoMilhar(sValor:string):String;
function tornaNegativo(fValor : Currency):Currency;
function tornaPositivo(fValor : Currency):Currency;
function TranformaTaxaEmValor(eCapital, eTaxa: Extended):Currency;
Function UltimoDiaDoMes(wAno,wMes:Integer):Integer;
function WindowExists(AppWindowName, AppClassName: string): Boolean;
procedure AbreArquivoWindows(F: String);
Procedure Adverte(sMensagem : string);
Procedure ArquivosDiretorio(Path,sMascaraArquivo:string; var FileList: TStringList);overload;
procedure ArquivosDiretorio(Path,sMascaraArquivo:string; var FileList: TStringList;var HashList :TStringList);overload;
Procedure AtribuiProp(Comp: TComponent; Const PropName: string; Val: string);
Procedure CentralizaForm(Frm : TForm);
procedure curCopia;
procedure curSeta;
procedure curSqlWait(sHint:string='');
Procedure Erro(sMensagem : string);
Procedure GravaErroLog(sErro,sUsuario,sLocalErro:string);
Procedure Informa(sMensagem: string);
Procedure Subdiretorios(DiretorioPai:string;DirList:TStringList);
Procedure TravaDestravaTeclado(bTravar:Boolean);
Procedure DescarregaArquivoCache(sArquivo:string);
function MD5(const fileName : string) : string;
function isDate(TestaString:String):boolean;

implementation

uses Math, Variants;

function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
	Texto : Texto original
	TamanhoDesejado: Tamanho que a string resultante deverá ter
	AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda
		TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
				 Se o tamanho do texto for MAIOR que o desejado, eliminar últimos caracteres do texto
		FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à esquerda
				 Se o tamanho do texto for MAIOR que o desejado, eliminar primeiros caracteres do texto
	CaracterAcrescentar: Carácter que deverá ser acrescentado
}
var
	QuantidadeAcrescentar,
	TamanhoTexto,
	PosicaoInicial,
	i : integer;

begin
	case CaracterAcrescentar of
		'0'..'9','a'..'z','A'..'Z' : ;{Não faz nada}
		else
			CaracterAcrescentar := ' ';
	end;

	Texto := Trim(AnsiUpperCase(Texto));
	TamanhoTexto := Length(Texto);
	for i := 1 to (TamanhoTexto) do
	begin
		if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
		begin
			case Texto[i] of
				'Á','À','Â','Ä','Ã' : Texto[i] := 'A';
				'É','È','Ê','Ë' : Texto[i] := 'E';
				'Í','Ì','Î','Ï' : Texto[i] := 'I';
				'Ó','Ò','Ô','Ö','Õ' : Texto[i] := 'O';
				'Ú','Ù','Û','Ü' : Texto[i] := 'U';
				'Ç' : Texto[i] := 'C';
				'Ñ' : Texto[i] := 'N';
				else Texto[i] := ' ';
			end;
		end;
	end;

	QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
	if QuantidadeAcrescentar < 0 then
		QuantidadeAcrescentar := 0;
	if CaracterAcrescentar = '' then
		CaracterAcrescentar := ' ';
	if TamanhoTexto >= TamanhoDesejado then
		PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
	else
		PosicaoInicial := 1;

	if AcrescentarADireita then
		Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
	else
		Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

	Result := AnsiUpperCase(Texto);
end;

{---------------------------------------------------------------------}
{ Objetivo : Retirar todos os em brancos da string  (ALLTrim)         }
{ Autor :  Cristiano Rebonatto             Data : 25/08/1998          }
{ Exemplo de chamada : Alltrim(edit1.text)                            }
{---------------------------------------------------------------------}
function AllTrim(OQue : String) : String;
begin
	  while Pos(' ',OQue) > 0 do
			 delete(OQue,Pos(' ',OQue),1);
	  result := OQue;
end;

procedure curSeta;
begin
	  Screen.Cursor:=crDefault;
end;

procedure curSqlWait(sHint:string='');
begin
  if Alltrim(sHint)<>'' then
	  Application.Hint:=sHint;
  Screen.Cursor:=crSqlWait;
end;

// Abrir Janela de Mensagem com o ícone de Pergunta "?"
Function Confirma(sMensagem: string;sBotaoDefault:string='N'):Boolean;
begin
	  Application.Hint:='Aguardando confirmação....';
	  If POS('?',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' ?';

	  MessageBeep(MB_ICONQUESTION);
	  if sBotaoDefault='S' then
		Result:=(Application.MessageBox(PCHAR(sMensagem),'Confirma',MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON1)=IDYES)
	  else
		Result:=(Application.MessageBox(PCHAR(sMensagem),'Confirma',MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES);
end;

Function ConfirmaOuCancela(sMensagem: string;sBotaoDefault:string):Integer;
begin
	  Application.Hint:='Aguardando confirmação....';
	  If POS('?',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' ?';

	  MessageBeep(MB_ICONQUESTION);
	  if sBotaoDefault='S' then
		Result:= Application.MessageBox(PCHAR(sMensagem),'Confirma',MB_ICONQUESTION+MB_YESNOCANCEL+MB_DEFBUTTON1)
	  else if sBotaoDefault='N' then
		Result:= Application.MessageBox(PCHAR(sMensagem),'Confirma',MB_ICONQUESTION+MB_YESNOCANCEL+MB_DEFBUTTON2)
	  else
		Result:= Application.MessageBox(PCHAR(sMensagem),'Confirma',MB_ICONQUESTION+MB_YESNOCANCEL+MB_DEFBUTTON3);
end;

// Abrir Janela de Mensagem com o ícone de Informação "I"
Procedure Informa(sMensagem : string);
Var
	cCurAnterior :TCursor;
begin
	  cCurAnterior:=screen.Cursor;
	  curSeta;
	  Application.Hint:='Informação';
	  If POS('!',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' !';
	  MessageBeep(MB_ICONINFORMATION);
	  Application.MessageBox(PChar(sMensagem), 'Informe',MB_SYSTEMMODAL+MB_ICONINFORMATION+MB_OK);
	  screen.Cursor:=cCurAnterior;
end;

// Abrir Janela de Mensagem com o ícone de Advertência
Procedure Adverte(sMensagem: string);
begin
	  Application.Hint:='Atenção... advertência';
	  If POS('!',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' !';

	  MessageBeep(MB_ICONASTERISK);
	  Application.MessageBox(PChar(sMensagem), 'Atenção',MB_SYSTEMMODAL+MB_ICONWARNING+MB_OK);

	  MessageDlg(sMensagem,mtWarning,[mbOk],0);
end;

// Abrir Janela de Mensagem com o ícone de Erro
Procedure Erro(sMensagem: string);
begin
	  Application.Hint:='Erro... erro detectado';
	  If POS('!',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' !';
	  MessageBeep(MB_ICONERROR);
	  MessageDlg(sMensagem,mtError,[mbOk],0);
end;

Procedure CentralizaForm(Frm : TForm);
begin
{   Frm.Left:=(Application.MainForm.ClientWidth-Frm.Width )div 2;
   Frm.Top:=(Application.MainForm.ClientHeight-Frm.Height-42) div 2;}
	If Frm.FormStyle<>fsNormal then
   begin
		if Assigned(Application.MainForm) then
      begin
		  Frm.Left:=(Application.MainForm.ClientWidth-Frm.Width )div 2;
        Frm.Top:=(Application.MainForm.ClientHeight-Frm.Height-60) div 2;
   	//Frm.Top:=(Application.MainForm.ClientHeight-Frm.Height-iAlturaBarraBtn-iAlturaBarraStatus) div 2
      end;
	end
   else
	begin
     if Assigned(Application.MainForm) then
	  begin
        Frm.Left:=(Application.MainForm.Width-Frm.Width )div 2;
        Frm.Top:=(Application.MainForm.Height-Frm.Height+42) div 2;
        //Frm.Top:=(Application.MainForm.Height-Frm.Height+iAlturaBarraBtn+iAlturaBarraStatus) div 2;
     end;
	end;
end;

//criptografa descriptografa uma String
Function Criptografia(sStr:string;sChave: string=''): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave, teste: Integer;
  mChave                                       : string;
begin
	teste:= 0;
	Result := sStr;
	if Alltrim(sChave)='' then
		mChave:='SoMa'
	else
		mChave:=sChave;
	TamanhoString := Length(sStr);
	TamanhoChave := Length(mChave);
	for i := 1 to TamanhoString do
	begin
		pos := (i mod TamanhoChave);
		if pos = 0 then
		pos := TamanhoChave;		
		posLetra := ord(Result[i]) xor ord(mChave[pos]);
		if posLetra = 0 then
		posLetra := ord(Result[i]);
		Result[i] := chr(posLetra);
   end;
end;

Function GeraCodigoBarras(iCodigo:Longint):String;
var
   sCodigo :string;
   iSoma   :integer;
   i       :integer;
   sDigito :string;
begin
	Result:='';
   sCodigo:=FormatFloat('000000000000',iCodigo);
	i:=1;
   iSoma:=0;
	While i <= Length(sCodigo) do
   begin
      if i mod 2 = 0 then
         iSoma:=iSoma+(StrToInt(Copy(sCodigo,i,1))*3)
		else
         iSoma:=iSoma+StrToInt(Copy(sCodigo,i,1));
      inc(i);
	end;
	sDigito:=Copy(FormatFloat('00000',iSoma),5,1);
	if StrToInt(sDigito)> 0 then
      sDigito:=IntToStr(10-StrToInt(sDigito));
   Result:=sCodigo+sDigito;
end;

Function CodigoBarrasValido(sCBarras:string):Boolean;
Var
   i       :integer;
   iSoma   :integer;
   sDigito :string;
begin
	Result :=False;
   if (Length(sCBarras)=13) and (sCBarras<>'0000000000000') then
   begin
		i:=1;
      iSoma:=0;
		While i <= Length(sCBarras)-1 do
      begin
			if i mod 2 = 0 then
				iSoma:=iSoma+(StrToInt(Copy(sCBarras,i,1))*3)
         else
            iSoma:=iSoma+StrToInt(Copy(sCBarras,i,1));
         inc(i);
      end;
      sDigito:=Copy(FormatFloat('00000',iSoma),5,1);
      if StrToInt(sDigito)> 0 then
			sDigito:=IntToStr(10-StrToInt(sDigito));
		Result:=sDigito=Copy(sCBarras,13,1);
	end;
end;

Function MesExtenso(iMes:integer;bMaiusculo:boolean=True):string;
Var
   sMesMaiusculo:array [1..12] of string;
	sMesMinusculo:array [1..12] of string;
begin
  sMesMaiusculo[1] :='JANEIRO';
  sMesMaiusculo[2] :='FEVEREIRO';
  sMesMaiusculo[3] :='MARÇO';
  sMesMaiusculo[4] :='ABRIL';
  sMesMaiusculo[5] :='MAIO';
  sMesMaiusculo[6] :='JUNHO';
  sMesMaiusculo[7] :='JULHO';
  sMesMaiusculo[8] :='AGOSTO';
  sMesMaiusculo[9] :='SETEMBRO';
  sMesMaiusculo[10]:='OUTUBRO';
  sMesMaiusculo[11]:='NOVEMBRO';
  sMesMaiusculo[12]:='DEZEMBRO';

  sMesMinusculo[1] :='Janeiro';
  sMesMinusculo[2] :='Fevereiro';
  sMesMinusculo[3] :='Março';
  sMesMinusculo[4] :='Abril';
  sMesMinusculo[5] :='Maio';
  sMesMinusculo[6] :='Junho';
  sMesMinusculo[7] :='Julho';
  sMesMinusculo[8] :='Agosto';
  sMesMinusculo[9] :='Setembro';
  sMesMinusculo[10]:='Outubro';
  sMesMinusculo[11]:='Novembro';
  sMesMinusculo[12]:='Dezembro';
  if bMaiusculo then
     Result:=sMesMaiusculo[iMes]
  else
      Result:=sMesMinusculo[iMes];
end;

Function TiraMascaraFloat(sValor :String):String;
Var
   sAux:string;
begin
	if DecimalSeparator=',' then
		sAux:=Alltrim(StringReplace(sValor,'.','',[rfReplaceAll]))
   else
      sAux:=Alltrim(StringReplace(sValor,',','',[rfReplaceAll]));
   Result:=sAux;
end;

function PadCenter(StrToPad: string; LenToPad: integer; StrFill: string): string;
var
	cStr, cCenter: string;
   iCont        : integer;
   iEspacos     : Integer;
   iLimite      : Integer;
begin
     cStr := '';
	  cCenter := '';
     iEspacos := 0;
	  iLimite := 0;
     iLimite := LenToPad - Length(StrToPad);
     if LenToPad > Length(StrToPad) then
	  begin
	  iEspacos := Trunc(iLimite / 2);
		for iCont := 1 to iEspacos do
			 cStr := cStr + StrFill;
	 end;
	  cCenter := cStr+ StrToPad + cStr;
	 if ((iEspacos * 2) < LenToPad) then
	cCenter := cCenter + StrFill;
     PadCenter := cCenter;
end;

function PadLeft(StrToPad: string; LenToPad: integer; StrFill: string): string;
var cStr: string;
	  iCont, iLimite: integer;
begin
	cStr := '';
	iLimite := LenToPad - Length(StrToPad);
	if LenToPad > Length(StrToPad) then
		for iCont := 1 to iLimite do
			cStr := cStr + StrFill;
	PadLeft := cStr + StrToPad;
end;

function PadRight(StrToPad: string; LenToPad: integer; StrFill: string): string;
var cStr: string;
	  iCont, iLimite: integer;
begin
	cStr := '';
	iLimite := LenToPad - Length(StrToPad);
	if LenToPad > Length(StrToPad) then
		for iCont := 1 to iLimite do
			cStr := cStr + StrFill;
	PadRight := StrToPad + cStr;
end;


Function CriaDiretorio(sNomePasta:string):boolean;
begin
   Result:=True;
   if not DirectoryExists(sNomePasta) then
   begin
		if not CreateDir(sNomePasta) then
      begin
         Result:=False;
         Adverte('Não foi possível criar a pasta '+sNomePasta);
      end;
   end;
end;


Function NomedoComputador:string;
var
	Computer : PChar;
   CSize    : DWORD;
begin
   Computer := #0;
	CSize := MAX_COMPUTERNAME_LENGTH + 1;
	try
      GetMem( Computer, CSize );
      if Windows.GetComputerName( Computer, CSize ) then
	 Result:=computer;
	finally
      FreeMem( Computer );
   end;
end;


Function EnviaArquivoLixeira(sFileName : string ) : boolean;
var
   fos : TSHFileOpStruct;
Begin
   FillChar( fos, SizeOf( fos ), 0 );
	With fos do
	begin
      wFunc  := FO_DELETE;
		pFrom  := PChar( sFileName );
      fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION   or FOF_SILENT;
  end;
  Result := ( 0 = ShFileOperation( fos ) );
end;

Function UltimoDiaDoMes(wAno,wMes:Integer):Integer;
begin
	if wMes = 2 then
	begin
		if IsLeapYear(wAno) then
			Result:=29
		else
			Result:=28;
	end
   else if (wmes = 1) or(wmes = 3)or(wmes = 5)or (wmes = 7)or(wmes = 8)or(wmes = 10)or(wmes = 12) then
      Result:=31
	else
      Result:=30;
end;

Procedure Subdiretorios(DiretorioPai:string;DirList:TStringList);
var
  SR :TSearchRec;
begin
   if FindFirst(DiretorioPai+'*', faDirectory, SR) = 0 then
	begin
      repeat
         if (SR.Attr = faDirectory) then
			begin
				if (SR.Name<>'.') and (SR.Name<>'..') then
					DirList.Add(SR.Name);
			end;
      until FindNext(SR) <> 0;
		Sysutils.FindClose(SR);
  end;
end;

function WindowExists(AppWindowName, AppClassName: string): Boolean;
var
  hwd: LongWord;
begin
   hwd    := 0;
   if Alltrim(AppClassName)='' then
      hwd    := FindWindow(PChar(AppWindowName), nil)
   else
      hwd    := FindWindow(PChar(AppWindowName), PChar(AppClassName));

   Result := False;
	Result := Hwd >0;
{WindowExists('TPropertyInspector', 'Object Inspector') }
end;

Function ExecutaProgramaExterno(sPrograma, sParametros: String):boolean;
Var
   Comando: Array[0..1024] of Char;
   Parms: Array[0..1024] of Char;
begin
	Result:=True;
	StrPCopy(Comando,sPrograma);
   StrPCopy(Parms, sParametros);
   if ShellExecute(0, Nil, Comando, Parms, Nil, SW_SHOWNORMAL) <= 32 then
   begin
	  MessageBeep(MB_ICONWARNING);
		Adverte('O programa '+sPrograma+' não pode ser executado !');
      Result:=False;
   end;
end;

Function TiraMascaraCNPJCPF(sCNPJCPF:string):string;
Var
  sAux :string;
begin
  sAux:=sCNPJCPF;
  while Pos('-',sAux) > 0 do
	  delete(sAux,Pos('-',sAux),1);
  while Pos('.',sAux) > 0 do
     delete(sAux,Pos('.',sAux),1);
  while Pos('/',sAux) > 0 do
     delete(sAux,Pos('/',sAux),1);
  while Pos('\',sAux) > 0 do
	  delete(sAux,Pos('\',sAux),1);
  while Pos(',',sAux) > 0 do
     delete(sAux,Pos(',',sAux),1);	  
  Result:=sAux;
end;

Function TiraMascaraIE(sIE:string):string;
Var
  sAux,sAux2:string;
  cp:Char;
  i:Integer;
begin
  sAux:='';
  for i:=1 to Length(sIE) do
  begin
	 sAux2:=Copy(sIE,i,1);
	 cp:=sAux2[1];
	 if cp in ['0'..'9']  then
		  sAux:=saux + Copy(sIE,i,1);
  end;
  Result:=sAux;
end;
       
function F_GetBuildInfo:string;
var
  VerInfo: Pointer;
  VerInfoSize,VerValueSize,Dummy: DWORD;
  VerValue: PVSFixedFileInfo;
  V1, V2, V3, V4: Word;
  Prog : string;
begin
  Prog := Application.Exename;
  VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
	V1 := dwFileVersionMS shr 16;
	V2 := dwFileVersionMS and $FFFF;
	V3 := dwFileVersionLS shr 16;
	V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  result := Copy (IntToStr (v1), 1, 4) + '.' +
				Copy (IntToStr (v2), 1, 2) + '.' +
				Copy (IntToStr (v3), 1, 2) + '.' +
				Copy (IntToStr (v4), 1, 3);
end;

function F_GetBuildInfo(exeName : String):string;
var
  VerInfo: Pointer;
  VerInfoSize,VerValueSize,Dummy: DWORD;
  VerValue: PVSFixedFileInfo;
  V1, V2, V3, V4: Word;
  Prog : string;
begin
  Prog := exeName;
  VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
	  V1 := dwFileVersionMS shr 16;
	  V2 := dwFileVersionMS and $FFFF;
	  V3 := dwFileVersionLS shr 16;
	  V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  result := Copy (IntToStr (v1), 1, 4) + '.' +
				Copy (IntToStr (v2), 1, 2) + '.' +
				Copy (IntToStr (v3), 1, 2) + '.' +
				Copy (IntToStr (v4), 1, 3);
end;

// Abrir arquivos com o aplicatiovo associoado no windows
procedure AbreArquivoWindows(F: String);
var
	 r: String;
	 Handle: THandle;
begin
	 r:='';
	 case ShellExecute(Handle, nil, PChar(F), nil, nil, SW_SHOWNORMAL) of
		  ERROR_FILE_NOT_FOUND:   r   := 'O arquivo especificado não foi encontrado.';
		  ERROR_PATH_NOT_FOUND:   r   := 'O caminho especificado não foi encontrado.';
		  ERROR_BAD_FORMAT:       r := 'O arquivo .EXE é inválido(não pertence ao Win32 .EXE ou o formato .EXE contém erro).';
		  SE_ERR_ACCESSDENIED:    r := 'O sistema operacional negou o acesso ao arquivo especificado.';
		  SE_ERR_ASSOCINCOMPLETE: r := 'O nome do arquivo está incompleto ou é inválido.';
		  SE_ERR_DDEBUSY:         r := 'Não foi possível terminar a transação DDE, pois outras transações DDE eram processadas .';
		  SE_ERR_DDEFAIL:         r := 'Ocorreu falha na tranação DDE.';
		  SE_ERR_DDETIMEOUT:      r := 'Não foi possível terminar a transação DDE, pois o tempo de transação espirou.';
		  SE_ERR_DLLNOTFOUND:     r := 'A biblioteca dinânica especificada não foi encontrada.';
		  SE_ERR_NOASSOC:         r := 'Não há nenhuma aplicação associada com a extensão especificada nesse arquivo.';
		  SE_ERR_OOM:             r := 'Não há memória suficiente para terminar a operação.';
		  SE_ERR_SHARE:           r := 'Ocorreu uma violação de compartilhamento.';
	 end;
	 if Alltrim(r)<>'' then
		Adverte(r);
end;

function tiraPontoMilhar(sValor:string):String;
var sQtde : string;
begin
	  if Pos('.',sValor)<>0then
	  begin
			sQtde:=Copy(sValor,1,Pos('.',sValor)-1);
			sQtde:=sQtde+Copy(sValor,Pos('.',sValor)+1,Length(sValor)-Length(sQtde)-1);
			Result:=sQtde;
	  end
	  else
			Result:=sValor;
end;

function ExececutaEsperaFechamentoAplicativoExterno(const FileName, Params: string; const WindowState: Word): boolean;
var  SUInfo: TStartupInfo;
	  ProcInfo: TProcessInformation;
	 CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido
	 aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
	 cb := SizeOf(SUInfo);
	 dwFlags := STARTF_USESHOWWINDOW;
	 wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
				CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
				PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);

  { Aguarda até ser finalizado }
  if Result then
  begin
	 WaitForSingleObject(ProcInfo.hProcess, INFINITE);
	 { Libera os Handles }
	 CloseHandle(ProcInfo.hProcess);
	 CloseHandle(ProcInfo.hThread);
  end;
end;

function TiraEnter(sTexto:string):string;
begin
	 sTexto:=stringReplace(sTexto,#13,' ',[rfReplaceall]);
	 sTexto:=stringReplace(sTexto,#10,'',[rfReplaceall]);
	 Result:=sTexto;
end;

function RetiraNumerosTracos(sTexto:string):string;
var cLetra : char;
begin
	 while not IsCharAlpha(sTexto[1])do
	  sTexto:=copy(sTexto,2,length(sTexto));
	 Result:=sTexto;
end;

//retorna o n° de arquivos com uma determinada extenção encontrados em um diretório
function ContaArq(Dir, Extencao: String): Integer;
var
	SR: TSearchRec;
	Cont,I: integer;
begin
	Cont := 0;
	I := FindFirst(Dir + '\*.' + Extencao, faAnyFile, SR);
	while I = 0 do
	begin
		if (SR.Attr and faDirectory) <> faDirectory then
		begin
			inc(Cont);
			I := FindNext(SR);
		end;
	end;
	Result := Cont;
end;

Function isFolderEmpty(const directory : string;bIgnoraSubPastas : boolean): Boolean;
var
  searchRec :TSearchRec;
begin
  try
	  if DirectoryExists(directory) then
	  begin
			if bIgnoraSubPastas then
				result := (FindFirst(directory+'\*.*', faArchive, searchRec) <> 0)
			else
				result := (FindFirst(directory+'\*.*', faAnyFile, searchRec) <> 0);
	  end
	  else
			Result := true;
  finally
	//===================================================================
	//== força a utilização da procedure FindClose da unit SysUtils.   ==
	//== a não utilização deste comando faz com que seja chamada outra ==
	//== procedure com parametros diferentes, causando erro            ==
	//===================================================================
	SysUtils.FindClose(searchRec);
  end;
end;
{ Escrever valor em determinado atributo de uma determinada chave do registro
  Argumentos: rootkey : pasta raiz dentro do registro do windows EX.: HKEY_LOCAL_MACHINE, HKKEY_CURRENT_USER
              sCaminhoChave : caminho para o registro a ser alterado EX.: SOFTWARE\MINHA_EMPRESA
              sPropriedade : Propriedade a ser alterada.
  Result: True se escreveu com sucesso no registro. }
function escreveNoWinRegistry(RootKey : HKEY; sCaminhoChave,sPropriedade : String;valor : Variant):boolean;
var
  Reg: Tregistry;
begin
  Reg := Tregistry.create;
  reg.RootKey := RootKey;
  reg.Openkey(sCaminhoChave,true);
  if VarIsStr(valor) then
	  reg.writestring(sPropriedade,VarToStr(valor));
  if VarIsNumeric(valor) then
	  reg.WriteInteger(sPropriedade,valor);
  if VarIsFloat(valor) then
	  reg.WriteFloat(sPropriedade,valor);
  reg.Closekey;
  reg.Free;
end;

{ ler o valor de um determinado atributo de uma determinada chave do registro
  Argumentos: rootkey : pasta raiz dentro do registro do windows EX.: HKEY_LOCAL_MACHINE, HKKEY_CURRENT_USER
                 sCaminhoChave : caminho para o registro a ser lido EX.: SOFTWARE\MINHA_EMPRESA
                 sPropriedade : Propriedade a ser lida.
                 sTipoValor : [I,S,F,D] onde I = integer, S = String, F = Float, D = Date
  Result:  valor da propriedade lida.}
function leWinRegistry(RootKey : HKEY; sCaminhoChave,sPropriedade : String;sTipoValor : String):Variant;
var
  Reg: Tregistry;
begin
	Reg:=Tregistry.create;
	Reg.RootKey := RootKey;
	Reg.Openkey(sCaminhoChave,true);
	case sTipoValor[1] of
		'I': Result := reg.ReadInteger(sPropriedade);
		'S': Result := reg.ReadString(sPropriedade);
		'F': Result := reg.ReadFloat(sPropriedade);
		'D': Result := reg.ReadDate(sPropriedade)
	end;
	reg.closekey;
	reg.Free;
end;

Procedure TravaDestravaTeclado(bTravar:Boolean);
begin
   BlockInput(bTravar); 
end;

//obriga o sistema operacional a descarregar o arquivo que se encontra em cache direto para o disco rígido da máquina
Procedure DescarregaArquivoCache(sArquivo:string);
var fHandle:LongInt;
begin
	 fHandle:=CreateFile(pchar(sArquivo),GENERIC_WRITE,0,0,OPEN_ALWAYS,FILE_FLAG_NO_BUFFERING,0);
	 FlushFileBuffers(fHandle);
	 CloseHandle(fHandle);
end;

function MD5(const fileName: string): string;
var
	//idmd5 : TIdHashMessageDigest5;
   fs : TFileStream;
//	hash : T4x4LongWordRecord;
begin
	//idmd5 := TIdHashMessageDigest5.Create;
	fs := TFileStream.Create(fileName, fmOpenRead ) ;
	try
	  //result := idmd5.AsHex(idmd5.HashValue(fs)) ;
	finally
	  freeAndNil(fs);
	  //freeAndNil(idmd5);
	end;
end;

function isDate(TestaString:String):boolean;
begin
  result := False;
  try
	  StrToDate(TestaString);
	  result := True;	  
  except
	  On EConvertError do result := False;
	  else result := True;
  end;
end;


end.
























