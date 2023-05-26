unit Model.Funcionario;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, Controller,
  Firedac.Stan.Param, Data.DB;

type
  TFuncionario = class
    private
      FNmContato: string;
      FTlCelular: string;
      FDtCadastro: TDate;
      FIdEmpresa: Integer;
      FNuRG: string;
      FNmEndereco: string;
      FDtValidadeCarteiraMot: TDate;
      FDtExcluido: TDate;
      FIdCidade: Integer;
      FDtDemissao: TDate;
      FNuCPF: string;
      FNmFuncionario: string;
      FNmBairro: string;
      FNuCEP: string;
      FTxObs: string;
      FTpCateroria: string;
      FDtNascimento: TDate;
      FStExcluido: string;
      FTxEmail: string;
      FIdFuncionario: Integer;
      FDtContratacao: TDate;
      FIdUF: Integer;
      FTlResidencial: string;
      FTlContato: string;
      FNuCarteiraMotorista: string;
      FStAtivo: string;
      FNuCarteiraTrab: string;
      FNuEndereco: string;
      FNuTituloEleitor: string;
      FControle: TController;
    public
      constructor Create(pConexaoControle:TController);
      destructor Destroy; override;

      procedure Inserir(const objetoFuncionario: TFuncionario);
      procedure Alterar(const objetoFuncionario: TFuncionario);
      procedure Excluir(const objetoFuncionario: TFuncionario);
      function Pesquisar(pIdEmpresa: string): TFuncionario;

      property IdFuncionario         : Integer read FIdFuncionario write FIdFuncionario;
      property IdEmpresa             : Integer read FIdEmpresa write FIdEmpresa;
      property NmFuncionario         : string read FNmFuncionario write FNmFuncionario;
      property NuCPF                 : string read FNuCPF write FNuCPF;
      property NuRG                  : string read FNuRG write FNuRG;
      property DtNascimento          : TDate read FDtNascimento write FDtNascimento;
      property TxEmail               : string read FTxEmail write FTxEmail;
      property NuCarteiraTrab        : string read FNuCarteiraTrab write FNuCarteiraTrab;
      property NuTituloEleitor       : string read FNuTituloEleitor write FNuTituloEleitor;
      property NuCarteiraMotorista   : string read FNuCarteiraMotorista write FNuCarteiraMotorista;
      property TpCateroria           : string read FTpCateroria write FTpCateroria;
      property DtValidadeCarteiraMot : TDate read FDtValidadeCarteiraMot write FDtValidadeCarteiraMot;
      property TlResidencial         : string read FTlResidencial write FTlResidencial;
      property TlCelular             : string read FTlCelular write FTlCelular;
      property TlContato             : string read FTlContato write FTlContato;
      property NmContato             : string read FNmContato write FNmContato;
      property DtContratacao         : TDate read FDtContratacao write FDtContratacao;
      property DtDemissao            : TDate read FDtDemissao write FDtDemissao;
      property DtCadastro            : TDate read FDtCadastro write FDtCadastro;
      property StAtivo               : string read FStAtivo write FStAtivo;
      property TxObs                 : string read FTxObs write FTxObs;
      property NmEndereco            : string read FNmEndereco write FNmEndereco;
      property NuEndereco            : string read FNuEndereco write FNuEndereco;
      property NmBairro              : string read FNmBairro write FNmBairro;
      property IdCidade              : Integer read FIdCidade write FIdCidade;
      property IdUF                  : Integer read FIdUF write FIdUF;
      property NuCEP                 : string read FNuCEP write FNuCEP;
      property StExcluido            : string read FStExcluido write FStExcluido;
      property DtExcluido            : TDate read FDtExcluido write FDtExcluido;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create(pConexaoControle:TController);
begin
  FControle := pConexaoControle;
end;

destructor TFuncionario.Destroy;
begin

  inherited;
end;

