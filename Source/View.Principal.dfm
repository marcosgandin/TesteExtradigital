object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Teste Conhecimentos Delphi  - Extradigital'
  ClientHeight = 469
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mnuPrincipal
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mnuPrincipal: TMainMenu
    Left = 160
    Top = 24
    object mniCadastros: TMenuItem
      Caption = '&Cadastros'
      object mniEmpresa: TMenuItem
        Caption = 'Empresa'
        OnClick = mniEmpresaClick
      end
    end
    object mniSair: TMenuItem
      Caption = '&Sair'
      OnClick = mniSairClick
    end
  end
end
