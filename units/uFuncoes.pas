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
  //Converte cada 2 bytes para char
function ASN1Decode(Value: String): String;
function MD5(const fileName : string) : string;
function IsFloat(TestaString: String): boolean;
Function IsInteger(TestaString: String) : boolean;
function isDate(TestaString:String):boolean;
function formata_moeda2casas(valor:string):string;

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

{-----------------------------------------------------------------------------------------------------------}
{ Objetivo : O fator de vencimento é a quantidade de dias entre 07/Nov/1997 e a data de vencimento do título}
{ Autor : Giucimar Dias Vieira             Data : 23/01/2009                                                }
{ Exemplo de chamada : CalcularFatorVencimento(25/08/1998)                                                  }
{-----------------------------------------------------------------------------------------------------------}
function CalcularFatorVencimento(DataDesejada : TDateTime) : string;
begin
	Result := IntToStr( Trunc(DataDesejada - EncodeDate(1997,10,07)));
end;

{--------------------------------------------------------------------------------}
{ Autor :  Giucimar Dias Vieira                     Data : 23/01/2009            }
{ Exemplo de chamada : Modulo10(Valor)                                           }
{ Objetivo :                                                                     }
{			Rotina usada para cálculo de alguns dígitos verificadores               }
{	Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a    }
{	esquerda e multiplica-se por 2121212...                                       }
{	Soma-se cada um dos subprodutos. Caso algum dos subprodutos tenha mais de um  }
{	dígito, deve-se somar cada um dos dígitos. (Exemplo: 7*2 = 14 >> 1+4 = 5)     }
{	Divide-se a soma por 10.                                                      }
{	Faz-se a operação 10-Resto da divisão e devolve-se o resultado dessa operação }
{	como resultado da função Modulo10.                                            }
{	Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO). }
{--------------------------------------------------------------------------------}
function Modulo10(Valor: String) : string;
var
	Auxiliar : string;
	Contador, Peso : integer;
	Digito : integer;
begin
	Auxiliar := '';
	Peso := 2;
	for Contador := Length(Valor) downto 1 do
	begin
		Auxiliar := IntToStr(StrToInt(Valor[Contador]) * Peso) + Auxiliar;
		if Peso = 1 then
			Peso := 2
		else
			Peso := 1;
	end;

	Digito := 0;
	for Contador := 1 to Length(Auxiliar) do
	begin
		Digito := Digito + StrToInt(Auxiliar[Contador]);
	end;
	Digito := 10 - (Digito mod 10);
	if (Digito > 9) then
		Digito := 0;
	Result := IntToStr(Digito);
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
{--------------------------------------}
{ Função : Mostrar Cursor Seta         }
{ Autor :  Cristiano Rebonatto         }
{ Data : 28/01/1998                    }
{--------------------------------------}
procedure curSeta;
begin
	  Screen.Cursor:=crDefault;
end;
{--------------------------------------}
{ Função : Mostrar Cursor SqlWait      }
{ Autor :  Cristiano Rebonatto         }
{ Data : 19/05/1999                    }
{--------------------------------------}
procedure curSqlWait(sHint:string='');
begin
  if Alltrim(sHint)<>'' then
	  Application.Hint:=sHint;
  Screen.Cursor:=crSqlWait;
end;
{--------------------------------------}
{ Função : Mostrar Cursor SqlWait      }
{ Autor :  Cristiano Rebonatto         }
{ Data : 19/05/1999                    }
{--------------------------------------}
procedure curCopia;
begin
	  Screen.Cursor:=crMultiDrag;
