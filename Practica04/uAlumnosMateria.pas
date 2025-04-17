{
  Nombre : Jesus Eduardo Hernandez Bravo
  Fecha : 13-Ene-2025
}

unit uAlumnosMateria;

interface

type
  // Estructura para alumnos
  TAlumno = record
    matricula: Integer;
    nombre: string;
    grado: Integer;
    promedio: Double;
  end;

  // Estructura para materias
  TMateria = record
    matricula: Integer;
    nombre: string;
    calificacion: Double;
  end;

type
  TControl = class(TObject)
    constructor Create;
  private
    // Arreglo para guardar alumnos
    alumnos: TArray<TAlumno>;
    // Arreglo para guardar materias
    materias: TArray<TMateria>;
    { Procedimientos }
    // Calcula el promedio del alumno segun su matricula
    procedure CalculaPromedioAlumno(m: Integer);
  public
    { Procedimientos }
    // Agrega nuevo alumno al arreglo
    procedure AgregarAlumno(m: Integer; n: string; g: Integer);
    // Agrega nueva materia al arreglo
    procedure AgregarMateria(m: Integer; n: string; c: Double);
    { Funciones }
    // Devuelve una lista de TAlumno
    function ListaAlumnos: TArray<TAlumno>;
    // Devuelve lista de TMateria
    function GetListaMaterias(m: Integer): TArray<TMateria>;
    // Devuelve TAlumno segun indice de arreglo
    function GetAlumnoPos(i: Integer): TAlumno;
    // Devuevle TAlumno segun matricula
    function GetAlumnoMatricula(m: Integer): TAlumno;
    // Devuelve materia segun indice de arreglo
    function GetMateriaPos(i: Integer): TMateria;
    // Devuelve numero de alumnos en el arreglo
    function GetNumeroAlumnos: Integer;
    // Devuelve numero de materias en el arreglo
    function GetNumeroMaterias: Integer;
    // Devuelve numero de materias segun indice de alumno
    function GetNumeroMateriasAlumno(i: Integer): Integer;
    // Devuelve el indice del alumno segun su matricula
    function GetIndiceAlumno(m: Integer): Integer;
    // Devuelve true o false si hay alumno segun matricula
    function ComprobarMatricula(m: Integer): Boolean;
  end;

implementation

// Inicializa los arreglo
constructor TControl.Create;
begin
  // Inicaliza arreglo de alumnos
  SetLength(alumnos, 0);
  // Inicaliza arreglo de materias
  SetLength(materias, 0);
end;

// Calcula y devuelve el numero de alumnos en el arreglo
function TControl.GetNumeroAlumnos: Integer;
begin
  Result := Length(alumnos);
end;

// Calcula y devuelve el numero de materias en el arreglo
function TControl.GetNumeroMaterias: Integer;
begin
  Result := Length(materias);
end;

// Devuelve un TMateria segun indice del arreglo
function TControl.GetMateriaPos(i: Integer): TMateria;
begin
  Result := materias[i];
end;

// Devuelve un TAlumno segun indice del arreglo
function TControl.GetAlumnoPos(i: Integer): TAlumno;
begin
  Result := alumnos[i];
end;

// Obtiene el indice del arreglo de alumnos segun su matricula
function TControl.GetIndiceAlumno(m: Integer): Integer;
var
  indice: Integer;
  i: Integer;
begin
  i := 0;
  // Itera todos los alumnos del arreglo hasta encontrar
  // el alumno con la matricula deseada
  for indice := 0 to Length(alumnos) - 1 do
  begin
    if alumnos[indice].matricula = m then
    begin
      i := indice;
    end;
  end;

  Result := i;
end;

// Devuelve la lista de alumnos
function TControl.ListaAlumnos: System.TArray<TAlumno>;
begin
  Result := alumnos;
end;

// Obtiene y devuelve las materias segun matricula
function TControl.GetListaMaterias(m: Integer): System.TArray<TMateria>;
var
  lista: TArray<TMateria>;
  indice: Integer;
begin
  // Inicializa el arreglo
  SetLength(lista, 0);
  // Itera las materias
  for indice := 0 to Length(materias) - 1 do
  begin
    // Si la matricula de la materia coincide con la
    // matricula se guarda en la lista
    if materias[indice].matricula = m then
    begin
      SetLength(lista, Length(lista) + 1);
      lista[Length(lista) - 1] := materias[indice];
    end;
  end;

  // Se devuelve la lista resultante
  Result := lista;
