object FRegMaterias: TFRegMaterias
  Left = 0
  Top = 0
  Caption = 'Registrar Materias'
  ClientHeight = 231
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
    Left = 50
    Top = 25
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Matricula : '
  end
  object Label2: TLabel
    Left = 50
    Top = 75
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Nombre : '
  end
  object Label3: TLabel
    Left = 50
    Top = 125
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Calificacion : '
  end
  object in_matricula: TEdit
    Left = 175
    Top = 25
    Width = 90
    Height = 23
    TabOrder = 0
  end
  object in_nombre: TEdit
    Left = 175
    Top = 75
    Width = 90
    Height = 23
    TabOrder = 1
  end
  object in_calif: TEdit
    Left = 175
    Top = 125
    Width = 90
    Height = 23
    TabOrder = 2
  end
  object Button1: TButton
    Left = 104
    Top = 184
    Width = 120
    Height = 25
    Caption = 'Registrar Materia'
    TabOrder = 3
    OnClick = RegistrarMateria
  end
end
