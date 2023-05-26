unit Model.Endereco;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, Controller,
  Firedac.Stan.Param, Data.DB;

type
  TEndereco = class
    private
      FIdEndereco  : Integer;
      FIdTitular   : Integer;
      FIdEmpresa   : Integer;
      FNmEndereco  : string;
      FNuEndereco  : string;
      FNmBairro    : string;
      FIdCidade    : Integer;
      FIdUF        : Integer;
      FNuCEP       : string;
      FStAtivo     : string;
      FStExcluido  : string;
      FDtExcluido  : TDate;
      FTpCadastro  : string;
      FControle: TController;
    public
      constructor Create(pConexaoControle:TController);
      destructor Destroy; override;

      procedure Inserir(const objetoEndereco: TEndereco);
      procedure Alterar(const objetoEndereco: TEndereco);
      procedure Excluir(const objetoEndereco: TEndereco);
      function  Pesquisar(pIdEmpresa: string): TEndereco;
      function ExisteEnderecoAtivo(pIdEmpresa: string): Boolean;

      property IdEndereco : Integer read FIdEndereco write FIdEndereco;
      property IdTitular  : Integer read FIdTitular write FIdTitular;
      property IdEmpresa  : Integer read FIdEmpresa write FIdEmpresa;
      property NmEndereco : string read FNmEndereco write FNmEndereco;
      property NuEndereco : string read FNuEndereco write FNuEndereco;
      property NmBairro   : string read FNmBairro write FNmBairro;
      property IdCidade   : Integer read FIdCidade write FIdCidade;
      property IdUF       : Integer read FIdUF write FIdUF;
      property NuCEP      : string read FNuCEP write FNuCEP;
      property StAtivo    : string read FStAtivo write FStAtivo;
      property StExcluido : string read FStExcluido write FStExcluido;
      property DtExcluido : TDate read FDtExcluido write FDtExcluido;
      property TpCadastro : string read FTpCadastro write FTpCadastro;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create(pConexaoControle:TController);
begin
  FControle := pConexaoControle;
end;

destructor TEndereco.Destroy;
begin

  inherited;
end;

procedure TEndereco.Inserir(const objetoEndereco: TEndereco);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('INSERT INTO CADENDERECOS ');
  FControle.SqqGeral.SQL.Add('  (IDTITULAR, IDEMPRESA, NMENDERECO, NUENDERECO, NMBAIRRO, IDCIDADE, ');
  FControle.SqqGeral.SQL.Add('   IDUF, NUCEP, STATIVO, STEXCLUIDO, DTEXCLUIDO, TPCADASTRO) ');
  FControle.SqqGeral.SQL.Add('VALUES ');
  FControle.SqqGeral.SQL.Add('  (:IDTITULAR, :IDEMPRESA, :NMENDERECO, :NUENDERECO, :NMBAIRRO, :IDCIDADE, ');
  FControle.SqqGeral.SQL.Add('   :IDUF, :NUCEP, :STATIVO, :STEXCLUIDO, :DTEXCLUIDO, :TPCADASTRO) ');

  FControle.SqqGeral.ParamByName('IDTITULAR').AsInteger := Self.IdTitular;
  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMENDERECO').AsString := Self.NmEndereco;
  FControle.SqqGeral.ParamByName('NUENDERECO').AsString := Self.NuEndereco;
  FControle.SqqGeral.ParamByName('NMBAIRRO').AsString := Self.NmBairro;
  FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger := Self.IdCidade;
  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NUCEP').AsString := Self.NuCEP;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;
  FControle.SqqGeral.ParamByName('TPCADASTRO').AsString := Self.TpCadastro;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Cadastro de Endereços. Verifique!');
  end;
end;

procedure TEndereco.Alterar(const objetoEndereco: TEndereco);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('UPDATE CADENDERECOS SET ');
  FControle.SqqGeral.SQL.Add('  IDTITULAR = :IDTITULAR, ');
  FControle.SqqGeral.SQL.Add('  IDEMPRESA = :IDEMPRESA, ');
  FControle.SqqGeral.SQL.Add('  NMENDERECO = :NMENDERECO, ');
  FControle.SqqGeral.SQL.Add('  NUENDERECO = :NUENDERECO, ');
  FControle.SqqGeral.SQL.Add('  NMBAIRRO = :NMBAIRRO, ');
  FControle.SqqGeral.SQL.Add('  IDCIDADE = :IDCIDADE, ');
  FControle.SqqGeral.SQL.Add('  IDUF = :IDUF, ');
  FControle.SqqGeral.SQL.Add('  NUCEP = :NUCEP, ');
  FControle.SqqGeral.SQL.Add('  STATIVO = :STATIVO, ');
  FControle.SqqGeral.SQL.Add('  STEXCLUIDO = :STEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  DTEXCLUIDO = :DTEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  TPCADASTRO = :TPCADASTRO ');
  FControle.SqqGeral.SQL.Add('WHERE IDENDERECO = :IDENDERECO ');

  FControle.SqqGeral.ParamByName('IDENDERECO').AsInteger := Self.IdEndereco;
  FControle.SqqGeral.ParamByName('IDTITULAR').AsInteger := Self.IdTitular;
  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMENDERECO').AsString := Self.NmEndereco;
  FControle.SqqGeral.ParamByName('NUENDERECO').AsString := Self.NuEndereco;
  FControle.SqqGeral.ParamByName('NMBAIRRO').AsString := Self.NmBairro;
  FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger := Self.IdCidade;
  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NUCEP').AsString := Self.NuCEP;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;
  FControle.SqqGeral.ParamByName('TPCADASTRO').AsString := Self.TpCadastro;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Cadastro de Endereços. Verifique!');
  end;
