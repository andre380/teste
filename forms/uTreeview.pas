unit uTreeview;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, PairSplitter, StdCtrls, Buttons, ActnList, ComCtrls,
  ButtonPanel, PopupNotifier, EditBtn, Spin, Grids, SynMemo, SynHighlighterPas,
  SynHighlighterPHP, SynHighlighterSQL, SynHighlighterIni,

  LCLType, Messages, Variants,
  XMLRead, XMLWrite, xmlutils,XMLPropStorage,xmltestreport, dom,
  uacessorios, Uclassificador, Uarrays, aux_interface, Uarquivotxt, Ucoisa,
  Uideograma, Uarquivos, Upensamento;

type

  { Tfrmtreeview }

  Tfrmtreeview = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem2: TMenuItem;
    mniAddNO: TMenuItem;
    mniAddtexto: TMenuItem;
    mniAtualizar: TMenuItem;
    mniSalvar: TMenuItem;
    mniabrir: TMenuItem;
    mnucancelar: TMenuItem;
    mnucopiar: TMenuItem;
    mnumover: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    ini: TSynIniSyn;
    SynMemo1: TSynMemo;
    pascal: TSynPasSyn;
    php: TSynPHPSyn;
    sql: TSynSQLSyn;
    TreeView1: TTreeView;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure mniabrirClick(Sender: TObject);
    procedure mniAddNOClick(Sender: TObject);
    procedure mniAddtextoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mnucopiarClick(Sender: TObject);
    procedure mnumoverClick(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure TreeView1Editing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
      Cancel: Boolean);
    procedure TreeView1Enter(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
    docxml,docxml2:TXMLDocument;
    xmlideogr,xmlideogr2: TxmlIdeogramas;
    xmltarefa,xmltarefa2:TxmlTarefas;
    domtools:Tdomtools;
    nopaiAux:TDOMNode;
    aberto:TDOMElementio;
    editado: Boolean;
    conteudo: TTreeNode;

  end; 

var
  frmtreeview: Tfrmtreeview;

implementation

{ Tfrmtreeview }

procedure Tfrmtreeview.mniabrirClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
   // if OpenDialog1.FileName;
  end;
end;

procedure Tfrmtreeview.mniAddNOClick(Sender: TObject);
var novoNO,nodestino:TDOMNode;
  str1: String;
begin
  if docxml= nil then
  begin
    docxml:=domtools.criaObjetoXML('raiz');
  end;
  nodestino:= nil;
  nodestino:=domtools.getNOdestino(TreeView1,docxml);
  if nodestino=docxml.FirstChild then
  begin
    novoNO:=docxml.CreateElement('novoNO');
    nodestino.AppendChild(novono);
    domtools.XML2Tree(TreeView1,docxml);
  end else
  begin
    novoNO:=docxml.CreateElement('novoNO');
    str1:= TreeView1.InsertMarkNode.Text;
    if TreeView1.InsertMarkType = tvimAsFirstChild then begin
      IF nodestino.HasChildNodes then begin
      nodestino:=nodestino.FirstChild;
      domtools.insereAntes(nil,nodestino,novono);

      TreeView1.Items.AddChildFirst(TreeView1.InsertMarkNode,'novoNO').ImageIndex:=1;
      end else begin
      nodestino.AppendChild(novono);
      TreeView1.Items.AddChild(TreeView1.InsertMarkNode,'novoNO').ImageIndex:=1;
      end;
    end;
    if TreeView1.InsertMarkType = tvimAsNextSibling then begin
      domtools.insereDepois(nil,nodestino,novono);
      TreeView1.Items.InsertBehind(TreeView1.InsertMarkNode,'novoNO').ImageIndex:=1;
    end;
    if TreeView1.InsertMarkType = tvimAsPrevSibling then begin
      domtools.insereAntes(nil,nodestino,novono);
      TreeView1.Items.Insert(TreeView1.InsertMarkNode,'novoNO').ImageIndex:=1;
    end;
  end;
end;

procedure Tfrmtreeview.mniAddtextoClick(Sender: TObject);
var novoNO,notexto,nodestino:TDOMNode;
begin
  nodestino:= nil;
nodestino:=domtools.getNOdestino(TreeView1,docxml);
  novoNO:=docxml.CreateElement('baba');
  novoNO.TextContent:='novo texto';
  notexto:=novoNO.FirstChild;
   if TreeView1.InsertMarkType = tvimAsFirstChild then begin
   IF nodestino.HasChildNodes then begin
   nodestino:=nodestino.FirstChild;
   domtools.insereAntes(nil,nodestino,notexto);
   TreeView1.Items.AddChildFirst(TreeView1.InsertMarkNode,'novoTexto').ImageIndex:=2;
   end else begin
   nodestino.AppendChild(notexto);
   TreeView1.Items.AddChild(TreeView1.InsertMarkNode,'novoTexto').ImageIndex:=2;
   end;
 end;
 if TreeView1.InsertMarkType = tvimAsNextSibling then begin
   domtools.insereDepois(nil,nodestino,notexto);
   TreeView1.Items.InsertBehind(TreeView1.InsertMarkNode,'novoTexto').ImageIndex:=2;
 end;
 if TreeView1.InsertMarkType = tvimAsPrevSibling then begin
   domtools.insereAntes(nil,nodestino,notexto);
   TreeView1.Items.Insert(TreeView1.InsertMarkNode,'novoTexto').ImageIndex:=2;
 end;
 novoNO.Destroy;
end;

procedure Tfrmtreeview.mniAtualizarClick(Sender: TObject);
begin
   TreeView1.Items.Clear;
    TreeView1.Visible:=false;
    domtools.XML2Tree(TreeView1,docxml);
    TreeView1.Visible:=true;
end;

procedure Tfrmtreeview.mnucopiarClick(Sender: TObject);
var novono,nodestino:TDOMNode;
 novonotree:TTreeNode;
 notreedestino: TTreeNode;
begin
  if (Assigned(docxml))and(docxml.FirstChild.HasChildNodes)then
begin
   TreeView1.Visible:=false;
   notreedestino:= TreeView1.InsertMarkNode;
   novono:= domtools.getNOorigem(TreeView1,docxml);
   novono:=novono.CloneNode(true);
  // NovoNo := docxml.CreateElement('item');
   nodestino:=domtools.getNOdestino(TreeView1,docxml);
   if TreeView1.InsertMarkType = tvimAsFirstChild then begin
     IF nodestino.HasChildNodes then begin
     nodestino:=nodestino.FirstChild;
     novonotree:= TreeView1.Items.AddChildFirst(notreedestino,TreeView1.Selected.Text);
     domtools.insereAntes(novonotree,nodestino,novono);
     end else begin
      novonotree:=TreeView1.Items.AddChild(TreeView1.
      InsertMarkNode,TreeView1.Selected.Text);
      nodestino.AppendChild(novono);
      ////
     end;
   end;

   if TreeView1.InsertMarkType = tvimAsNextSibling then begin
     novonotree:=TreeView1.Items.InsertBehind(notreedestino,TreeView1.Selected.Text);
     domtools.insereDepois(novonotree,nodestino,novono);
   end;

   if TreeView1.InsertMarkType = tvimAsPrevSibling then begin
     novonotree:=TreeView1.Items.Insert(notreedestino,TreeView1.Selected.Text);
     domtools.insereAntes(novonotree,nodestino,novono);
   end;
     novonotree.ImageIndex:=TreeView1.Selected.ImageIndex;
    //TreeView1.Items.Clear;
    //TreeView1.Visible:=false;
    //domtools.XML2Tree(TreeView1,docxml);
    TreeView1.Visible:=true;
 end;
end;

procedure Tfrmtreeview.mnumoverClick(Sender: TObject);
var novono,nodestino,apagado:TDOMNode;
  novonotree: TTreeNode;
begin
  if (Assigned(docxml))and(docxml.FirstChild.HasChildNodes)then
  begin
    apagado:=  domtools.getNOorigem(TreeView1,docxml);
    novono:=apagado.CloneNode(true,docxml);
    // NovoNo := docxml.CreateElement('item');
    nodestino:=domtools.getNOdestino(TreeView1,docxml);
    if TreeView1.InsertMarkType = tvimAsFirstChild then begin
      IF nodestino.HasChildNodes then begin
        nodestino:=nodestino.FirstChild;

        novonotree:= TreeView1.Items.AddChildFirst(TreeView1.
        InsertMarkNode,TreeView1.Selected.Text);

        domtools.insereAntes(novonotree,nodestino,novono);
      end else begin
       novonotree:=TreeView1.Items.AddChild(TreeView1.
       InsertMarkNode,TreeView1.Selected.Text);
       nodestino.AppendChild(novono);
       ////
      end;
    end;
    if TreeView1.InsertMarkType = tvimAsNextSibling then begin
      novonotree:=TreeView1.Items.InsertBehind(TreeView1.
      InsertMarkNode,TreeView1.Selected.Text);
      domtools.insereDepois(novonotree,nodestino,novono);
    end;
    if TreeView1.InsertMarkType = tvimAsPrevSibling then begin
      novonotree:=TreeView1.Items.Insert(TreeView1.
      InsertMarkNode,TreeView1.Selected.Text);
      domtools.insereAntes(novonotree,nodestino,novono);
    end;
    novonotree.ImageIndex:=TreeView1.Selected.ImageIndex;
    domtools.excluino(apagado);
    TreeView1.Selected.Delete;
  end;
end;

procedure Tfrmtreeview.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer
  );
