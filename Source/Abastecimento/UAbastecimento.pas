unit UAbastecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.TreeView, FMX.MultiView, System.Actions, FMX.ActnList, FMX.Ani,
  FMX.Effects, FMX.Filter.Effects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox, FMX.DateTimeCtrls,
  System.Bluetooth, System.Bluetooth.Components,System.Threading,FireDAC.Comp.Client,
  FMX.EditBox, FMX.SpinBox, FMX.Memo,IdHTTP,System.Json.writers,System.Json.Readers,System.JSON.Types,
  Rest.Json,System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Data.Bind.ObjectScope,
  REST.Client, IPPeerClient,REST.Types,FMX.VirtualKeyboard,FMX.Platform,
  IdHashMessageDigest,System.ImageList,
  FMX.ImgList, FMX.Media, System.Sensors, System.Sensors.Components,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Gestures, FMX.NumberBox, FMX.ListView, FMX.MediaLibrary.Actions,FMX.Surfaces,
  FMX.StdActns,u99Permissions
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
    ,Soap.EncdDecd;

type
  TfrmAbastecimento = class(TForm)
    layBase: TLayout;
    recPrincipal: TRectangle;
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    tbiCad: TTabItem;
    TimerMsg: TTimer;
    layTBICad: TLayout;
    Rectangle1: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout67: TLayout;
    layBuscaMaquina: TLayout;
    Rectangle2: TRectangle;
    Layout9: TLayout;
    Label2: TLabel;
    edtMaquina: TEdit;
    Layout12: TLayout;
    Rectangle6: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Label10: TLabel;
    Label3: TLabel;
    edtData: TDateEdit;
    edtHora: TTimeEdit;
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
    Label5: TLabel;
    Layout10: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Label6: TLabel;
    edtLocalEstoque: TEdit;
    EditButton1: TEditButton;
    Layout18: TLayout;
    Rectangle8: TRectangle;
    Layout19: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    GestureManager1: TGestureManager;
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
    Layout29: TLayout;
    Rectangle14: TRectangle;
    Layout30: TLayout;
    Layout32: TLayout;
    Label26: TLabel;
    Layout33: TLayout;
    EditButton3: TEditButton;
    btnLerQr: TEditButton;
    Image5: TImage;
    Layout34: TLayout;
    Layout8: TLayout;
    Layout35: TLayout;
    Layout36: TLayout;
    edtQtdOutroProduto: TEdit;
    GestureManager2: TGestureManager;
    Layout5: TLayout;
    Layout37: TLayout;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    Layout38: TLayout;
    btnNovo: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    Lista: TListView;
    btnExcluiItem: TRectangle;
    Image1: TImage;
    lblExcluir: TLabel;
    Rectangle22: TRectangle;
    tbiProdutos: TTabItem;
    layListaP: TLayout;
    layLista: TLayout;
    Rectangle11: TRectangle;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label13: TLabel;
    edtNomeFiltro: TEdit;
    ListaProdutos: TListView;
    btnExcluiProduto: TRectangle;
    Image6: TImage;
    Label22: TLabel;
    Layout20: TLayout;
    btnNovoProduto: TRectangle;
    Image2: TImage;
    Label15: TLabel;
    btnVoltarProduto: TRectangle;
    Image3: TImage;
    Label16: TLabel;
    AnimacaoMnu: TFloatAnimation;
    Layout39: TLayout;
    Rectangle15: TRectangle;
    Rectangle17: TRectangle;
    Image7: TImage;
    Label23: TLabel;
    Layout40: TLayout;
    btnConfirmarA: TRectangle;
    Image10: TImage;
    Label24: TLabel;
    Rectangle19: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout22: TLayout;
    Label9: TLabel;
    edtMaquinaF: TEdit;
    btnBuscar: TRectangle;
    LaybtnEntrar: TLayout;
    Label25: TLabel;
    Image11: TImage;
    ClearEditButton3: TClearEditButton;
    Label14: TLabel;
    lblUltimoAbastecimento: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    lblUltimoHr: TLabel;
    lblUltimoKM: TLabel;
    Label12: TLabel;
    Label29: TLabel;
    edtCombustivel: TEdit;
    EditButton4: TEditButton;
    ClearEditButton4: TClearEditButton;
    Layout1: TLayout;
    Rectangle18: TRectangle;
    Layout41: TLayout;
    Label20: TLabel;
    btnImg: TRectangle;
    Image17: TImage;
    Label33: TLabel;
    LocationSensor1: TLocationSensor;
    Layout44: TLayout;
    Rectangle20: TRectangle;
    Layout45: TLayout;
    Label34: TLabel;
    Label35: TLabel;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    tbiImg: TTabItem;
    layImgHorimetro: TLayout;
    Rectangle26: TRectangle;
    Layout71: TLayout;
    Layout42: TLayout;
    Rectangle21: TRectangle;
    Rectangle27: TRectangle;
    Image14: TImage;
    Label31: TLabel;
    Layout43: TLayout;
    btnSalvarFoto: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    ActionList1: TActionList;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActFoto: TTakePhotoFromCameraAction;
    edtHorimetro: TEdit;
    edtKm: TEdit;
    layAlerta: TLayout;
    Rectangle5: TRectangle;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    Layout16: TLayout;
    Layout17: TLayout;
    Rectangle23: TRectangle;
    Label11: TLabel;
    cbxTipoAlerta: TComboBox;
    Layout46: TLayout;
    btnConfirmaAlerta: TRectangle;
    Image15: TImage;
    Label36: TLabel;
    btnConfirmaProduto: TRectangle;
    Image4: TImage;
    Label19: TLabel;
    Image18: TImage;
    Layout47: TLayout;
    Label28: TLabel;
    lblVolumeLitro: TLabel;
    layFotoKM: TLayout;
    Rectangle13: TRectangle;
    imgFotoKM: TImage;
    btnFotoKM: TRectangle;
    Image20: TImage;
    Label37: TLabel;
    layFotoHorimetro: TLayout;
    RecImgHrimetro: TRectangle;
    imgHorimetro: TImage;
    btnFotoHorimetro: TRectangle;
    Image12: TImage;
    Label8: TLabel;
    layFotoBomba: TLayout;
    RecImgBomba: TRectangle;
    imgBomba: TImage;
    btnFotoBomba: TRectangle;
    Image13: TImage;
    Label30: TLabel;
    VertScrollBox1: TVertScrollBox;
    edtLitros: TEdit;
    procedure btnBuscarMaquinaClick(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ListaGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure btnNovoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnExcluiItemMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnExcluiItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnVoltarProdutoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltarProdutoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoProdutoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoProdutoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure btnVoltarProdutoClick(Sender: TObject);
    procedure tbPrincipalChange(Sender: TObject);
   {$IFDEF ANDROID}
    procedure btnLerQrClick(Sender: TObject);
   {$ENDIF}
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ListaProdutosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure edtNomeFiltroClick(Sender: TObject);
    procedure btnExcluiProdutoClick(Sender: TObject);
    procedure ListaProdutosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnSalvaFotosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmarAClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure btnFotoHorimetroClick(Sender: TObject);
    procedure btnFotoBombaClick(Sender: TObject);
    procedure ActFotoDidFinishTaking(Image: TBitmap);
    procedure btnSalvarFotoClick(Sender: TObject);
    procedure Rectangle27Click(Sender: TObject);
    procedure btnImgClick(Sender: TObject);
    procedure cbxTipoAlertaChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmaAlertaClick(Sender: TObject);
    procedure btnConfirmaProdutoClick(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure btnFotoKMClick(Sender: TObject);
    procedure edtKmTyping(Sender: TObject);
    procedure edtHorimetroTyping(Sender: TObject);
    procedure edtLitrosTyping(Sender: TObject);
  private
    vLatitude,vLongitude:string;
    vTipoAlerta,vErro:integer;
    permissao : T99Permissions;
    FImageStream: TStringStream;
    {$IFDEF ANDROID}
    Location: TLocationCoord2D;
    FGeocoder: TGeocoder;
    Access_Fine_Location, Access_Coarse_Location : string;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
    procedure TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);

    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    
    procedure DisplayRationale(Sender: TObject;
              const APermissions: TArray<string>; const APostRationaleProc: TProc);

     procedure LocationPermissionRequestResult
                (Sender: TObject; const APermissions: TArray<string>;
                const AGrantResults: TArray<TPermissionStatus>);
    {$ENDIF}
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure GeraLista(vFiltro:string);
    procedure GeraListaProdutos(vIdAbastecimento,vFiltro:string);
    function  GeraFiltro:string;
    procedure LimpaCampos;
    procedure SalvarImagem(Bitmap: TBitmap);
    protected
     property ImageStream: TStringStream read FImageStream write FImageStream;
    procedure AfterConstruction; override;
    function BitmapFromBase64(const base64: string): TBitmap;
    function Base64FromBitmap(Bitmap: TBitmap): string;
    procedure InsertAbastecimento;
  public
    ClipService: IFMXClipboardService;
    Elapsed,vImgCapture,vAbriImg: integer;
    vIdMaquina,vIdLocalEstoque,vFiltro,vFlagSync,
    vIdAbastecimento,vIdProduto,vIdItemOutros,vILocalOrigem,vIdLocalDestino,
    vIdTransferencia,vIdCombustivel,vImg64Horimetro,vImg64Bomba,vImg64KM:string;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.fmx}

