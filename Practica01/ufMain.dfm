object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora Basica'
  ClientHeight = 417
  ClientWidth = 423
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 2499120
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object l_op: TLabel
    Left = 184
    Top = 8
    Width = 55
    Height = 45
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object num_01: TEdit
    Left = 8
    Top = 8
    Width = 170
    Height = 45
    Hint = 'Ingresa un numero'
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object num_02: TEdit
    Left = 245
    Top = 8
    Width = 170
    Height = 45
    Hint = 'Ingresa un numero'
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object btn_Suma: TButton
    Left = 8
    Top = 59
    Width = 200
    Height = 49
    Hint = 'Realizar suma'
    Caption = 'SUMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2499120
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = SumaProcedimiento
  end
  object btn_Resta: TButton
    Left = 214
    Top = 59
    Width = 200
    Height = 49
    Hint = 'Realizar resta'
    Caption = 'RESTA'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = RestaProcedimiento
  end
  object btn_Division: TButton
    Left = 8
    Top = 114
    Width = 200
    Height = 49
    Hint = 'Realizar division'
    Caption = 'DIVISION'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = MostrarResultadoDivision
  end
  object btn_Multiplicacion: TButton
    Left = 214
    Top = 114
    Width = 200
    Height = 49
    Hint = 'Realizar multiplicacion'
    Caption = 'MULTIPLICACION'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = MostrarResultadoMultiplicacion
  end
  object btn_Igual: TButton
    Left = 8
    Top = 169
    Width = 406
    Height = 49
    Hint = 'Limpiar valores'
    Caption = 'AC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = LimpiarValores
  end
end