end;
{-----------------------------------------------------------------------------}
{ Função : Abrir Janela de Mensagem com o ícone de Pergunta "?"               }
{ Autor :  Cristiano Rebonatto                                                }
{ Data : 02/12/1997                                                           }
{ Parametros : Mensagem  - string que conterá a Pergunta                      }
{ Retorno : Bool                                                              }
{-----------------------------------------------------------------------------}
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
{-----------------------------------------------------------------------------}
{ Função : Abrir Janela de Mensagem com o ícone de Pergunta "?"  com a opção  }
{          de CANCELAR.                                                       }
{ Autor :  Braian O. Dias                                                     }
{ Data : 18/05/2010                                                           }
{ Parametros : Mensagem  - string que conterá a Pergunta                      }
{ Retorno : Bool                                                              }
{-----------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------}
{ Função : Abrir Janela de Mensagem com o ícone de Informação "I"               }
{ Autor :  Cristiano Rebonatto                                                  }
{ Data : 02/12/1997                                                             }
{ Parametros : Mensagem  - string que conterá a Mensagem                        }
{-------------------------------------------------------------------------------}
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
	  Application.MessageBox(PChar(sMensagem), 'Informe',MB_SYSTEMMODAL+MB_ICONINFORMATION+MB_OK);//Rodolfo(30/03/2010)substitui oMessageDlg para poder forçar o foco na mensagem
	  screen.Cursor:=cCurAnterior;
