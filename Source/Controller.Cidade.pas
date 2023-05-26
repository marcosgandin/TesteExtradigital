unit Controller.Cidade;

interface

uses
  SysUtils, Model.Cidade;

type
  TControllerCidade = class
  private
    function VerificaCampos(const objetoCidade: TCidade): boolean;
  public
    procedure Salvar(const objetoCidade: TCidade);
    procedure Atualizar(const objetoCidade: TCidade);
    procedure Excluir(const objetoCidade: TCidade);
  end;

implementation

{ TControllerCidade }

function TControllerCidade.VerificaCampos(const objetoCidade: TCidade): Boolean;
begin
  Result := objetoCidade.IdUF.ToString.IsEmpty;
end;

procedure TControllerCidade.Salvar(const objetoCidade: TCidade);
begin
  if VerificaCampos(objetoCidade) then
    raise Exception.Create('Campo UF é obrigatório.');

  objetoCidade.Inserir(objetoCidade);
end;

procedure TControllerCidade.Atualizar(const objetoCidade: TCidade);
begin
  if VerificaCampos(objetoCidade) then
    raise Exception.Create('Campo UF é obrigatório.');

  objetoCidade.Alterar(objetoCidade);
end;

procedure TControllerCidade.Excluir(const objetoCidade: TCidade);
begin
  objetoCidade.Excluir(objetoCidade);
end;

end.
