unit Controller;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs, {DBXFirebird,} SqlExpr, StrUtils, inifiles,
   ConexaoBanco;

type
  TController = class
    private
      FConexao  : TConexaoBanco;
      FSqqGeral : TSQLQuery;
    public
     constructor Create;
     destructor  Destroy; override;

     property SqqGeral : TSQLQuery read FSqqGeral write FSqqGeral;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FConexao  := TConexaoBanco.Create;
  FSqqGeral := TSQLQuery.Create(Application);
  FSqqGeral.SQLConnection := FConexao.ConexaoBanco;
end;

destructor TController.Destroy;
begin
  inherited;
end;

end.