procedure TFuncionario.Inserir(const objetoFuncionario: TFuncionario);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('INSERT INTO CADFUNCIONARIOS ');
  FControle.SqqGeral.SQL.Add('  (IDEMPRESA, NMFUNCIONARIO, NUCPF, NURG, DTNASCIMENTO, TXEMAIL, ');
  FControle.SqqGeral.SQL.Add('   NUCARTEIRATRAB, NUTITULOELEITOR, NUCARTEIRAMOTORISTA, TPCATERORIA, ');
  FControle.SqqGeral.SQL.Add('   DTVALIDADECARTEIRAMOT, TLRESIDENCIAL, TLCELULAR, TLCONTATO, NMCONTATO, ');
  FControle.SqqGeral.SQL.Add('   DTCONTRATACAO, DTDEMISSAO, DTCADASTRO, STATIVO, TXOBS, NMENDERECO, ');
  FControle.SqqGeral.SQL.Add('   NUENDERECO, NMBAIRRO, IDCIDADE, IDUF, NUCEP, STEXCLUIDO, DTEXCLUIDO) ');
  FControle.SqqGeral.SQL.Add('VALUES ');
  FControle.SqqGeral.SQL.Add('  (:IDEMPRESA, :NMFUNCIONARIO, :NUCPF, :NURG, :DTNASCIMENTO, :TXEMAIL, ');
  FControle.SqqGeral.SQL.Add('   :NUCARTEIRATRAB, :NUTITULOELEITOR, :NUCARTEIRAMOTORISTA, :TPCATERORIA, ');
  FControle.SqqGeral.SQL.Add('   :DTVALIDADECARTEIRAMOT, :TLRESIDENCIAL, :TLCELULAR, :TLCONTATO, :NMCONTATO, ');
  FControle.SqqGeral.SQL.Add('   :DTCONTRATACAO, :DTDEMISSAO, :DTCADASTRO, :STATIVO, :TXOBS, :NMENDERECO, ');
  FControle.SqqGeral.SQL.Add('   :NUENDERECO, :NMBAIRRO, :IDCIDADE, :IDUF, :NUCEP, :STEXCLUIDO, :DTEXCLUIDO) ');

  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMFUNCIONARIO').AsString := Self.NmFuncionario;
  FControle.SqqGeral.ParamByName('NUCPF').AsString := Self.NuCPF;
  FControle.SqqGeral.ParamByName('NURG').AsString := Self.NuRG;
  FControle.SqqGeral.ParamByName('DTNASCIMENTO').AsDate := Self.DtNascimento;
  FControle.SqqGeral.ParamByName('TXEMAIL').AsString := Self.TxEmail;
  FControle.SqqGeral.ParamByName('NUCARTEIRATRAB').AsString := Self.NuCarteiraTrab;
  FControle.SqqGeral.ParamByName('NUTITULOELEITOR').AsString := Self.NuTituloEleitor;
  FControle.SqqGeral.ParamByName('NUCARTEIRAMOTORISTA').AsString := Self.NuCarteiraMotorista;
  FControle.SqqGeral.ParamByName('TPCATERORIA').AsString := Self.TpCateroria;
  FControle.SqqGeral.ParamByName('DTVALIDADECARTEIRAMOT').AsDate := Self.DtValidadeCarteiraMot;
  FControle.SqqGeral.ParamByName('TLRESIDENCIAL').AsString := Self.TlResidencial;
  FControle.SqqGeral.ParamByName('TLCELULAR').AsString := Self.TlCelular;
  FControle.SqqGeral.ParamByName('TLCONTATO').AsString := Self.TlContato;
  FControle.SqqGeral.ParamByName('NMCONTATO').AsString := Self.NmContato;
  FControle.SqqGeral.ParamByName('DTCONTRATACAO').AsDate := Self.DtContratacao;
  FControle.SqqGeral.ParamByName('DTDEMISSAO').AsDate := Self.DtDemissao;
  FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate := Self.DtCadastro;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;
  FControle.SqqGeral.ParamByName('TXOBS').AsString := Self.TxObs;
  FControle.SqqGeral.ParamByName('NMENDERECO').AsString := Self.NmEndereco;
  FControle.SqqGeral.ParamByName('NUENDERECO').AsString := Self.NuEndereco;
  FControle.SqqGeral.ParamByName('NMBAIRRO').AsString := Self.NmBairro;
  FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger := Self.IdCidade;
  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NUCEP').AsString := Self.NuCEP;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Cadastro de Funcionários. Verifique!');
  end;
