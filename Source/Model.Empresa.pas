unit Model.Empresa;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, Controller,
  Firedac.Stan.Param, Data.DB;

type
  TEmpresa = class
    private
      FTlCelular: string;
      FDtCadastro: TDate;
      FIdEmpresa: Integer;
      FNuCNPJ: string;
      FDtExcluido: TDate;
      FTxOBS: Integer;
      FStExcluido: string;
      FTlComercial: string;
      FTxEmail: string;
      FNuInscricao: string;
      FDtAbertura: TDate;
      FStAtivo: string;
      FNmEmpresa: string;
      FControle: TController;
    public
      constructor Create(pConexaoControle: TController);
      destructor Destroy; override;

      procedure Inserir(const objetoEmpresa: TEmpresa);
      procedure Alterar(const objetoEmpresa: TEmpresa);
      procedure Excluir(const objetoEmpresa: TEmpresa);
      function Pesquisar(pIdEmpresa: string): TEmpresa;

      property IdEmpresa   : Integer read FIdEmpresa write FIdEmpresa;
      property NmEmpresa   : string read FNmEmpresa write FNmEmpresa;
      property NuCNPJ      : string read FNuCNPJ write FNuCNPJ;
      property NuInscricao : string read FNuInscricao write FNuInscricao;
      property StAtivo     : string read FStAtivo write FStAtivo;
      property DtCadastro  : TDate read FDtCadastro write FDtCadastro;
      property DtAbertura  : TDate read FDtAbertura write FDtAbertura;
      property TlComercial : string read FTlComercial write FTlComercial;
      property TlCelular   : string read FTlCelular write FTlCelular;
      property TxOBS       : Integer read FTxOBS write FTxOBS;
      property TxEmail     : string read FTxEmail write FTxEmail;
      property StExcluido  : string read FStExcluido write FStExcluido;
      property DtExcluido  : TDate read FDtExcluido write FDtExcluido;
  end;

implementation

{ TEmpresa }

constructor TEmpresa.Create(pConexaoControle: TController);
begin
  FControle := pConexaoControle;
end;

destructor TEmpresa.Destroy;
begin

  inherited;
end;

procedure TEmpresa.Inserir(const objetoEmpresa: TEmpresa);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('INSERT INTO CADEMPRESA ');
  FControle.SqqGeral.SQL.Add('  (NMEMPRESA, NUCNPJ, NUINSCRICAO, STATIVO, DTCADASTRO, DTABERTURA, ');
  FControle.SqqGeral.SQL.Add('   TLCOMERCIAL, TLCELULAR, TXOBS, TXEMAIL, STEXCLUIDO, DTEXCLUIDO) ');
  FControle.SqqGeral.SQL.Add('VALUES ');
  FControle.SqqGeral.SQL.Add('  (:NMEMPRESA, :NUCNPJ, :NUINSCRICAO, :STATIVO, :DTCADASTRO, :DTABERTURA, ');
  FControle.SqqGeral.SQL.Add('   :TLCOMERCIAL, :TLCELULAR, :TXOBS, :TXEMAIL, :STEXCLUIDO, :DTEXCLUIDO) ');

  FControle.SqqGeral.ParamByName('NMEMPRESA').AsString := Self.NmEmpresa;
  FControle.SqqGeral.ParamByName('NUCNPJ').AsString := Self.NuCNPJ;
  FControle.SqqGeral.ParamByName('NUINSCRICAO').AsString := Self.NuInscricao;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;
  FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate := Self.DtCadastro;
  FControle.SqqGeral.ParamByName('DTABERTURA').AsDate := Self.DtAbertura;
  FControle.SqqGeral.ParamByName('TLCOMERCIAL').AsString := Self.TlComercial;
  FControle.SqqGeral.ParamByName('TLCELULAR').AsString := Self.TlCelular;
  FControle.SqqGeral.ParamByName('TXOBS').AsInteger := Self.TxOBS;
  FControle.SqqGeral.ParamByName('TXEMAIL').AsString := Self.TxEmail;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Cadastro de Empresa. Verifique!');
  end;
end;