end;

// Comprueba si existe un alumno con la matricula deseada
function TControl.ComprobarMatricula(m: Integer): Boolean;
var
  indice: Integer;
  m_invalid: Boolean;
begin
  // Devuelve false de no encontrar alumno
  m_invalid := false;
  // Itera el arreglo de alumnos
  for indice := 0 to Length(alumnos) - 1 do
  begin
    // Si la matricula del alumno es igual a la deseada
    // se cambia el valor aux a true
    if alumnos[indice].matricula = m then
      m_invalid := true;
  end;

  // Devuelve false si no hay alumno con la matricula deseada
  // O devuelve false si no hay alumno con la matricula deseada
  Result := m_invalid;
end;

// Calcula y devuelve el numero de materias segun alumno
// dado por su indice en el arreglo
function TControl.GetNumeroMateriasAlumno(i: Integer): Integer;
var
  indice: Integer;
  n_mat: Integer;
begin
  n_mat := 0;
  // Itera el arreglo de las materias
  for indice := 0 to Length(materias) - 1 do
  begin
    // Si la matricula de la materia es igual a la del alumno
    // aumenta el numero de materias (n_mat)
    if alumnos[i].matricula = materias[indice].matricula then
    begin
      n_mat := n_mat + 1;
    end;
  end;

  // Devuelve el numero de materias registradas del alumno
  Result := n_mat;
end;

// Agrega alumno al arreglo segun sus parametros
procedure TControl.AgregarAlumno(m: Integer; n: string; g: Integer);
var
  a: TAlumno;
begin
  // Se aumenta el tamanio del arreglo
  SetLength(alumnos, Length(alumnos) + 1);

  // Se asignan los datos del alumno
  a.matricula := m;
  a.nombre := n;
  a.grado := g;
  a.promedio := 0.0;

  // Se agrega alumno al arreglo
  alumnos[Length(alumnos) - 1] := a;
end;

// Agrega materia al arreglo materias
procedure TControl.AgregarMateria(m: Integer; n: string; c: Double);
var
  ma: TMateria;
begin
  // Se aumenta el tamanio del arreglo
  SetLength(materias, Length(materias) + 1);
  // Se asignan los datos de la materia
  ma.matricula := m;
  ma.nombre := n;
  ma.calificacion := c;

  // Se agrega materia al arreglo
  materias[Length(materias) - 1] := ma;
  // Calcula nuevo promedio del alumno segun matricula
  CalculaPromedioAlumno(m);
end;

// Devuelve alumno segun matricula
function TControl.GetAlumnoMatricula(m: Integer): TAlumno;
var
  indice: Integer;
  a: TAlumno;
begin
  // Busca en el arreglo el alumno por su matricula
  for indice := 0 to Length(alumnos) - 1 do
  begin
    // Si la matricula es igual a la que se desea
    // se guarda en la variable a
    if alumnos[indice].matricula = m then
      a := alumnos[indice];
  end;

  // Devuelve el alumno
  Result := a;
end;

// Calcula el promedio del alumno seleccionado por su matricula
procedure TControl.CalculaPromedioAlumno(m: Integer);
var
  // Guarda la suma de las calificaciones
  suma: Double;
  // Guarda el numero de la materia
  num_ma: Integer;
  // Indice para el ciclo
  indice: Integer;
  // Indice de la posicion del alumno en el arreglo
  pos_alum: Integer;
begin
  // Igualamos a 0 las variables
  suma := 0;
  num_ma := 0;
  // Obtiene el indice del alumno
  pos_alum := GetIndiceAlumno(m);

  // Ciclo para sumar las  materias del alumno
  for indice := 0 to Length(materias) - 1 do
  begin
    // Si las matricula de la materia es igual a la de la alumno
    // se suman las calificaciones y el numero de materias
    if materias[indice].matricula = m then
    begin
      suma := suma + materias[indice].calificacion;
      num_ma := num_ma + 1;
    end;
  end;

  // Se acualiza el promedio del alumno indicado por el indice
  alumnos[pos_alum].promedio := suma / num_ma;
end;

end.
