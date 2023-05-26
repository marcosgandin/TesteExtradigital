unit View.Cadastro.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.UITypes,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Controller.Empresa, Model.Empresa,
  Datasnap.DBClient, Datasnap.Provider, Controller, Controller.Funcionario, Model.Funcionario;

type
  TStatus = (Incluir, Editar);

type
  TfrmCadEmpresa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnEnderecos: TBitBtn;
    btnFechar: TBitBtn;
    pgeEmpresa: TPageControl;
    tbsCadastro: TTabSheet;
    tbsConsulta: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtCNPJ: TMaskEdit;
    edtTelefoneComercial: TMaskEdit;
    Label4: TLabel;
    edtInscEstadual: TEdit;
    chkAtivo: TCheckBox;
    Label6: TLabel;
    edtTelefoneCelular: TMaskEdit;
    Label7: TLabel;
    edtEmail: TEdit;
    cdsEmpresa: TClientDataSet;
    cdsEmpresaIDEMPRESA: TIntegerField;
    cdsEmpresaNMEMPRESA: TStringField;
    cdsEmpresaNUCNPJ: TStringField;
    cdsEmpresaNUINSCRICAO: TStringField;
    cdsEmpresaSTATIVO: TStringField;
    cdsEmpresaDTCADASTRO: TDateField;
    cdsEmpresaDTABERTURA: TDateField;
    cdsEmpresaTLCOMERCIAL: TStringField;
    cdsEmpresaTLCELULAR: TStringField;
    cdsEmpresaTXOBS: TIntegerField;
    cdsEmpresaTXEMAIL: TStringField;
    cdsEmpresaSTEXCLUIDO: TStringField;
    cdsEmpresaDTEXCLUIDO: TDateField;
    dspEmpresa: TDataSetProvider;
    dbgEmpresa: TDBGrid;
    dsEmpresa: TDataSource;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    Label8: TLabel;
    dtAbertura: TDateTimePicker;
    TabSheet1: TTabSheet;
    dbgFuncionarios: TDBGrid;
    dsFuncionario: TDataSource;
    dspFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    cdsFuncionarioIDFUNCIONARIO: TIntegerField;
    cdsFuncionarioIDEMPRESA: TIntegerField;
    cdsFuncionarioNMFUNCIONARIO: TStringField;
    cdsFuncionarioNUCPF: TStringField;
    cdsFuncionarioNURG: TStringField;
    cdsFuncionarioDTNASCIMENTO: TDateField;
    cdsFuncionarioTXEMAIL: TStringField;
    cdsFuncionarioNUCARTEIRATRAB: TStringField;
    cdsFuncionarioNUTITULOELEITOR: TStringField;
    cdsFuncionarioNUCARTEIRAMOTORISTA: TStringField;
    cdsFuncionarioTPCATERORIA: TStringField;
    cdsFuncionarioDTVALIDADECARTEIRAMOT: TDateField;
    cdsFuncionarioTLRESIDENCIAL: TStringField;
    cdsFuncionarioTLCELULAR: TStringField;
    cdsFuncionarioTLCONTATO: TStringField;
    cdsFuncionarioNMCONTATO: TStringField;
    cdsFuncionarioDTCONTRATACAO: TDateField;
    cdsFuncionarioDTDEMISSAO: TDateField;
    cdsFuncionarioDTCADASTRO: TDateField;
    cdsFuncionarioSTATIVO: TStringField;
    cdsFuncionarioTXOBS: TStringField;
    cdsFuncionarioNMENDERECO: TStringField;
    cdsFuncionarioNUENDERECO: TStringField;
    cdsFuncionarioNMBAIRRO: TStringField;
    cdsFuncionarioIDCIDADE: TIntegerField;
    cdsFuncionarioIDUF: TIntegerField;
    cdsFuncionarioNUCEP: TStringField;
    cdsFuncionarioSTEXCLUIDO: TStringField;
    cdsFuncionarioDTEXCLUIDO: TDateField;
    cdsFuncionarioNMESTADO: TStringField;
    cdsFuncionarioSGESTADO: TStringField;
    cdsFuncionarioNMCIDADE: TStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pgeEmpresaChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure btnEnderecosClick(Sender: TObject);
  private
    procedure HabilitaCampos(pStatus: Boolean);
    procedure LimpaCampos;
    procedure PreencheCampos(pIdEmpresa: string);
    procedure PreencheFuncionarios(pIdEmpresa: string);
  public
    objetoEmpresa: TEmpresa;
    objetoControleEmpresa: TControllerEmpresa;
    objetoFuncionario: TFuncionario;
    objetoControleFuncionario: TControllerFuncionario;
    objetoController: TController;
    Status: TStatus;
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses
  View.Cadastro.Endereco;

{$R *.dfm}