uses UPrincipal, Maquinas,ULocalEstoque,UProdutos,UDmDB, UnitCamera,
  UStartBomba, uFormat;

procedure TfrmAbastecimento.btnBuscarClick(Sender: TObject);
begin
 GeraLista(GeraFiltro);
end;

procedure TfrmAbastecimento.btnConfirmaAlertaClick(Sender: TObject);
begin
 if cbxTipoAlerta.ItemIndex=-1 then
 begin
   ShowMessage('Selecione um aleta!');
   Exit;
 end;
   case cbxTipoAlerta.ItemIndex of
     0:vTipoAlerta:=1;
     1:vTipoAlerta:=2;
     2:vTipoAlerta:=3;
     3:vTipoAlerta:=4;
   end;
 layAlerta.Visible := false;
end;

procedure TfrmAbastecimento.btnConfirmaProdutoClick(Sender: TObject);
begin
 if edtOutroProduto.Text.Length=0 then
 begin
   ShowMessage('Informe o Produto');
   Exit;
 end;
 if(edtQtdOutroProduto.Text.Length=0)or(edtQtdOutroProduto.Text='0') then
 begin
   ShowMessage('Informe a Quantidade');
   Exit;
 end;
 dmDB.TAbastecimentoOutrosidusuario.AsString       := dmDB.vIdUser;
 dmDB.TAbastecimentoOutrosidabastecimento.AsString := vIdAbastecimento;
 dmDB.TAbastecimentoOutrosidproduto.AsString       := vIdProduto;
 dmDB.TAbastecimentoOutrosquantidade.AsString      := StringReplace(edtQtdOutroProduto.Text,',','.',[rfReplaceAll]);
 try
   dmDB.TAbastecimentoOutros.ApplyUpdates(-1);
   ShowMessage('Produto Adicionado com Sucesso!');
   GeraListaProdutos(vIdAbastecimento,'');
   layNewOutros.Visible := false;
 except
   on E: Exception do
    ShowMessage('Erro ao salvar Produto:'+E.Message);
 end;
