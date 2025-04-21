{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}
unit ufAsignarCalificacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAlumnoMateria,
  System.Actions, Vcl.ActnList, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons, Vcl.ExtCtrls;

type
  TFAsignarCalif = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    in_calif: TEdit;
    ActionList: TActionList;
    AAsignarCalificacion: TAction;
    ZAsignarCalificacion: TZQuery;
    ZComprobarCalificacion: TZQuery;
    ACerrar: TAction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure InicializarOpciones(Sender: TObject);
    procedure AAsignarCalificacionExecute(Sender: TObject);
    procedure ACerrarExecute(Sender: TObject);
  private
    { Private declarations }
    // Objeto para guardar alumnos y materias
    control_alumnnos_materia: TControl;
  public
    { Public declarations }
  end;

var
  FAsignarCalif: TFAsignarCalif;

implementation

// Importa la unidad de la capa de datos
uses
  uCapaDatos;

{$R *.dfm}

// Asigna  calificacion en base de datos
procedure TFAsignarCalif.AAsignarCalificacionExecute(Sender: TObject);
var
  alumno: TAlumno;
  materia: TMateria;
  calificacion: Double;
begin

  // Verifica si hay campos vacios
  if (in_calif.Text = '') then
    raise Exception.Create('Ingrese una calificacion.');

  // Verifica si se selecciono alumno y materia
  if (ComboBox1.ItemIndex < 0) or (ComboBox2.ItemIndex < 0) then
    raise Exception.Create('Debe escoger un alumno y materia.');

  // Verifica que sean caracteres numericos
  try
    calificacion := StrToFloat(in_calif.Text);
  except
    raise Exception.Create('Ingrese caracteres numericos.');
  end;

  // Si la calificacion es menor a 0 o mayor a 10 lanza la excepcion
  if (calificacion < 0) or (calificacion > 10) then
    raise Exception.Create('Ingrese una calificacion entre 0 y 10.');

  // Obtiene el alumno seleccionado
  alumno := control_alumnnos_materia.GetAlumnoPorPosicion(ComboBox1.ItemIndex);
  // Obtiene la materia seleccionada
  materia := control_alumnnos_materia.GetMateriaPorPosicion
    (ComboBox2.ItemIndex);

  // Comprueba si el alumno ya tienen calificacion en esa materia
  with ZComprobarCalificacion do
  begin
    Close;
    ParamByName('id_alumno').AsInteger := alumno.id;
    ParamByName('id_materia').AsInteger := materia.id;
    Open;
    // Si el alumno ya tienen calificacion para esa materia
    // lanza la excepcion
    if RecordCount > 0 then
      raise Exception.Create
        ('El alumno ya tiene una calificacion asignada para esta materia.');
  end;

  // Realiza consulta para ingresar nueva calificacion
  with ZAsignarCalificacion do
  begin
    Close;
    ParamByName('id_alumno').AsInteger := alumno.id;
    ParamByName('id_materia').AsInteger := materia.id;
    ParamByName('calificacion').AsFloat := calificacion;
    ExecSQL;
  end;

  // Reinicia los componente
  in_calif.Text := '';
  ComboBox1.ItemIndex := -1;
  ComboBox1.Text := 'Alumno';
  ComboBox2.ItemIndex := -1;
  ComboBox2.Text := 'Materia';
  // Muestra el mensaje de confirmacion
  ShowMessage('Se asigno calificacion con exito para ' + alumno.nombre);

  // Cierra el formulario con el estado mrOk
  ModalResult := mrOk;
end;

// Cierra el formulario
procedure TFAsignarCalif.ACerrarExecute(Sender: TObject);
begin
  Close;
end;

// Inicializa los opciones
procedure TFAsignarCalif.InicializarOpciones(Sender: TObject);
begin
  // Crea el objeto de control
  control_alumnnos_materia := TControl.Create;
  // Realiza la consulta para recuperar todos los alumnos
  with CapaDatos.ZMostrarAlumnos do
  begin
    Close;
    Open;
    // Mientras no llegue al final de los resultados
    // agrega el alumno al objeto control
    while not Eof do
    begin
      control_alumnnos_materia.AgregarAlumno(FieldByName('id').AsInteger,
        FieldByName('matricula').AsInteger, FieldByName('nombre').AsString,
        FieldByName('grado').AsInteger, FieldByName('promedio').AsFloat);

      // En la caja de opciones pone la matricula y nombre del alumno
      ComboBox1.AddItem((FieldByName('matricula').AsString + ' - ' +
        FieldByName('nombre').AsString), nil);
      Next;
    end;
  end;

  // Realiza la consulta para recuperar todas la materias
  with CapaDatos.ZMostrarMaterias do
  begin
    Close;
    Open;
    // Mientras no llegue al final de los resultados
    // agrega la materia al objeto control
    while not Eof do
    begin
      control_alumnnos_materia.AgregarMateria(FieldByName('id').AsInteger,
        FieldByName('nombre').AsString);

      // En la caja de opciones pone la matricula y nombre del alumno
      ComboBox2.AddItem(FieldByName('nombre').AsString, nil);
      Next;
    end;
  end;
end;

end.
