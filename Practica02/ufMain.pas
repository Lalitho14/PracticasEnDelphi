{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Fecha : 09 - Ene - 2025
}

unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  // Arreglo constante de calificaciones
  CALIF_CHICO_01: array [0 .. 5] of Double = (9.0, 6.6, 7.0, 8.3, 9.5, 7.6);

type
  TFMain = class(TForm)
    CChico1: TMemo;
    Label1: TLabel;
    btn_promedio1: TButton;
    btn_calificaciones1: TButton;
    Label2: TLabel;
    n_materias_c2: TEdit;
    Label3: TLabel;
    btn_materias_c2: TButton;
    CChico2: TMemo;
    btn_promedio2: TButton;
    Label4: TLabel;
    Calif_C2: TEdit;
    btn_calif2: TButton;
    btn_limpiarCC2: TButton;
    { Procedimientos para botones }
    procedure MostrarCalificaciones1(Sender: TObject);
    // Muestra las calif. del chico 1
    procedure VerPromedio1(Sender: TObject); // Muestra el promedio del Chico 2
    procedure VerPromedio2(Sender: TObject); // Muestra el promedio del CHico 1
    procedure IngresarMateriasC2(Sender: TObject);
    // Ingresa el num. de materias
    procedure IngresarCalificacionC2(Sender: TObject);
    // Ingresa calif. de chico 2
    procedure LimpiarCalificaciones(Sender: TObject); // Limpia calif.
  private
    { Private declarations }
    num_materias_C2: Integer; // Num. materias del Chico 2
    i_calif: Integer; // Inidice de calificaciones ingresadas
    // Arreglo dinam. alamacena las calificaciones de Chico 2
    arreglo_cc2: array of Double;

    { Procedimientos }
    procedure MostrarCalificaciones2; // Muestra las calificaciones en el TMemo
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

// Muestra las calificaciones en el TMemo del chico 2
procedure TFMain.MostrarCalificaciones2;
begin
  // Agrega al TMemo la calificacion
  CChico2.Lines.Add(FloatToStr(arreglo_cc2[i_calif]));
end;

// Ingresa calificacion al arreglo del chico 2
procedure TFMain.IngresarCalificacionC2(Sender: TObject);
var
  calificacion: Double;
begin
  // Validar si no esta vacio el TEdit
  if (Trim(Calif_C2.Text) = '') then
    raise Exception.Create('Debe ingresar la calificacion.');

  // Valida si hay texto diferente de numero
  try
    calificacion := StrToFloat(Calif_C2.Text);
  except
    raise Exception.Create('Ingrese solo numeros.');
  end;

  // Valida que la calif. este entre 0 o  10
  if (calificacion < 0) or (calificacion > 10) then
    raise Exception.Create('Las calificaciones tienen que ser entre 0 y 10.');

  // Agrega la calificacion al arreglo en el indice correspondiente
  arreglo_cc2[i_calif] := calificacion;
  // Limpiar el cuadro de texto
  Calif_C2.Text := '';

  // Si el indice sobre pasa el tamanio del arreglo
  // desactivamos los componentes necesarios
  if i_calif = Length(arreglo_cc2) - 1 then
  begin
    btn_promedio2.Enabled := true; // Habilita el boton para ver promedio
    Label4.Enabled := false; // Deshabilita letrero
    Calif_C2.Enabled := false; // Deshabilita TEdit
    btn_calif2.Enabled := false // Deshabilita boton para ingresar calif.
  end;

  MostrarCalificaciones2; // Muestra las calificaciones en el TMemo
  Inc(i_calif, 1); // Incrementa 1 al indice de calificaciones
  // Actualiza el letrero para saber que calif. sigue
  Label4.Caption := 'Calificacion ' + IntToStr(i_calif + 1) + ' : ';
end;

