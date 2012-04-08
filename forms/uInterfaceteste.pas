unit uInterfaceteste;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, PairSplitter, StdCtrls, Buttons, ActnList, ComCtrls,
  ButtonPanel, PopupNotifier, EditBtn, Spin, Grids, XMLRead, XMLWrite, xmlutils,
  XMLPropStorage,{Ipfilebroker,} xmltestreport, dom,
  uacessorios, Uclassificador, Uarrays, aux_interface, Uarquivotxt, Ucoisa,
  Uideograma, Uarquivos, Upensamento, eventlog,

  LCLType, Messages, Variants;//   Mask;

type

  { TfrmTeste }

  TfrmTeste = class(TForm)
    Button1: TButton;
    btnLefrase: TButton;
    edtFrase: TEdit;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    mniAtualizar: TMenuItem;
    mniAddtexto: TMenuItem;
    mniAddNO: TMenuItem;
    mnucopiar: TMenuItem;
    mnumover: TMenuItem;
    mnucancelar: TMenuItem;
    mnuabrir: TMenuItem;
    mnusalvar: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1,Panel2,Panel3,Panel4,Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    grd1: TStringGrid;
    TreeView1,TreeView2: TTreeView;
    procedure btnLefraseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EventLog1GetCustomCategory(Sender: TObject; var Code: Word);
    procedure FormCreate(Sender: TObject); //create#####
    procedure mniAbrirClick(Sender: TObject);
    procedure mniAddNOClick(Sender: TObject);
    procedure mniAddtextoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
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
  end;

var
  frmTeste: TfrmTeste;
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

procedure TfrmTeste.mniAbrirClick(Sender: TObject);
var
  texto: String;
  int1: LongInt;
  cont: Integer;
  cont2: Integer;
  stl1:TStringList;
begin
  OpenDialog1.Execute;
  int1:=OpenDialog1.FilterIndex;
  if (OpenDialog1.FileName<>'')and(OpenDialog1.FilterIndex = 1 )then
  begin
    if docxml<>nil then
    docxml.Destroy;

    ReadXMLFile(docxml ,OpenDialog1.FileName);
    TreeView1.Items.Clear;
    TreeView1.Visible:=false;
    domtools.XML2Tree(TreeView1,docxml);
    TreeView1.Visible:=true;
  end;
  //-----------------------------------------------------------------
  if (OpenDialog1.FileName<>'')and(OpenDialog1.FilterIndex = 2 )then begin
    memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  //   stl1:= arrumatexto(TStringList(Memo1.Lines));
  //end;
  //Memo1.Lines.Clear;
  //for cont:=0 to stl1.Count-1 do
  //begin
  //  memo1.Lines.Add(IntToStr(cont)+' '+ stl1.Strings[cont]);
  end;




end;
procedure TfrmTeste.mniAddNOClick(Sender: TObject);
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
procedure TfrmTeste.mniAddtextoClick(Sender: TObject);
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
procedure TfrmTeste.mniAtualizarClick(Sender: TObject);
begin
  TreeView1.Items.Clear;
    TreeView1.Visible:=false;
    domtools.XML2Tree(TreeView1,docxml);
    TreeView1.Visible:=true;
end;
procedure TfrmTeste.FormCreate(Sender: TObject);
var
  str1:string ;
  cont: Integer;
  cont2: Integer;
  matriz:Tmatriz500x20;
  stlSujeito,stlAdjetivo,stlVerbo,stlPronome,stlIndefinido:TStringList;
