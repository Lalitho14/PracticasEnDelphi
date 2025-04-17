object FRegAlum: TFRegAlum
  Left = 0
  Top = 0
  Caption = 'Registrar Alumnos'
  ClientHeight = 200
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 56
    Top = 16
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Nombre : '
  end
  object Label2: TLabel
    Left = 56
    Top = 66
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Matricula : '
  end
  object Label3: TLabel
    Left = 56
    Top = 116
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Grado : '
  end
  object in_nombre: TEdit
    Left = 181
    Top = 16
    Width = 100
    Height = 23
    TabOrder = 0
  end
  object in_matricula: TEdit
    Left = 181
    Top = 66
    Width = 100
    Height = 23
    TabOrder = 1
  end
  object in_grado: TEdit
    Left = 181
    Top = 116
    Width = 100
    Height = 23
    TabOrder = 2
  end
  object btn_AgregarAlum: TButton
    Left = 102
    Top = 158
    Width = 100
    Height = 25
    Caption = 'Agregar Alumno'
    TabOrder = 3
    OnClick = AgregarAlumno
  end
end
