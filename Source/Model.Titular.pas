unit Model.Titular;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, Controller,
  Firedac.Stan.Param, Data.DB;

type
  TTitular = class
    private
      FIdTitular     : Integer;
      FIdEmpresa     : Integer;
      FNmTitular     : string;
      FNuCNPJCPF     : string;
      FNuIncricaoRG  : string;
      FDtNascimento  : TDate;
      FDtCadastro    : TDate;
      FTxEmail       : string;
      FTxObs         : string;
      FTlResidencial : string;
      FTlComercial   : string;
      FTlCelular     : string;
      FTlContato     : string;
      FNmContato     : string;
      FStExcluido    : string;
      FDtExcluido    : TDate;
      FStAtivo       : string;
      FControle: TController;
    public
      constructor Create(pConexaoControle:TController);
      destructor Destroy; override;

      procedure Inserir(objetoTitular: TTitular);
      procedure Alterar(objetoTitular: TTitular);
      procedure Excluir(objetoTitular: TTitular);
      function Pesquisar(pIdTitular: string): TTitular;

      property IdTitular     : Integer read FIdTitular write FIdTitular;
      property IdEmpresa     : Integer read FIdEmpresa write FIdEmpresa;
      property NmTitular     : string read FNmTitular write FNmTitular;
      property NuCNPJCPF     : string read FNuCNPJCPF write FNuCNPJCPF;
      property NuIncricaoRG  : string read FNuIncricaoRG write FNuIncricaoRG;
      property DtNascimento  : TDate read FDtNascimento write FDtNascimento;
      property DtCadastro    : TDate read FDtCadastro write FDtCadastro;
      property TxEmail       : string read FTxEmail write FTxEmail;
      property TxObs         : string read FTxObs write FTxObs;
      property TlResidencial : string read FTlResidencial write FTlResidencial;
      property TlComercial   : string read FTlComercial write FTlComercial;
      property TlCelular     : string read FTlCelular write FTlCelular;
      property TlContato     : string read FTlContato write FTlContato;
      property NmContato     : string read FNmContato write FNmContato;
      property StExcluido    : string read FStExcluido write FStExcluido;
      property DtExcluido    : TDate read FDtExcluido write FDtExcluido;
      property StAtivo       : string read FStAtivo write FStAtivo;
  end;

implementation

{ TTitular }

constructor TTitular.Create(pConexaoControle:TController);
begin
  FControle := pConexaoControle;
end;

destructor TTitular.Destroy;
begin

  inherited;
end;

procedure TTitular.Inserir(objetoTitular: TTitular);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('INSERT INTO CADTITULAR ');
  FControle.SqqGeral.SQL.Add('  (IDEMPRESA, NMTITULAR, NUCNPJCPF, NUINCRICAORG, DTNASCIMENTO, DTCADASTRO, ');
  FControle.SqqGeral.SQL.Add('   TXEMAIL, TXOBS, TLRESIDENCIAL, TLCOMERCIAL, TLCELULAR, TLCONTATO, ');
  FControle.SqqGeral.SQL.Add('   NMCONTATO, STEXCLUIDO, DTEXCLUIDO, STATIVO) ');
  FControle.SqqGeral.SQL.Add('VALUES ');
  FControle.SqqGeral.SQL.Add('  (:IDEMPRESA, :NMTITULAR, :NUCNPJCPF, :NUINCRICAORG, :DTNASCIMENTO, :DTCADASTRO, ');
  FControle.SqqGeral.SQL.Add('   :TXEMAIL, :TXOBS, :TLRESIDENCIAL, :TLCOMERCIAL, :TLCELULAR, :TLCONTATO, ');
  FControle.SqqGeral.SQL.Add('   :NMCONTATO, :STEXCLUIDO, :DTEXCLUIDO, :STATIVO) ');

  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMTITULAR').AsString := Self.NmTitular;
  FControle.SqqGeral.ParamByName('NUCNPJCPF').AsString := Self.NuCNPJCPF;
  FControle.SqqGeral.ParamByName('NUINCRICAORG').AsString := Self.NuIncricaoRG;
  FControle.SqqGeral.ParamByName('DTNASCIMENTO').AsDate := Self.DtNascimento;
  FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate := Self.DtCadastro;
  FControle.SqqGeral.ParamByName('TXEMAIL').AsString := Self.TxEmail;
  FControle.SqqGeral.ParamByName('TXOBS').AsString := Self.TxObs;
  FControle.SqqGeral.ParamByName('TLRESIDENCIAL').AsString := Self.TlResidencial;
  FControle.SqqGeral.ParamByName('TLCOMERCIAL').AsString := Self.TlComercial;
  FControle.SqqGeral.ParamByName('TLCELULAR').AsString := Self.TlCelular;
  FControle.SqqGeral.ParamByName('TLCONTATO').AsString := Self.TlContato;
  FControle.SqqGeral.ParamByName('NMCONTATO').AsString := Self.NmContato;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Cadastro de Titular. Verifique!');
  end;
end;

