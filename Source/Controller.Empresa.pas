unit Controller.Empresa;

interface

uses
  SysUtils, Model.Empresa, uUtil;

type
  TControllerEmpresa = class
  private
    //
  public
    procedure Salvar(const objetoEmpresa: TEmpresa);
    procedure Atualizar(const objetoEmpresa: TEmpresa);
    procedure Excluir(const objetoEmpresa: TEmpresa);
    function VerificaCampos(const objetoEmpresa: TEmpresa): boolean;
  end;

implementation

{ TControllerEmpresa }

function TControllerEmpresa.VerificaCampos(const objetoEmpresa: TEmpresa): boolean;
begin
  Result := TestaCgc(objetoEmpresa.NuCNPJ);
end;

procedure TControllerEmpresa.Salvar(const objetoEmpresa: TEmpresa);
begin
  objetoEmpresa.Inserir(objetoEmpresa);
end;

procedure TControllerEmpresa.Atualizar(const objetoEmpresa: TEmpresa);
begin
  objetoEmpresa.Alterar(objetoEmpresa);
end;

procedure TControllerEmpresa.Excluir(const objetoEmpresa: TEmpresa);
begin
  objetoEmpresa.Excluir(objetoEmpresa);
end;

end.