end;

procedure TfrmAbastecimento.btnConfirmarAClick(Sender: TObject);
var
 vVolumeF,vLitroF,vPescent,vKM,vHorimetro :double;
begin
 vErro       :=0;
 if edtMaquina.Text.Length=0 then
 begin
   ShowMessage('Informe a Maquina!!');
   edtMaquina.SetFocus;
   Exit;
 end;
 if edtLocalEstoque.Text.Length=0 then
 begin
   ShowMessage('Informe a Bomba!!');
   edtLocalEstoque.SetFocus;
   Exit;
 end;
 if edtCombustivel.Text.Length=0 then
 begin
   ShowMessage('Informe o Combustivel!!');
   edtCombustivel.SetFocus;
   Exit;
 end;
 if (edtLitros.Text.Length=0)OR(edtLitros.Text='0') then
 begin
   ShowMessage('Informe os Litros!!');
   edtHorimetro.SetFocus;
   Exit;
 end;
 if (vImg64Bomba.Length=0)then
  begin
   ShowMessage('Foto da Bomba é Obrigatoria!!');
   Exit;
  end;
  if(vImg64Horimetro.Length=0)then
  begin
   ShowMessage('Foto do Horímetro é Obrigatoria!!');
   Exit;
  end;
  if(vImg64KM.Length=0)AND(dmDB.TMaquinastipomedicao.AsInteger=2)then
  begin
   ShowMessage('Foto do KM é Obrigatoria!!');
   Exit;
  end;
  if (edtLatitude.Text.Length=0) or (edtLatitude.Text.Length=0) then
  begin
   ShowMessage('Aguarde capturando localização!');
   LocationSensor1.Active := true;
   Exit;
  end;
  if(lblVolumeLitro.Text.Length>0)and(lblVolumeLitro.Text<>'0') then
  begin
    vVolumeF := StrToFloat(lblVolumeLitro.Text);
    vLitroF  := StrToFloat(StringReplace(edtLitros.Text,'.','',[rfReplaceAll]));
    vPescent := (vLitroF*100)/vVolumeF;
    if vPescent>110 then
    begin
     vErro :=1;
     ShowMessage('Quantidade de litros não pode ser maior'+#13+
     'do que a capacidade do tanque da maquina + 10%');
     Exit;
    end;
  end;
  // checagem Horimetro Hodometro
  if dmDB.TMaquinastipomedicao.AsInteger=0 then // se for Horimetro
  begin
    if(edtHorimetro.Text.Length=0) then
    begin
     ShowMessage('Informe o Horimetro!!');
     edtHorimetro.SetFocus;
     Exit;
    end;
    vHorimetro := StrToFloat(StringReplace(edtHorimetro.Text,'.','',[rfReplaceAll]));
    if (vTipoAlerta=0)and(strToInt(lblUltimoHr.Text)>=vHorimetro) then
    begin
     vErro :=1;
     MessageDlg('Horímetro Atual não pode ser menor ou igual ao último'+#13+
     'Deseja Informar um alerta para prosseguir?', System.UITypes.TMsgDlgType.mtInformation,
     [System.UITypes.TMsgDlgBtn.mbYes,
     System.UITypes.TMsgDlgBtn.mbNo
     ], 0,
     procedure(const AResult: System.UITypes.TModalResult)
     begin
      case AResult of
       mrYES:
       begin
         layAlerta.Visible := true;
         Exit;
       end;
       mrNo:
        Exit;
      end;
     end);
    end;
    if vErro=0 then
    begin
      if (vTipoAlerta=0)and(vHorimetro-strToInt(lblUltimoHr.Text)>24) then
      begin
       vErro :=1;
       MessageDlg('Horímetro Atual não pode ser maior do que 24 horas do último registrado'+#13+
       'Deseja Informar um alerta para prosseguir?', System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
       ], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
        case AResult of
         mrYES:
         begin
           layAlerta.Visible := true;
           Exit;
         end;
         mrNo:
          Exit;
        end;
       end);
      end
    end;
  end; // fim checagem Horimetro

  if dmDB.TMaquinastipomedicao.AsInteger=1 then // se for Hodometro
  begin
    if(edtKM.Text.Length=0) then
    begin
     ShowMessage('Informe o KM!!');
     edtHorimetro.SetFocus;
     Exit;
    end;
    vKM := StrToFloat(StringReplace(edtKM.Text,'.','',[rfReplaceAll]));
    if(vTipoAlerta=0)and(strToInt(lblUltimokm.Text)>=vKM) then
    begin
      vErro :=1;
      MessageDlg('KM Atual não pode ser menor ou igual ao último'+#13+
      'Deseja Informar um alerta para prosseguir?', System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
       case AResult of
        mrYES:
        begin
          layAlerta.Visible := true;
          Exit;
        end;
        mrNo:
         Exit;
       end;
      end);
    end;
    if vErro=0 then
    begin
      if (vTipoAlerta=0)and((vKM-strToInt(lblUltimokm.Text))>600) then
      begin
        vErro :=1;
        MessageDlg('KM Atual não pode ser 600 km maior do que o último registrado?',
        System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbYes,
        System.UITypes.TMsgDlgBtn.mbNo
        ], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
         case AResult of
          mrYES:
          begin
            layAlerta.Visible := true;
            Exit;
          end;
          mrNo:
           Exit;
         end;
        end);
      end
    end;
  end;//Fim  checagem Hdometro
  if dmDB.TMaquinastipomedicao.AsInteger=2 then // se for Horimetro e Hodometro
  begin
    if(edtHorimetro.Text.Length=0) then
    begin
     ShowMessage('Informe o Horimetro!!');
     edtHorimetro.SetFocus;
     Exit;
    end;
    vHorimetro := StrToFloat(StringReplace(edtHorimetro.Text,'.','',[rfReplaceAll]));
    if (edtKM.Text.Length=0) then
    begin
     ShowMessage('Informe o KM!!');
     edtKM.SetFocus;
     Exit;
    end;
    vKM := StrToFloat(StringReplace(edtKM.Text,'.','',[rfReplaceAll]));
    if (vTipoAlerta=0)and(strToInt(lblUltimoHr.Text)>=vHorimetro) then
    begin
      vErro :=1;
      MessageDlg('Horímetro Atual não pode ser menor ou igual ao último'+#13+
      'Deseja Informar um alerta para prosseguir?', System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
       case AResult of
        mrYES:
        begin
          layAlerta.Visible := true;
          Exit;
        end;
        mrNo:
         Exit;
       end;
      end);
    end;
    if vErro=0 then
    begin
      if (vTipoAlerta=0)and((vHorimetro-strToInt(lblUltimoHr.Text))>24) then
      begin
       vErro :=1;
       MessageDlg('Horímetro Atual não pode ser maior do que 24 horas do último registrado'+#13+
       'Deseja Informar um alerta para prosseguir?', System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
       ], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
        case AResult of
         mrYES:
         begin
           layAlerta.Visible := true;
           Exit;
         end;
         mrNo:
          Exit;
        end;
       end);
      end;
    end;
    if vErro=0 then
    begin
      if(vTipoAlerta=0)and(strToInt(lblUltimokm.Text)>=vkM) then
      begin
       vErro :=1;
       MessageDlg('KM Atual não pode ser menor ou igual ao último'+#13+
       'Deseja Informar um alerta para prosseguir?', System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes,
       System.UITypes.TMsgDlgBtn.mbNo
       ], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
        case AResult of
         mrYES:
         begin
           layAlerta.Visible := true;
           Exit;
         end;
         mrNo:
          Exit;
        end;
       end);
      end;
      if (vTipoAlerta=0)and((vKM-strToInt(lblUltimokm.Text))>600) then
      begin
        vErro :=1;
        MessageDlg('KM Atual não pode ser 600 km maior do que o último registrado?',
        System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbYes,
        System.UITypes.TMsgDlgBtn.mbNo
        ], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
         case AResult of
          mrYES:
          begin
            layAlerta.Visible := true;
            Exit;
          end;
          mrNo:
           Exit;
         end;
        end);
      end
    end;
  end;
  if (vErro)=0 then
     InsertAbastecimento;
