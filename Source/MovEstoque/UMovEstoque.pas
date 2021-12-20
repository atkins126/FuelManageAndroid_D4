unit UMovEstoque;

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
    tbiImg: TTabItem;
    layImgHorimetro: TLayout;
    Rectangle26: TRectangle;
    VertScrollBox1: TVertScrollBox;
    layFotoHorimetro: TLayout;
    RecImgHrimetro: TRectangle;
    imgTanque: TImage;
    btnFotoHorimetro: TRectangle;
    Image12: TImage;
    Label8: TLabel;
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
    btnImg: TRectangle;
    Image17: TImage;
    Label33: TLabel;
    ActionList1: TActionList;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActFoto: TTakePhotoFromCameraAction;
    Layout8: TLayout;
    Rectangle6: TRectangle;
    ImgTanqueFim: TImage;
    btnFotoTotalizadorFinal: TRectangle;
    Image2: TImage;
    Label5: TLabel;
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
    procedure btnImgClick(Sender: TObject);
    procedure btnFotoHorimetroClick(Sender: TObject);
    procedure btnSalvarFotoClick(Sender: TObject);
    procedure Rectangle27Click(Sender: TObject);
    procedure btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnBuscarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActFotoDidFinishTaking(Image: TBitmap);
    procedure btnFotoTotalizadorFinalClick(Sender: TObject);
    procedure edtLitrosTyping(Sender: TObject);
  private
    vFiltro,vFlagSync,vIdTransferencia :String;
    permissao : T99Permissions;

    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure GerarLista(vFiltro:string);
    procedure LimpaCampos;
    function BitmapFromBase64(const base64: string): TBitmap;
    function Base64FromBitmap(Bitmap: TBitmap): string;
    {$IFDEF ANDROID}
    var Access_Fine_Location, Access_Coarse_Location : string;
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

  public
    vAbriImg,vImgCapture,vEditImg:integer;
    vIdLocalOrigem,vIdLocalDestino,vIdProduto ,vImg64Tanque,vImg64TanqueFim:String;
  end;

var
  frmMovEstoque: TfrmMovEstoque;

implementation

{$R *.fmx}

uses UPrincipal, UDmDB, ULocalEstoque, uFormat;

procedure TfrmMovEstoque.ActFotoDidFinishTaking(Image: TBitmap);
begin
 if vImgCapture=1 then
  imgTanque.Bitmap.Assign(Image);
 if vImgCapture=2 then
  ImgTanqueFim.Bitmap.Assign(Image);
end;

function TfrmMovEstoque.Base64FromBitmap(Bitmap: TBitmap): string;
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

function TfrmMovEstoque.BitmapFromBase64(const base64: string): TBitmap;
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

procedure TfrmMovEstoque.btnBuscarClick(Sender: TObject);
begin
 GerarLista('');
end;

procedure TfrmMovEstoque.btnBuscarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity :=1;
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
 if (vImg64Tanque.Length=0)then
  begin
  ShowMessage('Foto do Totalizador Inicial é Obrigatoria!!');
  Exit;
 end;
 if (vImg64TanqueFim.Length=0)then
  begin
  ShowMessage('Foto do Totalizador Final é Obrigatoria!!');
  Exit;
 end;
 dmDB.TMovLocalEstoque.Insert;
 if vImg64Tanque.Length>0 then
   dmdb.TMovLocalEstoqueimg.AsString                 := vImg64Tanque;
 if vImg64TanqueFim.Length>0 then
   dmdb.TMovLocalEstoqueimgfim.AsString              := vImg64TanqueFim;
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

procedure TfrmMovEstoque.btnFotoHorimetroClick(Sender: TObject);
begin
 {$IFDEF ANDROID}
  vImgCapture:=1;
  if vAbriImg=1 then
   vEditImg:=1
  else
   vEditImg:=0;

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

procedure TfrmMovEstoque.btnFotoTotalizadorFinalClick(Sender: TObject);
begin
  {$IFDEF ANDROID}
  vImgCapture:=2;
  if vAbriImg=1 then
   vEditImg:=1
  else
   vEditImg:=0;
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

{$IFDEF ANDROID}

procedure TfrmMovEstoque.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage('O app precisa acessar a câmera e as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
   APostProc;
  end);
end;

