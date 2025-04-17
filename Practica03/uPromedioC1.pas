{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Fecha : 10 - Ene - 2025
}

unit uPromedioC1;

interface

uses
  Vcl.StdCtrls, System.SysUtils;

const
  // Arreglo constante de calificaciones
  CALIF_CHICO_01: array [0 .. 5] of Double = (9.0, 6.6, 7.0, 8.3, 9.5, 7.6);

type
  TPromedioC1 = class(TObject)

  public
    { Procedimientos }
    procedure MostrarCalificaciones(calif: TMemo); // Pasa las calif. al TMemo
    { Funciones }
    function PromedioC1: Double; // Calcula el promedio del arreglo de calif.
  end;

implementation

// Calcula el promedio del arreglo de calificaciones del chico 1
function TPromedioC1.PromedioC1: Double;
var
  suma: Double;
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
  Result := suma / Length(CALIF_CHICO_01);
end;

// Pasa las calif. del arreglo a un TMemo
procedure TPromedioC1.MostrarCalificaciones(calif: TMemo);
var
  indice: Integer;
begin
  calif.Lines.Clear; // Limpia el TMemo
  // Se itera el arreglo constante
  for indice := 0 to Length(CALIF_CHICO_01) - 1 do
  begin
    // Se agrega el elemento del arreglo al TMemo
    calif.Lines.Add(FloatToStr(CALIF_CHICO_01[indice]));
  end;
end;

end.
