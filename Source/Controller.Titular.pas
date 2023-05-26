unit Controller.Titular;

interface

uses
  SysUtils, Model.Titular;

type
  TControllerTitular = class
  private
    function VerificaCampos(const objetoTitular: TTitular): boolean;
  public
    procedure Salvar(const objetoTitular: TTitular);
    procedure Atualizar(const objetoTitular: TTitular);
    procedure Excluir(const objetoTitular: TTitular);
  end;

implementation

{ TControllerTitular }

function TControllerTitular.VerificaCampos(const objetoTitular: TTitular): Boolean;
begin
  Result := objetoTitular.IdEmpresa.ToString.IsEmpty;
end;

procedure TControllerTitular.Salvar(const objetoTitular: TTitular);
begin
  if VerificaCampos(objetoTitular) then
    raise Exception.Create('Campo Empresa é obrigatório.');

  objetoTitular.Inserir(objetoTitular);
end;

procedure TControllerTitular.Atualizar(const objetoTitular: TTitular);
begin
  if VerificaCampos(objetoTitular) then
    raise Exception.Create('Campo Empresa é obrigatório.');

  objetoTitular.Alterar(objetoTitular);
end;

procedure TControllerTitular.Excluir(const objetoTitular: TTitular);
begin
  objetoTitular.Excluir(objetoTitular);
end;

end.
