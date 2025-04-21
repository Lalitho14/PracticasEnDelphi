object FRegAlumno: TFRegAlumno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Registrar Alumno'
  ClientHeight = 167
  ClientWidth = 237
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
    Top = 28
    Width = 90
    Height = 25
    AutoSize = False
    Caption = 'Matricula : '
  end
  object Label2: TLabel
    Left = 25
    Top = 59
    Width = 90
    Height = 25
    AutoSize = False
    Caption = 'Nombre : '
  end
  object Label3: TLabel
    Left = 25
    Top = 90
    Width = 90
    Height = 25
    AutoSize = False
    Caption = 'Grado : '
  end
  object in_matricula: TEdit
    Left = 121
    Top = 30
    Width = 90
    Height = 23
    TabOrder = 0
  end
  object in_nombre: TEdit
    Left = 121
    Top = 59
    Width = 90
    Height = 23
    TabOrder = 1
  end
  object in_grado: TEdit
    Left = 121
    Top = 88
    Width = 90
    Height = 23
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 126
    Width = 237
    Height = 41
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 156
    ExplicitWidth = 302
    object cxButton1: TcxButton
      Left = 121
      Top = 8
      Width = 90
      Height = 25
      Action = ACancelar
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 25
      Top = 8
      Width = 90
      Height = 25
      Action = InsertarAlumno
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 256
    Top = 128
    object InsertarAlumno: TAction
      Caption = 'Registrar'
      OnExecute = InsertarAlumnoExecute
    end
    object ACancelar: TAction
      Caption = 'Cancelar'
      OnExecute = ACancelarExecute
    end
  end
  object ZInsertarAlumno: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      
        'INSERT INTO alumno(matricula, nombre, grado) VALUES(:matricula,:' +
        'nombre,:grado);')
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
      end>
    Left = 216
    Top = 128
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
      end>
  end
end
