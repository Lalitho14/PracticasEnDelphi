{
  Nombre : Jesus Eduardo Hernandez Bravo
  Fecha : 13-Ene-2025
}

unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAlumnosMateria,
  Vcl.Grids;

type
  TFMain = class(TForm)
    btn_AgregarAlumno: TButton;
    btn_AgregarMateria: TButton;
    TTabla: TStringGrid;
    { Procedimientos para botones }
    // Abre la ventana para un nuevo registro de alumno.
    procedure AgregarAlumno(Sender: TObject);
    // Abre la ventana para un nuevo registro.
    procedure AgregarMateria(Sender: TObject);
    // Inicia el objeto de control y tabla.
    procedure InicializarControles(Sender: TObject);
  private
    { Private declarations }
    // Objeto para controlar registros.
    control: TControl;
    // Actualiza la tabla para ver los registros.
    procedure ActualizarTabla;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

// Se importan los formularios necesarios.
uses
  ufRegAlumnos, ufRegMaterias;

{$R *.dfm}

// Funcion para actualizar la tabla
procedure TFMain.ActualizarTabla;
var
  indice: Integer;
  a: TAlumno;
  mat: TArray<TMateria>;
  j: Integer;
begin
  // Itera los alumnos registrados.
  for indice := 0 to control.GetNumeroAlumnos - 1 do
  begin
    // Verifica si hay espacio en la tabla para el alumno (fila)
    if (TTabla.RowCount - 1) / 2 < control.GetNumeroAlumnos then
      TTabla.RowCount := TTabla.RowCount + 2;
    // Obtenemos el alumno segun su posicion
    a := control.GetAlumnoPos(indice);

    // Colocamos los datos del alumno
    TTabla.Cells[0, 2 * (indice + 1)] := a.nombre;
    TTabla.Cells[1, 2 * (indice + 1)] := IntToStr(a.grado);
    TTabla.Cells[2, 2 * (indice + 1)] := IntToStr(a.matricula);
    TTabla.Cells[3, 2 * (indice + 1)] := FloatToStr(a.promedio);

    // Verifica si hay espacio para las materias por alumno (columna)
    if TTabla.ColCount - 4 < control.GetNumeroMateriasAlumno(indice) then
      TTabla.ColCount := TTabla.ColCount + 1;

    // Obtiene la lista de materias del alumno.
    mat := control.GetListaMaterias(a.matricula);

    // Itera la lista de materias del alumno.
    for j := 0 to Length(mat) - 1 do
    begin
      // Coloca los datos de la materia donde corresponde
      TTabla.Cells[j + 4, (2 * (indice + 1)) - 1] := mat[j].nombre;
      TTabla.Cells[j + 4, 2 * (indice + 1)] := FloatToStr(mat[j].calificacion);
    end;

  end;
end;

// Abrir ventana para alumnos
procedure TFMain.AgregarAlumno(Sender: TObject);
begin
  // Crea la ventana
  with TFRegAlum.Create(nil) do
    try
      // Se obtienen los datos del control principal
      cn := control;
      // Se muestra formulario
      ShowModal;
    finally
      // Se recuperan los datos modificados en el formulario
      control := cn;
      // Se libera los recursos del formulario
      Free;
    end;

  // Se actualizan los cambios en el registro
  ActualizarTabla;
end;

// Abre ventana para registrar nueva materia para alumno
procedure TFMain.AgregarMateria(Sender: TObject);
begin
  // Crea la ventana
  with TFRegMaterias.Create(nil) do
    try
      // Se obtienen los datos del control principal
      cn := control;
      // Se muestra formulario
      ShowModal;
    finally
      // Se recuperan los datos modificados en el formulario
      control := cn;
      // Se libera los recursos del formulario
      Free;
    end;

  // Se actualizan los cambios en el registro
  ActualizarTabla;
end;

// Se inicializa la tabla y obj control al abrir
procedure TFMain.InicializarControles(Sender: TObject);
begin
  // Se crea objeto control
  control := TControl.Create;
  // Se establecen los encabezados de la tabla
  TTabla.ColCount := 5;
  TTabla.Cells[0, 0] := 'Alumno';
  TTabla.Cells[1, 0] := 'Grado';
  TTabla.Cells[2, 0] := 'Matricula';
  TTabla.Cells[3, 0] := 'Promedio';
  TTabla.Cells[4, 0] := 'Materias';
end;

end.