procedure TTitular.Alterar(objetoTitular: TTitular);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('UPDATE CADTITULAR SET ');
  FControle.SqqGeral.SQL.Add('  IDEMPRESA = :IDEMPRESA, ');
  FControle.SqqGeral.SQL.Add('  NMTITULAR = :NMTITULAR, ');
  FControle.SqqGeral.SQL.Add('  NUCNPJCPF = :NUCNPJCPF, ');
  FControle.SqqGeral.SQL.Add('  NUINCRICAORG = :NUINCRICAORG, ');
  FControle.SqqGeral.SQL.Add('  DTNASCIMENTO = :DTNASCIMENTO, ');
  FControle.SqqGeral.SQL.Add('  DTCADASTRO = :DTCADASTRO, ');
  FControle.SqqGeral.SQL.Add('  TXEMAIL = :TXEMAIL, ');
  FControle.SqqGeral.SQL.Add('  TXOBS = :TXOBS, ');
  FControle.SqqGeral.SQL.Add('  TLRESIDENCIAL = :TLRESIDENCIAL, ');
  FControle.SqqGeral.SQL.Add('  TLCOMERCIAL = :TLCOMERCIAL, ');
  FControle.SqqGeral.SQL.Add('  TLCELULAR = :TLCELULAR, ');
  FControle.SqqGeral.SQL.Add('  TLCONTATO = :TLCONTATO, ');
  FControle.SqqGeral.SQL.Add('  NMCONTATO = :NMCONTATO, ');
  FControle.SqqGeral.SQL.Add('  STEXCLUIDO = :STEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  DTEXCLUIDO = :DTEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  STATIVO = :STATIVO ');
  FControle.SqqGeral.SQL.Add('WHERE IDTITULAR = :IDTITULAR ');

  FControle.SqqGeral.ParamByName('IDTITULAR').AsInteger := Self.IdTitular;
  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMTITULAR').AsString := Self.NmTitular;
  FControle.SqqGeral.ParamByName('NUCNPJCPF').AsString := Self.NuCNPJCPF;
  FControle.SqqGeral.ParamByName('NUINCRICAORG').AsString := Self.NuIncricaoRG;
  FControle.SqqGeral.ParamByName('DTNASCIMENTO').AsDate := Self.DtNascimento;
  FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate := Self.DtCadastro;
  FControle.SqqGeral.ParamByName('TXEMAIL').AsString := Self.TxEmail;
  FControle.SqqGeral.ParamByName('TXOBS').AsString := Self.TxObs;
  FControle.SqqGeral.ParamByName('TLRESIDENCIAL').AsString := Self.TlResidencial;
  FControle.SqqGeral.ParamByName('TLCOMERCIAL').AsString := Self.TlComercial;
  FControle.SqqGeral.ParamByName('TLCELULAR').AsString := Self.TlCelular;
  FControle.SqqGeral.ParamByName('TLCONTATO').AsString := Self.TlContato;
  FControle.SqqGeral.ParamByName('NMCONTATO').AsString := Self.NmContato;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Cadastro de Titular. Verifique!');
  end;
end;

procedure TTitular.Excluir(objetoTitular: TTitular);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('DELETE FROM CADTITULAR ');
  FControle.SqqGeral.SQL.Add('WHERE IDTITULAR = :IDTITULAR ');

  FControle.SqqGeral.ParamByName('IDTITULAR').AsInteger := Self.IdTitular;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao excluir dados na tabela de Cadastro de Titular. Verifique!');
  end;
end;

function TTitular.Pesquisar(pIdTitular: string): TTitular;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT IDTITULAR, IDEMPRESA, NMTITULAR, NUCNPJCPF, NUINCRICAORG, DTNASCIMENTO, DTCADASTRO, ');
  FControle.SqqGeral.SQL.Add('  TXEMAIL, TXOBS, TLRESIDENCIAL, TLCOMERCIAL, TLCELULAR, TLCONTATO, NMCONTATO, STEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  DTEXCLUIDO, STATIVO');
  FControle.SqqGeral.SQL.Add('FROM CADTITULAR ');
  FControle.SqqGeral.SQL.Add('WHERE IDTITULAR = '+ pIdTitular);
  FControle.SqqGeral.Open;

  if FControle.SqqGeral.IsEmpty then
  begin
    Self.IdTitular := -1;
  end
  else
  begin
    Self.IdTitular     := FControle.SqqGeral.ParamByName('IDTITULAR').AsInteger;
    Self.IdEmpresa     := FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger;
    Self.NmTitular     := FControle.SqqGeral.ParamByName('NMTITULAR').AsString;
    Self.NuCNPJCPF     := FControle.SqqGeral.ParamByName('NUCNPJCPF').AsString;
    Self.NuIncricaoRG  := FControle.SqqGeral.ParamByName('NUINCRICAORG').AsString;
    Self.DtNascimento  := FControle.SqqGeral.ParamByName('DTNASCIMENTO').AsDate;
    Self.DtCadastro    := FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate;
    Self.TxEmail       := FControle.SqqGeral.ParamByName('TXEMAIL').AsString;
    Self.TxObs         := FControle.SqqGeral.ParamByName('TXOBS').AsString;
    Self.TlResidencial := FControle.SqqGeral.ParamByName('TLRESIDENCIAL').AsString;
    Self.TlComercial   := FControle.SqqGeral.ParamByName('TLCOMERCIAL').AsString;
    Self.TlCelular     := FControle.SqqGeral.ParamByName('TLCELULAR').AsString;
    Self.TlContato     := FControle.SqqGeral.ParamByName('TLCONTATO').AsString;
    Self.NmContato     := FControle.SqqGeral.ParamByName('NMCONTATO').AsString;
    Self.StExcluido    := FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString;
    Self.DtExcluido    := FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate;
    Self.StAtivo       := FControle.SqqGeral.ParamByName('STATIVO').AsString;
  end;

  Result := Self;
end;

end.
