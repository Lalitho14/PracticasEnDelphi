object FModMateria: TFModMateria
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Modificar Materia'
  ClientHeight = 182
  ClientWidth = 281
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Top = 25
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 25
    Top = 25
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Nombre Materia : '
  end
  object Label2: TLabel
    Left = 25
    Top = 103
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Nombre : '
    Enabled = False
  end
  object in_buscar_nombre: TEdit
    Left = 131
    Top = 25
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object in_nombre: TEdit
    Left = 131
    Top = 103
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 1
  end
  object btn_Buscar: TcxButton
    Left = 28
    Top = 56
    Width = 225
    Height = 25
    Action = ABuscarMateria
    OptionsImage.ImageIndex = 3
    OptionsImage.Images = CapaDatos.cxImageList1
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 281
    Height = 45
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 136
    ExplicitWidth = 277
    object btn_Actualizar: TcxButton
      Left = 131
      Top = 9
      Width = 122
      Height = 25
      Action = AModMateria
      Enabled = False
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 0
    end
    object cxButton1: TcxButton
      Left = 28
      Top = 9
      Width = 97
      Height = 25
      Action = ACancelar
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    object ABuscarMateria: TAction
      Caption = 'Buscar Materia'
      OnExecute = ABuscarMateriaExecute
    end
    object AModMateria: TAction
      Caption = 'Actualizar'
      OnExecute = AModMateriaExecute
    end
    object ACancelar: TAction
      Caption = 'Cancelar'
      OnExecute = ACancelarExecute
    end
  end
  object ZModificarMateria: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      'UPDATE materia'
      'SET nombre=:nombre'
      'WHERE id=:id;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
