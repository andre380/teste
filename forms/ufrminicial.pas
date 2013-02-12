unit ufrmInicial; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls, Buttons, ActnList, SynHighlighterPython,


  ufrmBaseTdi,
  uFodastico,uInterfaceteste,uTreeview,Ucoisa,Upensamento;


type

  { TfrmInicial }

  TfrmInicial = class(TfrmBaseTdi)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    mnuMenu: TMenuItem;
    mniArvore: TMenuItem;
    SynPythonSyn1: TSynPythonSyn;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    coisa:Tcoisa;
    pensamento,pensamento2:Tpensamento;
    int1:integer;
  end; 

var
  frmInicial: TfrmInicial;

implementation

{$R *.lfm}

{ TfrmInicial }

procedure TfrmInicial.Button1Click(Sender: TObject);
begin
  if not Assigned(frmfodastico)then
  begin
    Application.CreateForm(TfrmFodastico,frmFodastico);
  end;
  frmFodastico.show;
end;

procedure TfrmInicial.Button2Click(Sender: TObject);
begin
  coisa:= Tcoisa.cria;
 // coisa.Execute;
end;

procedure TfrmInicial.Button3Click(Sender: TObject);
var
  cont: Integer;
begin
  for cont := 1 to 100000 do
  begin
  pensamento2.ciclo;
  if int1 = 0 then Label1.Caption:='|';
  if int1 = 2 then Label1.Caption:='/';
  if int1 = 3 then Label1.Caption:='-';
  if int1 = 4 then Label1.Caption:='\';
  if int1 = 5 then Label1.Caption:='|';
  if int1 = 6 then Label1.Caption:='/';
  if int1 = 7 then Label1.Caption:='-';
  if int1 = 8 then Label1.Caption:='\';
  inc(int1);
  if int1>8 then int1:=0;
  label1.Update;

  end;
end;

procedure TfrmInicial.Button4Click(Sender: TObject);
begin
  if not Assigned(frmTeste)then
  begin
    Application.CreateForm(TfrmTeste,frmTeste);
  end;
  frmTeste.Show;
end;

procedure TfrmInicial.Button5Click(Sender: TObject);
begin
  if not Assigned(frmtreeview)then
  begin
    Application.CreateForm(Tfrmtreeview,frmtreeview);
  end;
  frmtreeview.Show;
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
  pensamento:=Tpensamento.Create;
  pensamento2:=Tpensamento.Create;
  int1:=0
end;

procedure TfrmInicial.Timer1Timer(Sender: TObject);
var
  cont: Integer;
begin
  Timer1.Enabled:=false;
  for cont := 1 to 1000 do
  begin
  pensamento.ciclo;
  if int1 = 0 then Label1.Caption:='|';
  if int1 = 2 then Label1.Caption:='/';
  if int1 = 3 then Label1.Caption:='-';
  if int1 = 4 then Label1.Caption:='\';
  if int1 = 5 then Label1.Caption:='|';
  if int1 = 6 then Label1.Caption:='/';
  if int1 = 7 then Label1.Caption:='-';
  if int1 = 8 then Label1.Caption:='\';
  inc(int1);
  if int1>8 then int1:=0;
  label1.Update;

  end;
  Timer1.Enabled:=true;
end;

end.

