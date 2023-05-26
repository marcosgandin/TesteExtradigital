program TesteExtradigital;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {frmPrincipal},
  View.Cadastro.Empresa in 'View.Cadastro.Empresa.pas' {frmCadEmpresa},
  View.Cadastro.Endereco in 'View.Cadastro.Endereco.pas' {frmCadEnderecos},
  uUtil in 'uUtil.pas',
  Model.Empresa in 'Model.Empresa.pas',
  Model.Cidade in 'Model.Cidade.pas',
  Model.UF in 'Model.UF.pas',
  Model.Endereco in 'Model.Endereco.pas',
  Model.Titular in 'Model.Titular.pas',
  Model.Funcionario in 'Model.Funcionario.pas',
  Controller.Cidade in 'Controller.Cidade.pas',
  Controller.Empresa in 'Controller.Empresa.pas',
  Controller.Endereco in 'Controller.Endereco.pas',
  Controller.Funcionario in 'Controller.Funcionario.pas',
  Controller.Titular in 'Controller.Titular.pas',
  Controller.UF in 'Controller.UF.pas',
  ConexaoBanco in 'ConexaoBanco.pas',
  Controller in 'Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
