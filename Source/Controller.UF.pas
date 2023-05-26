unit Controller.UF;

interface

uses
  SysUtils, Model.UF;

type
  TControllerUF = class
  private
    //
  public
    procedure Salvar(const objetoUF: TUF);
    procedure Atualizar(const objetoUF: TUF);
    procedure Excluir(const objetoUF: TUF);
  end;

implementation

{ TControllerUF }

procedure TControllerUF.Salvar(const objetoUF: TUF);
begin
  objetoUF.Inserir(objetoUF);
end;

procedure TControllerUF.Atualizar(const objetoUF: TUF);
begin
  objetoUF.Alterar(objetoUF);
end;

procedure TControllerUF.Excluir(const objetoUF: TUF);
begin
  objetoUF.Excluir(objetoUF);
end;

end.