// Ingresa el numero de materias del chico 2
procedure TFMain.IngresarMateriasC2(Sender: TObject);
begin
  // Valida no esta vacio el cuadro de texto
  if (Trim(n_materias_c2.Text) = '') then
    raise Exception.Create('Debe ingresar el numero de materias.');

  // Valida que haya solo caracteres numericos
  try
    num_materias_C2 := StrToInt(n_materias_c2.Text);
  except
    raise Exception.Create('Ingrese solo caracteres de numeros enteros.');
  end;

  // Valida si es al menos 1 materia
  if (num_materias_C2 <= 0) then
    raise Exception.Create('Debe haber al menos una materia.');

  // Deshabilita y habilita los componentes necesarios para seguir
  // con el proceso
  Label4.Enabled := true;
  Label4.Caption := 'Calificacion 1 : ';
  Calif_C2.Enabled := true;
  btn_calif2.Enabled := true;
  btn_limpiarCC2.Enabled := true;
  Label3.Enabled := false;
  n_materias_c2.Enabled := false;
  btn_materias_c2.Enabled := false;
  i_calif := 0; // Inicializa el indice de calificacione en 0
  SetLength(arreglo_cc2, num_materias_C2); // Se inicializa el tam. del arreglo
end;

// Calcula y muestra el promedio del chico 2
procedure TFMain.VerPromedio2(Sender: TObject);
var
  { Variables locales }
  suma: Double;
  promedio: Double;
  indice: Integer;
begin
  suma := 0; // Suma de calif. se inicializa en 0
  // Se itera el arreglo dinamico de califiaciones del chico 2
  for indice := 0 to Length(arreglo_cc2) - 1 do
  begin
    // Acumulado de calificaciones
    suma := suma + arreglo_cc2[indice];
  end;

  // Calculo de promedio
  promedio := suma / Length(arreglo_cc2);

  // Muestra el promedio del chico 2
  ShowMessage('El promedio del chico 2 es : ' + FloatToStr(promedio));
end;

// Limpia las calificaciones ingresadas para el chico 2
procedure TFMain.LimpiarCalificaciones(Sender: TObject);
begin
  CChico2.Lines.Clear; // Limpia el TMemo
  SetLength(arreglo_cc2, 0); // Se reinicia el arreglo
  i_calif := 0; // Se inicia el indice de calif. en 0 nuevamente
  num_materias_C2 := 0; // Num. de materias en 0
  // Se renicia el estado de los componentes
  Label3.Enabled := true;
  n_materias_c2.Enabled := true;
  n_materias_c2.Text := '';
  btn_materias_c2.Enabled := true;
  Label4.Caption := 'Calificacion : ';
  btn_promedio2.Enabled := false;
end;

// Muestra las calificaciones del chico 1
procedure TFMain.MostrarCalificaciones1(Sender: TObject);
var
  indice: Integer;
begin
  CChico1.Lines.Clear; // Limpia el TMemo
  // Se itera el arreglo constante
  for indice := 0 to Length(CALIF_CHICO_01) - 1 do
  begin
    // Se agrega el elemento del arreglo al TMemo
    CChico1.Lines.Add(FloatToStr(CALIF_CHICO_01[indice]));
  end;
  btn_promedio1.Enabled := true;
  // Se habilita el btn que muestra el promedio del chico 1
end;

// Calcula y Muestra el promedio del chico 1
procedure TFMain.VerPromedio1(Sender: TObject);
var
  { Variables locales }
  suma: Double;
  promedio: Double;
  indice: Integer;
begin
  suma := 0; // Suma de calif. se inicializa en 0
  // Se itera el arreglo constante de califiaciones del chico 1
  for indice := 0 to Length(CALIF_CHICO_01) - 1 do
  begin
    // Acumulado de calificaciones
    suma := suma + CALIF_CHICO_01[indice];
  end;

  // Calculo de promedio
  promedio := suma / Length(CALIF_CHICO_01);

  // Muestra el promedio del chico 1
  ShowMessage('El promedio del chico 1 es : ' + FloatToStr(promedio));
end;

end.
