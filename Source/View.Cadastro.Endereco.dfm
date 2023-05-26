object frmCadEnderecos: TfrmCadEnderecos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Endere'#231'os'
  ClientHeight = 217
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 167
    Width = 637
    Height = 50
    Align = alBottom
    TabOrder = 0
    object btnFechar: TBitBtn
      Left = 510
      Top = 12
      Width = 82
      Height = 25
      Caption = '&Fechar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnNovo: TBitBtn
      Left = 8
      Top = 12
      Width = 74
      Height = 25
      Caption = '&Novo'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btnEditar: TBitBtn
      Left = 86
      Top = 12
      Width = 82
      Height = 25
      Caption = 'E&ditar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnExcluir: TBitBtn
      Left = 174
      Top = 12
      Width = 82
      Height = 25
      Caption = '&Excluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnSalvar: TBitBtn
      Left = 260
      Top = 12
      Width = 72
      Height = 25
      Caption = '&Salvar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 337
      Top = 12
      Width = 82
      Height = 25
      Caption = '&Cancelar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 167
    Align = alClient
    TabOrder = 1
    object pgeEnderecos: TPageControl
      Left = 1
      Top = 1
      Width = 635
      Height = 165
      ActivePage = tbsCadastro
      Align = alClient
      TabOrder = 0
      object tbsCadastro: TTabSheet
        Caption = 'Cadastro'
        object Label1: TLabel
          Left = 24
          Top = 16
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
        end
        object Label2: TLabel
          Left = 24
          Top = 43
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object Label3: TLabel
          Left = 24
          Top = 70
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
        end
        object Label5: TLabel
          Left = 152
          Top = 70
          Width = 32
          Height = 13
          Caption = 'Bairro:'
        end
        object Label6: TLabel
          Left = 485
          Top = 70
          Width = 23
          Height = 13
          Caption = 'CEP:'
        end
        object Label7: TLabel
          Left = 152
          Top = 99
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object Label8: TLabel
          Left = 24
          Top = 99
          Width = 17
          Height = 13
          Caption = 'UF:'
        end
        object edtCodigo: TEdit
          Left = 87
          Top = 13
          Width = 77
          Height = 21
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtLogradouro: TEdit
          Left = 87
          Top = 40
          Width = 504
          Height = 21
          TabOrder = 1
        end
        object edtNumero: TEdit
          Left = 87
          Top = 67
          Width = 57
          Height = 21
          TabOrder = 2
        end
        object edtBairro: TEdit
          Left = 196
          Top = 67
          Width = 282
          Height = 21
          TabOrder = 3
        end
        object edtCEP: TMaskEdit
          Left = 514
          Top = 67
          Width = 76
          Height = 21
          EditMask = '99.999\-999;0;_'
          MaxLength = 10
          TabOrder = 4
          Text = ''
        end
        object cbxUF: TComboBox
          Left = 87
          Top = 96
          Width = 56
          Height = 21
          TabOrder = 5
          OnChange = cbxUFChange
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object chkAtivo: TCheckBox
          Left = 547
          Top = 17
          Width = 45
          Height = 17
          Caption = 'Ativo'
          TabOrder = 6
        end
        object cbxCidade: TComboBox
          Left = 196
          Top = 96
          Width = 396
          Height = 21
          TabOrder = 7
        end
      end
      object tbsConsulta: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 1
        object dbgPessoas: TDBGrid
          Left = 0
          Top = 0
          Width = 627
          Height = 137
          Align = alClient
          DataSource = dsEndereco
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDENDERECO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUENDERECO'
              Title.Caption = 'N'#250'mero'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMBAIRRO'
              Title.Caption = 'Bairro'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGESTADO'
              Title.Caption = 'UF'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMCIDADE'
              Title.Caption = 'Cidade'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMTITULAR'
              Title.Caption = 'Titular'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATIVO'
              Title.Caption = 'Ativo'
              Visible = True
            end>
        end
      end
    end
  end
  object dsEndereco: TDataSource
    DataSet = cdsEndereco
    Left = 176
    Top = 7
  end
  object dspEndereco: TDataSetProvider
    Left = 238
    Top = 7
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEndereco'
    Left = 302
    Top = 7
    object cdsEnderecoIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
    end
    object cdsEnderecoIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
    end
    object cdsEnderecoIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object cdsEnderecoNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object cdsEnderecoNUENDERECO: TStringField
      FieldName = 'NUENDERECO'
      Size = 10
    end
    object cdsEnderecoNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Size = 50
    end
    object cdsEnderecoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object cdsEnderecoIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object cdsEnderecoNUCEP: TStringField
      FieldName = 'NUCEP'
      Size = 10
    end
    object cdsEnderecoSTATIVO: TStringField
      FieldName = 'STATIVO'
      Size = 1
    end
    object cdsEnderecoSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Size = 1
    end
    object cdsEnderecoDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object cdsEnderecoTPCADASTRO: TStringField
      FieldName = 'TPCADASTRO'
      Size = 1
    end
    object cdsEnderecoNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object cdsEnderecoNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Size = 100
    end
    object cdsEnderecoNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Size = 50
    end
    object cdsEnderecoSGESTADO: TStringField
      FieldName = 'SGESTADO'
      Size = 3
    end
  end
  object cdsUF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUF'
    Left = 302
    Top = 55
    object cdsUFIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object cdsUFNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Size = 50
    end
    object cdsUFSGESTADO: TStringField
      FieldName = 'SGESTADO'
      Size = 3
    end
  end
  object dsUF: TDataSource
    DataSet = cdsUF
    Left = 176
    Top = 55
  end
  object dspUF: TDataSetProvider
    Left = 238
    Top = 55
  end
  object dsCidade: TDataSource
    DataSet = cdsCidade
    Left = 384
    Top = 23
  end
  object dspCidade: TDataSetProvider
    Left = 446
    Top = 23
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 502
    Top = 23
    object cdsCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object cdsCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Size = 100
    end
    object cdsCidadeIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object cdsCidadeNOIBGE: TStringField
      FieldName = 'NOIBGE'
      Size = 7
    end
  end
end
