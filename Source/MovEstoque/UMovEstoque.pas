unit UMovEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.Effects, FMX.DateTimeCtrls, FMX.Edit, FMX.ListView,
  FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.ActnList, System.Actions;

type
  TfrmMovEstoque = class(TForm)
    layBase: TLayout;
    recPrincipal: TRectangle;
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    Layout5: TLayout;
    Layout37: TLayout;
    Rectangle22: TRectangle;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    Layout38: TLayout;
    btnNovo: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    Rectangle19: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout22: TLayout;
    tbiCad: TTabItem;
    TimerMsg: TTimer;
    layTBICad: TLayout;
    Rectangle1: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout67: TLayout;
    Layout39: TLayout;
    Rectangle15: TRectangle;
    Layout40: TLayout;
    btnConfirmarA: TRectangle;
    Image10: TImage;
    Label24: TLabel;
    Rectangle17: TRectangle;
    Image7: TImage;
    Label23: TLabel;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Label10: TLabel;
    Label3: TLabel;
    edtData: TDateEdit;
    edtHora: TTimeEdit;
    Layout1: TLayout;
    Rectangle18: TRectangle;
    Layout41: TLayout;
    Label20: TLabel;
    edtLitros: TEdit;
    Layout44: TLayout;
    Rectangle20: TRectangle;
    Layout45: TLayout;
    Label34: TLabel;
    Label35: TLabel;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    laymsg: TLayout;
    RecStatusAcao: TRectangle;
    layBaseMSG: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    ShadowEffect14: TShadowEffect;
    layBtnControls: TLayout;
    SEffectBtnConfirm1: TShadowEffect;
    btnConfirmar: TRectangle;
    layBntConfirm: TLayout;
    imgBntConfirm: TImage;
    lblBtnConfirm: TLabel;
    SEffectBtnConfirm: TShadowEffect;
    btnCancel: TRectangle;
    layBtnCancel: TLayout;
    ImgBtnCancel: TImage;
    lblBtnCancel: TLabel;
    SEffectBtnCancel: TShadowEffect;
    lblmsg: TLabel;
    Image8: TImage;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    btnVoltar: TSpeedButton;
    lblPage: TLabel;
    layNewOutros: TLayout;
    Rectangle9: TRectangle;
    ToolBar8: TToolBar;
    Rectangle10: TRectangle;
    Label17: TLabel;
    Layout21: TLayout;
    Layout26: TLayout;
    Rectangle12: TRectangle;
    Layout27: TLayout;
    Layout28: TLayout;
    Label18: TLabel;
    edtOutroProduto: TEdit;
    EditButton3: TEditButton;
    Layout29: TLayout;
    Rectangle14: TRectangle;
    Layout30: TLayout;
    Layout32: TLayout;
    Label26: TLabel;
    edtQtdOutroProduto: TEdit;
    Layout33: TLayout;
    btnConfirmaPluvi: TRectangle;
    Label28: TLabel;
    Image21: TImage;
    Rectangle13: TRectangle;
    Image4: TImage;
    Label19: TLabel;
    btnBuscar: TRectangle;
    LaybtnEntrar: TLayout;
    Label25: TLabel;
    Image11: TImage;
    layBombaOrigem: TLayout;
    Rectangle2: TRectangle;
    Layout9: TLayout;
    Label2: TLabel;
    edtLocalOrigem: TEdit;
    EditButton2: TEditButton;
    ClearEditButton1: TClearEditButton;
    listaTranferencia: TListView;
    btnExcluirTranferencia: TRectangle;
    Image13: TImage;
    Label37: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    Rectangle5: TRectangle;
    lblCombustivelO: TLabel;
    layBombaDestino: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Layout17: TLayout;
    Label6: TLabel;
    edtLocalDestino: TEdit;
    EditButton1: TEditButton;
    ClearEditButton2: TClearEditButton;
    Layout18: TLayout;
    Rectangle8: TRectangle;
    lblCombustivelD: TLabel;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    procedure tbPrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluirTranferenciaClick(Sender: TObject);
    procedure listaTranferenciaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnConfirmarAClick(Sender: TObject);
    procedure Rectangle17Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
  private
    vFiltro,vFlagSync,vIdTransferencia :String;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure GerarLista(vFiltro:string);
    procedure LimpaCampos;
  public
    vIdLocalOrigem,vIdLocalDestino,vIdProduto :String;
  end;

var
  frmMovEstoque: TfrmMovEstoque;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB, ULocalEstoque;

procedure TfrmMovEstoque.btnBuscarClick(Sender: TObject);
begin
 vFiltro                 :=' and datamov='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
 GerarLista(vFiltro);
end;