procedure TfrmCadEmpresa.HabilitaCampos(pStatus: Boolean);
begin
  edtCodigo.ReadOnly            := pStatus;
  edtNome.ReadOnly              := pStatus;
  edtCNPJ.ReadOnly              := pStatus;
  edtInscEstadual.ReadOnly      := pStatus;
  chkAtivo.Enabled              := not pStatus;
  edtTelefoneComercial.ReadOnly := pStatus;
  edtTelefoneCelular.ReadOnly   := pStatus;
  edtEmail.ReadOnly             := pStatus;
end;

procedure TfrmCadEmpresa.LimpaCampos;
begin
  edtCodigo.Text            :=  EmptyStr;
  edtNome.Text              :=  EmptyStr;
  edtCNPJ.Text              :=  EmptyStr;
  edtInscEstadual.Text      :=  EmptyStr;
  chkAtivo.Checked := False;
  edtTelefoneComercial.Text :=  EmptyStr;
  edtTelefoneCelular.Text   :=  EmptyStr;
  edtEmail.Text             :=  EmptyStr;
end;

procedure TfrmCadEmpresa.pgeEmpresaChange(Sender: TObject);
begin
  case pgeEmpresa.ActivePageIndex of
    0 : PreencheCampos(cdsEmpresa.FieldByName('IDEMPRESA').AsString);
    1 : PreencheCampos(EmptyStr);
    2 : PreencheFuncionarios(cdsEmpresa.FieldByName('IDEMPRESA').AsString);
  end;
end;

procedure TfrmCadEmpresa.PreencheCampos(pIdEmpresa: string);
begin
  objetoEmpresa.Pesquisar(pIdEmpresa);

  dspEmpresa.DataSet := objetoController.SqqGeral;

  cdsEmpresa.Open;
  cdsEmpresa.EmptyDataSet;

  while not objetoController.SqqGeral.Eof do
  begin
    cdsEmpresa.Append;
    cdsEmpresa.FieldByName('IDEMPRESA').AsInteger   := objetoController.SqqGeral.FieldByName('IDEMPRESA').AsInteger;;
    cdsEmpresa.FieldByName('NMEMPRESA').AsString    := objetoController.SqqGeral.FieldByName('NMEMPRESA').AsString;
    cdsEmpresa.FieldByName('NUCNPJ').AsString       := objetoController.SqqGeral.FieldByName('NUCNPJ').AsString;
    cdsEmpresa.FieldByName('NUINSCRICAO').AsString  := objetoController.SqqGeral.FieldByName('NUINSCRICAO').AsString;
    cdsEmpresa.FieldByName('STATIVO').AsString      := objetoController.SqqGeral.FieldByName('STATIVO').AsString;
    cdsEmpresa.FieldByName('DTCADASTRO').AsDateTime := objetoController.SqqGeral.FieldByName('DTCADASTRO').AsDateTime;
    cdsEmpresa.FieldByName('DTABERTURA').AsDateTime := objetoController.SqqGeral.FieldByName('DTABERTURA').AsDateTime;
    cdsEmpresa.FieldByName('TLCOMERCIAL').AsString  := objetoController.SqqGeral.FieldByName('TLCOMERCIAL').AsString;
    cdsEmpresa.FieldByName('TLCELULAR').AsString    := objetoController.SqqGeral.FieldByName('TLCELULAR').AsString;
    cdsEmpresa.FieldByName('TXOBS').AsInteger       := objetoController.SqqGeral.FieldByName('TXOBS').AsInteger;
    cdsEmpresa.FieldByName('TXEMAIL').AsString      := objetoController.SqqGeral.FieldByName('TXEMAIL').AsString;
    cdsEmpresa.FieldByName('STEXCLUIDO').AsString   := objetoController.SqqGeral.FieldByName('STEXCLUIDO').AsString;
    cdsEmpresa.FieldByName('DTEXCLUIDO').AsDateTime := objetoController.SqqGeral.FieldByName('DTEXCLUIDO').AsDateTime;

    cdsEmpresa.Post;
    objetoController.SqqGeral.Next;
  end;

  cdsEmpresa.First;

  edtCodigo.Text            := cdsEmpresa.FieldByName('IDEMPRESA').AsString;
  edtNome.Text              := cdsEmpresa.FieldByName('NMEMPRESA').AsString;
  edtCNPJ.Text              := cdsEmpresa.FieldByName('NUCNPJ').AsString;
  edtInscEstadual.Text      := cdsEmpresa.FieldByName('NUINSCRICAO').AsString;
  chkAtivo.Checked          := cdsEmpresa.FieldByName('STATIVO').AsString = 'S';
  dtAbertura.Date           := cdsEmpresa.FieldByName('DTABERTURA').AsDateTime;
  edtTelefoneComercial.Text := cdsEmpresa.FieldByName('TLCOMERCIAL').AsString;
  edtTelefoneCelular.Text   := cdsEmpresa.FieldByName('TLCELULAR').AsString;
  edtEmail.Text             := cdsEmpresa.FieldByName('TXEMAIL').AsString;
