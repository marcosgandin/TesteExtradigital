unit Controller.Funcionario;

interface

uses
  SysUtils, Model.Funcionario, uUtil;

type
  TControllerFuncionario = class
  private
    //
  public
    procedure Salvar(const objetoFuncionario: TFuncionario);
    procedure Atualizar(const objetoFuncionario: TFuncionario);
    procedure Excluir(const objetoFuncionario: TFuncionario);
    function VerificaCampos(const objetoFuncionario: TFuncionario): boolean;
  end;

implementation

{ TControllerFuncionario }

function TControllerFuncionario.VerificaCampos(const objetoFuncionario: TFuncionario): boolean;
begin
  Result := TestaCpf(objetoFuncionario.NuCPF);
end;

procedure TControllerFuncionario.Salvar(const objetoFuncionario: TFuncionario);
begin
  objetoFuncionario.Inserir(objetoFuncionario);
end;

procedure TControllerFuncionario.Atualizar(const objetoFuncionario: TFuncionario);
begin
  objetoFuncionario.Alterar(objetoFuncionario);
end;

procedure TControllerFuncionario.Excluir(const objetoFuncionario: TFuncionario);
begin
  objetoFuncionario.Excluir(objetoFuncionario);
end;

end.
