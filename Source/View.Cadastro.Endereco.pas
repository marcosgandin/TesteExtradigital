unit View.Cadastro.Endereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.UITypes,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Controller.Endereco, Model.Endereco,
  Controller, Datasnap.DBClient, Datasnap.Provider, Controller.UF, Model.UF, Controller.Cidade,
  Model.Cidade, Vcl.ComCtrls;

type
  TStatus = (Incluir, Editar);

type
  TfrmCadEnderecos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    dsEndereco: TDataSource;
    dspEndereco: TDataSetProvider;
    cdsEndereco: TClientDataSet;
    cdsEnderecoIDENDERECO: TIntegerField;
    cdsEnderecoIDTITULAR: TIntegerField;
    cdsEnderecoIDEMPRESA: TIntegerField;
    cdsEnderecoNMENDERECO: TStringField;
    cdsEnderecoNUENDERECO: TStringField;
    cdsEnderecoNMBAIRRO: TStringField;
    cdsEnderecoIDCIDADE: TIntegerField;
    cdsEnderecoIDUF: TIntegerField;
    cdsEnderecoNUCEP: TStringField;
    cdsEnderecoSTATIVO: TStringField;
    cdsEnderecoSTEXCLUIDO: TStringField;
    cdsEnderecoDTEXCLUIDO: TDateField;
    cdsEnderecoTPCADASTRO: TStringField;
    cdsEnderecoNMTITULAR: TStringField;
    cdsEnderecoNMCIDADE: TStringField;
    cdsEnderecoNMESTADO: TStringField;
    cdsEnderecoSGESTADO: TStringField;
    cdsUF: TClientDataSet;
    dsUF: TDataSource;
    dspUF: TDataSetProvider;
    dsCidade: TDataSource;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsUFIDUF: TIntegerField;
    cdsUFNMESTADO: TStringField;
    cdsUFSGESTADO: TStringField;
    cdsCidadeIDCIDADE: TIntegerField;
    cdsCidadeNMCIDADE: TStringField;
    cdsCidadeIDUF: TIntegerField;
    cdsCidadeNOIBGE: TStringField;
    pgeEnderecos: TPageControl;
    tbsCadastro: TTabSheet;
    tbsConsulta: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigo: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCEP: TMaskEdit;
    cbxUF: TComboBox;
    chkAtivo: TCheckBox;
    cbxCidade: TComboBox;
    dbgPessoas: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxUFChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure HabilitaCampos(pStatus: Boolean);
    procedure LimpaCampos;
    procedure PreencheCampos(pIdEndereco: string);
    procedure PreencheUF;
    procedure PreencheCidade;
    procedure FiltraCidades(pIdUF: string);
  public
    objetoEndereco: TEndereco;
    objetoControleEndereco: TControllerEndereco;
    objetoUF: TUF;
    objetoControleUF: TControllerUF;
    objetoCidade: TCidade;
    objetoControleCidade: TControllerCidade;
    objetoController: TController;
    Status: TStatus;
    iIdEmpresa: string;
  end;

var
  frmCadEnderecos: TfrmCadEnderecos;

implementation

{$R *.dfm}

procedure TfrmCadEnderecos.btnCancelarClick(Sender: TObject);
begin
  HabilitaCampos(True);
  btnNovo.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnCancelar.Enabled := False;

  PreencheCampos(iIdEmpresa);
  FiltraCidades(IntToStr(Integer(cbxUF.Items.Objects[cbxUF.ItemIndex])));
end;

procedure TfrmCadEnderecos.btnEditarClick(Sender: TObject);
begin
  Status := Editar;
  HabilitaCampos(False);

  btnNovo.Enabled := False;
  btnEditar.Enabled := False;
  btnExcluir.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  edtLogradouro.SetFocus;
end;

procedure TfrmCadEnderecos.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o endereço selecionado ? ', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    objetoEndereco.Excluir(objetoEndereco);
    PreencheCampos(EmptyStr);
    FiltraCidades(IntToStr(Integer(cbxUF.Items.Objects[cbxUF.ItemIndex])));
  end;
end;

procedure TfrmCadEnderecos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadEnderecos.btnNovoClick(Sender: TObject);
begin
  Status := Incluir;
  HabilitaCampos(False);
  LimpaCampos;
  PreencheUF;
  PreencheCidade;

  btnNovo.Enabled := False;
  btnEditar.Enabled := False;
  btnExcluir.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  edtLogradouro.SetFocus;
end;

procedure TfrmCadEnderecos.btnSalvarClick(Sender: TObject);
begin
  objetoEndereco.NmEndereco := edtLogradouro.Text;
  objetoEndereco.NuEndereco := edtNumero.Text;
  objetoEndereco.NmBairro   := edtBairro.text;
  objetoEndereco.NuCEP      := edtCEP.Text;
  objetoEndereco.IdUF       := Integer(cbxUF.Items.Objects[cbxUF.ItemIndex]);
  objetoEndereco.IdCidade   := Integer(cbxCidade.Items.Objects[cbxCidade.ItemIndex]);

  objetoEndereco.StAtivo := 'N';
  if chkAtivo.Checked then
  begin
    if objetoEndereco.ExisteEnderecoAtivo(objetoEndereco.IdEmpresa.ToString) then
    begin
      ShowMessage('Já existe um endereço ativo para esta empresa. Verifique!');
      Exit;
    end
    else
      objetoEndereco.StAtivo := 'S';
  end;

  case Status of
    Incluir : objetoControleEndereco.Salvar(objetoEndereco);
    Editar  : objetoControleEndereco.Atualizar(objetoEndereco);
  end;

  HabilitaCampos(True);
  btnNovo.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