end;

procedure TfrmAbastecimento.btnExcluiItemClick(Sender: TObject);
begin
 btnExcluiItem.Visible := false;
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
       dmDB.DeletaAbastecimento(vIdAbastecimento);
       GeraLista('');
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

procedure TfrmAbastecimento.btnExcluiItemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnExcluiItem.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnExcluiItemMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnExcluiItem.Opacity :=1;
end;
procedure TfrmAbastecimento.btnExcluiProdutoClick(Sender: TObject);
begin
 btnExcluiProduto.Visible := false;
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
       dmDB.DeletaAbastecimentoOutros(vIdItemOutros);
       GeraListaProdutos(vIdAbastecimento,'');
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

procedure TfrmAbastecimento.btnFecharClick(Sender: TObject);
begin
 layAlerta.Visible := false;
end;

procedure TfrmAbastecimento.btnFotoBombaClick(Sender: TObject);
begin
vImgCapture:=2;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmAbastecimento.btnFotoHorimetroClick(Sender: TObject);
begin
vImgCapture:=1;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmAbastecimento.btnFotoKMClick(Sender: TObject);
begin
 vImgCapture:=3;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmAbastecimento.btnImgClick(Sender: TObject);
begin
 if vImg64Horimetro.Length>0 then
  imgHorimetro.Bitmap  := BitmapFromBase64(vImg64Horimetro)
 else
  imgHorimetro.Bitmap  := nil;

 if vImg64Horimetro.Length>0 then
  imgBomba.Bitmap  := BitmapFromBase64(vImg64Bomba)
 else
  imgBomba.Bitmap  := nil;

 if vImg64KM.Length>0 then
  imgFotoKM.Bitmap  := BitmapFromBase64(vImg64KM)
 else
  imgFotoKM.Bitmap  := nil;


 MudarAba(tbiImg,sender)
