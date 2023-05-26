unit Model.UF;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, Controller,
  Firedac.Stan.Param, Data.DB;

type
  TUF = class
    private
      FIdUF: Integer;
      FNmEstado: string;
      FSgEstado: string;
      FControle: TController;
    public
      constructor Create(pConexaoControle:TController);
      destructor Destroy; override;

      procedure Inserir(const objetoUF: TUF);
      procedure Alterar(const objetoUF: TUF);
      procedure Excluir(const objetoUF: TUF);
      function Pesquisar(pIdUF: string): TUF;

      property IdUF     : Integer read FIdUF write FIdUF;
      property NmEstado : string read FNmEstado write FNmEstado;
      property SgEstado : string read FSgEstado write FSgEstado;
  end;

implementation

{ TUF }

constructor TUF.Create(pConexaoControle:TController);
begin
  FControle := pConexaoControle;
end;

destructor TUF.Destroy;
begin

  inherited;
end;

procedure TUF.Inserir(const objetoUF: TUF);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('INSERT INTO CADUF ');
  FControle.SqqGeral.SQL.Add('  (IDUF, NMESTADO, SGESTADO) ');
  FControle.SqqGeral.SQL.Add('VALUES ');
  FControle.SqqGeral.SQL.Add('  (:IDUF, :NMESTADO, SGESTADO) ');

  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NMESTADO').AsString := Self.NmEstado;
  FControle.SqqGeral.ParamByName('SGESTADO').AsString := Self.SgEstado;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Cadastro de Estados. Verifique!');
  end;
end;

procedure TUF.Alterar(const objetoUF: TUF);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('UPDATE CADUF SET ');
  FControle.SqqGeral.SQL.Add('  NMESTADO = :NMESTADO, ');
  FControle.SqqGeral.SQL.Add('  SGESTADO = :SGESTADO ');
  FControle.SqqGeral.SQL.Add('WHERE IDUF = :IDUF ');

  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;
  FControle.SqqGeral.ParamByName('NMESTADO').AsString := Self.NmEstado;
  FControle.SqqGeral.ParamByName('SGESTADO').AsString := Self.SgEstado;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Cadastro de Estados. Verifique!');
  end;
end;

procedure TUF.Excluir(const objetoUF: TUF);
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('DELETE FROM CADUF ');
  FControle.SqqGeral.SQL.Add('WHERE IDUF = :IDUF ');

  FControle.SqqGeral.ParamByName('IDUF').AsInteger := Self.IdUF;

  try
    FControle.SqqGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao excluir dados na tabela de Cadastro de Estados. Verifique!');
  end;
end;

function TUF.Pesquisar(pIdUF: string): TUF;
begin
  FControle.SqqGeral.Close;
  FControle.SqqGeral.SQL.Clear;
  FControle.SqqGeral.SQL.Add('SELECT IDUF, NMESTADO, SGESTADO ');
  FControle.SqqGeral.SQL.Add('FROM CADUF ');

  if pIdUF <> EmptyStr then
    FControle.SqqGeral.SQL.Add('WHERE IDUF = '+ pIdUF);

  FControle.SqqGeral.Open;

  if FControle.SqqGeral.IsEmpty then
  begin
    Self.IdUF := -1;
  end
  else
  begin
    Self.IdUF     := FControle.SqqGeral.FieldByName('IDUF').AsInteger;
    Self.NmEstado := FControle.SqqGeral.FieldByName('NMESTADO').AsString;
    Self.SgEstado := FControle.SqqGeral.FieldByName('SGESTADO').AsString;
  end;

  Result := Self;
end;

end.
