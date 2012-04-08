unit uFodastico;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ShellCtrls, ComCtrls,

  XMLRead, XMLWrite, xmlutils, XMLPropStorage, Menus, xmltestreport, dom,
  uacessorios, Uclassificador, Uarrays, aux_interface, Uarquivotxt, Ucoisa,
  Uideograma, Uarquivos, Upensamento, eventlog, types;

type

  { TfrmFodastico }

  TfrmFodastico = class(TForm)
    btnAbrirtexto: TBitBtn;
    btnAbrirProcessado: TBitBtn;
    cbxprocura: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    MenuItem2: TMenuItem;
    mniAddNO: TMenuItem;
    mniAddtexto: TMenuItem;
    mniAtualizar: TMenuItem;
    mnucancelar: TMenuItem;
    mnucopiar: TMenuItem;
    mnumover: TMenuItem;
    OpenDialogXML: TOpenDialog;
    OpenDialogtexto: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    procedure btnAbrirtextoClick(Sender: TObject);
    procedure cbxprocuraChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
      Cancel: Boolean);
    procedure TreeView1Enter(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  public
    stlTextoCru:TStringList;
    classificador:Tclassificador;
    utilitarios:Tutilitarios;
    domtools:Tdomtools;
    docxml:TXMLDocument;
  end;

var
  frmFodastico: TfrmFodastico;

implementation

{ TfrmFodastico }

procedure TfrmFodastico.cbxprocuraChange(Sender: TObject);
begin

  Utf8ToAnsi('');
  AnsiToUtf8('');
end;

procedure TfrmFodastico.FormCreate(Sender: TObject);
begin
  stlTextoCru:=TStringList.Create;
  docxml:=nil;
  classificador:=Tclassificador.create;
  domtools:=Tdomtools.Create;

end;

procedure TfrmFodastico.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  PopupMenu1.PopUp(x+self.Left,y+self.Top);
end;

procedure TfrmFodastico.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
//  completa dragdrop ^^^
end;

procedure TfrmFodastico.ProgressBar1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TfrmFodastico.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer
  );
begin

end;

procedure TfrmFodastico.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: string);
var
  str1: String;
begin
  //aberto:=TDOMElementio( domtools.getNOorigem(TreeView1,docxml));
  //TreeView1.Update;
  //frmInterface.Update;
  //str1:=s;
  //str1:=TreeView1.Selected.GetTextPath;
  //str1:=TreeView1.Selected.Text;
  //conteudo:= TreeView1.Selected;
  //conteudo.Text:=S;
  //editado:=true;
  //TreeView1Enter(sender);
end;

procedure TfrmFodastico.TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
  Cancel: Boolean);
begin

end;

procedure TfrmFodastico.TreeView1Enter(Sender: TObject);
begin

  //if editado then begin
  //str1:= conteudo.Text;
  //TreeView1.Update;
  //str1:= conteudo.Text;
  //  if aberto.NodeName = '#text'then begin // nao é um nó real é só texto
  //  aberto.NodeValue:=conteudo.Text;      //o valor real esta em NodeValue
  //  end else
  //  begin
  //    stlAtributo:=TStringList.Create;
  //    stlValor:=TStringList.Create;
  //    int1:=pos(' ',conteudo.Text);
  //    if int1 > 0 then
  //    begin
  //      if  aberto.SetNodeName(copy(conteudo.Text,1,int1-1))then
  //      begin
  //        sobraDoConteudo:=Copy(conteudo.Text,int1,Length(conteudo.Text));
  //        repeat
  //          repeat
  //            int1:=pos(' ',sobraDoConteudo);
  //            if int1 = 1 then
  //              Delete(sobraDoConteudo,1,1)
  //          until int1 <> 1 ;
  //          int1:=pos('=',sobraDoConteudo);
  //          if int1 > 0 then
  //          begin
  //            stlAtributo.Add(Copy(sobraDoConteudo,1,int1-1));
  //            sobraDoConteudo:=Copy(sobraDoConteudo,int1+1,Length(sobraDoConteudo));
  //            repeat
  //              int1:=pos(' ',sobraDoConteudo);
  //              if int1 = 1 then
  //                Delete(sobraDoConteudo,1,1)
  //            until int1 <> 1 ;
  //            int1:=pos(' ',sobraDoConteudo);
  //            if int1 > 0 then
  //            begin
  //            stlValor.Add(Copy(sobraDoConteudo,1,int1));
  //            sobraDoConteudo:=copy(sobraDoConteudo,int1,Length(sobraDoConteudo));
  //            end else
  //            stlValor.Add(sobraDoConteudo);
  //          end;
  //        until int1 < 1 ;
  //        if stlAtributo.Count > 0 then
  //          for int1:=0 to stlAtributo.Count -1 do
  //          begin
  //              TDOMElement(aberto).SetAttribute(stlAtributo.Strings[int1],stlValor.Strings[int1])
  //          end;
  //      end;
  //    end
  //    else
  //      aberto.SetNodeName(conteudo.Text)
  //  end;
  //  editado:=false;
  //end;
end;

procedure TfrmFodastico.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //debug:=TreeView1.Selected;
 // if (key = vk_delete)and (TreeView1.Selected<>nil) then begin
 //
 // nodel:=domtools.getNOorigem(TreeView1,docxml);
 //nopai:= nodel.ParentNode;
 //nopai.DetachChild(nodel);
 //nodel.Destroy;
 //TreeView1.Selected.Delete;
 //
 // end;
end;

procedure TfrmFodastico.btnAbrirtextoClick(Sender: TObject);
var
  cont: Integer;
  strtexto:string;
begin
  if OpenDialogtexto.Execute then
  stlTextoCru.LoadFromFile(OpenDialogtexto.FileName);
  strtexto:=(stlTextoCru.CommaText);
  //if stlTextoCru.CommaText= strtexto then
  begin
    //stlTextoCru.CommaText:=AnsiToUtf8(strtexto);
  end;
  if docxml= nil then
  begin
    docxml:=domtools.criaObjetoXML('raiz');
  end;
   ProgressBar1.Position:=0;
     classificador.classificaEmArvore(stlTextoCru,docxml.DocumentElement,ProgressBar1);
   ProgressBar1.Position:=0;
  domtools.XML2Tree(TreeView1,docxml);
  Memo1.Lines.Clear;
  for cont:=0 to stlTextoCru.Count-1 do
  begin
    memo1.Lines.Add(inttostr(cont)+' '+stlTextoCru.Strings[cont]);
  end;
end;

initialization
  {$I uFodastico.lrs}

end.