end;

procedure TfrmAbastecimento.btnLerQrClick(Sender: TObject);
begin
  FrmCamera.Show;
end;

procedure TfrmAbastecimento.btnNovoClick(Sender: TObject);
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
   LimpaCampos;
   edtLocalEstoque.Text    := dmDB.TStartbombaLocal.AsString;
   vIdLocalEstoque         := dmDB.TStartbombaidlocalestoque.AsString;
   vIdCombustivel          := dmDB.TStartbombacombustivel.AsString;
   edtCombustivel.Text     := dmDB.TStartbombaCombustivelNome.AsString;
   edtLocalEstoque.Enabled := false;
   edtCombustivel.Enabled  := false;
   layAlerta.Height        := 180;
   vAbriImg                := 0;
   vImg64Bomba             := '';
   vImg64Horimetro         := '';
   layBuscaMaquina.Height  := 60;
   lblPage.Text            := 'Novo Abastecimentos';
   dmDB.TAbastecimento.Insert;
   MudarAba(tbiCad,sender);
 end;
end;

procedure TfrmAbastecimento.btnNovoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnNovo.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnNovoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovo.Opacity :=1;
end;

procedure TfrmAbastecimento.btnNovoProdutoClick(Sender: TObject);
begin
  btnExcluiProduto.Visible    := false;
  edtOutroProduto.Text        :='';
  edtQtdOutroProduto.Text     :='0';
  layNewOutros.Visible        :=true;
  dmDB.AbrirAbastecimentoOutros(vIdAbastecimento,'');
  dmDB.TAbastecimentoOutros.Insert;
end;

procedure TfrmAbastecimento.btnNovoProdutoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   btnNovoProduto.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnNovoProdutoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovoProduto.Opacity :=1;
end;

procedure TfrmAbastecimento.btnSalvaFotosClick(Sender: TObject);
begin
 MudarAba(tbiCad,sender)
end;

procedure TfrmAbastecimento.btnSalvarFotoClick(Sender: TObject);
begin
 if not imgHorimetro.Bitmap.IsEmpty then
   vImg64Horimetro := Base64FromBitmap(imgHorimetro.Bitmap);

 if not imgBomba.Bitmap.IsEmpty then
   vImg64Bomba := Base64FromBitmap(imgBomba.Bitmap);

 if not imgFotoKM.Bitmap.IsEmpty then
   vImg64KM := Base64FromBitmap(imgFotoKM.Bitmap);

 MudarAba(tbiCad,sender);
end;

procedure TfrmAbastecimento.ActFotoDidFinishTaking(Image: TBitmap);
begin
  if vImgCapture=1 then
  begin
   imgHorimetro.Bitmap.Assign(Image);
   Exit;
  end;
  if vImgCapture=2 then
  begin
   imgBomba.Bitmap.Assign(Image);
   Exit;
  end;
  if vImgCapture=3 then
  begin
   imgFotoKM.Bitmap.Assign(Image);
   Exit;
  end;
end;

procedure TfrmAbastecimento.AfterConstruction;
begin
  inherited;
  Self.ImageStream := TStringStream.Create;
end;



function TfrmAbastecimento.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.Resize(300,300);
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

function TfrmAbastecimento.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfrmAbastecimento.SalvarImagem(Bitmap: TBitmap);
var
  objSurf: TBitmapSurface;
begin
  objSurf   := TBitmapSurface.Create;
  try
   Self.ImageStream.Clear;
   objSurf.Assign(Bitmap);

   if not TBitmapCodecManager.SaveToStream(Self.ImageStream, objSurf, '.jpg') then
    raise EBitmapSavingFailed.Create('Error saving Bitmap to jpg');
  finally
   objSurf.Free;
  end;
end;

procedure TfrmAbastecimento.TakePicturePermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
 if (Length(AGrantResults) = 3) and
   (AGrantResults[0] = TPermissionStatus.Granted) and
   (AGrantResults[1] = TPermissionStatus.Granted) and
   (AGrantResults[2] = TPermissionStatus.Granted) then
        ActFoto.Execute
 else
  TDialogService.ShowMessage('Você não tem permissão para tirar fotos');
end;

procedure TfrmAbastecimento.btnVoltar1Click(Sender: TObject);
begin
 begin
   MessageDlg('Deseja Realmente Sair dessa Tela?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       Close;
     end;
     mrNo:
    end;
   end);
 end
end;

procedure TfrmAbastecimento.btnVoltar1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnVoltar1.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnVoltar1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnVoltar1.Opacity :=1;
end;

