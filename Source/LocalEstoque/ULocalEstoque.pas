unit ULocalEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation;

type
  TfrmLocalEstoque = class(TForm)
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    edtPrefixoF: TEdit;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    ListaLocalEstoque: TListView;
    Rectangle2: TRectangle;
    imgLogoCad: TImage;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaLocalEstoqueItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPrefixoFChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    vIdLocalEstoque,vNomeLocalEstoque,
    vIdCombustivel,vNomeCombustivel :string;
    procedure GeraListaLocalEstoque;
  end;

var
  frmLocalEstoque: TfrmLocalEstoque;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB, UAbastecimento, UStartBomba, UMovEstoque;

procedure TfrmLocalEstoque.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocalEstoque.btnSelecionarClick(Sender: TObject);
var
 vFiltro:string;
begin
if vIdLocalEstoque.Length=0 then
 begin
   ShowMessage('Selecione um Local!');
   Exit;
 end
 else
 begin
  if dmDB.vTipoOp=1 then   //startdiario
  begin
   frmStartBomba.edtLocalEstoque.Text   := vNomeLocalEstoque;
   frmStartBomba.vIdLocalEstoque        := vIdLocalEstoque;
   frmStartBomba.vIdCombustivel         := vIdCombustivel;
   frmStartBomba.edtCombustivel.Text    := vNomeCombustivel;
   vFiltro := ' and s.dataastart='+FormatDateTime('yyyy-mm-dd',
    frmStartBomba.edtData.DateTime).QuotedString;
   vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
   dmDB.AbrirStartBomba(vFiltro);
//   if not dmDB.TStartbomba.IsEmpty then
//   begin
//     ShowMessage('J� existe um start para esse Bomba nessa data!');
//     frmStartBomba.edtLocalEstoque.Text :='';
//   end;
   if not dmDB.VerificaStartAberto(vIdLocalEstoque) then
   begin
     ShowMessage('Existe um start em aberto para esse Bomba Finalize ante de iniciar!');
    frmStartBomba.edtLocalEstoque.Text :='';
   end;
  end;
  if dmDB.vTipoOp=2 then //abastecimento
  begin
    frmAbastecimento.edtLocalEstoque.Text   := vNomeLocalEstoque;
    frmAbastecimento.vIdLocalEstoque        := vIdLocalEstoque;
    frmAbastecimento.vIdCombustivel         := vIdCombustivel;
    frmAbastecimento.edtCombustivel.Text    := vNomeCombustivel;
    vFiltro := ' and s.dataastart='+FormatDateTime('yyyy-mm-dd',
     frmAbastecimento.edtData.DateTime).QuotedString;
    vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
    dmDB.AbrirStartBomba(vFiltro);
    if dmDB.TStartbomba.IsEmpty then
    begin
      ShowMessage('� necessario realizar o Start Diario dessa Bomba antes de abastecer!');
      frmAbastecimento.edtLocalEstoque.Text :='';
    end;
  end;
  if dmDB.vTipoOp=3 then
  begin
    if dmDB.vLocalMov=1 then //local origem
    begin
      frmMovEstoque.vIdLocalOrigem         := vIdLocalEstoque;
      frmMovEstoque.vIdProduto             := vIdCombustivel;
      frmMovEstoque.edtLocalOrigem.Text    := vNomeLocalEstoque;
      frmMovEstoque.lblCombustivelO.Text   := vNomeCombustivel;
      frmMovEstoque.layBombaOrigem.Height  := 125;
    end;
    if dmDB.vLocalMov=2 then //local Destino
    begin
      frmMovEstoque.vIdLocalDestino        := vIdLocalEstoque;
      frmMovEstoque.edtLocalDestino.Text   := vNomeLocalEstoque;
      frmMovEstoque.lblCombustivelD.Text   := vNomeCombustivel;
      frmMovEstoque.layBombaDestino.Height := 125;
    end;
  end;
  Close;
 end;
end;

procedure TfrmLocalEstoque.edtPrefixoFChangeTracking(Sender: TObject);
begin
  if edtPrefixoF.Text.Length >0 then
  begin
    dmDB.TLocalEstoque.Filtered := false;
    dmDB.TLocalEstoque.Filter   := 'nome like '+QuotedStr('%'+edtPrefixoF.Text+'%');
    dmDB.TLocalEstoque.Filtered := true;
    GeraListaLocalEstoque;
  end
  else
  begin
   dmDB.TLocalEstoque.Filtered := false;
   dmDB.TLocalEstoque.Close;
   dmDB.TLocalEstoque.Open;
   GeraListaLocalEstoque;
  end;
end;

procedure TfrmLocalEstoque.FormShow(Sender: TObject);
begin
 frmLocalEstoque.StyleBook := frmPrincipal.StyleBook1;
 dmDB.TLocalEstoque.Close;
 dmDB.TLocalEstoque.Open();
 GeraListaLocalEstoque;
end;

procedure TfrmLocalEstoque.GeraListaLocalEstoque;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDb.TLocalEstoque.First;
    ListaLocalEstoque.Items.Clear;
    while not dmDb.TLocalEstoque.eof do
     begin
       item := ListaLocalEstoque.Items.Add;
         with frmLocalEstoque do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TLocalEstoqueId.AsString;
             txt.TagString := dmDb.TLocalEstoquenome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TLocalEstoquenome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := 'Combust�vel:';

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := dmDb.TLocalEstoquecombustivel.AsString;
             txt.TagString := dmDb.TLocalEstoqueidcombustivel.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgLocalEstoque.Bitmap;
           end;
           dmDb.TLocalEstoque.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmLocalEstoque.ListaLocalEstoqueItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdLocalEstoque :=
   TAppearanceListViewItem(ListaLocalEstoque.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').Text;

  vNomeLocalEstoque :=
   TAppearanceListViewItem(ListaLocalEstoque.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').TagString;

  vIdCombustivel   :=
   TAppearanceListViewItem(ListaLocalEstoque.Selected).Objects.FindObjectT<TListItemText>
   ('Text4').TagString;

  vNomeCombustivel :=
   TAppearanceListViewItem(ListaLocalEstoque.Selected).Objects.FindObjectT<TListItemText>
   ('Text4').Text;

end;

end.