end;

procedure TFuncionario.Alterar(const objetoFuncionario: TFuncionario);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('UPDATE CADFUNCIONARIOS SET ');
  FControle.SqqGeral.SQL.Add('  IDEMPRESA = :IDEMPRESA, ');
  FControle.SqqGeral.SQL.Add('  NMFUNCIONARIO = :NMFUNCIONARIO, ');
  FControle.SqqGeral.SQL.Add('  NUCPF = :NUCPF, ');
  FControle.SqqGeral.SQL.Add('  NURG = :NURG, ');
  FControle.SqqGeral.SQL.Add('  DTNASCIMENTO = :DTNASCIMENTO, ');
  FControle.SqqGeral.SQL.Add('  TXEMAIL= :TXEMAIL, ');
  FControle.SqqGeral.SQL.Add('  NUCARTEIRATRAB = :NUCARTEIRATRAB, ');
  FControle.SqqGeral.SQL.Add('  NUTITULOELEITOR = :NUTITULOELEITOR, ');
  FControle.SqqGeral.SQL.Add('  NUCARTEIRAMOTORISTA = :NUCARTEIRAMOTORISTA, ');
  FControle.SqqGeral.SQL.Add('  TPCATERORIA = :TPCATERORIA, ');
  FControle.SqqGeral.SQL.Add('  DTVALIDADECARTEIRAMOT = :DTVALIDADECARTEIRAMOT, ');
  FControle.SqqGeral.SQL.Add('  TLRESIDENCIAL = :TLRESIDENCIAL, ');
  FControle.SqqGeral.SQL.Add('  TLCELULAR = :TLCELULAR, ');
  FControle.SqqGeral.SQL.Add('  TLCONTATO = :TLCONTATO, ');
  FControle.SqqGeral.SQL.Add('  NMCONTATO = :NMCONTATO, ');
  FControle.SqqGeral.SQL.Add('  DTCONTRATACAO = :DTCONTRATACAO, ');
  FControle.SqqGeral.SQL.Add('  DTDEMISSAO = :DTDEMISSAO, ');
  FControle.SqqGeral.SQL.Add('  DTCADASTRO = :DTCADASTRO, ');
  FControle.SqqGeral.SQL.Add('  STATIVO = :STATIVO, ');
  FControle.SqqGeral.SQL.Add('  TXOBS = :TXOBS, ');
  FControle.SqqGeral.SQL.Add('  NMENDERECO = :NMENDERECO, ');
  FControle.SqqGeral.SQL.Add('  NUENDERECO = :NUENDERECO, ');
  FControle.SqqGeral.SQL.Add('  NMBAIRRO = :NMBAIRRO, ');
  FControle.SqqGeral.SQL.Add('  IDCIDADE = :IDCIDADE, ');
  FControle.SqqGeral.SQL.Add('  IDUF = :IDUF, ');
  FControle.SqqGeral.SQL.Add('  NUCEP = :NUCEP, ');
  FControle.SqqGeral.SQL.Add('  STEXCLUIDO = :STEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  DTEXCLUIDO = :DTEXCLUIDO ');
  FControle.SqqGeral.SQL.Add('WHERE IDFUNCIONARIO = :IDFUNCIONARIO ');

  FControle.SqqGeral.ParamByName('IDFUNCIONARIO').AsInteger := Self.IdFuncionario;
  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMFUNCIONARIO').AsString := Self.NmFuncionario;
  FControle.SqqGeral.ParamByName('NUCPF').AsString := Self.NuCPF;
  FControle.SqqGeral.ParamByName('NURG').AsString := Self.NuRG;
  FControle.SqqGeral.ParamByName('DTNASCIMENTO').AsDate := Self.DtNascimento;
  FControle.SqqGeral.ParamByName('TXEMAIL').AsString := Self.TxEmail;
  FControle.SqqGeral.ParamByName('NUCARTEIRATRAB').AsString := Self.NuCarteiraTrab;
  FControle.SqqGeral.ParamByName('NUTITULOELEITOR').AsString := Self.NuTituloEleitor;
  FControle.SqqGeral.ParamByName('NUCARTEIRAMOTORISTA').AsString := Self.NuCarteiraMotorista;
  FControle.SqqGeral.ParamByName('TPCATERORIA').AsString := Self.TpCateroria;
  FControle.SqqGeral.ParamByName('DTVALIDADECARTEIRAMOT').AsDate := Self.DtValidadeCarteiraMot;
  FControle.SqqGeral.ParamByName('TLRESIDENCIAL').AsString := Self.TlResidencial;
  FControle.SqqGeral.ParamByName('TLCELULAR').AsString := Self.TlCelular;
  FControle.SqqGeral.ParamByName('TLCONTATO').AsString := Self.TlContato;
  FControle.SqqGeral.ParamByName('NMCONTATO').AsString := Self.NmContato;
  FControle.SqqGeral.ParamByName('DTCONTRATACAO').AsDate := Self.DtContratacao;
  FControle.SqqGeral.ParamByName('DTDEMISSAO').AsDate := Self.DtDemissao;
  FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate := Self.DtCadastro;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;
  FControle.SqqGeral.ParamByName('TXOBS').AsString := Self.TxObs;
  FControle.SqqGeral.ParamByName('NMENDERECO').AsString := Self.NmEndereco;
  FControle.SqqGeral.ParamByName('NUENDERECO').AsString := Self.NuEndereco;
  FControle.SqqGeral.ParamByName('NMBAIRRO').AsString := Self.NmBairro;
  FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger := Self.IdCidade;
  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NUCEP').AsString := Self.NuCEP;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Cadastro de Titular. Verifique!');
  end;
