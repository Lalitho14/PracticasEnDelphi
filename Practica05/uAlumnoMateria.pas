unit uAlumnoMateria;

interface

type
  // Estructura para alumnos
  TAlumno = record
    id: Integer;
    matricula: Integer;
    nombre: string;
    grado: Integer;
    promedio: Double;
  end;

  // Estructura para materias
  TMateria = record
    id: Integer;
    nombre: string;
  end;

type
  TControl = class(TObject)
    constructor Create;
  private
    // Arreglo para guardar alumnos
    alumnos: TArray<TAlumno>;
    // Arreglo para guardar materias
    materias: TArray<TMateria>;
  public
    { Procedimientos }
    // Agrega nuevo alumno al arreglo
    procedure AgregarAlumno(_id: Integer; _matricula: Integer; _nombre: string;
      _grado: Integer; _promedio: Double);
    // Agrega nueva materia al arreglo
    procedure AgregarMateria(_id: Integer; _nombre: string);
    // Actualiza promedio del alumno segun su posicion
    procedure SetPromedioAlumno(_promedio: Double; _indice: Integer);
    { Funciones }
    // Devuelve una lista de TAlumno
    function ListaAlumnos: TArray<TAlumno>;
    // Devuelve lista de TMateria
    function GetListaMaterias(m: Integer): TArray<TMateria>;
    // Devuelve TAlumno segun indice de arreglo
    function GetAlumnoPorPosicion(_indice: Integer): TAlumno;
    // Devuevle TAlumno segun matricula
    function GetAlumnoMatricula(m: Integer): TAlumno;
    // Devuelve materia segun indice de arreglo
    function GetMateriaPorPosicion(_indice: Integer): TMateria;
    // Devuelve numero de alumnos en el arreglo
    function GetNumeroAlumnos: Integer;
    // Devuelve numero de materias en el arreglo
    function GetNumeroMaterias: Integer;
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
function TControl.GetMateriaPorPosicion(_indice: Integer): TMateria;
begin
  Result := materias[_indice];
end;

// Devuelve un TAlumno segun indice del arreglo
function TControl.GetAlumnoPorPosicion(_indice: Integer): TAlumno;
begin
  Result := alumnos[_indice];
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
    if materias[indice].id = m then
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

procedure TControl.SetPromedioAlumno(_promedio: Double; _indice: Integer);
begin
  alumnos[_indice].promedio := _promedio;
end;

// Agrega alumno al arreglo segun sus parametros
procedure TControl.AgregarAlumno(_id: Integer; _matricula: Integer;
  _nombre: string; _grado: Integer; _promedio: Double);
var
  a: TAlumno;
begin
  // Se aumenta el tamanio del arreglo
  SetLength(alumnos, Length(alumnos) + 1);

  // Se asignan los datos del alumno
  a.id := _id;
  a.matricula := _matricula;
  a.nombre := _nombre;
  a.grado := _grado;
  a.promedio := _promedio;

  // Se agrega alumno al arreglo
  alumnos[Length(alumnos) - 1] := a;
end;

// Agrega materia al arreglo materias
procedure TControl.AgregarMateria(_id: Integer; _nombre: string);
var
  materia: TMateria;
begin
  // Se aumenta el tamanio del arreglo
  SetLength(materias, Length(materias) + 1);
  // Se asignan los datos de la materia
  materia.id := _id;
  materia.nombre := _nombre;

  // Se agrega materia al arreglo
  materias[Length(materias) - 1] := materia;
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

end.