procedure TEmpresa.Alterar(const objetoEmpresa: TEmpresa);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('UPDATE CADEMPRESA SET ');
  FControle.SqqGeral.SQL.Add('  NMEMPRESA = :NMEMPRESA, ');
  FControle.SqqGeral.SQL.Add('  NUCNPJ = :NUCNPJ, ');
  FControle.SqqGeral.SQL.Add('  NUINSCRICAO = :NUINSCRICAO, ');
  FControle.SqqGeral.SQL.Add('  STATIVO = :STATIVO, ');
  FControle.SqqGeral.SQL.Add('  DTCADASTRO = :DTCADASTRO, ');
  FControle.SqqGeral.SQL.Add('  DTABERTURA = :DTABERTURA, ');
  FControle.SqqGeral.SQL.Add('  TLCOMERCIAL = :TLCOMERCIAL, ');
  FControle.SqqGeral.SQL.Add('  TLCELULAR = :TLCELULAR, ');
  FControle.SqqGeral.SQL.Add('  TXOBS = :TXOBS, ');
  FControle.SqqGeral.SQL.Add('  TXEMAIL = :TXEMAIL, ');
  FControle.SqqGeral.SQL.Add('  STEXCLUIDO = :STEXCLUIDO, ');
  FControle.SqqGeral.SQL.Add('  DTEXCLUIDO = :DTEXCLUIDO ');
  FControle.SqqGeral.SQL.Add('WHERE IDEMPRESA = :IDEMPRESA ');

  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;
  FControle.SqqGeral.ParamByName('NMEMPRESA').AsString := Self.NmEmpresa;
  FControle.SqqGeral.ParamByName('NUCNPJ').AsString := Self.NuCNPJ;
  FControle.SqqGeral.ParamByName('NUINSCRICAO').AsString := Self.NuInscricao;
  FControle.SqqGeral.ParamByName('STATIVO').AsString := Self.StAtivo;
  FControle.SqqGeral.ParamByName('DTCADASTRO').AsDate := Self.DtCadastro;
  FControle.SqqGeral.ParamByName('DTABERTURA').AsDate := Self.DtAbertura;
  FControle.SqqGeral.ParamByName('TLCOMERCIAL').AsString := Self.TlComercial;
  FControle.SqqGeral.ParamByName('TLCELULAR').AsString := Self.TlCelular;
  FControle.SqqGeral.ParamByName('TXOBS').AsInteger := Self.TxOBS;
  FControle.SqqGeral.ParamByName('TXEMAIL').AsString := Self.TxEmail;
  FControle.SqqGeral.ParamByName('STEXCLUIDO').AsString := Self.StExcluido;
  FControle.SqqGeral.ParamByName('DTEXCLUIDO').AsDate := Self.DtExcluido;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Cadastro de Empresa. Verifique!');
  end;
end;

procedure TEmpresa.Excluir(const objetoEmpresa: TEmpresa);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('DELETE FROM CADEMPRESA ');
  FControle.SqqGeral.SQL.Add('WHERE IDEMPRESA = :IDEMPRESA ');

  FControle.SqqGeral.ParamByName('IDEMPRESA').AsInteger := Self.IdEmpresa;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao excluir dados na tabela de Cadastro de Empresa. Verifique!');
  end;
end;

function TEmpresa.Pesquisar(pIdEmpresa: string): TEmpresa;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT IDEMPRESA, NMEMPRESA, NUCNPJ, NUINSCRICAO, STATIVO, DTCADASTRO, DTABERTURA, ');
  FControle.SqqGeral.SQL.Add('  TLCOMERCIAL, TLCELULAR, TXOBS, TXEMAIL, STEXCLUIDO, DTEXCLUIDO ');
  FControle.SqqGeral.SQL.Add('FROM CADEMPRESA ');

  if pIdEmpresa <> EmptyStr then
    FControle.SqqGeral.SQL.Add('WHERE IDEMPRESA = '+ pIdEmpresa);

  FControle.SqqGeral.Open;

  if FControle.SqqGeral.IsEmpty then
  begin
    Self.IdEmpresa := -1;
  end
  else
  begin
    Self.IdEmpresa   := FControle.SqqGeral.FieldByName('IDEMPRESA').AsInteger;
    Self.NmEmpresa   := FControle.SqqGeral.FieldByName('NMEMPRESA').AsString;
    Self.NuCNPJ      := FControle.SqqGeral.FieldByName('NUCNPJ').AsString;
    Self.NuInscricao := FControle.SqqGeral.FieldByName('NUINSCRICAO').AsString;
    Self.StAtivo     := FControle.SqqGeral.FieldByName('STATIVO').AsString;
    Self.DtCadastro  := FControle.SqqGeral.FieldByName('DTCADASTRO').AsDateTime;
    Self.DtAbertura  := FControle.SqqGeral.FieldByName('DTABERTURA').AsDateTime;
    Self.TlComercial := FControle.SqqGeral.FieldByName('TLCOMERCIAL').AsString;
    Self.TlCelular   := FControle.SqqGeral.FieldByName('TLCELULAR').AsString;
    Self.TxOBS       := FControle.SqqGeral.FieldByName('TXOBS').AsInteger;
    Self.TxEmail     := FControle.SqqGeral.FieldByName('TXEMAIL').AsString;
    Self.StExcluido  := FControle.SqqGeral.FieldByName('STEXCLUIDO').AsString;
    Self.DtExcluido  := FControle.SqqGeral.FieldByName('DTEXCLUIDO').AsDateTime;
  end;

  Result := Self;
end;

end.
