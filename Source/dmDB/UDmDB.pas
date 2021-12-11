unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,System.IOUtils,FMX.Dialogs,
  FireDAC.Phys.SQLiteWrapper.Stat,StrUtils;

type
  TdmDB = class(TDataModule)
    qryControAcces: TFDQuery;
    FCon: TFDConnection;
    qryControAccesid: TFDAutoIncField;
    qryControAccesusuario: TWideStringField;
    qryControAccesdata_access: TDateTimeField;
    qryControAccessenha: TStringField;
    qryConfig: TFDQuery;
    qryConfigIP_SERVIDOR: TWideStringField;
    qryConfigPOTA_SERVIDOR: TIntegerField;
    qryConfigSERIAL: TWideStringField;
    qryConfigSalvarLogin: TIntegerField;
    TAbastecimento: TFDQuery;
    TAbastecimentoOutros: TFDQuery;
    TAbastecimentoOutrosstatus: TWideStringField;
    TAbastecimentoOutrosdatareg: TWideStringField;
    TAbastecimentoOutrosidusuario: TWideStringField;
    TAbastecimentoOutrosdataalteracao: TWideStringField;
    TAbastecimentoOutrosidusuarioalteracao: TWideStringField;
    TAbastecimentoOutrosidabastecimento: TWideStringField;
    TAbastecimentoOutrosidproduto: TWideStringField;
    TAbastecimentoOutrosquantidade: TBCDField;
    TAbastecimentoOutrossyncaws: TWideStringField;
    TAbastecimentoOutrossyncfaz: TWideStringField;
    TAbastecimentoOutrosProduto: TStringField;
    TLocalEstoque: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TWideStringField;
    TLocalEstoquedatareg: TWideStringField;
    TLocalEstoqueidusuario: TWideStringField;
    TLocalEstoquedataalteracao: TWideStringField;
    TLocalEstoqueidusuarioalteracao: TWideStringField;
    TLocalEstoquenome: TStringField;
    TLocalEstoquecapacidade: TBCDField;
    TLocalEstoquesyncaws: TWideStringField;
    TLocalEstoqueidcentrocusto: TWideStringField;
    TStartbomba: TFDQuery;
    TStartbombaid: TFDAutoIncField;
    TStartbombastatus: TWideStringField;
    TStartbombadatareg: TWideStringField;
    TStartbombaidusuario: TWideStringField;
    TStartbombadataalteracao: TWideStringField;
    TStartbombaidusuarioalteracao: TWideStringField;
    TStartbombaidlocalestoque: TWideStringField;
    TStartbombaidcentrocusto: TWideStringField;
    TStartbombacombustivel: TWideStringField;
    TStartbombadataastart: TDateField;
    TStartbombahorastart: TTimeField;
    TStartbombadataaend: TDateField;
    TStartbombahoraend: TTimeField;
    TStartbombasyncaws: TWideStringField;
    TStartbombavolumelitrosIni: TBCDField;
    TStartbombaobs: TStringField;
    TStartbombaimgStart: TWideMemoField;
    TStartbombaimgEnd: TWideMemoField;
    TStartbombavolumelitrosFim: TBCDField;
    TStartbombaLocal: TStringField;
    TStartbombaCombustivelNome: TStringField;
    TStartBombaInsert: TFDQuery;
    TStartBombaInsertid: TFDAutoIncField;
    TStartBombaInsertstatus: TWideStringField;
    TStartBombaInsertdatareg: TWideStringField;
    TStartBombaInsertidusuario: TWideStringField;
    TStartBombaInsertdataalteracao: TWideStringField;
    TStartBombaInsertidusuarioalteracao: TWideStringField;
    TStartBombaInsertidlocalestoque: TWideStringField;
    TStartBombaInsertidcentrocusto: TWideStringField;
    TStartBombaInsertcombustivel: TWideStringField;
    TStartBombaInsertdataastart: TDateField;
    TStartBombaInserthorastart: TTimeField;
    TStartBombaInsertdataaend: TDateField;
    TStartBombaInserthoraend: TTimeField;
    TStartBombaInsertsyncaws: TWideStringField;
    TStartBombaInsertvolumelitrosIni: TBCDField;
    TStartBombaInsertobs: TStringField;
    TStartBombaInsertimgStart: TWideMemoField;
    TStartBombaInsertimgEnd: TWideMemoField;
    TStartBombaInsertvolumelitrosFim: TBCDField;
    TMaquinas: TFDQuery;
    TMaquinasid: TIntegerField;
    TMaquinasstatus: TWideStringField;
    TMaquinasdatareg: TWideStringField;
    TMaquinasidusuario: TWideStringField;
    TMaquinasdataalteracao: TWideStringField;
    TMaquinasidusuarioalteracao: TWideStringField;
    TMaquinasidmarca: TWideStringField;
    TMaquinasmodelo: TStringField;
    TMaquinasplaca: TStringField;
    TMaquinasano: TWideStringField;
    TMaquinaschassi: TStringField;
    TMaquinasidcombustivel: TWideStringField;
    TMaquinasimg: TWideStringField;
    TMaquinasprefixo: TStringField;
    TMaquinassyncaws: TWideStringField;
    TMaquinassyncfaz: TWideStringField;
    TMaquinasultimoabastecimento: TDateField;
    TMaquinashorimetroultimarev: TBCDField;
    TMaquinashorimetroatual: TBCDField;
    TMaquinasqrcode: TStringField;
    TMaquinasidgrupo: TWideStringField;
    TMaquinaskmatual: TBCDField;
    qryAux: TFDQuery;
    Tauxatividadeabastecimento: TFDQuery;
    Tauxatividadeabastecimentoid: TIntegerField;
    Tauxatividadeabastecimentostatus: TWideStringField;
    Tauxatividadeabastecimentodatareg: TWideStringField;
    Tauxatividadeabastecimentoidusuario: TWideStringField;
    Tauxatividadeabastecimentodataalteracao: TWideStringField;
    Tauxatividadeabastecimentoidusuarioalteracao: TWideStringField;
    Tauxatividadeabastecimentonome: TStringField;
    Tauxatividadeabastecimentosyncaws: TWideStringField;
    TOperadorMaquina: TFDQuery;
    TOperadorMaquinaid: TIntegerField;
    TOperadorMaquinastatus: TWideStringField;
    TOperadorMaquinadatareg: TWideStringField;
    TOperadorMaquinaidusuario: TWideStringField;
    TOperadorMaquinadataalteracao: TWideStringField;
    TOperadorMaquinaidusuarioalteracao: TWideStringField;
    TOperadorMaquinanome: TStringField;
    TOperadorMaquinarg: TStringField;
    TOperadorMaquinacpf: TStringField;
    TOperadorMaquinacnh: TStringField;
    TOperadorMaquinacelular: TStringField;
    TOperadorMaquinasyncaws: TWideStringField;
    TOperadorMaquinasyncfaz: TWideStringField;
    TProdutos: TFDQuery;
    TProdutosid: TIntegerField;
    TProdutosstatus: TWideStringField;
    TProdutosdatareg: TWideStringField;
    TProdutosidusuario: TWideStringField;
    TProdutosdataalteracao: TWideStringField;
    TProdutosidusuarioalteracao: TWideStringField;
    TProdutosnome: TStringField;
    TProdutostipo: TWideStringField;
    TProdutosunidademedida: TStringField;
    TProdutosestoqueminimo: TBCDField;
    TProdutoscodigobarras: TStringField;
    TProdutosidmarca: TWideStringField;
    TProdutoscodigofabricante: TStringField;
    TProdutossyncaws: TWideStringField;
    TProdutoscustomedio: TBCDField;
    TProdutossaldoatual: TBCDField;
    TMovLocalEstoque: TFDQuery;
    TUsuario: TFDQuery;
    TUsuarioid: TIntegerField;
    TUsuariostatus: TWideStringField;
    TUsuariodatareg: TWideStringField;
    TUsuarioidusuario: TWideStringField;
    TUsuariodataalteracao: TWideStringField;
    TUsuarioidusuarioalteracao: TWideStringField;
    TUsuarionome: TStringField;
    TUsuarioemail: TStringField;
    TUsuariocelular: TStringField;
    TUsuariousuario: TStringField;
    TUsuariosenha: TStringField;
    TUsuariotipo: TWideStringField;
    TUsuariosyncaws: TWideStringField;
    TCentroCusto: TFDQuery;
    TCentroCustoid: TIntegerField;
    TCentroCustostatus: TWideStringField;
    TCentroCustodatareg: TWideStringField;
    TCentroCustoidusuario: TWideStringField;
    TCentroCustodataalteracao: TWideStringField;
    TCentroCustoidusuarioalteracao: TWideStringField;
    TCentroCustonome: TStringField;
    TCentroCustosyncaws: TWideStringField;
    TMaquinasidsubgrupo: TWideStringField;
    TMaquinastipomedicao: TWideStringField;
    TAbastecimentoFoto: TFDQuery;
    TAbastecimentoFotoid: TFDAutoIncField;
    TAbastecimentoFotostatus: TWideStringField;
    TAbastecimentoFotodatareg: TWideStringField;
    TAbastecimentoFotoidusuario: TWideStringField;
    TAbastecimentoFotodataalteracao: TWideStringField;
    TAbastecimentoFotoidusuarioalteracao: TWideStringField;
    TAbastecimentoFotoidlocalestoque: TWideStringField;
    TAbastecimentoFotoidmaquina: TWideStringField;
    TAbastecimentoFotovolumelt: TBCDField;
    TAbastecimentoFotocombustivel: TWideStringField;
    TAbastecimentoFotodataabastecimento: TDateField;
    TAbastecimentoFotohora: TTimeField;
    TAbastecimentoFotosyncaws: TWideStringField;
    TAbastecimentoFotohorimetro: TBCDField;
    TAbastecimentoFotoobs: TStringField;
    TAbastecimentoFotoimg: TWideMemoField;
    TAbastecimentoFotoimg2: TWideMemoField;
    TAbastecimentoFotoimg3: TWideMemoField;
    TAbastecimentoFotoimg4: TWideMemoField;
    TAbastecimentoFotoimg5: TWideMemoField;
    TAbastecimentoFotovalorlitro: TBCDField;
    TAbastecimentoFotoexterno: TWideStringField;
    TAbastecimentoFotoidcentrocusto: TIntegerField;
    TAbastecimentoFotokmatual: TBCDField;
    TStartbombastatusStr: TWideStringField;
    TAbastecimentoOutrosid: TFDAutoIncField;
    TLocalEstoqueidcombustivel: TIntegerField;
    TLocalEstoquecombustivel: TStringField;
    TAbastecimentoid: TIntegerField;
    TAbastecimentostatus: TWideStringField;
    TAbastecimentodatareg: TWideStringField;
    TAbastecimentoidusuario: TWideStringField;
    TAbastecimentodataalteracao: TWideStringField;
    TAbastecimentoidusuarioalteracao: TWideStringField;
    TAbastecimentoidlocalestoque: TWideStringField;
    TAbastecimentoidmaquina: TWideStringField;
    TAbastecimentovolumelt: TBCDField;
    TAbastecimentocombustivel: TWideStringField;
    TAbastecimentodataabastecimento: TDateField;
    TAbastecimentohora: TTimeField;
    TAbastecimentosyncaws: TWideStringField;
    TAbastecimentohorimetro: TBCDField;
    TAbastecimentoobs: TStringField;
    TAbastecimentoimg: TWideMemoField;
    TAbastecimentoimg2: TWideMemoField;
    TAbastecimentoimg3: TWideMemoField;
    TAbastecimentoimg4: TWideMemoField;
    TAbastecimentoimg5: TWideMemoField;
    TAbastecimentovalorlitro: TBCDField;
    TAbastecimentoexterno: TWideStringField;
    TAbastecimentoidcentrocusto: TIntegerField;
    TAbastecimentokmatual: TBCDField;
    TAbastecimentolatitude: TFMTBCDField;
    TAbastecimentolongitude: TFMTBCDField;
    TAbastecimentoCombustivelNome: TStringField;
    TAbastecimentoLocalEstoque: TStringField;
    TAbastecimentoMaquina: TStringField;
    TMovLocalEstoqueid: TIntegerField;
    TMovLocalEstoquestatus: TWideStringField;
    TMovLocalEstoquedatareg: TWideStringField;
    TMovLocalEstoqueidusuario: TWideStringField;
    TMovLocalEstoquedataalteracao: TWideStringField;
    TMovLocalEstoqueidusuarioalteracao: TWideStringField;
    TMovLocalEstoqueidlocalestoqueorigem: TWideStringField;
    TMovLocalEstoqueidlocalestoquedetino: TWideStringField;
    TMovLocalEstoqueidproduto: TWideStringField;
    TMovLocalEstoqueqtde: TBCDField;
    TMovLocalEstoquedatamov: TDateField;
    TMovLocalEstoquehora: TTimeField;
    TMovLocalEstoquesyncaws: TWideStringField;
    TMovLocalEstoqueLocalOrigem: TStringField;
    TMovLocalEstoqueLocalDestino: TStringField;
    TMovLocalEstoqueProduto: TStringField;
    TAbastecimentoalerta: TIntegerField;
    TAbastecimentodescricaoalerta: TWideMemoField;
    qryConfigID_CENTRO_CUSTO: TIntegerField;
    qryConfigPATRIMONIO: TIntegerField;
    TMaquinasvolumetanque: TBCDField;
    TLubrificacaoprodutos: TFDQuery;
    TLubrificacao: TFDQuery;
    TLubrificacaoid: TIntegerField;
    TLubrificacaostatus: TWideStringField;
    TLubrificacaodatareg: TWideStringField;
    TLubrificacaoidusuario: TWideStringField;
    TLubrificacaodataalteracao: TWideStringField;
    TLubrificacaoidusuarioalteracao: TWideStringField;
    TLubrificacaoidmaquina: TWideStringField;
    TLubrificacaodatatroca: TDateField;
    TLubrificacaotipo: TWideStringField;
    TLubrificacaosyncaws: TWideStringField;
    TLubrificacaosyncfaz: TWideStringField;
    TLubrificacaohorimetro: TBCDField;
    TLubrificacaokm: TBCDField;
    TLubrificacaoidcentrocusto: TWideStringField;
    TLubrificacaoTipoStr: TWideStringField;
    TLubrificacaomaquina: TStringField;
    TLubrificacaocentrocusto: TStringField;
    TLubrificacaoprodutosid: TIntegerField;
    TLubrificacaoprodutosstatus: TWideStringField;
    TLubrificacaoprodutosdatareg: TWideStringField;
    TLubrificacaoprodutosidusuario: TWideStringField;
    TLubrificacaoprodutosdataalteracao: TWideStringField;
    TLubrificacaoprodutosidusuarioalteracao: TWideStringField;
    TLubrificacaoprodutosidlubrificacao: TWideStringField;
    TLubrificacaoprodutosidproduto: TWideStringField;
    TLubrificacaoprodutosqtd: TBCDField;
    TLubrificacaoprodutossyncaws: TWideStringField;
    TLubrificacaoprodutossyncfaz: TWideStringField;
    TLubrificacaoprodutosproduto: TStringField;
    TLubrificacaoprodutoscodigofabricante: TStringField;
    TLubrificacaoalerta: TWideStringField;
    TLubrificacaodescricaoalerta: TWideMemoField;
    procedure TstartBombaReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FConBeforeConnect(Sender: TObject);
    procedure TStartBombaInsertReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoFotoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TMovLocalEstoqueReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TLubrificacaoprodutosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private

  public
    vIdMaquinaSel,vMarcaModelo, vUltimoHorimetro,vUltimoKM:string;
    vIdCentroCusto,vIdUser,vIdProduto,vNomeProduto,vCodFabricanteProduto,
    vNomeOperador,vIdOperador,vIdAtividade,vNomeAtividade,
    vNomeLocalEstoque,vIdLocalEstoqueSel,vTipoUser:string;
    vPrimeiroAcesso:Boolean;
    vTipoOp,vLocalMov:integer;//1= start bomba 2= abastecimento
    procedure CreateTablesVersao(NumeroVersao: string);
    function  VerificaTabelaExiste(Atabela: string): Boolean;
    function  VerificaCampoExiste(Acampo, Atabela: string):Boolean;
    function  AutenticaUsuario(Usuario, Senha: string): Boolean;
    procedure AbrirAbastecimento(vFiltro: string);
    procedure AbrirStartBomba(vFiltro: string);
    procedure AbrirStartBombaInsert(vFiltro: string);
    function  BuscaMaquina(vQrCod:string):Boolean;
    procedure AbrirAbastecimentoOutros(vIdAbasteciemnto, vFiltro: string);
    procedure DeletaAbastecimento(vId:string);
    procedure DeletaStartBomba(vId:string);
    procedure DeletaAbastecimentoOutros(vId:string);
    procedure SalvarAcesso(vUsuario, Senha: string);
    procedure AbrirLocalEstoque(vidCentro:string);
    procedure FinalizaDia(idReg,DataEnd,HoraEnd,LitrosEnd,ImgEdn:string);
    function  VerificaStartExiste(vIdLocal,vData:string):Boolean;
    function  AbriMaquinaPrefixo(qrcode:string):Boolean;
    procedure AbrirAbastecimentoFotos(vId:string);
    function  VerificaStartAberto(vIdLocal:string):Boolean;
    function RetornaIdAbastecimento:integer;
    function VerificaIDExite(Atabela,AId:string):Boolean;
    procedure AbrirTrasnferencia(vFiltro:string);
    procedure DeletaTransferencia(vIdTransferencia:string);
    function RetornaSaldoAtualDia(vIdLocal:string):string;
    procedure AtualizaCentroCustoConfig(idCentro:string);
    procedure RetornaUltimoKMHorimetro(vIdMaquina:string);
    procedure AbrirLubrificacaoprodutos(vIdLubrificacao: string);
    procedure AbrirLubrificacao(vFiltro: string);
    function RetornaMaxId(AnomeTabela: string): string;
    procedure DeletaLubrificacao(vId:string);
    procedure DeletaLubrificacaoProduto(vId:string);
    function RetornaIdLubrificacao: integer;
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmDB }
procedure Tdmdb.AbrirLubrificacao(vFiltro: string);
begin
 with TLubrificacao,TLubrificacao.SQL do
 begin
   Clear;
   Add('select');
   Add(' l.*,');
   Add(' case');
   Add('  when tipo=1 then ''TROCA''');
   Add('  when tipo=2 then ''REMONTA''');
   Add(' end TipoStr,');
   Add(' m.prefixo maquina,');
   Add(' c.nome centrocusto');
   Add('from lubrificacao l');
   Add('join maquinaveiculo m on l.idmaquina =m.id');
   Add('join centrocusto c on c.id=l.idcentrocusto');
   Add('where l.status=1');
   Add(vFiltro);
   Add('order by datareg desc');
   Open;
 end;
