unit ufrmBaseTdi; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ActnList;

type

  { TfrmBaseTdi }

  TfrmBaseTdi = class(TForm)
    aclbaseTdi: TActionList;
    acModoAba: TAction;
    pnlControles: TPanel;
    btnSeparar: TSpeedButton;
    btnclose: TSpeedButton;
    procedure btncloseClick(Sender: TObject);
    procedure btnSepararClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  published
    pnlRaizTdi: TPanel;
  end; 

var
  frmBaseTdi: TfrmBaseTdi;

implementation

{$R *.lfm}

{ TfrmBaseTdi }

{ TfrmBaseTdi }

procedure TfrmBaseTdi.btncloseClick(Sender: TObject);
begin
  if pnlRaizTdi.Parent = self then
    self.Close
  else
  begin
    self.pnlRaizTdi.Parent.Destroy;
    self.Close;
  end;
end;

procedure TfrmBaseTdi.btnSepararClick(Sender: TObject);
begin
  if pnlRaizTdi.Parent = self then
  begin
    if Assigned(self.acModoAba.OnExecute)then
    self.acModoAba.OnExecute(self);
  end
  else
  begin
    self.pnlRaizTdi.Parent.Destroy;
  end;
end;

procedure TfrmBaseTdi.FormDestroy(Sender: TObject);
begin
  self.pnlRaizTdi:=nil;
end;

end.