procedure TfrmMovEstoque.btnConfirmarAClick(Sender: TObject);
begin
 if edtLocalOrigem.Text.Length=0 then
 begin
   ShowMessage('Informe o Local de Origem!');
   edtLocalOrigem.SetFocus;
   Exit;
 end;
 if edtLocalDestino.Text.Length=0 then
 begin
   ShowMessage('Informe o Local de Destino!');
   edtLocalDestino.SetFocus;
   Exit;
 end;
 if(edtLitros.Text.Length=0)or(edtLitros.Text='0') then
 begin
   ShowMessage('Informe o Volume em Litros!');
   edtLitros.SetFocus;
   Exit;
 end;
 dmDB.TMovLocalEstoque.Insert;
 dmDB.TMovLocalEstoqueidusuario.AsString             := dmDB.vIdUser;
 dmDB.TMovLocalEstoqueidproduto.AsString             := vIdProduto;
 dmDB.TMovLocalEstoqueidlocalestoqueorigem.AsString  := vIdLocalOrigem;
 dmDB.TMovLocalEstoqueidlocalestoquedetino.AsString  := vIdLocalDestino;
 dmDB.TMovLocalEstoqueqtde.AsString                  := edtLitros.Text;
 dmDB.TMovLocalEstoquedatamov.AsDateTime             := edtData.DateTime;
 dmDB.TMovLocalEstoquehora.AsDateTime                := edtHora.DateTime;
 try
  dmDB.TMovLocalEstoque.ApplyUpdates(-1);
  ShowMessage('Movimentação realizada com sucesso!');
  vFiltro                 :=' and datamov='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
  GerarLista(vFiltro);
  MudarAba(tbiLista,sender);
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmMovEstoque.btnExcluirTranferenciaClick(Sender: TObject);
begin
 btnExcluirTranferencia.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaTransferencia(vIdTransferencia);
       vFiltro                 :=' and datamov='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
       GerarLista(vFiltro);
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;

procedure TfrmMovEstoque.btnNovoClick(Sender: TObject);
begin
 vFiltro := ' and s.status=1 and s.dataastart='+FormatDateTime('yyyy-mm-dd',date).QuotedString;
 dmDB.AbrirStartBomba(vFiltro);
 if dmDB.TStartbomba.IsEmpty then
 begin
  ShowMessage('É necessario realizar o Start Diario antes de abastecer!');
  Exit;
 end
 else
 begin
   layBombaDestino.Height :=62;
   layBombaOrigem.Height  :=62;
   LimpaCampos;
   MudarAba(tbiCad,sender);
 end;
end;

procedure TfrmMovEstoque.btnVoltar1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmMovEstoque.btnVoltarClick(Sender: TObject);
begin
  if tbPrincipal.TabIndex=1 then
  begin
   vFiltro                 :=' and datamov='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
   GerarLista(vFiltro);
   MudarAba(tbiLista,sender)
  end
  else
   Close;
end;

procedure TfrmMovEstoque.ClearEditButton1Click(Sender: TObject);
begin
 layBombaOrigem.Height :=62;
end;

procedure TfrmMovEstoque.ClearEditButton2Click(Sender: TObject);
begin
 layBombaDestino.Height :=62;
end;

procedure TfrmMovEstoque.EditButton1Click(Sender: TObject);
begin
  dmDB.vLocalMov := 2;
  if not Assigned(frmLocalEstoque) then
   Application.CreateForm(TfrmLocalEstoque,frmLocalEstoque);
    frmLocalEstoque.Show;
end;

procedure TfrmMovEstoque.EditButton2Click(Sender: TObject);
begin
   dmDB.vLocalMov := 1;
   if not Assigned(frmLocalEstoque) then
   Application.CreateForm(TfrmLocalEstoque,frmLocalEstoque);
    frmLocalEstoque.Show;
end;

procedure TfrmMovEstoque.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmMovEstoque.Rectangle17Click(Sender: TObject);
begin
 vFiltro                 :=' and datamov='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
 GerarLista(vFiltro);
 MudarAba(tbiLista,sender)
end;

procedure TfrmMovEstoque.FormShow(Sender: TObject);
begin
  btnExcluirTranferencia.Visible := false;
  vFiltro                        :=' and datamov='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
  tbPrincipal.TabPosition        := TTabPosition.None;
  tbPrincipal.ActiveTab          := tbiLista;
  layBombaDestino.Height         := 62;
  layBombaOrigem.Height          := 62;
  GerarLista(vFiltro);
end;

procedure TfrmMovEstoque.GerarLista(vFiltro:string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbrirTrasnferencia(vFiltro);
 dmDB.TMovLocalEstoque.First;
 listaTranferencia.Items.Clear;
 while not dmDB.TMovLocalEstoque.eof do
 begin
   item := listaTranferencia.Items.Add;
   with frmMovEstoque do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Origem: ';
       txt.TagString := dmDB.TMovLocalEstoqueid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TMovLocalEstoqueLocalOrigem.AsString;
       txt.TagString := dmDB.TMovLocalEstoquesyncaws.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Destino: ';

       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TMovLocalEstoqueLocalDestino.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Produto: ';

       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dmDB.TMovLocalEstoqueProduto.AsString;



       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Data: ';
       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dmDB.TMovLocalEstoquedatamov.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text14'));
       txt.Text := 'Hora: ';
       txt      := TListItemText(Objects.FindDrawable('Text15'));
       txt.Text := dmDB.TMovLocalEstoquehora.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Qtde.: ';
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TMovLocalEstoqueqtde.AsString;

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgTransf.Bitmap;

     end;
     dmDB.TMovLocalEstoque.Next;
   end;
 end;
end;

procedure TfrmMovEstoque.LimpaCampos;
begin
  layBombaDestino.Height :=62;
  layBombaOrigem.Height  :=62;
  edtLocalOrigem.Text    :='';
  edtLocalDestino.Text   :='';
  edtLitros.Text         :='';
end;

procedure TfrmMovEstoque.listaTranferenciaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdTransferencia :=
  TAppearanceListViewItem(listaTranferencia.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').TagString;
  vFlagSync :=
  TAppearanceListViewItem(listaTranferencia.Selected).Objects.FindObjectT<TListItemText>
   ('Text').TagString;
end;

procedure TfrmMovEstoque.tbPrincipalChange(Sender: TObject);
begin
  if tbPrincipal.TabIndex=0 then
   lblPage.Text :='Lista de Transferência';
  if tbPrincipal.TabIndex=1 then
   lblPage.Text :='Cadastro Transferência';
end;

end.