end;

function Tdmdb.RetornaMaxId(AnomeTabela: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select max(id) maxid from '+AnomeTabela);
   Open;
   if FieldByName('maxid').AsString.Length=0 then
    Result :='1'
   else
    Result :=FieldByName('maxid').AsString;
 end;
end;

procedure Tdmdb.AbrirLubrificacaoprodutos(vIdLubrificacao: string);
begin
 with TLubrificacaoprodutos,TLubrificacaoprodutos.SQL do
 begin
   Clear;
   Add('select');
   Add('l.*,');
   Add('p.nome produto,');
   Add('p.codigofabricante');
   Add('from lubrificacaoprodutos l');
   Add('join produtos p on l.idproduto=p.id');
   Add('where l.status=1');
   Add('and l.idlubrificacao='+vIdLubrificacao);
   Open;
 end;
end;


procedure TdmDB.SalvarAcesso(vUsuario, Senha: string);
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   qryControAcces.Delete;
   qryControAcces.ApplyUpdates(-1);
  end;
  try
   qryControAcces.Close;
   qryControAcces.Open;
   qryControAcces.Insert;
   qryControAccesUsuario.AsString := vUsuario;
   qryControAccesSenha.AsString   := Senha;
   qryControAcces.ApplyUpdates(-1);
  except
   on E : Exception do
      ShowMessage('Erro ao inserir Controle de Acesso : '+E.Message);
  end;
end;

procedure TdmDB.TAbastecimentoFotoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message)
end;