end;

procedure TfrmCadEmpresa.PreencheFuncionarios(pIdEmpresa: string);
begin
  objetoFuncionario.Pesquisar(pIdEmpresa);

  dspFuncionario.DataSet := objetoController.SqqGeral;

  cdsFuncionario.Open;
  cdsFuncionario.EmptyDataSet;

  while not objetoController.SqqGeral.Eof do
  begin
    cdsFuncionario.Append;
    cdsFuncionario.FieldByName('IDFUNCIONARIO').AsInteger          := objetoController.SqqGeral.FieldByName('IDFUNCIONARIO').AsInteger;;
    cdsFuncionario.FieldByName('IDEMPRESA').AsInteger              := objetoController.SqqGeral.FieldByName('IDEMPRESA').AsInteger;
    cdsFuncionario.FieldByName('NMFUNCIONARIO').AsString           := objetoController.SqqGeral.FieldByName('NMFUNCIONARIO').AsString;
    cdsFuncionario.FieldByName('NUCPF').AsString                   := objetoController.SqqGeral.FieldByName('NUCPF').AsString;
    cdsFuncionario.FieldByName('NURG').AsString                    := objetoController.SqqGeral.FieldByName('NURG').AsString;
    cdsFuncionario.FieldByName('DTNASCIMENTO').AsDateTime          := objetoController.SqqGeral.FieldByName('DTNASCIMENTO').AsDateTime;
    cdsFuncionario.FieldByName('TXEMAIL').AsString                 := objetoController.SqqGeral.FieldByName('TXEMAIL').AsString;
    cdsFuncionario.FieldByName('NUCARTEIRATRAB').AsString          := objetoController.SqqGeral.FieldByName('NUCARTEIRATRAB').AsString;
    cdsFuncionario.FieldByName('NUTITULOELEITOR').AsString         := objetoController.SqqGeral.FieldByName('NUTITULOELEITOR').AsString;
    cdsFuncionario.FieldByName('NUCARTEIRAMOTORISTA').AsString     := objetoController.SqqGeral.FieldByName('NUCARTEIRAMOTORISTA').AsString;
    cdsFuncionario.FieldByName('TPCATERORIA').AsString             := objetoController.SqqGeral.FieldByName('TPCATERORIA').AsString;
    cdsFuncionario.FieldByName('DTVALIDADECARTEIRAMOT').AsDateTime := objetoController.SqqGeral.FieldByName('DTVALIDADECARTEIRAMOT').AsDateTime;
    cdsFuncionario.FieldByName('TLRESIDENCIAL').AsString           := objetoController.SqqGeral.FieldByName('TLRESIDENCIAL').AsString;
    cdsFuncionario.FieldByName('TLCELULAR').AsString               := objetoController.SqqGeral.FieldByName('TLCELULAR').AsString;
    cdsFuncionario.FieldByName('TLCONTATO').AsString               := objetoController.SqqGeral.FieldByName('TLCONTATO').AsString;
    cdsFuncionario.FieldByName('NMCONTATO').AsString               := objetoController.SqqGeral.FieldByName('NMCONTATO').AsString;
    cdsFuncionario.FieldByName('DTCONTRATACAO').AsDateTime         := objetoController.SqqGeral.FieldByName('DTCONTRATACAO').AsDateTime;
    cdsFuncionario.FieldByName('DTDEMISSAO').AsDateTime            := objetoController.SqqGeral.FieldByName('DTDEMISSAO').AsDateTime;
    cdsFuncionario.FieldByName('DTCADASTRO').AsDateTime            := objetoController.SqqGeral.FieldByName('DTCADASTRO').AsDateTime;
    cdsFuncionario.FieldByName('STATIVO').AsString                 := objetoController.SqqGeral.FieldByName('STATIVO').AsString;
    cdsFuncionario.FieldByName('TXOBS').AsString                   := objetoController.SqqGeral.FieldByName('TXOBS').AsString;
    cdsFuncionario.FieldByName('NMENDERECO').AsString              := objetoController.SqqGeral.FieldByName('NMENDERECO').AsString;
    cdsFuncionario.FieldByName('NUENDERECO').AsString              := objetoController.SqqGeral.FieldByName('NUENDERECO').AsString;
    cdsFuncionario.FieldByName('NMBAIRRO').AsString                := objetoController.SqqGeral.FieldByName('NMBAIRRO').AsString;
    cdsFuncionario.FieldByName('IDCIDADE').AsInteger               := objetoController.SqqGeral.FieldByName('IDCIDADE').AsInteger;
    cdsFuncionario.FieldByName('IDUF').AsInteger                   := objetoController.SqqGeral.FieldByName('IDUF').AsInteger;
    cdsFuncionario.FieldByName('NUCEP').AsString                   := objetoController.SqqGeral.FieldByName('NUCEP').AsString;
    cdsFuncionario.FieldByName('STEXCLUIDO').AsString              := objetoController.SqqGeral.FieldByName('STEXCLUIDO').AsString;
    cdsFuncionario.FieldByName('DTEXCLUIDO').AsDateTime            := objetoController.SqqGeral.FieldByName('DTEXCLUIDO').AsDateTime;
    cdsFuncionario.FieldByName('NMESTADO').AsString                := objetoController.SqqGeral.FieldByName('NMESTADO').AsString;
    cdsFuncionario.FieldByName('SGESTADO').AsString                := objetoController.SqqGeral.FieldByName('SGESTADO').AsString;
    cdsFuncionario.FieldByName('NMCIDADE').AsString                := objetoController.SqqGeral.FieldByName('NMCIDADE').AsString;

    cdsFuncionario.Post;
    objetoController.SqqGeral.Next;
  end;

  cdsFuncionario.First;
