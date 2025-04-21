object FModAlumno: TFModAlumno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Modificar Alumno'
  ClientHeight = 229
  ClientWidth = 328
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 57
    Top = 25
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Matricula : '
  end
  object Label2: TLabel
    Left = 57
    Top = 87
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Matricula : '
    Enabled = False
  end
  object Label3: TLabel
    Left = 57
    Top = 118
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Nombre  : '
    Enabled = False
  end
  object Label4: TLabel
    Left = 57
    Top = 149
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Grado : '
    Enabled = False
  end
  object in_buscar_matricula: TEdit
    Left = 163
    Top = 25
    Width = 120
    Height = 23
    TabOrder = 0
  end
  object in_matricula: TEdit
    Left = 163
    Top = 87
    Width = 120
    Height = 23
    Enabled = False
    TabOrder = 1
  end
  object in_nombre: TEdit
    Left = 163
    Top = 118
    Width = 120
    Height = 23
    Enabled = False
    TabOrder = 2
  end
  object in_grado: TEdit
    Left = 163
    Top = 149
    Width = 120
    Height = 23
    Enabled = False
    TabOrder = 3
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 185
    Width = 322
    Height = 41
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 217
    ExplicitWidth = 318
    object cxButton1: TcxButton
      Left = 54
      Top = 8
      Width = 100
      Height = 25
      Action = ACancelar
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 0
    end
    object btn_Actualizar: TcxButton
      Left = 160
      Top = 8
      Width = 120
      Height = 25
      Action = AModificarAlumno
      Enabled = False
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 1
    end
  end
  object btn_Buscar: TcxButton
    Left = 57
    Top = 56
    Width = 226
    Height = 25
    Action = ABuscarAlumno
    OptionsImage.ImageIndex = 3
    OptionsImage.Images = CapaDatos.cxImageList1
    TabOrder = 5
  end
  object ActionList: TActionList
    Images = CapaDatos.cxImageList1
    Left = 8
    Top = 128
    object ABuscarAlumno: TAction
      Caption = 'Buscar Alumno'
      OnExecute = ABuscarAlumnoExecute
    end
    object AModificarAlumno: TAction
      Caption = 'Actualizar'
      OnExecute = AModificarAlumnoExecute
    end
    object ACancelar: TAction
      Caption = 'Cancelar'
      OnExecute = ACancelarExecute
    end
  end
  object ZModificarAlumno: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      
        'UPDATE alumno SET matricula=:matricula, nombre=:nombre, grado=:g' +
        'rado WHERE matricula=:in_matricula;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'matricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_matricula'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'matricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_matricula'
        ParamType = ptUnknown
      end>
  end
end