procedure TdmDB.TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdmDB.TLubrificacaoprodutosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdmDB.TMovLocalEstoqueReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdmDB.TStartBombaInsertReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdmDB.TstartBombaReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

function TdmDB.VerificaCampoExiste(Acampo, Atabela: string): Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   while not vQryAux.eof do
   begin
     if Acampo=vQryAux.FieldByName('name').AsString then
       vExiste:=1;
     vQryAux.Next;
   end;
 end;
 Result:=vExiste=1;
 vQryAux.Free;
end;

function TdmDB.VerificaIDExite(Atabela, AId: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from '+Atabela);
  Add('where id='+AId);
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.VerificaStartAberto(vIdLocal: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from startbomba');
  Add('where idlocalestoque='+vIdLocal);
  Add('and status=1');
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.VerificaStartExiste(vIdLocal, vData: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from startbomba');
  Add('where idlocalestoque='+vIdLocal);
  Add('and dataastart='+vData);
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.VerificaTabelaExiste(Atabela: string): Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   Result:=vQryAux.IsEmpty;
 end;
 vQryAux.Free;
end;

function TdmDB.AbriMaquinaPrefixo(qrcode: string): Boolean;
var
 vqrcodeInt:integer;
begin
 if TryStrToInt(qrcode,vqrcodeInt) then
 begin
   with TMaquinas,TMaquinas.SQL do
   begin
     Clear;
     Add('select * from maquinaveiculo where qrcode=:qrcode');
     ParamByName('qrcode').AsInteger := vqrcodeInt;
     Open;
     Result := TMaquinas.IsEmpty;
   end;
 end
 else
  Result := true;
end;

procedure TdmDB.AbrirAbastecimento(vFiltro: string);
begin
 with TAbastecimento,TAbastecimento.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('p.nome CombustivelNome,');
   Add('b.nome LocalEstoque,');
   Add('c.prefixo  Maquina');
   Add('from abastecimento a');
   Add('left join produtos p on a.combustivel=p.id');
   Add('left join localestoque b on a.idlocalestoque=b.id');
   Add('left join maquinaveiculo c on c.id=a.idmaquina');
   Add('where a.status=1');
   Add('and a.idcentrocusto='+vIdCentroCusto);
   Add(vFiltro);
   Add('order by id desc');
   Open;
 end;
end;

procedure TdmDB.AbrirAbastecimentoFotos(vId: string);
begin
 with TAbastecimentoFoto,TAbastecimentoFoto.SQL do
 begin
   Clear;
   Add('select * from abastecimento where id='+vId);
   Open;
 end;
end;

procedure TdmDB.AbrirAbastecimentoOutros(vIdAbasteciemnto, vFiltro: string);
begin
 with TAbastecimentoOutros,TAbastecimentoOutros.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Produto from abastecimentoOutros a');
   Add('left join produtos b on b.id=a.idproduto');
   Add('where a.status=1 and a.idabastecimento='+vIdAbasteciemnto);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirLocalEstoque(vidCentro: string);
begin
 with TLocalEstoque,TLocalEstoque.SQL do
 begin
   Clear;
   Add('select * from localestoque');
   Add('where status=1');
   Add('and idcentrocusto='+vidCentro);
   Open;
 end;
end;

procedure TdmDB.AbrirStartBomba(vFiltro: string);
begin
 with TStartbomba,TStartbomba.sql do
 begin
   Clear;
   Add('select s.*,');
   Add('case');
   Add('when S.status=1 then ''EM ABERTO''');
   Add('when S.status=2 then ''FINALIZADO''');
   Add('end statusStr,');
   Add('l.nome Local,p.nome CombustivelNome from startbomba s');
   Add('left join localestoque l on s.idlocalestoque=l.id');
   Add('left join produtos p on p.id=s.combustivel');
   Add('WHERE s.status>-1');
   Add('and s.idcentrocusto='+vIdCentroCusto);
   Add(vFiltro);
   Add('Order by dataastart desc');
   Open;
 end;
end;

procedure TdmDB.AbrirStartBombaInsert(vFiltro: string);
begin
 with TStartBombaInsert,TStartBombaInsert.sql do
 begin
   Clear;
   Add('select s.* from startbomba s');
   Add('WHERE s.status>1');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirTrasnferencia(vFiltro: string);
begin
  with TMovLocalEstoque,TMovLocalEstoque.SQL do
  begin
    Clear;
    Add('select');
    Add('a.*,o.nome LocalOrigem,');
    Add('d.nome LocalDestino,');
    Add('p.nome Produto');
    Add('from tranferencialocalestoque a');
    Add('join localestoque o on o.id=a.idlocalestoqueorigem');
    Add('join localestoque d on d.id=a.idlocalestoquedetino');
    Add('join produtos p ON o.idcentrocusto=p.id');
    Add('where a.status=1');
    Add(vFiltro);
    Open;
  end;
end;

procedure TdmDB.AtualizaCentroCustoConfig(idCentro: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('update config set ID_CENTRO_CUSTO='+idCentro);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaAbastecimentoOutros(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from abastecimentooutros');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaAbastecimento(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from abastecimento');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaLubrificacao(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from lubrificacao');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaLubrificacaoProduto(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from lubrificacaoprodutos');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaStartBomba(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from startbomba');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaTransferencia(vIdTransferencia: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from tranferenciaLocalestoque');
   Add('WHERE ID='+vIdTransferencia);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.FConBeforeConnect(Sender: TObject);
var
 vPath:string;
begin
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   FCon.Params.DriverID :='SQLite';
   FCon.Params.Values['Database'] :=
   TPath.Combine(TPath.GetDocumentsPath,'Fueldb.db');
 {$ENDIF}
 {$IFDEF MSWINDOWS}
   vPath := 'E:\20102021\Projetos2021\Pecuarizze\ManejoPastagem\Mobile\db\dbw.db';
   if FileExists(vPath) then
   begin
    FCon.Params.DriverID :='SQLite';
    FCon.Params.Values['Database'] :=vPath;
   end
   else
    ShowMessage('BD Não localizado!!');
 {$ENDIF}
end;

procedure TdmDB.FinalizaDia(idReg, DataEnd, HoraEnd, LitrosEnd, ImgEdn: string);
begin

end;

function TdmDB.RetornaIdAbastecimento: integer;
var
 vid:Integer;
begin
 repeat
   vid := Random(900000);
  until (dmDB.VerificaIDExite('abastecimento',intToStr(vid)));
  Result :=vid;
end;

function TdmDB.RetornaIdLubrificacao: integer;
var
 vid:Integer;
begin
 repeat
   vid := Random(900000);
  until (dmDB.VerificaIDExite('lubrificacao',intToStr(vid)));
  Result :=vid;
end;

function TdmDB.RetornaSaldoAtualDia(vIdLocal: string): string;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select');
  Add('coalesce(a.volumelitrosIni,0)-');
  Add('coalesce((select sum(b.volumelt)');
  Add('from abastecimento b');
  Add('where dataabastecimento='+FormatDateTime('yyyy-mm-dd',date).QuotedString);
  Add('and b.idlocalestoque='+vIdLocal+'),0) saldoAtual');
  Add('from startbomba a');
  Add('where idlocalestoque='+vIdLocal);
  Add('and a.dataastart='+FormatDateTime('yyyy-mm-dd',date).QuotedString);
  Open;
  if IsEmpty then
   Result :='0'
  else
   Result := FieldByName('saldoAtual').AsString;
 end;
 qryAux.Free;
end;

procedure TdmDB.RetornaUltimoKMHorimetro(vIdMaquina: string);
var
 qryAux : TFDQuery;
 vMaxHAabastecimento,vMaxHMaquina,
 vMaxKAbastecimento,vMaxKMaquina :double;
 vUltimoAbastece,vUltimoAbastecimentoMaquina:TDateTime;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select');
  Add('coalesce(max(horimetro),0) maxHorimetro,');
  Add('coalesce(max(kmatual),0) maxkm,');
  Add('max(dataabastecimento) maxDataAbastecimento');
  Add('from abastecimento a');
  Add('where status=1 and idmaquina='+vIdMaquina);
  Open;
  vMaxHAabastecimento  := FieldByName('maxHorimetro').AsFloat;
  vMaxKAbastecimento   := FieldByName('maxkm').AsFloat;

  Clear;
  Add('select');
  Add('*');
  Add('from maquinaveiculo a');
  Add('where id='+vIdMaquina);
  Open;
  vMaxHMaquina  := FieldByName('horimetroatual').AsFloat;
  vMaxKMaquina  := FieldByName('kmatual').AsFloat;


  if vMaxHAabastecimento> vMaxHMaquina then
   vUltimoHorimetro := FloatToStr(vMaxHAabastecimento)
  else
   vUltimoHorimetro := FloatToStr(vMaxHMaquina);

  if vMaxKAbastecimento>vMaxKMaquina then
   vUltimoKM  := FloatToStr(vMaxKAbastecimento)
  else
   vUltimoKM  := FloatToStr(vMaxKMaquina);
 end;
 qryAux.Free;
end;

function TdmDB.AutenticaUsuario(Usuario, Senha: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('SELECT * FROM usuario');
  Add('WHERE usuario='+Usuario.QuotedString);
  Add('AND senha='+Senha.QuotedString);
  Open;
  if not qryAux.IsEmpty then
   begin
    vIdUser          := qryAux.FieldByName('id').AsString;
    vTipoUser        := qryAux.FieldByName('tipo').AsString;
    Result := true
   end
   else
    Result := false;
   end;
   qryAux.Free;
end;

function TdmDB.BuscaMaquina(vQrCod: string): Boolean;
begin
 with TMaquinas,TMaquinas.SQL do
 begin
   Clear;
   Add('select * from maquinaveiculo');
   Add('where qrcode='+vQrCod.QuotedString);
   Open;
   Result := TMaquinas.IsEmpty;
 end;
end;

procedure TdmDB.CreateTablesVersao(NumeroVersao: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := FCon;
 if not VerificaCampoExiste('volumetanque','maquinaveiculo') then
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('ALTER TABLE maquinaveiculo add volumetanque numeric(15,2) DEFAULT 0');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage('Erro ao inserir Controle de Acesso : '+E.Message);
   end;
 end;
 vQryAux.Free;
end;

end.
