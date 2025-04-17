object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calcular Promedios'
  ClientHeight = 412
  ClientWidth = 451
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
    Top = 8
    Width = 200
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Caption = 'Calificaciones '#13#10'Chico 1'
  end
  object Label2: TLabel
    Left = 243
    Top = 8
    Width = 200
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Caption = 'Calificaciones '#13#10'Chico 2'
  end
  object Label3: TLabel
    Left = 242
    Top = 53
    Width = 51
    Height = 25
    Caption = 'Materias :'
  end
  object Label4: TLabel
    Left = 264
    Top = 91
    Width = 71
    Height = 22
    Alignment = taCenter
    Caption = 'Calificacion : '
    Enabled = False
  end
  object CChico1: TMemo
    Left = 8
    Top = 100
    Width = 200
    Height = 133
    TabStop = False
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btn_promedio1: TButton
    Left = 24
    Top = 259
    Width = 150
    Height = 25
    Caption = 'Ver Promedio'
    Enabled = False
    TabOrder = 1
    OnClick = VerPromedio1
  end
  object btn_calificaciones1: TButton
    Left = 24
    Top = 53
    Width = 150
    Height = 25
    Caption = 'Ingresar Calificaciones'
    TabOrder = 0
    OnClick = MostrarCalificaciones1
  end
  object n_materias_c2: TEdit
    Left = 299
    Top = 49
    Width = 50
    Height = 25
    Alignment = taCenter
    TabOrder = 3
  end
  object btn_materias_c2: TButton
    Left = 367
    Top = 49
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = IngresarMateriasC2
  end
  object CChico2: TMemo
    Left = 243
    Top = 160
    Width = 200
    Height = 133
    TabStop = False
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object btn_promedio2: TButton
    Left = 264
    Top = 315
    Width = 150
    Height = 25
    Caption = 'Ver Promedio'
    Enabled = False
    TabOrder = 6
    OnClick = VerPromedio2
  end
  object Calif_C2: TEdit
    Left = 355
    Top = 88
    Width = 75
    Height = 25
    Alignment = taCenter
    Enabled = False
    TabOrder = 7
  end
  object btn_calif2: TButton
    Left = 299
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Ingresar'
    Enabled = False
    TabOrder = 8
    OnClick = IngresarCalificacionC2
  end
  object btn_limpiarCC2: TButton
    Left = 264
    Top = 360
    Width = 150
    Height = 25
    Caption = 'Limpiar Calificaciones'
    Enabled = False
    TabOrder = 9
    OnClick = LimpiarCalificaciones
  end
end
