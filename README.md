# TesteDelphi
Teste de Delphi para a Extradigital

O aplicativo espera atender os requisitos solicitados.
Para conexão no banco de dados, o sistema verifica a existeência do arquivo "Config.ini" que deverá estar na mesma pasta do executável. 

Exemplo do conteúdo do arquivo Config.ini:

[Dados]
Servidor=127.0.0.1
Database=C:\Projetos\TesteExtradigital\Database
DriverName=Firebird
UserName=SYSDBA
PassWord=masterkey

Estrutura do projeto:

c:\Projetos
   \TesteExtradigital
    \Database -> aqui está o banco de dados: DADOS.FDB 
    \Source	-> aqui estão os fontes do projeto: .pas, .dfm, .dpr e .dproj 

Versão do Delphi: 
- Delphi 10.4 Version 27.0.40680.4203 Community Edition