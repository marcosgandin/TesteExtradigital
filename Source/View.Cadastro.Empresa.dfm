object frmCadEmpresa: TfrmCadEmpresa
  Left = 0
  Top = 0
  ActiveControl = edtNome
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresa'
  ClientHeight = 250
  ClientWidth = 622
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 622
    Height = 50
    Align = alBottom
    TabOrder = 0
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
      TabOrder = 0
      OnClick = btnNovoClick
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
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnExcluir: TBitBtn
      Left = 173
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
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnEnderecos: TBitBtn
      Left = 447
      Top = 12
      Width = 82
      Height = 25
      Caption = 'En&dere'#231'os'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnEnderecosClick
    end
    object btnFechar: TBitBtn
      Left = 533
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
      TabOrder = 6
      OnClick = btnFecharClick
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
      TabOrder = 4
      OnClick = btnCancelarClick
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
      TabOrder = 1
      OnClick = btnEditarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 200
    Align = alClient
    TabOrder = 1
    object pgeEmpresa: TPageControl
      Left = 1
      Top = 1
      Width = 620
      Height = 198
      ActivePage = tbsCadastro
      Align = alClient
      TabOrder = 0
      OnChange = pgeEmpresaChange
      object tbsCadastro: TTabSheet
        Caption = 'Cadastro'
        object Label1: TLabel
          Left = 11
          Top = 16
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
        end
        object Label2: TLabel
          Left = 11
          Top = 43
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Label3: TLabel
          Left = 11
          Top = 70
          Width = 29
          Height = 13
          Caption = 'CNPJ:'
        end
        object Label5: TLabel
          Left = 11
          Top = 99
          Width = 95
          Height = 13
          Caption = 'Telefone Comercial:'
        end
        object Label4: TLabel
          Left = 195
          Top = 70
          Width = 75
          Height = 13
          Caption = 'Insc. Estadual: '
        end
        object Label6: TLabel
          Left = 224
          Top = 99
          Width = 82
          Height = 13
          Caption = 'Telefone Celular:'
        end
        object Label7: TLabel
          Left = 11
          Top = 127
          Width = 32
          Height = 13
          Caption = 'E-mail:'
        end
        object Label8: TLabel
          Left = 403
          Top = 70
          Width = 73
          Height = 13
          Caption = 'Data Abertura:'
        end
        object edtCodigo: TEdit
          Left = 54
          Top = 13
          Width = 75
          Height = 21
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 54
          Top = 40
          Width = 538
          Height = 21
          MaxLength = 100
          TabOrder = 1
        end
        object edtCNPJ: TMaskEdit
          Left = 54
          Top = 67
          Width = 128
          Height = 21
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          TabOrder = 2
          Text = ''
          OnExit = edtCNPJExit
        end
        object edtTelefoneComercial: TMaskEdit
          Left = 111
          Top = 96
          Width = 98
          Height = 21
          EditMask = '!\(99\)99999-9999;0;_'
          MaxLength = 14
          TabOrder = 5
          Text = ''
        end
        object edtInscEstadual: TEdit
          Left = 271
          Top = 67
          Width = 125
          Height = 21
          MaxLength = 15
          TabOrder = 3
        end
        object chkAtivo: TCheckBox
          Left = 544
          Top = 16
          Width = 44
          Height = 17
          Caption = 'Ativo'
          TabOrder = 8
        end
        object edtTelefoneCelular: TMaskEdit
          Left = 311
          Top = 96
          Width = 98
          Height = 21
          EditMask = '!\(99\)99999-9999;0;_'
          MaxLength = 14
          TabOrder = 6
          Text = ''
        end
        object edtEmail: TEdit
          Left = 54
          Top = 124
          Width = 538
          Height = 21
          MaxLength = 100
          TabOrder = 7
        end
        object dtAbertura: TDateTimePicker
          Left = 482
          Top = 67
          Width = 110
          Height = 21
          Date = 45070.858496076390000000
          Time = 45070.858496076390000000
          TabOrder = 4
        end
      end
      object tbsConsulta: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 1
        object dbgEmpresa: TDBGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 170
          Align = alClient
          DataSource = dsEmpresa
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDEMPRESA'
              Title.Caption = 'C'#243'digo'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMEMPRESA'
              Title.Caption = 'Nome Empresa'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUCNPJ'
              Title.Caption = 'CNPJ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUINSCRICAO'
              Title.Caption = 'Insc. Estadual'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATIVO'
              Title.Caption = 'Ativo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLCOMERCIAL'
              Title.Caption = 'Fone Comercial'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLCELULAR'
              Title.Caption = 'Fone Celular'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TXEMAIL'
              Title.Caption = 'E-mail'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTCADASTRO'
              Title.Caption = 'Data Cadastro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTABERTURA'
              Title.Caption = 'Data Abertura'
              Visible = True
            end>
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Consulta Funcion'#225'rios'
        ImageIndex = 2
        object dbgFuncionarios: TDBGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 170
          Align = alClient
          DataSource = dsFuncionario
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDFUNCIONARIO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMFUNCIONARIO'
              Title.Caption = 'Nome'
              Width = 349
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUCPF'
              Title.Caption = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NURG'
              Title.Caption = 'RG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTNASCIMENTO'
              Title.Caption = 'Dt. Nascimento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TXEMAIL'
              Title.Caption = 'E-mail'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUCARTEIRATRAB'
              Title.Caption = 'Cart. Trabalho'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUTITULOELEITOR'
              Title.Caption = 'T'#237'tulo Eleitor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUCARTEIRAMOTORISTA'
              Title.Caption = 'Car. Motorista'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TPCATERORIA'
              Title.Caption = 'Categoria'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVALIDADECARTEIRAMOT'
              Title.Caption = 'Dt. Validade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLRESIDENCIAL'
              Title.Caption = 'Fone Residencial'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLCELULAR'
              Title.Caption = 'Fone Celular'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLCONTATO'
              Title.Caption = 'Fone Contato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMCONTATO'
              Title.Caption = 'Nome Contato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTCONTRATACAO'
              Title.Caption = 'Dt. Contrata'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTDEMISSAO'
              Title.Caption = 'Dt. Demiss'#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTCADASTRO'
              Title.Caption = 'Dt. Cadastro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATIVO'
              Title.Caption = 'Ativo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUENDERECO'
              Title.Caption = 'Nro.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMBAIRRO'
              Title.Caption = 'Bairro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMCIDADE'
              Title.Caption = 'Cidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGESTADO'
              Title.Caption = 'UF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUCEP'
              Title.Caption = 'CEP'
              Visible = True
            end>
        end
      end
    end
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 320
    Top = 12
    object cdsEmpresaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object cdsEmpresaNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Size = 100
    end
    object cdsEmpresaNUCNPJ: TStringField
      FieldName = 'NUCNPJ'
      Size = 18
    end
    object cdsEmpresaNUINSCRICAO: TStringField
      FieldName = 'NUINSCRICAO'
      Size = 15
    end
    object cdsEmpresaSTATIVO: TStringField
      FieldName = 'STATIVO'
      Size = 1
    end
    object cdsEmpresaDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsEmpresaDTABERTURA: TDateField
      FieldName = 'DTABERTURA'
    end
    object cdsEmpresaTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      Size = 15
    end
    object cdsEmpresaTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
    object cdsEmpresaTXOBS: TIntegerField
      FieldName = 'TXOBS'
    end
    object cdsEmpresaTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object cdsEmpresaSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Size = 1
    end
    object cdsEmpresaDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
  end
  object dspEmpresa: TDataSetProvider
    Left = 256
    Top = 12
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 192
    Top = 12
  end
  object dsFuncionario: TDataSource
    DataSet = cdsFuncionario
    Left = 192
    Top = 68
  end
  object dspFuncionario: TDataSetProvider
    Left = 256
    Top = 68
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionario'
    Left = 320
    Top = 68
    object cdsFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
    object cdsFuncionarioIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object cdsFuncionarioNMFUNCIONARIO: TStringField
      FieldName = 'NMFUNCIONARIO'
      Size = 100
    end
    object cdsFuncionarioNUCPF: TStringField
      FieldName = 'NUCPF'
      Size = 18
    end
    object cdsFuncionarioNURG: TStringField
      FieldName = 'NURG'
      Size = 15
    end
    object cdsFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object cdsFuncionarioTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object cdsFuncionarioNUCARTEIRATRAB: TStringField
      FieldName = 'NUCARTEIRATRAB'
    end
    object cdsFuncionarioNUTITULOELEITOR: TStringField
      FieldName = 'NUTITULOELEITOR'
      Size = 12
    end
    object cdsFuncionarioNUCARTEIRAMOTORISTA: TStringField
      FieldName = 'NUCARTEIRAMOTORISTA'
      Size = 15
    end
    object cdsFuncionarioTPCATERORIA: TStringField
      FieldName = 'TPCATERORIA'
      Size = 4
    end
    object cdsFuncionarioDTVALIDADECARTEIRAMOT: TDateField
      FieldName = 'DTVALIDADECARTEIRAMOT'
    end
    object cdsFuncionarioTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Size = 15
    end
    object cdsFuncionarioTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
    object cdsFuncionarioTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Size = 15
    end
    object cdsFuncionarioNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object cdsFuncionarioDTCONTRATACAO: TDateField
      FieldName = 'DTCONTRATACAO'
    end
    object cdsFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
    end
    object cdsFuncionarioDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsFuncionarioSTATIVO: TStringField
      FieldName = 'STATIVO'
      Size = 1
    end
    object cdsFuncionarioTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object cdsFuncionarioNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object cdsFuncionarioNUENDERECO: TStringField
      FieldName = 'NUENDERECO'
      Size = 10
    end
    object cdsFuncionarioNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Size = 100
    end
    object cdsFuncionarioIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object cdsFuncionarioIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object cdsFuncionarioNUCEP: TStringField
      FieldName = 'NUCEP'
      Size = 10
    end
    object cdsFuncionarioSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Size = 1
    end
    object cdsFuncionarioDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object cdsFuncionarioNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Size = 50
    end
    object cdsFuncionarioSGESTADO: TStringField
      FieldName = 'SGESTADO'
      Size = 3
    end
    object cdsFuncionarioNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Size = 100
    end
  end
end
