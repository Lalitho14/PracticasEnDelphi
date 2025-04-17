object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Control Estudiantes'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = InicializarControles
  TextHeight = 15
  object btn_AgregarAlumno: TButton
    Left = 144
    Top = 392
    Width = 150
    Height = 25
    Caption = 'Agregar Alumno'
    TabOrder = 0
    OnClick = AgregarAlumno
  end
  object btn_AgregarMateria: TButton
    Left = 320
    Top = 392
    Width = 150
    Height = 25
    Caption = 'Agregar Materia'
    TabOrder = 1
    OnClick = AgregarMateria
  end
  object TTabla: TStringGrid
    Left = 8
    Top = 8
    Width = 612
    Height = 369
    DefaultColWidth = 100
    DefaultColAlignment = taCenter
    RowCount = 1
    FixedRows = 0
    Options = [goVertLine, goHorzLine, goRangeSelect, goColSizing, goFixedRowDefAlign]
    TabOrder = 2
  end
end