end;

procedure TEndereco.Excluir(const objetoEndereco: TEndereco);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('DELETE FROM CADENDERECOS ');
  FControle.SqqGeral.SQL.Add('WHERE IDENDERECO = :IDENDERECO ');

  FControle.SqqGeral.ParamByName('IDENDERECO').AsInteger := Self.IdEndereco;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao excluir dados na tabela de Cadastro de Endereçoes. Verifique!');
  end;
end;

function TEndereco.ExisteEnderecoAtivo(pIdEmpresa: string): Boolean;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT IDENDERECO FROM CADENDERECOS ');
  FControle.SqqGeral.SQL.Add('WHERE IDEMPRESA = '+ pIdEmpresa);
  FControle.SqqGeral.SQL.Add('  AND STATIVO = '+QuotedStr('S'));
  FControle.SqqGeral.Open;

  Result := not FControle.SqqGeral.IsEmpty;
end;

function TEndereco.Pesquisar(pIdEmpresa: string): TEndereco;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT ENDE.IDENDERECO, ENDE.IDTITULAR, ENDE.IDEMPRESA, ENDE.NMENDERECO, ENDE.NUENDERECO, ENDE.NMBAIRRO, ENDE.IDCIDADE, ');
  FControle.SqqGeral.SQL.Add('  CID.NMCIDADE, ENDE.IDUF, UF.NMESTADO, ENDE.NUCEP, ENDE.STATIVO, ENDE.STEXCLUIDO, ENDE.DTEXCLUIDO, ENDE.TPCADASTRO, ');
  FControle.SqqGeral.SQL.Add('  TIT.NMTITULAR, UF.SGESTADO ');
  FControle.SqqGeral.SQL.Add('FROM CADENDERECOS ENDE ');
  FControle.SqqGeral.SQL.Add('  LEFT OUTER JOIN CADTITULAR TIT ON (TIT.IDEMPRESA = ENDE.IDEMPRESA) ');
  FControle.SqqGeral.SQL.Add('  LEFT OUTER JOIN CADUF UF ON (UF.IDUF = ENDE.IDUF) ');
  FControle.SqqGeral.SQL.Add('  LEFT OUTER JOIN CADCIDADE CID ON (CID.IDCIDADE = ENDE.IDCIDADE AND CID.IDUF = UF.IDUF) ');

  if pIdEmpresa <> EmptyStr then
    FControle.SqqGeral.SQL.Add('WHERE ENDE.IDEMPRESA = '+ pIdEmpresa);

  FControle.SqqGeral.Open;

  if FControle.SqqGeral.IsEmpty then
  begin
    Self.IdEndereco := -1;
  end
  else
  begin
    Self.IdEndereco := FControle.SqqGeral.FieldByName('IDENDERECO').AsInteger;
    Self.IdTitular  := FControle.SqqGeral.FieldByName('IDTITULAR').AsInteger;
    Self.IdEmpresa  := FControle.SqqGeral.FieldByName('IDEMPRESA').AsInteger;
    Self.NmEndereco := FControle.SqqGeral.FieldByName('NMENDERECO').AsString;
    Self.NuEndereco := FControle.SqqGeral.FieldByName('NUENDERECO').AsString;
    Self.NmBairro   := FControle.SqqGeral.FieldByName('NMBAIRRO').AsString;
    Self.IdCidade   := FControle.SqqGeral.FieldByName('IDCIDADE').AsInteger;
    Self.IdUF       := FControle.SqqGeral.FieldByName('IDUF').AsInteger;
    Self.NuCEP      := FControle.SqqGeral.FieldByName('NUCEP').AsString;
    Self.StAtivo    := FControle.SqqGeral.FieldByName('STATIVO').AsString;
    Self.StExcluido := FControle.SqqGeral.FieldByName('STEXCLUIDO').AsString;
    Self.DtExcluido := FControle.SqqGeral.FieldByName('DTEXCLUIDO').AsDateTime;
    Self.TpCadastro := FControle.SqqGeral.FieldByName('TPCADASTRO').AsString;
  end;

  Result := Self;
end;

end.
