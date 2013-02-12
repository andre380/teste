unit ufrmabas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, ComCtrls, Grids, DBGrids, DbCtrls, Buttons, MaskEdit,
  LCLType,LCLIntf, ActnList,
  ufrmBaseTdi, uttabsheettdi,uInterfaceteste,

  uTreeview,
  ufrmInicial,
  uFodastico,
  ufrmInterface1;

  //ufrmconsultaclientes,
  //udtmconexao,
  //UFRMBACA;

type

  { TfrmAbas }

  TfrmAbas = class(TForm)
    aclInicial: TActionList;
    acPegaPainelDoForm: TAction;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    BACA: TMenuItem;
    MenuItem4: TMenuItem;
    mniFrmtreeview: TMenuItem;
    mniFrmInicial: TMenuItem;
    mniFormFodastico: TMenuItem;
    mniInterfaceteste: TMenuItem;
    mniInterface1: TMenuItem;
    mniSepararAba: TMenuItem;
    mniFecharaba: TMenuItem;
    menuprincipal: TMainMenu;
    nenu: TMenuItem;
    MenuItem3: TMenuItem;
    abasPrincipal: TPageControl;
    Panel1: TPanel;
    popAbas: TPopupMenu;
    SpeedButton1: TSpeedButton;
    abaFixa: TTabSheet;
    procedure acPegaPainelDoFormExecute(Sender: TObject);
    procedure BACAClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure mniFormFodasticoClick(Sender: TObject);
    procedure mniFrmInicialClick(Sender: TObject);
    procedure mniFrmtreeviewClick(Sender: TObject);
    procedure mniInterfacetesteClick(Sender: TObject);
    procedure mniInterface1Click(Sender: TObject);
    procedure mniSepararAbaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnClienteAnteriorClick(Sender: TObject);
    procedure btnClienteProximoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure mniFecharabaClick(Sender: TObject);
    procedure abasPrincipalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pegaNovoForm(var aForm:TfrmBaseTdi;aClassForm:TFormClass);
    { private declarations }
  public
    { public declarations }
    iAbaclicada:integer;
  end;

var
  frmAbas: TfrmAbas;

implementation

{$R *.lfm}

{ TfrmAbas }

procedure TfrmAbas.btnEditarClick(Sender: TObject);
begin

end;

procedure TfrmAbas.mniSepararAbaClick(Sender: TObject);
var
  aba: TTabSheetTdi;
begin
  if iAbaclicada >0 then
  begin
    aba:=TTabSheetTdi(abasPrincipal.Pages[iAbaclicada]);
    aba.Destroy;
  end;
end;

procedure TfrmAbas.acPegaPainelDoFormExecute(Sender: TObject);
var
  cont: Integer; novaaba:TTabSheetTdi;
begin
  try
  begin
    for cont:=1 to abasPrincipal.PageCount-1 do
    begin
      if TTabSheetTdi(abasPrincipal.Pages[cont]).form = Sender then
      begin
        abasPrincipal.PageIndex:=cont;
        exit;
      end;
    end;
      novaaba:=TTabSheetTdi.Criar(abasPrincipal,TfrmBaseTdi(sender));
      abasPrincipal.PageIndex:=novaaba.PageIndex;
  end;
  except
    // no
  end;
end;

procedure TfrmAbas.BACAClick(Sender: TObject);
begin
  //if (frmbaca = nil) or
  //    (frmbaca.Panel1 = nil)then
  // begin
  //   Application.CreateForm(Tfrmbaca,frmbaca);
  //   frmbaca.acModoAba.OnExecute:=acPegaPainelDoForm.OnExecute;
  // end;
  // acPegaPainelDoFormExecute(frmbaca);
end;

procedure TfrmAbas.btnExcluirClick(Sender: TObject);
begin

end;

procedure TfrmAbas.mniFormFodasticoClick(Sender: TObject);
begin
  pegaNovoForm(frmFodastico,TfrmFodastico);
end;

procedure TfrmAbas.mniFrmInicialClick(Sender: TObject);
begin
  pegaNovoForm(frmInicial,TfrmInicial);
end;

procedure TfrmAbas.mniFrmtreeviewClick(Sender: TObject);
begin
  pegaNovoForm(frmtreeview,Tfrmtreeview);
end;

procedure TfrmAbas.mniInterfacetesteClick(Sender: TObject);
begin
  pegaNovoForm(frmTeste,TfrmTeste);
end;

procedure TfrmAbas.mniInterface1Click(Sender: TObject);
begin
  if (frmInterface1 = nil) or
      (frmInterface1.pnlRaizTdi = nil)then
   begin
     Application.CreateForm(TfrmInterface1,frmInterface1);
     frmInterface1.acModoAba.OnExecute:=acPegaPainelDoForm.OnExecute;
     frmInterface1.acModoAba.OnExecute(frmInterface1);
   end;
   acPegaPainelDoFormExecute(frmInterface1);
end;

procedure TfrmAbas.btncancelarClick(Sender: TObject);
begin

end;

procedure TfrmAbas.btnClienteAnteriorClick(Sender: TObject);
begin
  //dtmconexao.qryClientes.Prior;
end;

procedure TfrmAbas.btnClienteProximoClick(Sender: TObject);
begin
  //dtmconexao.qryClientes.Next;
end;

procedure TfrmAbas.btnnovoClick(Sender: TObject);
begin

end;

procedure TfrmAbas.btnSalvarClick(Sender: TObject);
begin

end;

procedure TfrmAbas.FormShow(Sender: TObject);
begin

end;

procedure TfrmAbas.MenuItem1Click(Sender: TObject);
begin

end;

procedure TfrmAbas.MenuItem2Click(Sender: TObject);
begin
  if (frmBaseTdi = nil) or
      (frmBaseTdi.pnlRaizTdi = nil)then
   begin
     Application.CreateForm(TfrmBaseTdi,frmBaseTdi);
     frmBaseTdi.acModoAba.OnExecute:=acPegaPainelDoForm.OnExecute;
   end;
   acPegaPainelDoFormExecute(frmBaseTdi);
end;

procedure TfrmAbas.MenuItem3Click(Sender: TObject);
begin
  //if not Assigned(frmModeloConsulta) then
  //begin
  //  Application.CreateForm(TfrmModeloConsulta,frmModeloConsulta);
  //end;
  //acPegaPainelDoFormExecute(frmModeloConsulta);
end;

procedure TfrmAbas.mniFecharabaClick(Sender: TObject);
var aba:TTabSheetTdi;
begin
  if iAbaclicada >0 then
  begin
    aba:=TTabSheetTdi(abasPrincipal.Pages[iAbaclicada]);
    aba.form.btnclose.OnClick(nil);
  end;
end;

procedure TfrmAbas.abasPrincipalMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var pos :TPoint;int1:integer;
begin
  GetCursorPos(Pos);
  if Button = mbRight then
  begin
  iAbaclicada:=abasPrincipal.TabIndexAtClientPos(point(x,y));
  popAbas.PopUp(pos.x,pos.y);
  end;
end;

procedure TfrmAbas.pegaNovoForm(var aForm: TfrmBaseTdi;aClassForm:TFormClass);
begin
  if (aForm = nil) or
     (aForm.pnlRaizTdi = nil)then
    Application.CreateForm(aClassForm,aForm);
  aForm.acModoAba.OnExecute:=acPegaPainelDoForm.OnExecute;
  aForm.acModoAba.OnExecute(aForm);
end;



end.