end;
{----------------------------------------------------------------------------}
{ Função : Abrir Janela de Mensagem com o ícone de Advertência               }
{ Autor :  Cristiano Rebonatto                                               }
{ Data : 02/12/1997                                                          }
{ Parametros : Mensagem  - string que conterá a Mensagem                     }
{----------------------------------------------------------------------------}
Procedure Adverte(sMensagem: string);
begin
	  Application.Hint:='Atenção... advertência';
	  If POS('!',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' !';

	  MessageBeep(MB_ICONASTERISK);
	  Application.MessageBox(PChar(sMensagem), 'Atenção',MB_SYSTEMMODAL+MB_ICONWARNING+MB_OK);//Rodolfo(15/10/2009) add MB_SYSTEMMODAL para forçar a mensagem a aparecer na frente de todas as telas

	  MessageDlg(sMensagem,mtWarning,[mbOk],0);
end;
{----------------------------------------------------------------------------}
{ Função : Abrir Janela de Mensagem com o ícone de Erro                      }
{ Autor :  Cristiano Rebonatto                                               }
{ Data : 29/03/2004                                                          }
{ Parametros : Mensagem  - string que conterá a Mensagem                     }
{----------------------------------------------------------------------------}
Procedure Erro(sMensagem: string);
begin
	  Application.Hint:='Erro... erro detectado';
	  If POS('!',sMensagem) <= 0 then
		  sMensagem:=sMensagem+' !';
	  MessageBeep(MB_ICONERROR);
	  MessageDlg(sMensagem,mtError,[mbOk],0);
end;

{----------------------------------------------}
{-- Procedure que Atribui uma propriedade    --}
{----------------------------------------------}
procedure AtribuiProp(Comp: TComponent; Const PropName: string; Val: string);
var
  PInfo: PPropInfo;
begin
	PInfo := GetPropInfo(Comp.ClassInfo, PropName);
   if PInfo <> nil then
	begin
      case PInfo^.Proptype^.Kind of
           tkInteger                     :SetOrdProp(Comp, PInfo, StrToInt(Val));
           tkChar, tkWChar               :SetOrdProp(Comp, PInfo, ord(Val[1]));
           //tkEnumeration                 :SetOrdProp(Comp, PInfo, GetEnumValue(PInfo^.PropType^, Val));
           tkFloat                       :SetFloatProp(Comp, PInfo, StrToFloat(Val));
           tkString, tkLString, tkWString:SetStrProp(Comp, PInfo, Val);
           tkVariant                     :SetVariantProp(Comp, PInfo, Val);
			  tkInt64                       :SetInt64Prop(Comp, PInfo, StrToInt64(Val));
      end;
	end;
end;


{----------------------------------------------}
{-- Procedure que centraliza o form          --}
{----------------------------------------------}
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

Function FormJaCriado(Frm :TForm;bTrazerparafrente:boolean=True):Boolean;
Var
	i : integer;
begin
   {============================================}
	{== Alteração para mostrar os forms MODAIS  =}
   {============================================}
	Result:=False;
   For i:=0 to Screen.FormCount-1 do
   begin
	  if Screen.Forms[i]= Frm then
	  begin
        Result:=True;
		  Break;
     end;
   end;
   if (Result) and (bTrazerparafrente) then
   begin
     Frm.BringToFront;
	  CentralizaForm(Frm);
	end;


//   if frm.FormStyle = fsMdiChild then
//   begin
//	   Result:=False;
//	   For i:=0 to Screen.FormCount-1 do
//      begin
//   	   If Screen.Forms[i]=Frm then
//         begin
//      	   Result:=True;
//            Break;
//         end;
//      end;
//      if (Result) and (bTrazerParaFrente) then
//      begin
//         Frm.BringToFront;
//         CentralizaForm(Frm);
//      end;
//   end
//   else
//   begin
//
//   end;
end;

{----------------------------------------------}
{-- Function que criptograva uma String      --}
{----------------------------------------------}
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
{=================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
  Procedure/Function : ValidaCodigoBarras
  Autor              : Cristiano Rebonatto
  Criação            : 08-abril-2004
  Finalidade         : Validar um Código de barras
  Parâmetros         : sCoaigoBarras:string
  Resultado          : Boolean
=================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================}
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

Function ExtraiMsgFireBird(sMensagemOriginal:string):string;
Var
   sMsg: string;
   sAux:string;
	iFim:integer;
	iInicio: Integer;
begin
	Result:=sMensagemOriginal;
	if (Pos('{',sMensagemOriginal) > 0) and (Pos('}',sMensagemOriginal) > 0) then
	begin
		iFim  :=LastDelimiter('}',sMensagemOriginal);
		iFim  :=iFim-1;
		iInicio := Pos('{',sMensagemOriginal)+1;
		sAux  :=Copy(sMensagemOriginal,iInicio,(iFim-iInicio) + 1);
		Result:=sAux;
   end;
end;


Procedure GravaErroLog(sErro,sUsuario,sLocalErro:string);
Var
   FFile :TextFile;
   sPath :string;
   dData,dHora :TDateTime;
begin
	sPath:=sLocalErro;
   if Alltrim(sLocalErro)='' then
		sPath:='c:\windows\ERRORETAGUARDA.LOG';
	AssignFile(fFile,sPath);
   Try
		System.Append(fFile);
   except
		System.Rewrite(fFile);
	end;
     writeln(fFile,'('+FormatDateTime('dd/MM/yyyy',Date)+' '+FormatDateTime('hh:nn:ss',time)+');'+sUsuario+';'+sErro);
     CloseFile(fFile);
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

{== iTamanhoArquivo se for -2 nao verifica se e vazio ==}
{== se retorna -1 arquivo no encontrado               ==}
{== Alterado por Fernando Amaral                      ==}
Function CopiaArquivo(sArqOrigem,sArqDestino:string;bSobrepor:boolean=False;iTamanhoArquivo:Integer=-2):boolean;
begin
	Result:=False;
	if iTamanhoArquivo <> -2 then
	begin
		if iTamanhoArquivo > 0 then  // somente faz a copia do arquivo se ele nao for vazio
		begin
			Result:=True;
			//Result:=CopyFile(Pchar(sArqOrigem),Pchar(sArqDestino),bSobrePor);
		end
	end
	else
	begin
			Result:=True;
			//Result:=CopyFile(Pchar(sArqOrigem),Pchar(sArqDestino),bSobrePor);
	end;
end;

procedure ArquivosDiretorio(Path,sMascaraArquivo:string; var FileList: TStringList);
var
  SR: TSearchRec;
begin
  if FindFirst(Path+sMascaraArquivo, faAnyFile, SR) = 0 then
  begin
	 repeat
		if (SR.Attr <> faDirectory) then
		begin
		  if FileList.IndexOf(SR.Name) < 0 then
				FileList.Add(SR.Name);
		end;
	 until FindNext(SR) <> 0;
	 Sysutils.FindClose(SR);
  end;
end;

procedure ArquivosDiretorio(Path,sMascaraArquivo:string; var FileList: TStringList;var HashList :TStringList);
var
  SR: TSearchRec;
begin
  if FindFirst(Path+sMascaraArquivo, faAnyFile, SR) = 0 then
  begin
	 repeat
		if (SR.Attr <> faDirectory) then
		begin
		  if FileList.IndexOf(SR.Name) < 0 then
		  begin
				FileList.Add(SR.Name);
				HashList.Add(MD5(Path+SR.Name));
		  end;
		end;
	 until FindNext(SR) <> 0;
	 Sysutils.FindClose(SR);
  end;
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



Function RenomeiaArquivo(sArquivoOrigem,sNovaExtensao:string):Boolean;
Var
  lst :TStringList;
  sNomeNovo :string;
begin
  Result:=False;
  Try
     lst:=TStringList.Create;
	  lst.LoadFromFile(sArquivoOrigem);
	  sNomeNovo:=ChangeFileExt(sArquivoOrigem,sNovaExtensao);
	  lst.SaveToFile(sNomeNovo);
     if FileExists(sArquivoOrigem) then
        //DeleteFile(sArquivoOrigem);
	  lst.Free;
     Result:=True;
  except
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
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
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
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
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

{---------------------------------------------------------------------}
{ Procedure : Abrir arquivos com o aplicatiovo associoado no windows  }
{ Autor :  Cristiano Rebonatto => Retirado da Web                     }
{ Data : 30/08/2006                                       						}
{ Parametros : F :caminho do arquivo                   			 			    }
{---------------------------------------------------------------------}
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

function DigitoModulo11(sString:string):Integer;
var
	i					:Integer;
	iMultiplicador	:Integer;
	iNumero			:Integer;
	iSoma				:Integer;
	iRestoDivisao	:Integer;
	iDigito			:Integer;
begin
	iMultiplicador:=2;
	iSoma			  :=0;
	For i:=Length(sString) downto 1 do
	begin
		 iNumero	:=StrToInt(sString[i]);
		 iSoma	:=iSoma+(iNumero*iMultiplicador);
		 Inc(iMultiplicador);
		 if iMultiplicador > 9 then
			iMultiplicador:=2;
	end;
	iRestoDivisao:=(iSoma mod 11);
	iDigito:=11-iRestoDivisao;
	if (iDigito >= 10) then
		Result:=0
	else
		Result:=iDigito;
end;

{---------------------------------------------------------------------}
{ Function  : Verificar o tamanho de um arquivo                       }
{ Autor :  Fernando Amaral                                            }
{ Data : 29/12/2008                                                   }
{ Parametros : FileName = caminho e nome do arquivo                   }
{ OBS: A função abaixo retorna o tamanho do arquivo, ou -1 se o       }
{ arquivo não for encontrado                                          }
{---------------------------------------------------------------------}

function tbFileSize(const FileName: string): integer;
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst(FileName, faArchive, SR);
  try
	 if I = 0 then
		Result := SR.Size
	 else
		Result := -1;
  finally
	 Sysutils.FindClose(SR);
//	 FindClose(SR);
  end;
end;
function NumLinhasArq(Arqtexto:String): integer;
// Retorna o número de linhas que um arquivo possui
Var
	f: Textfile;
	linha, cont:integer;
Begin
linha := 0;
cont := 0;
AssignFile(f,Arqtexto);
Reset(f);
While not eof(f) Do
		begin
		ReadLn(f);
		Cont := Cont + 1;
		end;
Closefile(f);
result := cont;
end;




function tornaPositivo(fValor : Currency):Currency;
begin
	 Result:=fValor;
	 if fValor < 0 then
		Result:= fValor * (-1);
end;

function tornaNegativo(fValor : Currency):Currency;
begin
	 Result:=fValor;
	 if fValor > 0 then
		Result:= fValor * (-1);
end;

{------------------------------------------------------------------------------}
{ Function  : Modulo 10 de todos os bancos com condições dentro desta function }
{ Autor :  Giucimar Dias Vieira                                                }
{ Data : 27/05/2009                                                            }
{ Parametros : Valor a ser encontrado o Dv, o Banco                            }
{------------------------------------------------------------------------------}
function Modulo10BoletosBancarios(Valor: String;Banco: String) : string;
var
	Auxiliar : string;
	Aux, Contador, Peso : integer;
	Soma, Dv , AuxDv: integer;
begin
		Auxiliar  := '';
		Peso := 2;
		for Contador := Length(Valor) downto 1 do
		begin
			Aux := StrToInt(Valor[Contador]) * Peso;
			if (Aux > 9) then
				Aux := Aux - 9;

			Auxiliar := IntToStr(Aux)+ Auxiliar;
			if (Peso = 1) then
				Peso := 2
			else
				Peso := 1;
		end;

		Soma := 0;
		for Contador := 1 to Length(Auxiliar) do
		begin
			Soma := Soma + StrToInt(Auxiliar[Contador]);
		end;

		if (Banco = '041') then // Faz a Verificação se o banco é o Banrisul
		begin
				if (Soma < 10) then
				begin
						AuxDv := (Soma mod 10);
						Dv    := 10-AuxDv;
				end
					else
				begin
						AuxDv := (Soma mod 10);
						if (AuxDv = 0) then
								Dv := AuxDv
						else
						Dv := 10-AuxDv;
				end;
				Result := IntToStr(Dv);
		end;

		if (Banco = '748') then // Faz a verificação se o Banco é o Sicredi
		begin
			  if (Soma < 10) then
			  begin
					 Dv := Soma;
			  end
			  else
			  begin
					AuxDv := (Soma mod 10);
					if (AuxDv = 0) then
						Dv := AuxDv
					else
						Dv := 10 - AuxDv;
			  end;
			  Result := IntToStr(Dv);
		end;
end;

{------------------------------------------------------------------------------}
{ Function  : Modulo 11 de todos os bancos com condições dentro desta function }
{ Autor :  Giucimar Dias Vieira                                                }
{ Data : 27/05/2009                                                            }
{ Parametros : Valor a ser encontrado o Dv, o Banco, a Base de calculo         }
{------------------------------------------------------------------------------}
function Modulo11BoletosBancarios(Valor: string;Banco: String; Base:Integer): string;
var               // Banrisul
	Soma,resto: integer;
	Contador, Peso: integer;
	i					:Integer;
	iPeso       	:Integer;
	iNumero			:Integer;
	iSoma				:Integer;
	iRestoDivisao	:Integer;
	iDigito			:Integer;
	iMultiplicacao : Integer;
begin
	{ O Modulo 11 do Banrisul está retornando o Resto porque é feita 3 validações com o mesmo }
  if (Banco = '041') then // Verifica se o Banco é o Banrisul
  begin
		Soma := 0;
		Peso := 2;
		for Contador := Length(Valor) downto 1 do
		begin
				Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
				if Peso < Base then
					Peso := Peso + 1
				else
					Peso := 2;
		end;
		resto := Soma mod 11;
		if (Soma < 11) then  // Caso a soma for menor que 11 o
			resto := resto mod 11; // o própio resto será a soma está no manual do banrisul

		Result := IntToStr(resto);
  end;

	{ O Modulo 11 do Sicredi está retornando o Digito já Verificado }
	if (Banco = '748') then // Verifica se o Banco é o Sicredi
	begin
		Erro('Para sicredi utilize o cálculo do DV próprio do banco de acordo com o campo.');
	end;
end;

{------------------------------------------------------------------------------}
{ Função : Formatar um num de telefone sem caracteres especiais em 10 digitos  }
{ Autor :  Braian O. Dias                                                      }
{ Data :   24/06/2009                                                          }
{ Parametros : String a ser formatada                                          }
{------------------------------------------------------------------------------}
function TiraMascaraTelefone(sTelefone : string;tiraZeroInicial : Boolean):string;
var
	sAux : string;
begin
	sAux:=sTelefone;
	while Pos('(',sAux)>0 do
		delete(sAux,Pos('(',sAux),1);
	while Pos(')',sAux)>0 do
		delete(sAux,Pos(')',sAux),1);
	while Pos('-',sAux)>0 do
		delete(sAux,Pos('-',sAux),1);
	while Pos('/',sAux)>0 do
		delete(sAux,Pos('/',sAux),1);
	while Pos('\',sAux)>0 do
		delete(sAux,Pos('\',sAux),1);
	//se o numero começar com 0 retira (pra poder retornar o numero com 10 digitos)
	if tiraZeroInicial then
	begin
		while Pos('0',sAux)=1 do
			delete(sAux,Pos('0',sAux),1);
	end;

	Result:=sAux;

end;

function TranformaTaxaEmValor(eCapital, eTaxa: Extended):Currency;
begin
	  Result := ((eCapital*eTaxa)/100)/30;
end;

{-------------------------------------------------------------------------------------------------------------------
  Procedure: tiraPontoMilhar
  Author:    Rodolfo Noetzold de Oliveira
  DateTime:  17.07.2009
  Arguments: sValor
  Result:    String
  Obs:       tira o ponto quando o valor for maior ou = a mil p/ não dar erro quando
				 converter para float
--------------------------------------------------------------------------------------------------------------------}
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

{-------------------------------------------------------------------------------------------------------------------
  Procedure: ExececutaEsperaFechamentoAplicativoExterno
  Author:    função retirada da internet por Rodolfo Noetzold de Oliveira
  DateTime:  10.08.2009
  Arguments: const FileName,Params: string,const WindowState: Word
  Result:    boolean
  Obs:       espera o fechamento de um aplicativo externo ao programa. Enquanto o aplicativo externo não for fechado
             a aplicação fica bloqueada
--------------------------------------------------------------------------------------------------------------------}
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

{------------------------------------------------------------------------------}
{ Função : Procura um dado simbolo em uma string tendo a possibilidade de      }
{          informar o numero da ocorrencia do simbolo.                         }
{ Ex. : procuraSimbolo('>','<TAG></TAG>');   * retorna 5                       }
{       procuraSimbolo('>','<TAG></TAG>',2); * retorna 11, a 2ª ocorrencia do  }
{															* simbolo                         }
{ Autor :  Braian O. Dias                                                      }
{ Data :   20/10/2009                                                          }
{ Parametros : sSimbolo = Simbolo a ser procurado                              }
{              sStringProcurar = String fonte onde vai ser procurado o simbolo }
{              iOcorrencia = o numero da ocorrencia do simbolo. Informar se    }
{                       esta sendo buscado a 1ª,2ª,3ª,nª ocorrencia do simbolo }
{------------------------------------------------------------------------------}
function procuraSimbolo(sSimbolo,sStringProcurar: String; iOcorrencia: Integer=1): Integer;
var
	iPosIni : Integer;
begin
	iPosIni := Pos(sSimbolo,sStringProcurar);
	if iOcorrencia>1 then
	begin
		while iOcorrencia>1 do
		begin
			iPosIni := PosEx(sSimbolo,sStringProcurar,iPosIni);
			Dec(iOcorrencia);
		end;
		Result:= iPosIni;
	end
	else
	begin
		Result:=iPosIni;
	end;
end;
{-------------------------------------------------------------------------------------------------------------------
  Procedure: TiraEspacoFinal
  Author:    Rodolfo Noetzold de Oliveira
  DateTime:  07.12.2009
  Arguments: sTexto,iInicioFinal
  Result:    String
  Obs:       exclui  os espaçoes em branco do inicio(1),final(2) e inicio e fim(3) da string passada como parametro
--------------------------------------------------------------------------------------------------------------------}
function TiraEspacoInicioFinal(sTexto:string;iInicioFinal:integer):string;
begin
	if (iInicioFinal = 1)or(iInicioFinal = 3)then
	begin
		while(copy(sTexto,1,1)=' ')do
		begin
			 sTexto:=copy(sTexto,2,Length(sTexto));
		end;
	end;
	if (iInicioFinal = 2)or(iInicioFinal = 3)then
	begin
		while(copy(sTexto,Length(sTexto),1)=' ')do
		begin
			 sTexto:=copy(sTexto,1,Length(sTexto)-1);
		end;
	end;
	Result:=sTexto;
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
{-------------------------------------------------------------------------------------------------------------------
  Procedure: ContaArq
  Author:    Retirada da internet por Rodolfo
  DateTime:  12.02.2010
  Arguments: Dir, Extencao:string
  Result:    Integer
  Obs:       retorna o n° de arquivos com uma determinada extenção encontrados em um diretório
--------------------------------------------------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------------------------------------------
  Procedure: ProcessArquivo
  Author:    Obtido por Braian Dias de 'http://www.devmedia.com.br/articles/viewcomp.asp?comp=3010'
				 'Dicas - Copiando ou movendo arquivos usando a API do Windows'
  DateTime:  12/01/2010
  Arguments: Origem, Destino = arquivos a serem processados
				 Operacao [1,2] onde 1 = Move o arquivo e 2 = Copia o arquivo
				 Modo [1,2,3,4,5]  onde :
					 1: FOF_SILENT;
					 2: FOF_ALLOWUNDO or FOF_FILESONLY;
					 3: FOF_RENAMEONCOLLISION;
					 4: FOF_NOCONFIRMATION;
					 5: FOF_SIMPLEPROGRESS;
  Result:    True se a operação de copiar/mover o arquivo foi bem sucedida
--------------------------------------------------------------------------------------------------------------------}
function ProcessArquivo(const Origem, Destino : string; Operacao, Modo:Integer) : Boolean;
// Requer a unit ShellApi na clausula uses da unit
Const
	Aborted : Boolean = False;
var
	shfo : TSHFileOpStruct;
begin
	FillChar(shfo,SizeOf(shfo),$0);
	with shfo do
	begin
		if Operacao > 2 then
		begin
			operacao := 2;
		end;
		if Modo > 5 then
		begin
			modo := 1;
		end;
		case operacao of
			1: wFunc := FO_MOVE;
			2: wFunc := FO_COPY;
		end;
		pFrom := Pchar(Origem);
		pTo := Pchar(Destino);
		case Modo of
		1: fFlags := FOF_SILENT;
		2: fFlags := FOF_ALLOWUNDO or FOF_FILESONLY;
		3: fFlags := FOF_RENAMEONCOLLISION;
		4: fFlags := FOF_NOCONFIRMATION;
		5: fFlags := FOF_SIMPLEPROGRESS;
		end;
	end;
	Result := (SHFileOperation(shfo)= 0) and (not Aborted);
end;
{-------------------------------------------------------------------------------------------------------------------
  Procedure: isFolderEmpty
  Author:    Obtido por Braian Dias de 'http://scriptbrasil.com.br/forum/index.php?showtopic=111848'
  Função:    Testar se a pasta se encontra vazia
  DateTime:  12/01/2010
  Arguments: directory = pasta a ser testada se esta vazia
				 bIgnoraSubPastas = True para verificar se a pasta não contem nenhum arquivo, exceto pastas
										  False para verificar se a pasta contem qualquer tipo de arquivo

  Result:    True se a pasta esta vazia, false se contem algum
--------------------------------------------------------------------------------------------------------------------}
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
{-------------------------------------------------------------------------------------------------------------------
  Procedure: escreveNoWinRegistry
  Author:    Criado por Braian com base no link : http://www.devmedia.com.br/articles/viewcomp.asp?comp=860
  Função:    Escrever valor em determinado atributo de uma determinada chave do registro
  Data :     18/02/2010
  Arguments: rootkey : pasta raiz dentro do registro do windows EX.: HKEY_LOCAL_MACHINE, HKKEY_CURRENT_USER
				 sCaminhoChave : caminho para o registro a ser alterado EX.: SOFTWARE\SOMA
				 sPropriedade : Propriedade a ser alterada.
  Result:    True se escreveu com sucesso no registro.
--------------------------------------------------------------------------------------------------------------------}

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

{-------------------------------------------------------------------------------------------------------------------
  Procedure: leWinRegistry
  Author:    Criado por Braian com base no link : http://www.devmedia.com.br/articles/viewcomp.asp?comp=860
  Função:    ler o valor de um determinado atributo de uma determinada chave do registro
  Data :     18/02/2010
  Arguments: rootkey : pasta raiz dentro do registro do windows EX.: HKEY_LOCAL_MACHINE, HKKEY_CURRENT_USER
				 sCaminhoChave : caminho para o registro a ser lido EX.: SOFTWARE\SOMA
				 sPropriedade : Propriedade a ser lida.
				 sTipoValor : [I,S,F,D] onde I = integer, S = String, F = Float, D = Date
  Result:    A valor da propriedade lida.
--------------------------------------------------------------------------------------------------------------------}
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

{-------------------------------------------------------------------------------------------------------------------
  Procedure: DescarregaArquivoCache
  Author:    Retirada do Manual para certificação tef 2.0 por Rodolfo
  DateTime:  12.03.2010
  Arguments: sArquivo:string
  Obs:       obriga o sistema operacional a descarregar o arquivo que se encontra em cache direto para o disco rígido da máquina
--------------------------------------------------------------------------------------------------------------------}
Procedure DescarregaArquivoCache(sArquivo:string);
var fHandle:LongInt;
begin
	 fHandle:=CreateFile(pchar(sArquivo),GENERIC_WRITE,0,0,OPEN_ALWAYS,FILE_FLAG_NO_BUFFERING,0);
	 FlushFileBuffers(fHandle);
	 CloseHandle(fHandle);
end;
{-------------------------------------------------------------------------------------------------------------------
  Procedure: ASN1Decode
  Author:    Criado por Braian com base no projeto "pega_cnpj_cert" da pasta "delphi\demos_testes" dentro do repositorio
  Função:    Converte cada 2 bytes para char
  Data :     24/03/2010

  OBS: usado para poder pegar os dados do certificado digital a unit uCertificadoDigital
--------------------------------------------------------------------------------------------------------------------}
function ASN1Decode(Value: String): String;
begin
	Result := '';
	//sTag := Copy(Value, 1, 2);
	//sLen := Copy(Value, 3, 2);
	//sData:= Copy(Value, 5, Length(StrToInt('$'+sLen)));
	Delete(Value, 1, 4);
	repeat
		Result := Result + Char(StrToIntDef('$'+Value[1]+Value[2], 0));
		Delete(Value, 1, 2);
	until Value = '';
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
Function IsInteger(TestaString: String) : boolean;
begin
  result := False;
  try
	  StrToInt(TestaString);
	  result := True;
  except
	  On EConvertError do result := False;
	  else result := True;
  end;
end;

function IsFloat(TestaString: String): boolean;
begin
  result := False;
  try
	  StrToFloat(TestaString);
	  result := True;
  except
	  On EConvertError do result := False;
	  else result := True;
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

function formata_moeda2casas(valor:string):string;
var flo1:extended; str1:string;
begin
  valor:=TiraMascaraFloat(valor);
  flo1:= StrToFloat(valor);
  str1:= floattostr(flo1);
  str1:=TiraMascaraFloat(str1);
  result:= str1;
  if pos(',',str1)< 1 then
  begin
    result:=str1+',00';
  end else
   if pos(',',str1)= length(str1)-4 then
     begin
      delete(str1,length(str1)-2,2);
      result:= str1;
     end;

end;


end.
