end;

procedure TFuncionario.Excluir(const objetoFuncionario: TFuncionario);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('DELETE FROM CADFUNCIONARIOS ');
  FControle.SqqGeral.SQL.Add('WHERE IDFUNCIONARIO = :IDFUNCIONARIO ');

  FControle.SqqGeral.ParamByName('IDFUNCIONARIO').AsInteger := Self.IdFuncionario;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao excluir dados na tabela de Cadastro de Funcionários. Verifique!');
  end;
end;

function TFuncionario.Pesquisar(pIdEmpresa: string): TFuncionario;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT FUNC.IDFUNCIONARIO, FUNC.IDEMPRESA, FUNC.NMFUNCIONARIO, FUNC.NUCPF, FUNC.NURG, FUNC.DTNASCIMENTO, FUNC.TXEMAIL, ');
  FControle.SqqGeral.SQL.Add('  FUNC.NUCARTEIRATRAB, FUNC.NUTITULOELEITOR, FUNC.NUCARTEIRAMOTORISTA, FUNC.TPCATERORIA, ');
  FControle.SqqGeral.SQL.Add('  FUNC.DTVALIDADECARTEIRAMOT, FUNC.TLRESIDENCIAL, FUNC.TLCELULAR, FUNC.TLCONTATO, FUNC.NMCONTATO, ');
  FControle.SqqGeral.SQL.Add('  FUNC.DTCONTRATACAO, FUNC.DTDEMISSAO, FUNC.DTCADASTRO, FUNC.STATIVO, FUNC.TXOBS, FUNC.NMENDERECO, ');
  FControle.SqqGeral.SQL.Add('  FUNC.NUENDERECO, FUNC.NMBAIRRO, FUNC.IDCIDADE, FUNC.IDUF, FUNC.NUCEP, FUNC.STEXCLUIDO, FUNC.DTEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  UF.NMESTADO, UF.SGESTADO, CID.NMCIDADE ');
  FControle.SqqGeral.SQL.Add('FROM CADFUNCIONARIOS FUNC ');
  FControle.SqqGeral.SQL.Add('  INNER JOIN CADEMPRESA EMP ON (EMP.IDEMPRESA = FUNC.IDEMPRESA) ');
  FControle.SqqGeral.SQL.Add('  LEFT OUTER JOIN CADUF UF ON (UF.IDUF = FUNC.IDUF) ');
  FControle.SqqGeral.SQL.Add('  LEFT OUTER JOIN CADCIDADE CID ON (CID.IDCIDADE = FUNC.IDCIDADE AND CID.IDUF = UF.IDUF) ');

  if pIdEmpresa <> EmptyStr then
   FControle.SqqGeral.SQL.Add('WHERE FUNC.IDEMPRESA = '+ pIdEmpresa);

  FControle.SqqGeral.Open;

  if FControle.SqqGeral.IsEmpty then
  begin
    Self.IdFuncionario := -1;
  end
  else
  begin
    Self.IdFuncionario         := FControle.SqqGeral.ParamByName('IDFUNCIONARIO').AsInteger;
    Self.IdEmpresa             := FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger;
    Self.NmFuncionario         := FControle.SqqGeral.ParamByName('NMFUNCIONARIO').AsString;
    Self.NuCPF                 := FControle.SqqGeral.ParamByName('NUCPF').AsString;
    Self.NuRG                  := FControle.SqqGeral.ParamByName('NURG').AsString;
    Self.DtNascimento          := FControle.SqqGeral.ParamByName('DTNASCIMENTO').AsDate;
    Self.TxEmail               := FControle.SqqGeral.ParamByName('TXEMAIL').AsString;
    Self.NuCarteiraTrab        := FControle.SqqGeral.ParamByName('NUCARTEIRATRAB').AsString;
    Self.NuTituloEleitor       := FControle.SqqGeral.ParamByName('NUTITULOELEITOR').AsString;
    Self.NuCarteiraMotorista   := FControle.SqqGeral.ParamByName('NUCARTEIRAMOTORISTA').AsString;
    Self.TpCateroria           := FControle.SqqGeral.ParamByName('TPCATERORIA').AsString;
    Self.DtValidadeCarteiraMot := FControle.SqqGeral.ParamByName('DTVALIDADECARTEIRAMOT').AsDate;
    Self.TlResidencial         := FControle.SqqGeral.ParamByName('TLRESIDENCIAL').AsString;
    Self.TlCelular             := FControle.SqqGeral.ParamByName('TLCELULAR').AsString;
    Self.TlContato             := FControle.SqqGeral.ParamByName('TLCONTATO').AsString;
    Self.NmContato             := FControle.SqqGeral.ParamByName('NMCONTATO').AsString;
    Self.DtContratacao         := FControle.SqqGeral.ParamByName('DTCONTRATACAO').AsDate;
    Self.DtDemissao            := FControle.SqqGeral.ParamByName('DTDEMISSAO').AsDate;
    Self.DtCadastro            := FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate;
    Self.StAtivo               := FControle.SqqGeral.ParamByName('STATIVO').AsString;
    Self.TxObs                 := FControle.SqqGeral.ParamByName('TXOBS').AsString;
    Self.NmEndereco            := FControle.SqqGeral.ParamByName('NMENDERECO').AsString;
    Self.NuEndereco            := FControle.SqqGeral.ParamByName('NUENDERECO').AsString;
    Self.NmBairro              := FControle.SqqGeral.ParamByName('NMBAIRRO').AsString;
    Self.IdCidade              := FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger;
    Self.IdUF                  := FControle.SqqGeral.ParamByName('IDUF').AsInteger;
    Self.NuCEP                 := FControle.SqqGeral.ParamByName('NUCEP').AsString;
    Self.StExcluido            := FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString;
    Self.DtExcluido            := FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate;
  end;

  Result := Self;
end;

end.