procedure TfrmAbastecimento.btnVoltar2Click(Sender: TObject);
begin
  MudarAba(tbiLista,sender);
end;

procedure TfrmAbastecimento.btnVoltarClick(Sender: TObject);
begin
 if tbPrincipal.TabIndex =1 then
 begin
  tbPrincipal.ActiveTab := tbiLista;
  Exit;
 end;
 if tbPrincipal.TabIndex >1 then
 begin
  tbPrincipal.ActiveTab := tbiCad;
  Exit;
 end;
 if tbPrincipal.TabIndex=0 then
 begin
  Close;
 end;

end;

procedure TfrmAbastecimento.btnVoltarProdutoClick(Sender: TObject);
begin
  layNewOutros.Visible := false;
  btnExcluiProduto.Visible   := false;
  tbPrincipal.ActiveTab   := tbiLista;
end;

procedure TfrmAbastecimento.btnVoltarProdutoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
    btnVoltarProduto.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnVoltarProdutoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   btnVoltarProduto.Opacity :=1;
end;

procedure TfrmAbastecimento.cbxTipoAlertaChange(Sender: TObject);
begin
 if cbxTipoAlerta.ItemIndex=4 then
  layAlerta.Height:=275
 else
 begin

 end;

end;

{$IFDEF ANDROID}

procedure TfrmAbastecimento.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage('O app precisa acessar a câmera e as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
   APostProc;
  end);
end;

procedure TfrmAbastecimento.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
 TDialogService.ShowMessage('O app precisa acessar as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
    APostProc;
  end);
end;

procedure TfrmAbastecimento.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
var
  I: Integer;
  RationaleMsg: string;
begin
  for I := 0 to High(APermissions) do
  begin
    if (APermissions[I] = Access_Coarse_Location) or (APermissions[I] = Access_Fine_Location) then
      RationaleMsg := 'O app precisa de acesso ao GPS para obter sua localização'
  end;
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

{$ENDIF}

procedure TfrmAbastecimento.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;



procedure TfrmAbastecimento.Rectangle27Click(Sender: TObject);
begin
  layImgHorimetro.Enabled := true;
  btnSalvarFoto.Enabled   := true;
  if vAbriImg=0 then
   MudarAba(tbiCad,sender)
  else
   MudarAba(tbilista,sender)
end;

procedure TfrmAbastecimento.tbPrincipalChange(Sender: TObject);
begin
 case tbPrincipal.TabIndex of
  0:lblPage.Text            := 'Abastecimentos';
  1:lblPage.Text            := 'Novo Abastecimentos';
  2:lblPage.Text            := 'Fotos Anastecimento';
  3:lblPage.Text            := 'Outros Produtos';
  4:lblPage.Text            := 'Leitor de Qr Code';
 end;
end;

procedure TfrmAbastecimento.EditButton1Click(Sender: TObject);
begin
  if not Assigned(frmLocalEstoque) then
   Application.CreateForm(TfrmLocalEstoque,frmLocalEstoque);
    frmLocalEstoque.Show;
end;

procedure TfrmAbastecimento.EditButton3Click(Sender: TObject);
begin
 if not Assigned(frmprodutos) then
   Application.CreateForm(Tfrmprodutos,frmprodutos);
    frmprodutos.Show;
end;

procedure TfrmAbastecimento.EditButton4Click(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(Self);
  try
    frmprodutos.vAbastecimento :=1;
    frmProdutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdCombustivel          := dmDB.vIdProduto;
      edtCombustivel.Text     := dmDB.vNomeProduto;
    end);
  finally
    frmProdutos.free;
  end;
end;

procedure TfrmAbastecimento.btnBuscarMaquinaClick(Sender: TObject);
begin
  frmMaquinas := TfrmMaquinas.Create(Self);
  try
    frmMaquinas.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtMaquina.Text   := dmDB.vMarcaModelo;
      vIdMaquina        := dmDB.vIdMaquinaSel;
    end);
  finally
    frmMaquinas.free;
  end;
end;

procedure TfrmAbastecimento.edtHorimetroTyping(Sender: TObject);
begin
 formatar(edtHorimetro,TFormato.Valor);
end;

procedure TfrmAbastecimento.edtKmTyping(Sender: TObject);
begin
 formatar(edtKm,TFormato.Valor);
end;

procedure TfrmAbastecimento.edtLitrosTyping(Sender: TObject);
begin
 formatar(edtLitros,TFormato.ValorDecimal);
end;

procedure TfrmAbastecimento.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
  GeraListaProdutos(vIdAbastecimento,
   'and produto like '+QuotedStr('%'+edtNomeFiltro.Text+'%'))
 else
   GeraListaProdutos(vIdAbastecimento,'');
end;

procedure TfrmAbastecimento.edtNomeFiltroClick(Sender: TObject);
begin
 btnExcluiProduto.Visible   := false;
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
 permissao               := T99Permissions.Create;
  if NOT permissao.VerifyCameraAccess then
   permissao.Camera(nil, nil);
 {$IFDEF ANDROID}
  if not TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipService)) then
   ClipService := nil;
  Elapsed := 0;
  Access_Coarse_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
  Access_Fine_Location   := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
  PermissionsService.RequestPermissions([Access_Coarse_Location,
                                                       Access_Fine_Location],
                                                       LocationPermissionRequestResult,
                                                       DisplayRationale);
  PermissaoCamera       := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage  := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);

 {$ENDIF}