begin
  editado:=false;
  docxml:=nil;
  classificador:=Tclassificador.create;

   //  str1:= matriz.coluna[cont,1];
   //
   //  if matriz.coluna[cont,1]='sujeito'then
   //  begin
   //    stlSujeito.Add(matriz.coluna[cont,4]);
   //  end;
   //  if matriz.coluna[cont,1]='adjetivo'then
   //  begin
   //    stlAdjetivo.Add(matriz.coluna[cont,4]);
   //  end;
   //  if matriz.coluna[cont,1]='verbo'then
   //  begin
   //    stlVerbo.Add(matriz.coluna[cont,4]);
   //  end;
   //  if matriz.coluna[cont,1]='pronome'then
   //  begin
   //    stlPronome.Add(matriz.coluna[cont,4]);
   //  end;
   //  if matriz.coluna[cont,1]='indefinido'then
   //  begin
   //    stlIndefinido.Add(matriz.coluna[cont,4]);
   //  end;
   //end;
   //for cont := 1 to stlSujeito.Count do
   //begin
   //  grd1.Cells[1,cont]:= stlSujeito.Strings[cont-1];
   //end;
   //
   //for cont := 1 to stlAdjetivo.Count do
   //begin
   //  grd1.Cells[2,cont]:= stlAdjetivo.Strings[cont-1];
   //end;
   //for cont := 1 to stlVerbo.Count do
   //begin
   //  grd1.Cells[3,cont]:= stlVerbo.Strings[cont-1];
   //end;
   //for cont := 1 to stlPronome.Count do
   //begin
   //  grd1.Cells[4,cont]:= stlPronome.Strings[cont-1];
   //end;
   //for cont := 1 to stlIndefinido.Count do
   //begin
   //  grd1.Cells[5,cont]:= stlIndefinido.Strings[cont-1];
   //end;
  //xmlideogr:= TxmlIdeogramas.create;
  //
  //xmlideogr.NomeArquivo:='C:\Users\Daiane\Desktop\ideogr.xml';
  //
  //xmlideogr2:=TxmlIdeogramas.create;
  //xmlideogr2.lista:=xmlideogr.lista;
  //xmlideogr2.NomeArquivo:='C:\Users\Daiane\Desktop\ideogr2.xml';
  //
  //xmltarefa:= TxmlTarefas.create;
  //
  //xmltarefa.NomeArquivo:='C:\Users\Daiane\Desktop\tarefa.xml';
  //
  //xmltarefa2:=TxmlTarefas.create;
  //xmltarefa2.lista:=xmltarefa.lista;
  //xmltarefa2.NomeArquivo:='C:\Users\Daiane\Desktop\tarefa2.xml';

  //arquivotxt:= Tarquivotxt.Create;
end;

procedure TfrmTeste.Button1Click(Sender: TObject);
var
  cont: Integer;

begin
  //if pensamento=nil then
  //pensamento:=Tpensamento.Create;
  if docxml= nil then
    begin
      docxml:=domtools.criaObjetoXML('raiz');
    end;
     classificador.classificaEmArvore(TStringList(memo1.Lines),docxml.DocumentElement);

// classificador.classificaEmArvore(TStringList(Memo1.Lines),);
  //xmltarefa2:=TxmlTarefas.create;
  //xmltarefa2.lista:=pensamento.filaAtual;
  //xmltarefa2.NomeArquivo:='C:\Users\Daiane\Desktop\tarefasbase.xml';
 //for cont:=0 to 10 do
 // pensamento.ciclo;
end;

procedure TfrmTeste.EventLog1GetCustomCategory(Sender: TObject; var Code: Word);
begin

end;

procedure TfrmTeste.btnLefraseClick(Sender: TObject);
var
  matriz: Tmatriz500x20;
  cont: Integer;
  cont2: Integer;
begin
 // arrumatexto(texto:Ttxt;tamanho:integer);
  classificador.entrafrase(edtfrase.Text);
  matriz:=classificador.matriz;
   for cont := 0 to 10 do
   begin
     for cont2:= 0 to 15 do
     begin
       grd1.Cells[cont,cont2]:=matriz.coluna[cont,cont2];
     end;

   end;
end;

procedure TfrmTeste.mnucopiarClick(Sender: TObject);
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
procedure TfrmTeste.mnumoverClick(Sender: TObject);
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
procedure TfrmTeste.mnusalvarClick(Sender: TObject);
begin
   SaveDialog1.Execute;
   if docxml<>nil then
  writeXMLFile(docxml,SaveDialog1.FileName);

end;
procedure TfrmTeste.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
         PopupMenu1.PopUp(x+frmTeste.Left,y+frmTeste.Top);
end;
procedure TfrmTeste.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  //saco....!
end;
procedure TfrmTeste.TreeView1Edited(Sender: TObject; Node: TTreeNode; var S: string
  );
  var nodom:TDOMNode;
    str1: String;
    notext:TDOMText;
    str2: String;

begin
  aberto:=TDOMElementio( domtools.getNOorigem(TreeView1,docxml));
  TreeView1.Update;
  frmTeste.Update;
  str1:=s;
  str1:=TreeView1.Selected.GetTextPath;
  str1:=TreeView1.Selected.Text;
  conteudo:= TreeView1.Selected;
  conteudo.Text:=S;
  editado:=true;
  TreeView1Enter(sender);
end;

procedure TfrmTeste.TreeView1EditingEnd(Sender: TObject; Node: TTreeNode;
  Cancel: Boolean);
begin

end;

procedure TfrmTeste.TreeView1Enter(Sender: TObject);
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
procedure TfrmTeste.TreeView1KeyDown(Sender: TObject; var Key: Word;
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
procedure TfrmTeste.TreeView2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
             //sdfhgj
end;
procedure TfrmTeste.TreeView2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  //wefdbghjg
end;
procedure TfrmTeste.exemploscomDOMnode;
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
  {$I uInterfaceteste.lrs}

end.

