unit Controller.Endereco;

interface

uses
  SysUtils, Model.Endereco;

type
  TControllerEndereco = class
  private
    //
  public
    procedure Salvar(const objetoEndereco: TEndereco);
    procedure Atualizar(const objetoEndereco: TEndereco);
    procedure Excluir(const objetoEndereco: TEndereco);
  end;

implementation

{ TControllerEndereco }

procedure TControllerEndereco.Salvar(const objetoEndereco: TEndereco);
begin
  objetoEndereco.Inserir(objetoEndereco);
end;

procedure TControllerEndereco.Atualizar(const objetoEndereco: TEndereco);
begin
  objetoEndereco.Alterar(objetoEndereco);
end;

procedure TControllerEndereco.Excluir(const objetoEndereco: TEndereco);
begin
  objetoEndereco.Excluir(objetoEndereco);
end;

end.
