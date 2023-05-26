unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Controller;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mniCadastros: TMenuItem;
    mniSair: TMenuItem;
    mniEmpresa: TMenuItem;
    procedure mniSairClick(Sender: TObject);
    procedure mniEmpresaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Fcontrole: TController;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  View.Cadastro.Empresa;

{$R *.dfm}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Fcontrole);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Fcontrole := TController.Create;
end;

procedure TfrmPrincipal.mniEmpresaClick(Sender: TObject);
begin
  frmCadEmpresa := TfrmCadEmpresa.Create(Application);
  frmCadEmpresa.ShowModal;
  if frmCadEmpresa <> nil then
    frmCadEmpresa.Free;
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Close;
end;

end.
