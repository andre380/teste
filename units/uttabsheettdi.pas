unit uttabsheettdi; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,ComCtrls,Forms,ufrmBaseTdi;
type

  { TTabSheetTdi }

  TTabSheetTdi = class(TTabSheet)
  private
    Fform: TfrmBaseTdi;
    procedure Setform(const AValue: TfrmBaseTdi);
  public
    property form:TfrmBaseTdi read Fform write Setform;
    constructor Criar(TheOwner: TPageControl;aform:TfrmBaseTdi);
    procedure devolveForm;
    destructor Destroy; override;

  end;

implementation

{ TTabSheetTdi }

procedure TTabSheetTdi.Setform(const AValue: TfrmBaseTdi);
begin
  if Fform=AValue then exit;
  Fform:=AValue;
  Fform.Hide;
  Fform.pnlRaizTdi.Parent:=Self;
end;

constructor TTabSheetTdi.Criar(TheOwner: TPageControl; aform: TfrmBaseTdi);
begin
  Inherited Create(TheOwner);
  self.form:=aform;
  self.Parent:=TheOwner;
  Self.Caption:=aform.Caption;
  self.Hint:=aform.Hint;
  if Self.Hint <> '' then
  self.ParentShowHint:=false;
  self.ShowHint:=True;
end;

destructor TTabSheetTdi.Destroy;

begin
  devolveForm;
  Inherited Destroy;
end;

procedure TTabSheetTdi.devolveForm;
begin
  if (self.Fform <> nil) and (self.form.pnlRaizTdi <>nil) then
  begin
    Fform.pnlRaizTdi.Parent:=Fform;
    Fform.Show;
    Fform:=nil;
  end;
end;

end.

