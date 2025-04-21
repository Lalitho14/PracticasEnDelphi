{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}
unit ufRegAlumno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.ExtCtrls, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TFRegAlumno = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    in_matricula: TEdit;
    in_nombre: TEdit;
    in_grado: TEdit;
    ActionList: TActionList;
    InsertarAlumno: TAction;
    // Consulta para insertar nuevo alumno
    ZInsertarAlumno: TZQuery;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ACancelar: TAction;
    { Procedimientos }
    // Ingresa un nuevo alumno a la base de datos
    procedure InsertarAlumnoExecute(Sender: TObject);
    // Cierra el formulario
    procedure ACancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegAlumno: TFRegAlumno;

implementation

// Importa la unidad de la capa de datos
uses
  uCapaDatos;

{$R *.dfm}

// Cierra el formulario
procedure TFRegAlumno.ACancelarExecute(Sender: TObject);
begin
  Close;
end;

// Ingresa un nuevo alumno a la base de datos
procedure TFRegAlumno.InsertarAlumnoExecute(Sender: TObject);
var
  m: Integer;
  g: Integer;
begin
  // Se comprueba si los campos de texto no estan vacios
  if (in_nombre.Text = '') or (in_matricula.Text = '') or (in_grado.Text = '')
  then
    raise Exception.Create('Hay campos vacios en el formulario.');

  // Se verifica si en el campo de texto de la matricula haya solo numeros
  try
    m := StrToInt(in_matricula.Text);
  except
    raise Exception.Create
      ('Ingrese caracteres de numeros enteros en la matricula.');
  end;

  // Se verifica que la matricula sea un numero positivo entero
  if (m < 0) then
    raise Exception.Create
      ('Ingrese valores numericos validos para la matricula.');

  // Se comprueba que el grado sea un numero entero
  try
    g := StrToInt(in_grado.Text);
  except
    on E: EConvertError do
      raise Exception.Create
        ('Ingrese caracteres de numeros enteros en el grado.');
  end;

  // Se verifica que el grado sea un numero positivo entero
  if (g < 0) then
    raise Exception.Create('Ingrese valores numericos validos para el grado.');

  // Verifica si el alumno que se quiere ingresar ya esta registrado
  with CapaDatos.ZMostrarAlumno do
  begin
    Close;
    ParamByName('matricula').AsInteger := m;
    Open;
    // Si existe un alumno con la misma matricula se lanza la excepcion
    if RecordCount > 0 then
      raise Exception.Create('Matricula ya registrada.');
  end;

  // Se realiza la consulta para insertar nuevo alumno
  with ZInsertarAlumno do
  begin
    Close;
    ParamByName('matricula').AsInteger := m;
    ParamByName('nombre').AsString := in_nombre.Text;
    ParamByName('grado').AsInteger := g;
    ExecSQL;
  end;

  // Mensaje de confirmacion
  ShowMessage('Se registro alumno.');
  // Se reinician los campos de texto
  in_matricula.Text := '';
  in_nombre.Text := '';
  in_grado.Text := '';

  //Cierra el formulario con el estado mrOk
  ModalResult := mrOk;
end;

end.
