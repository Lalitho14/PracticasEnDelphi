object FRegMateria: TFRegMateria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Registrar Materia'
  ClientHeight = 105
  ClientWidth = 290
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 39
    Top = 28
    Width = 64
    Height = 25
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Nombre : '
    ParentBiDiMode = False
  end
  object in_nombre: TEdit
    Left = 125
    Top = 25
    Width = 120
    Height = 23
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 64
    Width = 290
    Height = 41
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 63
    ExplicitWidth = 286
    object cxButton1: TcxButton
      Left = 39
      Top = 8
      Width = 100
      Height = 25
      Action = AInsertarMateria
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 145
      Top = 8
      Width = 100
      Height = 25
      Action = ACerrar
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 264
    Top = 40
    object AInsertarMateria: TAction
      Caption = 'Registrar'
      OnExecute = AInsertarMateriaExecute
    end
    object ACerrar: TAction
      Caption = 'Cancelar'
      OnExecute = ACerrarExecute
    end
  end
  object ZInsertarMateria: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      'INSERT INTO materia(nombre) VALUES(:nom_materia);')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nom_materia'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nom_materia'
        ParamType = ptUnknown
      end>
  end
end