end;

procedure TfrmCadEnderecos.cbxUFChange(Sender: TObject);
begin
  FiltraCidades(IntToStr(Integer(cbxUF.Items.Objects[cbxUF.ItemIndex])));
end;

procedure TfrmCadEnderecos.FiltraCidades(pIdUF: string);
begin
  objetoCidade.Pesquisar(pIdUF);

  dspCidade.DataSet := objetoController.SqqGeral;

  cdsCidade.Open;
  cdsCidade.EmptyDataSet;

  cbxCidade.Items.Clear;
  while not objetoController.SqqGeral.Eof do
  begin
    cdsCidade.Append;
    cdsCidade.FieldByName('IDCIDADE').AsInteger := objetoController.SqqGeral.FieldByName('IDCIDADE').AsInteger;
    cdsCidade.FieldByName('NMCIDADE').AsString  := objetoController.SqqGeral.FieldByName('NMCIDADE').AsString;
    cdsCidade.FieldByName('IDUF').AsInteger     := objetoController.SqqGeral.FieldByName('IDUF').AsInteger;
    cdsCidade.FieldByName('NOIBGE').AsString    := objetoController.SqqGeral.FieldByName('NOIBGE').AsString;

    cdsCidade.Post;

    cbxCidade.Items.AddObject(Trim(cdsCidade.FieldByName('NMCIDADE').AsString),TObject(cdsCidadeIDCIDADE.AsInteger));

    objetoController.SqqGeral.Next;
  end;
end;

procedure TfrmCadEnderecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(objetoCidade);
  FreeAndNil(objetoControleCidade);
  FreeAndNil(objetoUF);
  FreeAndNil(objetoControleUF);
  FreeAndNil(objetoEndereco);
  FreeAndNil(objetoControleEndereco);
  FreeAndNil(objetoController);
end;

procedure TfrmCadEnderecos.FormCreate(Sender: TObject);
begin
  objetoController := TController.Create;
  objetoEndereco := TEndereco.Create(objetoController);
  objetoControleEndereco := TControllerEndereco.Create;

  objetoUF := TUF.Create(objetoController);
  objetoControleUF := TControllerUF.Create;

  objetoCidade := TCidade.Create(objetoController);
  objetoControleCidade := TControllerCidade.Create;
end;

procedure TfrmCadEnderecos.FormShow(Sender: TObject);
begin
  PreencheUF;
  PreencheCidade;
  PreencheCampos(iIdEmpresa);
  FiltraCidades(IntToStr(Integer(cbxUF.Items.Objects[cbxUF.ItemIndex])));

  HabilitaCampos(True);
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
end;

procedure TfrmCadEnderecos.HabilitaCampos(pStatus: Boolean);
begin
  edtLogradouro.ReadOnly := pStatus;
  edtNumero.ReadOnly     := pStatus;
  edtBairro.ReadOnly     := pStatus;
  edtCEP.ReadOnly        := pStatus;
  cbxUF.Enabled          := not pStatus;
  cbxCidade.Enabled      := not pStatus;
  chkAtivo.Enabled       := not pStatus;
end;

procedure TfrmCadEnderecos.LimpaCampos;
begin
  edtLogradouro.Text := EmptyStr;
  edtNumero.Text     := EmptyStr;
  edtBairro.Text     := EmptyStr;
  edtCEP.Text        := EmptyStr;
  cbxUF.Text         := EmptyStr;
  cbxCidade.Text     := EmptyStr;
  chkAtivo.Checked   := False;
end;

