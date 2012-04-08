unit uInterface;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, PairSplitter, StdCtrls, Buttons, ActnList, ComCtrls,
  ButtonPanel, PopupNotifier, EditBtn, Spin, Grids, XMLRead, XMLWrite, xmlutils,
  XMLPropStorage,Ipfilebroker, xmltestreport, dom,
  uacessorios, Uclassificador, Uarrays, aux_interface, Uarquivotxt, Ucoisa,
  Uideograma, Uarquivos, Upensamento, eventlog,

  LCLType, Messages, Variants;//   Mask;

type

  { TfrmInterface }

  TfrmInterface = class(TForm)
    edtRaiz: TEdit;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    leTexto: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    mniIdeogramas: TMenuItem;
    MenuItem7: TMenuItem;
    mniAtualizar: TMenuItem;
    mniAddtexto: TMenuItem;
    mniAddNO: TMenuItem;
    mnucopiar: TMenuItem;
    mnumover: TMenuItem;
    mnucancelar: TMenuItem;
    mnuabrir: TMenuItem;
    mnusalvar: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1,Panel2,Panel3: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure edtRaizChange(Sender: TObject);
    procedure edtRaizEditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject); //create#####
    procedure leTextoClick(Sender: TObject);
    procedure mniAbrirClick(Sender: TObject);
    procedure mniAddNOClick(Sender: TObject);
    procedure mniAddtextoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniIdeogramasClick(Sender: TObject);
    procedure mnucopiarClick(Sender: TObject);
    procedure mnumoverClick(Sender: TObject);
    procedure mnusalvarClick(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
      Cancel: Boolean);
    procedure TreeView1Enter(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeView2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    procedure exemploscomDOMnode;
    { private declarations }
  public
    { public declarations }
    stlTextocru,stltxtok:tstringlist;
  end; 

var
  frmInterface: TfrmInterface;
  docxml,docxml2:TXMLDocument;
  xmlideogr,xmlideogr2: TxmlIdeogramas;
  xmltarefa,xmltarefa2:TxmlTarefas;
  domtools:Tdomtools;
    nopaiAux:TDOMNode;
    aberto:TDOMElementio;
    editado: Boolean;
    conteudo: TTreeNode;
    coisa:Tcoisa;
    pensamento:Tpensamento;
    classificador:Tclassificador;
    utilitarios:Tutilitarios;
    arr500:Tarray500;
    arquivotxt: TextFile;


implementation

procedure TfrmInterface.mniAbrirClick(Sender: TObject);
var
  texto: String;
  int1: LongInt;
  cont: Integer;
  cont2: Integer;
  stl1:TStringList;
begin
  if OpenDialog1.Execute then
  begin
    int1:=OpenDialog1.FilterIndex;
    if (OpenDialog1.FileName<>'')and(OpenDialog1.FilterIndex = 1 )then
    begin
      if docxml<>nil then
      docxml.Destroy;

      ReadXMLFile(docxml ,OpenDialog1.FileName);
      TreeView1.Items.Clear;
      TreeView1.Visible:=false;
      domtools.XML2Tree(TreeView1,docxml);
      edtRaiz.Text:=docxml.FirstChild.NodeName;
      TreeView1.Visible:=true;
      TreeView1.SetFocus;
    end;
    //-----------------------------------------------------------------
    if (OpenDialog1.FileName<>'')and(OpenDialog1.FilterIndex = 2 )then
    begin
      stlTextocru.LoadFromFile(OpenDialog1.FileName);
      stltxtok:=arrumatexto(stlTextocru);
      for cont:=0 to stltxtok.Count-1 do
      begin
        memo1.Lines.Add(stltxtok.Strings[cont]);
      end;
    end;
  end;
end;

procedure TfrmInterface.mniAddNOClick(Sender: TObject);
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
procedure TfrmInterface.mniAddtextoClick(Sender: TObject);
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
procedure TfrmInterface.mniAtualizarClick(Sender: TObject);
begin
  TreeView1.Items.Clear;
    TreeView1.Visible:=false;
    domtools.XML2Tree(TreeView1,docxml);
    TreeView1.Visible:=true;
end;

procedure TfrmInterface.mniIdeogramasClick(Sender: TObject);
begin

end;

procedure TfrmInterface.FormCreate(Sender: TObject);
var
  str1:string ;
  cont: Integer;
  cont2: Integer;
  matriz:Tmatriz500x20;
  stlSujeito,stlAdjetivo,stlVerbo,stlPronome,stlIndefinido:TStringList;
begin
  stlTextocru:=TStringList.Create;
  stltxtok:=TStringList.Create;
  editado:=false;
  docxml:=nil;
  classificador:=Tclassificador.create;
end;

procedure TfrmInterface.leTextoClick(Sender: TObject);
var
  cont: Integer;
begin
    if docxml= nil then
    begin
      docxml:=domtools.criaObjetoXML('raiz');
    end;
     classificador.classificaEmArvore(stltxtok,docxml.DocumentElement,ProgressBar1);
    memo1.lines.Clear;
    for cont:=0 to stltxtok.Count-1 do
    begin
      memo1.Lines.Add(IntToStr(cont)+'- '+stltxtok.Strings[cont]);
    end;
end;



procedure TfrmInterface.Button1Click(Sender: TObject);
var
  cont: Integer;
begin

end;

procedure TfrmInterface.edtRaizChange(Sender: TObject);
begin

end;

procedure TfrmInterface.edtRaizEditingDone(Sender: TObject);
begin
  if(docxml<>nil)and(edtRaiz.Text<>docxml.FirstChild.NodeName) then
  begin
    TDOMElementio(docxml.FirstChild).setnodename(edtRaiz.text);
  end;
end;

procedure TfrmInterface.mnucopiarClick(Sender: TObject);
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
procedure TfrmInterface.mnumoverClick(Sender: TObject);
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
procedure TfrmInterface.mnusalvarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
   if docxml<>nil then
     writeXMLFile(docxml,SaveDialog1.FileName);
  end;
end;
procedure TfrmInterface.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
         PopupMenu1.PopUp(x+frmInterface.Left,y+frmInterface.Top);
end;
procedure TfrmInterface.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  //saco....!
end;
procedure TfrmInterface.TreeView1Edited(Sender: TObject; Node: TTreeNode; var S: string
  );
  var nodom:TDOMNode;
    str1: String;
    notext:TDOMText;
    str2: String;

begin
  aberto:=TDOMElementio( domtools.getNOorigem(TreeView1,docxml));
  TreeView1.Update;
  frmInterface.Update;
  str1:=s;
  str1:=TreeView1.Selected.GetTextPath;
  str1:=TreeView1.Selected.Text;
  conteudo:= TreeView1.Selected;
  conteudo.Text:=S;
  editado:=true;
  TreeView1Enter(sender);
end;

procedure TfrmInterface.TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
  Cancel: Boolean);