end;

procedure TfrmCadEmpresa.btnCancelarClick(Sender: TObject);
begin
  HabilitaCampos(True);
  btnNovo.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnCancelar.Enabled := False;

  PreencheCampos(EmptyStr);
end;

procedure TfrmCadEmpresa.btnEditarClick(Sender: TObject);
begin
  Status := Editar;
  HabilitaCampos(False);

  btnNovo.Enabled := False;
  btnEditar.Enabled := False;
  btnExcluir.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  edtNome.SetFocus;
end;

procedure TfrmCadEmpresa.btnEnderecosClick(Sender: TObject);
begin
  frmCadEnderecos := TfrmCadEnderecos.Create(Application);
  frmCadEnderecos.iIdEmpresa := objetoEmpresa.IdEmpresa.ToString;
  frmCadEnderecos.ShowModal;
  if frmCadEnderecos <> nil then
    frmCadEnderecos.Free;
end;

procedure TfrmCadEmpresa.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir a empresa selecionada ? ', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    objetoEmpresa.Excluir(objetoEmpresa);
    PreencheCampos(EmptyStr);
  end;
end;

procedure TfrmCadEmpresa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadEmpresa.btnNovoClick(Sender: TObject);
begin
  Status := Incluir;
  HabilitaCampos(False);
  LimpaCampos;

  btnNovo.Enabled := False;
  btnEditar.Enabled := False;
  btnExcluir.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  edtNome.SetFocus;
end;

procedure TfrmCadEmpresa.btnSalvarClick(Sender: TObject);
begin
  objetoEmpresa.NmEmpresa   := edtNome.Text;
  objetoEmpresa.NuCNPJ      := edtCNPJ.Text;
  objetoEmpresa.NuInscricao := edtInscEstadual.Text;

  if chkAtivo.Checked then
    objetoEmpresa.StAtivo := 'S'
  else
    objetoEmpresa.StAtivo := 'N';

  objetoEmpresa.DtAbertura  := dtAbertura.Date;
  objetoEmpresa.TlComercial := edtTelefoneComercial.Text;
  objetoEmpresa.TlCelular   := edtTelefoneCelular.Text;
  objetoEmpresa.TxEmail     := edtEmail.Text;

  case Status of
    Incluir : begin
                objetoEmpresa.DtCadastro := Now;
                objetoControleEmpresa.Salvar(objetoEmpresa);
              end;
    Editar : objetoControleEmpresa.Atualizar(objetoEmpresa);
  end;

  HabilitaCampos(True);
  btnNovo.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
end;

procedure TfrmCadEmpresa.edtCNPJExit(Sender: TObject);
begin
  objetoEmpresa.NuCNPJ := edtCNPJ.Text;
  if not objetoControleEmpresa.VerificaCampos(objetoEmpresa) then
    raise Exception.Create('CNPJ inválido. Verifique!');
end;

procedure TfrmCadEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(objetoEmpresa);
  FreeAndNil(objetoControleEmpresa);
  FreeAndNil(objetoController);
end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
  objetoController := TController.Create;
  objetoEmpresa := TEmpresa.Create(objetoController);
  objetoControleEmpresa := TControllerEmpresa.Create;

  objetoFuncionario := TFuncionario.Create(objetoController);
  objetoControleFuncionario := TControllerFuncionario.Create;

  PreencheCampos(EmptyStr);
  PreencheFuncionarios(cdsEmpresa.FieldByName('IDEMPRESA').AsString);

  HabilitaCampos(True);
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
end;

end.
