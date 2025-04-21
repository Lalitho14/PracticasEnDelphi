object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro de Alumnos y Materias'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object btn_AbrirRegAlumno: TButton
    Left = 8
    Top = 32
    Width = 150
    Height = 25
    Caption = 'Registrar Alumno'
    TabOrder = 0
    OnClick = AbrirRegistrarAlumno
  end
  object btn_AbrirRegMateria: TButton
    Left = 8
    Top = 80
    Width = 150
    Height = 25
    Caption = 'Registrar Materia'
    TabOrder = 1
    OnClick = AbrirRegistrarMateria
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 128
    Width = 628
    Height = 314
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 127
    ExplicitWidth = 624
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DSAlumnos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Alumnos registrados.'
          Kind = skCount
          FieldName = 'id'
          Column = cxGrid1DBTableView1Column1
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'Nombre'
        DataBinding.FieldName = 'nombre'
        Options.Editing = False
        Width = 191
      end
      object cxGrid1DBTableView1Column5: TcxGridDBColumn
        Caption = 'Grado'
        DataBinding.FieldName = 'grado'
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = 'Matricula'
        DataBinding.FieldName = 'matricula'
        Options.Editing = False
        Width = 115
      end
      object cxGrid1DBTableView1Column3: TcxGridDBColumn
        Caption = 'Promedio'
        DataBinding.FieldName = 'promedio'
        Options.Editing = False
        Width = 118
      end
      object cxGrid1DBTableView1Column4: TcxGridDBColumn
        Caption = 'Materias'
        DataBinding.FieldName = 'materias_calificaciones'
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object btn_ModAlumno: TButton
    Left = 192
    Top = 32
    Width = 150
    Height = 25
    Caption = 'Modificar Alumno'
    TabOrder = 3
    OnClick = ModificarAlumno
  end
  object btn_ModMateria: TButton
    Left = 192
    Top = 80
    Width = 150
    Height = 25
    Caption = 'Modificar Materia'
    TabOrder = 4
    OnClick = ModificarMateria
  end
  object btn_AsigCalificacion: TButton
    Left = 424
    Top = 56
    Width = 150
    Height = 25
    Caption = 'Asignar Calificacion'
    TabOrder = 5
    OnClick = AsignarCalificacion
  end
  object DSAlumnos: TDataSource
    DataSet = ZMostrarAlumnosMaterias
    Left = 528
    Top = 16
  end
  object ActionList: TActionList
    Left = 584
    Top = 16
    object AActualizarTabla: TAction
      Caption = 'Actualizar'
      OnExecute = AActualizarTablaExecute
    end
  end
  object ZMostrarAlumnosMaterias: TZQuery
    Connection = CapaDatos.ZConexion
    SQL.Strings = (
      
        'SELECT alumno.*, GROUP_CONCAT(materia.nombre, '#39' ('#39', alumnomateri' +
        'a.calificacion, '#39')'#39') AS materias_calificaciones'
      'FROM alumno'
      'LEFT JOIN alumnomateria ON alumnomateria.id_alumno=alumno.id'
      'LEFT JOIN materia ON alumnomateria.id_materia=materia.id'
      'GROUP BY alumno.id;')
    Params = <>
    Left = 440
    Top = 16
  end
end