procedure TfrmMovEstoque.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
 TDialogService.ShowMessage('O app precisa acessar as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
    APostProc;
  end);
end;

procedure TfrmMovEstoque.DisplayRationale(Sender: TObject;
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


procedure TfrmMovEstoque.btnImgClick(Sender: TObject);
begin
 if vImg64Tanque.Length>0 then
  imgTanque.Bitmap  := BitmapFromBase64(vImg64Tanque)
 else
  imgTanque.Bitmap  := nil;
 MudarAba(tbiImg,sender)
end;

procedure TfrmMovEstoque.btnNovoClick(Sender: TObject);
begin
 vAbriImg     :=0;
 vEditImg     :=0;
 vImg64Tanque :='';
 vFiltro := ' and s.dataastart='+FormatDateTime('yyyy-mm-dd',date).QuotedString;
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

procedure TfrmMovEstoque.btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity :=0.5;
end;

procedure TfrmMovEstoque.btnSalvarFotoClick(Sender: TObject);
begin
 if not imgTanque.Bitmap.IsEmpty then
   vImg64Tanque := Base64FromBitmap(imgTanque.Bitmap);

 if not ImgTanqueFim.Bitmap.IsEmpty then
   vImg64TanqueFim := Base64FromBitmap(ImgTanqueFim.Bitmap);

 if (vAbriImg=1)and(vEditImg=1) then
  dmDB.AtualizaImagemTransferencia(vIdTransferencia, vImg64Tanque,
   vImg64TanqueFim);

 MudarAba(tbiCad,sender);
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

procedure TfrmMovEstoque.edtLitrosTyping(Sender: TObject);
begin
   formatar(edtLitros,TFormato.ValorDecimal);
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

procedure TfrmMovEstoque.Rectangle27Click(Sender: TObject);
begin
  layImgHorimetro.Enabled := true;
  btnSalvarFoto.Enabled   := true;
  if vAbriImg=0 then
   MudarAba(tbiCad,sender)
  else
   MudarAba(tbilista,sender)
end;

procedure TfrmMovEstoque.TakePicturePermissionRequestResult(Sender: TObject;
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

procedure TfrmMovEstoque.FormCreate(Sender: TObject);
begin
permissao               := T99Permissions.Create;
  if NOT permissao.VerifyCameraAccess then
   permissao.Camera(nil, nil);
 {$IFDEF ANDROID}
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

procedure TfrmMovEstoque.FormDestroy(Sender: TObject);
begin
 permissao.DisposeOf;
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
 dmDB.AbrirTrasnferencia(edtDataF.Date);
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
       txt.TagString := dmDB.TMovLocalEstoqueimg.AsString;

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

       img := TListItemImage(Objects.FindDrawable('Image11'));
       img.Bitmap     := frmPrincipal.ImgCam2.Bitmap;


     end;
     dmDB.TMovLocalEstoque.Next;
   end;
 end;
end;

procedure TfrmMovEstoque.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin

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
   ('Text6').TagString;
  vImg64Tanque:=
  TAppearanceListViewItem(listaTranferencia.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').TagString;

  if ItemObject is TListItemImage then
  begin
    if TListItemImage(ItemObject).Name='Image11' then
    begin
     vAbriImg                 :=1;
     if vFlagSync='1' then
     begin
      layImgHorimetro.Enabled  := false;
      btnSalvarFoto.Enabled    := false;
     end
     else
     begin
      layImgHorimetro.Enabled  := true;
      btnSalvarFoto.Enabled    := true;
     end;

     if vImg64Tanque.Length>0 then
      imgTanque.Bitmap  := BitmapFromBase64(vImg64Tanque)
     else
      imgTanque.Bitmap  := nil;

     if vImg64TanqueFim.Length>0 then
      ImgTanqueFim.Bitmap  := BitmapFromBase64(vImg64TanqueFim)
     else
      ImgTanqueFim.Bitmap  := nil;

     MudarAba(tbiImg,sender)
    end;
  end;




end;

procedure TfrmMovEstoque.LocationPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin

end;

procedure TfrmMovEstoque.tbPrincipalChange(Sender: TObject);
begin
  if tbPrincipal.TabIndex=0 then
   lblPage.Text :='Lista de Transferência';
  if tbPrincipal.TabIndex=1 then
   lblPage.Text :='Cadastro Transferência';
end;

end.