begin
  //...
end;

procedure TfrmInterface.TreeView1Enter(Sender: TObject);
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
          aberto.RemoveAttributes;
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
procedure TfrmInterface.TreeView1KeyDown(Sender: TObject; var Key: Word;
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
procedure TfrmInterface.TreeView2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
             //sdfhgj
end;
procedure TfrmInterface.TreeView2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  //wefdbghjg
end;
procedure TfrmInterface.exemploscomDOMnode;
var
 noraiz,nopai,nofilho,novono:TDOMNode;
 xdoc:TXMLDocument;//o xdoc é o que contem o domnode raiz(xdoc nao é o raiz )
begin
  ReadXMLFile(xdoc ,'arquivo.xml'); // instancía xdoc com o arquivo fornecido

  xdoc := TXMLDocument.create;// cria uma instancia nova
  noraiz := xdoc.CreateElement('cadastro');//cria um nó para raiz
  Xdoc.Appendchild(noraiz); // cadastra o nó raiz (só pode ter um)
  noraiz:= xdoc.DocumentElement; //atualiza o edereco do noraiz
  nopai := xdoc.CreateElement('usuario'); //cria um nó pai (ou filho do raiz)
  TDOMElement(nopai).SetAttribute('id', '001'); // cria um atributo para o nó pai
  noraiz.Appendchild(nopai);                    // cadastra o nó pai
  //so há duas maneiras de adicionar nós a arvore e precisa do nópai correspondente pra isso
  nopai.AppendChild(novono);  //insere o novonó depois do ultimo nófilho
  nopai.InsertBefore(novono,nofilho);//insere o novonó antes nófilho apresentado
  writeXMLFile(xDoc,'teste.xml');//gera um arquivo
end;
initialization
  {$I uInterface.lrs}

end.