begin
   PopupMenu1.PopUp(x+self.Left,y+self.Top);
end;

procedure Tfrmtreeview.TreeView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  //...
end;

procedure Tfrmtreeview.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: string);
var nodom:TDOMNode;
  str1: String;
  notext:TDOMText;
  str2: String;
begin
  aberto:=TDOMElementio( domtools.getNOorigem(TreeView1,docxml));
  TreeView1.Update;
  self.Update;
  str1:=s;
  str1:=TreeView1.Selected.GetTextPath;
  str1:=TreeView1.Selected.Text;
  conteudo:= TreeView1.Selected;
  conteudo.Text:=S;
  editado:=true;
  str1:=Node.Text;
  TreeView1Enter(sender);
end;

procedure Tfrmtreeview.TreeView1Editing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
var
  str1: String;
begin
  str1:=Node.Text;
end;

procedure Tfrmtreeview.TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
  Cancel: Boolean);
var
  str1: String;
begin
  str1:=Node.Text;
end;

procedure Tfrmtreeview.TreeView1Enter(Sender: TObject);
var
  str1,sobraDoConteudo: String; stlAtributo,stlValor :TStringList; int2,int1:integer;
begin

  if editado then begin
  str1:= conteudo.Text;
  TreeView1.Update;
  str1:= conteudo.Text;
    if aberto.NodeName = '#text'then begin // nao é um nó real é só texto
    aberto.NodeValue:=conteudo.Text;      //o valor real esta em NodeValue
    end else
    begin
      stlAtributo:=TStringList.Create;
      stlValor:=TStringList.Create;
      int1:=pos(' ',conteudo.Text);
      if int1 > 0 then
      begin
        if  aberto.SetNodeName(copy(conteudo.Text,1,int1-1))then
        begin
          sobraDoConteudo:=Copy(conteudo.Text,int1,Length(conteudo.Text));
          repeat
            repeat
              int1:=pos(' ',sobraDoConteudo);
              if int1 = 1 then
                Delete(sobraDoConteudo,1,1)
            until int1 <> 1 ;
            int1:=pos('=',sobraDoConteudo);
            if int1 > 0 then
            begin
              stlAtributo.Add(Copy(sobraDoConteudo,1,int1-1));
              sobraDoConteudo:=Copy(sobraDoConteudo,int1+1,Length(sobraDoConteudo));
              repeat
                int1:=pos(' ',sobraDoConteudo);
                if int1 = 1 then
                  Delete(sobraDoConteudo,1,1)
              until int1 <> 1 ;
              int1:=pos(' ',sobraDoConteudo);
              if int1 > 0 then
              begin
              stlValor.Add(Copy(sobraDoConteudo,1,int1));
              sobraDoConteudo:=copy(sobraDoConteudo,int1,Length(sobraDoConteudo));
              end else
              stlValor.Add(sobraDoConteudo);
            end;
          until int1 < 1 ;
          if stlAtributo.Count > 0 then
            for int1:=0 to stlAtributo.Count -1 do
            begin
                TDOMElement(aberto).SetAttribute(stlAtributo.Strings[int1],stlValor.Strings[int1])
            end;
        end;
      end
      else
        aberto.SetNodeName(conteudo.Text)
    end;
    editado:=false;
  end;
end;

procedure Tfrmtreeview.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nodel: TDOMNode;
  nopai: TDOMNode;
  debug: TTreeNode;
begin
  debug:=TreeView1.Selected;
  if (key = vk_delete)and (TreeView1.Selected<>nil) then begin
    nodel:=domtools.getNOorigem(TreeView1,docxml);
    nopai:= nodel.ParentNode;
    nopai.DetachChild(nodel);
    nodel.Destroy;
    TreeView1.Selected.Delete;
  end;
end;

procedure Tfrmtreeview.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
  begin
    SynMemo1.Highlighter:=pascal;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    SynMemo1.Highlighter:=php;
  end;
  if ComboBox1.ItemIndex=2 then
  begin
    SynMemo1.Highlighter:=sql;
  end;
  if ComboBox1.ItemIndex=3 then
  begin
    SynMemo1.Highlighter:=ini;
  end;
end;

procedure Tfrmtreeview.FormCreate(Sender: TObject);
begin
  editado:=false;
  docxml:=nil;
end;

procedure Tfrmtreeview.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  PopupMenu1.PopUp(x+self.Left,y+self.Top);
end;

initialization
  {$I uTreeview.lrs}

end.

