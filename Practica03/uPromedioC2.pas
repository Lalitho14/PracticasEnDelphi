{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Fecha : 10 - Ene - 2025
}

unit uPromedioC2;

interface

uses
  System.SysUtils;

type
  TPromedioC2 = class(TObject)
    constructor Create(num_m: Integer); // Contructor del unit

  private
    n_materias: Integer; // Numero de materias para chico 2
    i_calif: Integer; // Indice de calificaciones ingresadas
    calificaciones: Array of Double; // Arreglo dinamico para calif.

  public
    { Funciones }
    function PromedioC2: Double;
    // Funcion para calcular el promedio del arreglo de calif.
    function GetMaterias: Integer; // Funcion para obtener el num. de materias
    function GetI_calif: Integer; // Obtiene las calif. ingresadas
    function GetCalif(pos: Integer): Double;
    // Devuelve la calif. segun posicion
    function GetTamCalificacion: Integer;
    // Obtiene el tamanio del arreglo de calificaciones
    { Procedimientos }
    procedure AgregarCalificacion(c: Double); // Agrega calificacion al arreglo
  end;

implementation

// Contructor del unit, se necesita el numero de materias
constructor TPromedioC2.Create(num_m: Integer);
begin
  n_materias := num_m; // Se establece el numero de materias
  SetLength(calificaciones, n_materias); // Se establece el tamanio del arreglo
  i_calif := 0; // Calificaciones ingresadas en 0
end;

// Devuelve las calificaciones ingresadas al momento
function TPromedioC2.GetI_calif: Integer;
begin
  Result := i_calif;
end;

// Devuelve el tamanio del arreglo de calificaciones
function TPromedioC2.GetTamCalificacion: Integer;
begin
  Result := Length(calificaciones);
end;

// Obtiene la calificion con la posicion dada
function TPromedioC2.GetCalif(pos: Integer): Double;
begin
  // Se verifica si la posicion solicitada esta en los limites
  // del arreglo
  if (pos > Length(calificaciones)) or (pos < 0) then
    raise Exception.Create('No existe calificacion.');

  Result := calificaciones[pos]; // Se devuelve la calif.
end;

// Devuelve el numero de materias
function TPromedioC2.GetMaterias: Integer;
begin
  Result := n_materias;
end;

// Agrega la calificacion dada al arreglo
procedure TPromedioC2.AgregarCalificacion(c: Double);
begin
  // Valida que la calif. este entre 0 o  10
  if (c < 0) or (c > 10) then
    raise Exception.Create('Las calificaciones tienen que ser entre 0 y 10.');

  // Agrega la calificacion al arreglo en el indice correspondiente
  calificaciones[i_calif] := c;
  Inc(i_calif, 1); // Incrementa 1 al indice de calificaciones
end;

// Calcula y el promedio del chico 2
function TPromedioC2.PromedioC2: Double;
var
  suma: Double;
  indice: Integer;
begin
  suma := 0; // Suma de calif. se inicializa en 0
  // Se itera el arreglo dinamico de califiaciones del chico 2
  for indice := 0 to Length(calificaciones) - 1 do
  begin
    // Acumulado de calificaciones
    suma := suma + calificaciones[indice];
  end;

  // Calculo de promedio
  Result := suma / Length(calificaciones);
end;

end.