procedure TfrmCadEnderecos.PreencheCampos(pIdEndereco: string);
begin
  objetoEndereco.Pesquisar(pIdEndereco);

  dspEndereco.DataSet := objetoController.SqqGeral;

  cdsEndereco.Open;
  cdsEndereco.EmptyDataSet;

  while not objetoController.SqqGeral.Eof do
  begin
    cdsEndereco.Append;
    cdsEndereco.FieldByName('IDENDERECO').AsInteger  := objetoController.SqqGeral.FieldByName('IDENDERECO').AsInteger;;
    cdsEndereco.FieldByName('IDTITULAR').AsInteger   := objetoController.SqqGeral.FieldByName('IDTITULAR').AsInteger;
    cdsEndereco.FieldByName('IDEMPRESA').AsInteger   := objetoController.SqqGeral.FieldByName('IDEMPRESA').AsInteger;
    cdsEndereco.FieldByName('NMENDERECO').AsString   := objetoController.SqqGeral.FieldByName('NMENDERECO').AsString;
    cdsEndereco.FieldByName('NUENDERECO').AsString   := objetoController.SqqGeral.FieldByName('NUENDERECO').AsString;
    cdsEndereco.FieldByName('NMBAIRRO').AsString     := objetoController.SqqGeral.FieldByName('NMBAIRRO').AsString;
    cdsEndereco.FieldByName('IDCIDADE').AsInteger    := objetoController.SqqGeral.FieldByName('IDCIDADE').AsInteger;
    cdsEndereco.FieldByName('IDUF').AsInteger        := objetoController.SqqGeral.FieldByName('IDUF').AsInteger;
    cdsEndereco.FieldByName('NUCEP').AsString        := objetoController.SqqGeral.FieldByName('NUCEP').AsString;
    cdsEndereco.FieldByName('STATIVO').AsString      := objetoController.SqqGeral.FieldByName('STATIVO').AsString;
    cdsEndereco.FieldByName('STEXCLUIDO').AsString   := objetoController.SqqGeral.FieldByName('STEXCLUIDO').AsString;
    cdsEndereco.FieldByName('DTEXCLUIDO').AsDateTime := objetoController.SqqGeral.FieldByName('DTEXCLUIDO').AsDateTime;
    cdsEndereco.FieldByName('TPCADASTRO').AsString   := objetoController.SqqGeral.FieldByName('TPCADASTRO').AsString;
    cdsEndereco.FieldByName('NMTITULAR').AsString    := objetoController.SqqGeral.FieldByName('NMTITULAR').AsString;
    cdsEndereco.FieldByName('NMCIDADE').AsString     := objetoController.SqqGeral.FieldByName('NMCIDADE').AsString;
    cdsEndereco.FieldByName('NMESTADO').AsString     := objetoController.SqqGeral.FieldByName('NMESTADO').AsString;
    cdsEndereco.FieldByName('SGESTADO').AsString     := objetoController.SqqGeral.FieldByName('SGESTADO').AsString;

    cdsEndereco.Post;
    objetoController.SqqGeral.Next;
  end;

  cdsEndereco.First;

  edtCodigo.Text      := cdsEndereco.FieldByName('IDENDERECO').AsString;
  edtLogradouro.Text  := cdsEndereco.FieldByName('NMENDERECO').AsString;
  edtNumero.Text      := cdsEndereco.FieldByName('NUENDERECO').AsString;
  edtBairro.Text      := cdsEndereco.FieldByName('NMBAIRRO').AsString;
  edtCEP.Text         := cdsEndereco.FieldByName('NUCEP').AsString;
  cbxUF.ItemIndex     := cdsEndereco.FieldByName('IDUF').AsInteger - 1;
  cbxCidade.ItemIndex := cdsEndereco.FieldByName('IDCIDADE').AsInteger - 1;
  chkAtivo.Checked    := cdsEndereco.FieldByName('STATIVO').AsString = 'S';
end;

procedure TfrmCadEnderecos.PreencheCidade;
begin
  objetoCidade.Pesquisar(EmptyStr);
  dspCidade.DataSet := objetoController.SqqGeral;

  cdsCidade.Open;
  cdsCidade.EmptyDataSet;

  cbxCidade.Items.Clear;
  while not objetoController.SqqGeral.Eof do
  begin
    cdsCidade.Append;
    cdsCidade.FieldByName('IDCIDADE').AsInteger := objetoController.SqqGeral.FieldByName('IDCIDADE').AsInteger;
    cdsCidade.FieldByName('NMCIDADE').AsString  := objetoController.SqqGeral.FieldByName('NMCIDADE').AsString;
    cdsCidade.FieldByName('IDUF').AsInteger     := objetoController.SqqGeral.FieldByName('IDUF').AsInteger;
    cdsCidade.FieldByName('NOIBGE').AsString    := objetoController.SqqGeral.FieldByName('NOIBGE').AsString;

    cdsCidade.Post;

    cbxCidade.Items.AddObject(Trim(cdsCidade.FieldByName('NMCIDADE').AsString),TObject(cdsCidadeIDCIDADE.AsInteger));

    objetoController.SqqGeral.Next;
  end;

  cdsCidade.First;
end;

procedure TfrmCadEnderecos.PreencheUF;
begin
  objetoUF.Pesquisar(EmptyStr);
  dspUF.DataSet := objetoController.SqqGeral;

  cdsUF.Open;
  cdsUF.EmptyDataSet;

  cbxUF.Items.Clear;
  while not objetoController.SqqGeral.Eof do
  begin
    cdsUF.Append;
    cdsUF.FieldByName('IDUF').AsInteger    := objetoController.SqqGeral.FieldByName('IDUF').AsInteger;
    cdsUF.FieldByName('NMESTADO').AsString := objetoController.SqqGeral.FieldByName('NMESTADO').AsString;
    cdsUF.FieldByName('SGESTADO').AsString := objetoController.SqqGeral.FieldByName('SGESTADO').AsString;

    cdsUF.Post;

    cbxUF.Items.AddObject(Trim(cdsUF.FieldByName('SGESTADO').AsString),TObject(cdsUFIDUF.AsInteger));

    objetoController.SqqGeral.Next;
  end;

  cdsUF.First;
end;

end.
