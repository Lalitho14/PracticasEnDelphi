{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}
unit ufModAlumno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
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
  cxLookAndFeelPainters, Vcl.Menus, cxButtons, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFModAlumno = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    in_buscar_matricula: TEdit;
    in_matricula: TEdit;
    in_nombre: TEdit;
    in_grado: TEdit;
    ActionList: TActionList;
    ABuscarAlumno: TAction;
    AModificarAlumno: TAction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    ZModificarAlumno: TZQuery;
    ACancelar: TAction;
    btn_Actualizar: TcxButton;
    btn_Buscar: TcxButton;
    procedure ABuscarAlumnoExecute(Sender: TObject);
    procedure AModificarAlumnoExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
  private
    { Private declarations }
    matricula: Integer;
  public
    { Public declarations }
  end;

var
  FModAlumno: TFModAlumno;

implementation

// Importa unidad con capa de datos
uses
  uCapaDatos;

{$R *.dfm}

// Realiza la busqueda del alumno en la base de datos segun su matricula
procedure TFModAlumno.ABuscarAlumnoExecute(Sender: TObject);
begin
  // Verifica si hay campos vacios
  if (in_buscar_matricula.Text = '') then
    raise Exception.Create('Ingrese matricula de alumno.');

  // Verifica que haya caracteres numericos no enteros
  try
    matricula := StrToInt(in_buscar_matricula.Text);
  except
    raise Exception.Create('Ingrese valores numericos enteros.');
  end;

  // Verifica si hay valores negativos
  if matricula < 0 then
    raise Exception.Create('Ingres valores positivos.');

  // Realiza la consulta para recuperar alumno con matricula ingresada
  with CapaDatos.ZMostrarAlumno do
  begin
    Close;
    ParamByName('matricula').AsInteger := matricula;
    Open;
    // Si hay alumno con esa matricula se acutalizan los campos
    // de texto
    if RecordCount > 0 then
    begin
      // Se desactivan los campos de texto de busqueda
      Label1.Enabled := false;
      in_buscar_matricula.Enabled := false;
      btn_Buscar.Enabled := false;

      // Se activan los campos de texto para actualizar
      btn_Actualizar.Enabled := true;
      Label2.Enabled := true;
      Label3.Enabled := true;
      Label4.Enabled := true;
      in_matricula.Enabled := true;
      in_nombre.Enabled := true;
      in_grado.Enabled := true;

      // Se actualizan los campos de textos con los datos del
      // alumno encontrado
      in_matricula.Text := IntToStr(FieldByName('matricula').AsInteger);
      in_nombre.Text := FieldByName('nombre').AsString;
      in_grado.Text := IntToStr(FieldByName('grado').AsInteger);
    end
    else
      // Sino se encuentra alumno lanza mensaje informativo
      ShowMessage('No hay alumno con esa matricula.');
  end;

end;

// Cerrar ventana
procedure TFModAlumno.ACancelarExecute(Sender: TObject);
begin
  Close;
end;

// Modifica el alumno en la base de datos
procedure TFModAlumno.AModificarAlumnoExecute(Sender: TObject);
var
  _matricula: Integer;
  _grado: Integer;
begin
  // Se comprueba si los campos de texto no estan vacios
  if (in_nombre.Text = '') or (in_matricula.Text = '') or (in_grado.Text = '')
  then
    raise Exception.Create('Hay campos vacios en el formulario.');

  // Se verifica si en el campo de texto de la matricula haya solo numeros
  try
    _matricula := StrToInt(in_matricula.Text);
  except
    raise Exception.Create
      ('Ingrese caracteres de numeros enteros en la matricula.');
  end;

  // Se verifica que la matricula sea un numero positivo entero
  if (_matricula < 0) then
    raise Exception.Create
      ('Ingrese valores numericos validos para la matricula.');

  // Se comprueba que el grado sea un numero entero
  try
    _grado := StrToInt(in_grado.Text);
  except
    raise Exception.Create
      ('Ingrese caracteres de numeros enteros en el grado.');
  end;

  // Se verifica que el grado sea un numero positivo entero
  if (_grado < 0) then
    raise Exception.Create('Ingrese valores numericos validos para el grado.');

  // Consulta para actualizar alumno en la base de datos
  with ZModificarAlumno do
  begin
    Close;
    ParamByName('in_matricula').AsInteger := matricula;
    ParamByName('matricula').AsInteger := _matricula;
    ParamByName('nombre').AsString := in_nombre.Text;
    ParamByName('grado').AsInteger := _grado;
    ExecSQL;
  end;

  // Activa los campo de texto de busqueda
  Label1.Enabled := true;
  in_buscar_matricula.Enabled := true;
  btn_Buscar.Enabled := true;

  // Desactiva los campo de texto de actualizacion
  btn_Actualizar.Enabled := false;
  Label2.Enabled := false;
  Label3.Enabled := false;
  Label4.Enabled := false;
  in_matricula.Enabled := false;
  in_nombre.Enabled := false;
  in_grado.Enabled := false;

  // Reinicia los campos de texto
  in_buscar_matricula.Text := '';
  in_matricula.Text := '';
  in_nombre.Text := '';
  in_grado.Text := '';

  // Muestra mensaje de confirmacion
  ShowMessage('Se modifico el alumno con exito.');

  // Cierra el formulario con el estado mrOk
  ModalResult := mrOk;
end;

end.
