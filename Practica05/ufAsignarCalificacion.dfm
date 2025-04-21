object FAsignarCalif: TFAsignarCalif
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Asignar Calificacion'
  ClientHeight = 145
  ClientWidth = 344
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Top = 25
  Position = poScreenCenter
  OnShow = InicializarOpciones
  TextHeight = 15
  object Label1: TLabel
    Left = 70
    Top = 68
    Width = 100
    Height = 25
    AutoSize = False
    Caption = 'Calificacion : '
  end
  object ComboBox1: TComboBox
    Left = 25
    Top = 28
    Width = 145
    Height = 23
    TabOrder = 0
    Text = 'Alumno'
  end
  object ComboBox2: TComboBox
    Left = 176
    Top = 28
    Width = 145
    Height = 23
    TabOrder = 1
    Text = 'Materia'
  end
  object in_calif: TEdit
    Left = 176
    Top = 65
    Width = 100
    Height = 23
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 104
    Width = 344
    Height = 41
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 114
    ExplicitWidth = 340
    object cxButton1: TcxButton
      Left = 70
      Top = 8
      Width = 100
      Height = 25
      Action = ACerrar
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 176
      Top = 8
      Width = 100
      Height = 25
      Action = AAsignarCalificacion
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = CapaDatos.cxImageList1
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    object AAsignarCalificacion: TAction
      Caption = 'Asignar'
      OnExecute = AAsignarCalificacionExecute
    end
    object ACerrar: TAction
      Caption = 'Cancelar'
      OnExecute = ACerrarExecute
    end
  end
  object ZAsignarCalificacion: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      'INSERT INTO alumnomateria(id_alumno,id_materia,calificacion)'
      'VALUES(:id_alumno,:id_materia,:calificacion);')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_alumno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_materia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'calificacion'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_alumno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_materia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'calificacion'
        ParamType = ptUnknown
      end>
  end
  object ZComprobarCalificacion: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      
        'SELECT * FROM alumnomateria WHERE id_alumno=:id_alumno AND id_ma' +
        'teria=:id_materia;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_alumno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_materia'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_alumno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_materia'
        ParamType = ptUnknown
      end>
  end
end
