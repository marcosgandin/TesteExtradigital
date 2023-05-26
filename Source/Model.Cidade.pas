unit Model.Cidade;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, Controller,
  Firedac.Stan.Param, Data.DB;

type
  TCidade = class
    private
      FIdCidade: Integer;
      FNmCidade: string;
      FIdUF: Integer;
      FNoIBGE: string;
      FControle: TController;
    public
      constructor Create(pConexaoControle:TController);
      destructor Destroy; override;

      procedure Inserir(const objetoCidade: TCidade);
      procedure Alterar(const objetoCidade: TCidade);
      procedure Excluir(const objetoCidade: TCidade);
      function Pesquisar(pIdUF: string): TCidade;

      property IdCidade : Integer read FIdCidade write FIdCidade;
      property NmCidade : string read FNmCidade write FNmCidade;
      property IdUF     : Integer read FIdUF write FIdUF;
      property NoIBGE   : string read FNoIBGE write FNoIBGE;
  end;

implementation

{ TCidade }

constructor TCidade.Create(pConexaoControle:TController);
begin
  FControle := pConexaoControle;
end;

destructor TCidade.Destroy;
begin

  inherited;
end;

procedure TCidade.Inserir(const objetoCidade: TCidade);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('INSERT INTO CADCIDADE ');
  FControle.SqqGeral.SQL.Add('  (NMCIDADE, IDUF, NOIBGE) ');
  FControle.SqqGeral.SQL.Add('VALUES ');
  FControle.SqqGeral.SQL.Add('  (:NMCIDADE, :IDUF, :NOIBGE) ');

  FControle.SqqGeral.ParamByName('NMCIDADE').AsString := Self.NmCidade;
  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NOIBGE').AsString := Self.NoIBGE;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Cadastro de Cidades. Verifique!');
  end;
end;

procedure TCidade.Alterar(const objetoCidade: TCidade);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('UPDATE CADCIDADE SET ');
  FControle.SqqGeral.SQL.Add('  NMCIDADE = :NMCIDADE, ');
  FControle.SqqGeral.SQL.Add('  IDUF = :IDUF, ');
  FControle.SqqGeral.SQL.Add('  NOIBGE = :NOIBGE ');
  FControle.SqqGeral.SQL.Add('WHERE IDCIDADE = :IDCIDADE ');

  FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger := Self.IdCidade;
  FControle.SqqGeral.ParamByName('NMCIDADE').AsString := Self.NmCidade;
  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NOIBGE').AsString := Self.NoIBGE;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Cadastro de Cidades. Verifique!');
  end;
end;

procedure TCidade.Excluir(const objetoCidade: TCidade);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('DELETE FROM CADCIDADE ');
  FControle.SqqGeral.SQL.Add('WHERE IDCIDADE = :IDCIDADE ');

  FControle.SqqGeral.ParamByName('IDCIDADE').AsInteger := Self.IdCidade;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao excluir dados na tabela de Cadastro de Cidades. Verifique!');
  end;
end;

function TCidade.Pesquisar(pIdUF: string): TCidade;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT IDCIDADE, NMCIDADE, IDUF, NOIBGE ');
  FControle.SqqGeral.SQL.Add('FROM CADCIDADE ');

  if pIdUF <> EmptyStr then
    FControle.SqqGeral.SQL.Add('WHERE IDUF = '+ pIdUF);

  FControle.SqqGeral.Open;

  if FControle.SqqGeral.IsEmpty then
  begin
    Self.IdCidade := -1;
  end
  else
  begin
    Self.IdCidade := FControle.SqqGeral.FieldByName('IDCIDADE').AsInteger;
    Self.NmCidade := FControle.SqqGeral.FieldByName('NMCIDADE').AsString;
    Self.IdUF     := FControle.SqqGeral.FieldByName('IDUF').AsInteger;
    Self.NoIBGE   := FControle.SqqGeral.FieldByName('NOIBGE').AsString;
  end;

  Result := Self;
end;

end.