end;

procedure TfrmAbastecimento.FormDestroy(Sender: TObject);
begin
 permissao.DisposeOf;
end;

procedure TfrmAbastecimento.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
 if Key = vkHardwareBack then
 begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
    KeyboardService.HideVirtualKeyboard;
   key := 0;
 end;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
 RecImgHrimetro.Height   := (frmAbastecimento.Height/3)-50;
 RecImgBomba.Height      := (frmAbastecimento.Height/3)-50;
 RecImgBomba.Height      := (frmAbastecimento.Height/3)-50;
 layNewOutros.Width      := frmAbastecimento.Width-20;
 layAlerta.Width         := frmAbastecimento.Width-20;
 layBuscaMaquina.Height  := 60;
 lblPage.Text            := 'Abastecimentos';
 layNewOutros.Visible    := false;
 btnExcluiItem.Visible   := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbiLista;
 GeraLista('');
end;

function TfrmAbastecimento.GeraFiltro:string;
begin
 vFiltro :='';
 if edtMaquinaF.Text.Length>0 then
 begin
   vFiltro := vFiltro+' and dataabastecimento='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
   vFiltro := vFiltro+' and Maquina like '+QuotedStr('%'+edtMaquinaF.Text+'%')
 end
 else
 begin
   vFiltro := vFiltro+' and dataabastecimento='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
 end;
 Result :=vFiltro;
end;

