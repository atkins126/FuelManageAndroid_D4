unit UnitCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.CodeReader, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Android.Permissions, FMX.Layouts;

type
  TFrmCamera = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    Label1: TLabel;
    btnVoltar: TRectangle;
    Image17: TImage;
    Label19: TLabel;
    AndroidPermissions1: TAndroidPermissions;
    CodeReader1: TCodeReader;
    procedure CodeReader1CodeReady(aCode: string);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigo : string;
  end;

var
  FrmCamera: TFrmCamera;

implementation

{$R *.fmx}

uses UAbastecimento, UDmDB;

procedure TFrmCamera.btnVoltarClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmCamera.CodeReader1CodeReady(aCode: string);
begin
  codigo := aCode;
 if codigo.Length>0 then
 begin
   if dmDB.AbriMaquinaPrefixo(codigo) then
   begin
     frmAbastecimento.layBuscaMaquina.Height       := 60;
     frmAbastecimento.lblUltimoKM.Text             :='';
     frmAbastecimento.lblUltimoHr.Text             :='';
     frmAbastecimento.lblUltimoAbastecimento.Text  :='';
     frmAbastecimento.lblVolumeLitro.Text          :='';
     ShowMessage('Maquina Não Encontrado');
     frmAbastecimento.edtMaquina.Text :='';
     Exit;
   end
   else
   begin
    frmAbastecimento.vIdMaquina                   := dmDB.TMaquinasid.AsString;
    frmAbastecimento.layBuscaMaquina.Height       := 135;
    frmAbastecimento.edtMaquina.Text              := dmDB.TMaquinasprefixo.AsString;
    dmDB.RetornaUltimoKMHorimetro(dmDB.TMaquinasid.AsString);
    frmAbastecimento.lblUltimoKM.Text             := dmDB.vUltimoKM;
    frmAbastecimento.lblUltimoHr.Text             := dmDB.vUltimoHorimetro;
    frmAbastecimento.lblUltimoAbastecimento.Text  := dmDB.TMaquinasultimoabastecimento.AsString;
    frmAbastecimento.lblVolumeLitro.Text          := dmDB.TMaquinasvolumetanque.AsString;
    case dmDB.TMaquinastipomedicao.AsInteger of
     0:begin
        frmAbastecimento.edtHorimetro.Enabled :=true;
        frmAbastecimento.edtkm.Enabled        :=false;
       end;
     1:begin
        frmAbastecimento.edtHorimetro.Enabled :=false;
        frmAbastecimento.edtkm.Enabled        :=true;
       end;
     2:begin
        frmAbastecimento.edtHorimetro.Enabled :=true;
        frmAbastecimento.edtkm.Enabled        :=true;
       end;
    end;
    Close;
   end;
 end;
end;

procedure TFrmCamera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CodeReader1.Stop;
end;

procedure TFrmCamera.FormShow(Sender: TObject);
begin
 CodeReader1.Start
end;

end.
