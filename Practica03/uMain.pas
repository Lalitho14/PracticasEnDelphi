{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Fecha : 10 - Ene - 2025
}

unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uPromedioC2;

type
  TFMain = class(TForm)
    Label1: TLabel;
    btn_calif_c1: TButton;
    Calif_C1: TMemo;
    btn_promedio_c1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    in_materias: TEdit;
    btn_materias: TButton;
    Calif_C2: TMemo;
    lb_calif: TLabel;
    Ecalif: TEdit;
    btn_icalif: TButton;
    btn_promedio_c2: TButton;
    btn_limp_calif: TButton;
    { Procedimientos para botones }
    procedure IngresarCalifC1(Sender: TObject);
    // Ingresa calificacion de chico1
    procedure VerPromedioC1(Sender: TObject); // Muestra el promedio de chico1
    procedure IngresarMaterias(Sender: TObject); // Ingresa materias de chico2
    procedure IngresarCalifC2(Sender: TObject); // Ingresa calif. para chico2
    procedure VerPromedioC2(Sender: TObject); // Muestra el promedio de chico2
    procedure LimpiarCalificaciones(Sender: TObject); // Limpia datos
  private
    { Private declarations }
    // Obj que nos permite realizar acciones para el chico 2
    chico2: TPromedioC2;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  uPromedioC1;

{$R *.dfm}

// Prodimiento para ingresar calificaciones de chico2
procedure TFMain.IngresarCalifC2(Sender: TObject);
begin
  // Validar si no esta vacio el TEdit
  if (Trim(Ecalif.Text) = '') then
    raise Exception.Create('Debe ingresar la calificacion.');

  try
    // Agrega la calif al objeto
    chico2.AgregarCalificacion(StrToFloat(Ecalif.Text));
  except
    // Valido si se ingresaron otros caracteres
    on E: EConvertError do
      raise Exception.Create('Ingrese solo numeros');
  end;

  // Agrega calif a TMemo
  Calif_C2.Lines.Add(Ecalif.Text);
  Ecalif.Text := ''; // Limpia el cuadro de texto

  // Si el indice sobre pasa el tamanio del arreglo
  // desactivamos los componentes necesarios
  if chico2.GetI_calif = (chico2.GetTamCalificacion) then
  begin
    btn_limp_calif.Enabled := true; // Habilita boton para limpiar datos
    btn_promedio_c2.Enabled := true; // Habilita el boton para ver promedio
    lb_calif.Enabled := false; // Deshabilita letrero
    Ecalif.Enabled := false; // Deshabilita TEdit
    btn_icalif.Enabled := false // Deshabilita boton para ingresar calif.
  end;
end;

// Prodimiento para ingresar el numero de materias
procedure TFMain.IngresarMaterias(Sender: TObject);
begin
  // Valida no esta vacio el cuadro de texto
  if (Trim(in_materias.Text) = '') then
    raise Exception.Create('Debe ingresar el numero de materias.');

  try
    // Verifica si hay al menos una materia
    if StrToInt(in_materias.Text) <= 0 then
      raise Exception.Create('Tiene que haber al menos una materia');

    // Se crea el obj para chico 2
    chico2 := TPromedioC2.Create(StrToInt(in_materias.Text));

    // Habilita o deshabilita los componentes necesarios para
    // seguir con el proceso
    lb_calif.Enabled := true;
    Ecalif.Enabled := true;
    btn_icalif.Enabled := true;
    Label3.Enabled := false;
    in_materias.Enabled := false;
    btn_materias.Enabled := false;
  except
    // Valido si se ingresaron otros caracteres
    on E: EConvertError do
      raise Exception.Create('Ingrese solo caracteres de numeros enteros.');
  end;
end;

// Procedimiento para limpiar datos en pantalla
procedure TFMain.LimpiarCalificaciones(Sender: TObject);
begin
  // Elimina el objeto del chico2
  chico2.Free;
  Calif_C2.Lines.Clear; // Limpia las calificaciones ingresadas

  // Devuelve los componentes a su forma inicial
  lb_calif.Enabled := false;
  Ecalif.Enabled := false;
  btn_icalif.Enabled := false;
  Label3.Enabled := true;
  in_materias.Enabled := true;
  in_materias.Text := '';
  btn_materias.Enabled := true;
  btn_promedio_c2.Enabled := false;
  btn_limp_calif.Enabled := false;
end;

// Muestra el promedio del chico 2
procedure TFMain.VerPromedioC2(Sender: TObject);
begin
  // Mostramos el promedio obtenido del obj de chico2
  ShowMessage('El promedio del Chico 2 es : ' + FloatToStr(chico2.PromedioC2));
end;

// Ingresamos y mostramos las calificaciones del chico 1
procedure TFMain.IngresarCalifC1(Sender: TObject);
begin
  // Habilitamos el boton para ver promedio
  btn_promedio_c1.Enabled := true;
  // Usamos el unit TPromedioC1 para mostrar calificaciones
  with TPromedioC1.Create do
    try
      // Llamamos el metodos para mostrar calif. pasando el TMemo
      // al cual se le colocaran las calificaciones
      MostrarCalificaciones(Calif_C1);
    finally
      // Se libera la memoria del unit
      Free;
    end;
end;

// Mostramos el promedio del chico1
procedure TFMain.VerPromedioC1(Sender: TObject);
begin
  // Usamos el unit de TPromedioC1
  with TPromedioC1.Create do
    try
      // Mostramos el promedio  del chico 1
      ShowMessage('El promedio del Chico 1 es : ' + FloatToStr(PromedioC1));
    finally
      Free;
    end;
end;

end.
