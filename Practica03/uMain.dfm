object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calcular Promedios'
  ClientHeight = 442
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 19
    Width = 200
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Calcular Promedio Chico 1'
  end
  object Label2: TLabel
    Left = 258
    Top = 19
    Width = 200
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Calcular Promedio Chico 2'
  end
  object Label3: TLabel
    Left = 258
    Top = 69
    Width = 65
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Materias : '
  end
  object lb_calif: TLabel
    Left = 258
    Top = 120
    Width = 90
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Calificacion : '
    Enabled = False
  end
  object btn_calif_c1: TButton
    Left = 8
    Top = 65
    Width = 200
    Height = 25
    Caption = 'Ingresar Calificaciones'
    TabOrder = 0
    OnClick = IngresarCalifC1
  end
  object Calif_C1: TMemo
    Left = 8
    Top = 120
    Width = 200
    Height = 160
    Alignment = taCenter
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btn_promedio_c1: TButton
    Left = 8
    Top = 296
    Width = 200
    Height = 25
    Caption = 'Ver Promedio'
    Enabled = False
    TabOrder = 2
    OnClick = VerPromedioC1
  end
  object in_materias: TEdit
    Left = 329
    Top = 66
    Width = 49
    Height = 25
    Alignment = taCenter
    AutoSize = False
    TabOrder = 3
  end
  object btn_materias: TButton
    Left = 384
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Ingresar'
    TabOrder = 4
    OnClick = IngresarMaterias
  end
  object Calif_C2: TMemo
    Left = 258
    Top = 193
    Width = 200
    Height = 160
    Alignment = taCenter
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object Ecalif: TEdit
    Left = 354
    Top = 117
    Width = 104
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Enabled = False
    TabOrder = 6
  end
  object btn_icalif: TButton
    Left = 258
    Top = 146
    Width = 200
    Height = 25
    Caption = 'Ingresar Calificacion'
    Enabled = False
    TabOrder = 7
    OnClick = IngresarCalifC2
  end
  object btn_promedio_c2: TButton
    Left = 258
    Top = 359
    Width = 200
    Height = 25
    Caption = 'Ver Promedio'
    Enabled = False
    TabOrder = 8
    OnClick = VerPromedioC2
  end
  object btn_limp_calif: TButton
    Left = 258
    Top = 390
    Width = 200
    Height = 25
    Caption = 'Limpiar Calificaciones'
    Enabled = False
    TabOrder = 9
    OnClick = LimpiarCalificaciones
  end
end