procedure TfrmAbastecimento.GeraLista(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbrirAbastecimento(vFiltro);
 dmDB.TAbastecimento.First;
 Lista.Items.Clear;
 while not dmDB.TAbastecimento.eof do
 begin
   item := Lista.Items.Add;
   with frmAbastecimento do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TAbastecimentoMaquina.AsString;
       txt.TagString := dmDB.TAbastecimentoid.AsString;

       txt           := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text      := 'Data: ';
       txt           := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text      := dmDB.TAbastecimentodataabastecimento.AsString;
       txt.TagString := dmDB.TAbastecimentosyncaws.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Hora: ';
       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dmDB.TAbastecimentohora.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Horímetro: ';
       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TAbastecimentohorimetro.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text17'));
       txt.Text := 'KM: ';
       txt      := TListItemText(Objects.FindDrawable('Text18'));
       txt.Text := dmDB.TAbastecimentokmatual.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Bomba: ';
       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dmDB.TAbastecimentoLocalEstoque.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Combustivel: ';
       txt.TagString := dmDB.TAbastecimentoimg.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dmDB.TAbastecimentoCombustivelNome.AsString;
       txt.TagString := dmDB.TAbastecimentoimg2.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text14'));
       txt.Text := 'Litros: ';
       txt      := TListItemText(Objects.FindDrawable('Text15'));
       txt.Text := dmDB.TAbastecimentovolumelt.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text16'));
       txt.Text := 'Outros Produtos';


       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgCobustivel.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image11'));
       img.Bitmap     := frmPrincipal.imgProdutos2.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image19'));
       img.Bitmap     := frmPrincipal.imgRecLista.Bitmap;
       img.TagString  := dmDB.TAbastecimentoimg.AsString;//img horimetro

       img := TListItemImage(Objects.FindDrawable('Image21'));
       img.Bitmap     := frmPrincipal.ImgCam2.Bitmap;
       txt      := TListItemText(Objects.FindDrawable('Text20'));
       txt.Text := 'Fotos';

       img.TagString  := dmDB.TAbastecimentoimg2.AsString;//img bomba
     end;
     dmDB.TAbastecimento.Next;
   end;
 end;
end;

procedure TfrmAbastecimento.GeraListaProdutos(vIdAbastecimento,
  vFiltro: string);
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
    dmDB.AbrirAbastecimentoOutros(vIdAbastecimento,vFiltro);
    ListaProdutos.Items.Clear;
    while not dmDb.TAbastecimentoOutros.eof do
     begin
       item := ListaProdutos.Items.Add;
         with frmAbastecimento do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TAbastecimentoOutrosid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TAbastecimentoOutrosProduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Qtde:';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TAbastecimentoOutrosquantidade.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap := frmPrincipal.imgSeed.Bitmap;

           end;
           dmDB.TAbastecimentoOutros.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmAbastecimento.Image18Click(Sender: TObject);
begin
 layNewOutros.Visible := false;
end;

procedure TfrmAbastecimento.InsertAbastecimento;
var
 vKM,vHorimetro:double;
begin
  if edtKM.Text.Length>0 then
   vKM := StrToFloat(StringReplace(edtKM.Text,'.','',[rfReplaceAll]));
  if edtHorimetro.Text.Length>0 then
   vHorimetro := StrToFloat(StringReplace(edtHorimetro.Text,'.','',[rfReplaceAll]));

  dmdb.TAbastecimento.Insert;
  dmdb.TAbastecimentoid.AsInteger                       := dmDB.RetornaIdAbastecimento;
  dmdb.TAbastecimentoidmaquina.AsString                 := vIdMaquina;
  dmdb.TAbastecimentoidusuario.AsString                 := dmDB.vIdUser;
  dmdb.TAbastecimentoidlocalestoque.AsString            := vIdLocalEstoque;
  dmdb.TAbastecimentocombustivel.AsString               := vIdCombustivel;
  dmdb.TAbastecimentodataabastecimento.AsDateTime       := edtData.DateTime;
  dmdb.TAbastecimentohora.AsDateTime                    := edtHora.DateTime;
  dmdb.TAbastecimentovolumelt.AsFloat                   := StrToFloat(edtLitros.Text);
  dmdb.TAbastecimentoimg.AsString                       := vImg64Horimetro;
  dmdb.TAbastecimentoimg2.AsString                      := vImg64Bomba;
  if vImg64KM.Length>0 then
   dmdb.TAbastecimentoimg3.AsString                     := vImg64KM;

  dmdb.TAbastecimentolatitude.AsString                  := edtLatitude.Text;
  dmdb.TAbastecimentolongitude.AsString                 := edtLongitude.Text;
  dmdb.TAbastecimentoidcentrocusto.AsString             := dmDB.vIdCentroCusto;
  if edtHorimetro.Text.Length>0 then
   dmdb.TAbastecimentohorimetro.AsFloat                 := vHorimetro;
  if edtKM.Text.Length>0 then
   dmdb.TAbastecimentokmatual.AsFloat                   := vKM;
  dmdb.TAbastecimentoalerta.AsInteger                   := vTipoAlerta;
  try
   dmdb.TAbastecimento.ApplyUpdates(-1);
   ShowMessage('Abastecimento Adicionada com sucesso!!');
   GeraLista('');
   tbPrincipal.ActiveTab := tbiLista;
  except
   on E: Exception do
    ShowMessage('Erro ao salvar Abastecimento:'+E.Message);
  end;
end;

procedure TfrmAbastecimento.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
 if (Length(AGrantResults) = 2) and
  (AGrantResults[0] = TPermissionStatus.Granted) and
  (AGrantResults[1] = TPermissionStatus.Granted) then
   ActLibrary.Execute
  else
   TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');
end;

procedure TfrmAbastecimento.LimpaCampos;
begin
  edtMaquina.Text          := '';
  edtLocalEstoque.Text     := '';
  edtLitros.text           := '';
  edtHorimetro.text        := '';
  edtKM.text               := '';
  edtData.Date             := date;
  edtHora.DateTime         := now;
  edtCombustivel.Text      := '';
  edtLatitude.Text         := '';
  edtLongitude.Text        := '';
  vTipoAlerta              := 0;
  layAlerta.Visible        := false;
  vImg64Horimetro          := '';
  vImg64Bomba              := '';
  vImg64KM                 := '';
end;

procedure TfrmAbastecimento.ListaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 btnExcluiItem.Visible   := true;
end;

procedure TfrmAbastecimento.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 vStream    : TMemoryStream;
begin
  vIdAbastecimento   := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
  vFlagSync          := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;

  vImg64Horimetro      := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text12').TagString;
  vImg64Bomba          := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text13').TagString;

  if ItemObject is TListItemImage then
  begin
    if TListItemImage(ItemObject).Name='Image11' then
    begin
     btnExcluiProduto.Visible   := false;
     GeraListaProdutos(vIdAbastecimento,vFiltro);
     MudarAba(tbiProdutos,sender);
     Exit;
    end;

    if TListItemImage(ItemObject).Name='Image21' then
    begin
     vAbriImg                 :=1;
     btnExcluiProduto.Visible := false;
     layImgHorimetro.Enabled  := false;
     btnSalvarFoto.Enabled    := false;

     if vImg64Horimetro.Length>0 then
      imgHorimetro.Bitmap  := BitmapFromBase64(vImg64Horimetro)
     else
      imgHorimetro.Bitmap  := nil;

     if vImg64Horimetro.Length>0 then
      imgBomba.Bitmap  := BitmapFromBase64(vImg64Bomba)
     else
      imgBomba.Bitmap  := nil;

     if vImg64KM.Length>0 then
      imgFotoKM.Bitmap  := BitmapFromBase64(vImg64KM)
     else
      imgFotoKM.Bitmap  := nil;


     MudarAba(tbiImg,sender)
    end;
  end;
end;

procedure TfrmAbastecimento.ListaProdutosGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  btnExcluiProduto.Visible   := true;
end;

procedure TfrmAbastecimento.ListaProdutosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdItemOutros   := TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
  ('Text14').Text;
end;

procedure TfrmAbastecimento.LocationPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
var
         x : integer;
begin
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
  begin
    LocationSensor1.Active := true;
  end
  else
  begin
    TDialogService.ShowMessage
      ('Não é possível acessar o GPS porque o app não possui acesso');
    vLatitude  := 'Sem Permissão';
    vLongitude := 'Sem Permissão';
  end;
end;

procedure TfrmAbastecimento.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
 edtLatitude.Text  := Format('%2.6f', [NewLocation.Latitude]);
 edtLongitude.Text := Format('%2.6f', [NewLocation.Longitude]);
end;

end.
