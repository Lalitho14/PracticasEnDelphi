program Practica05;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {FMain},
  uCapaDatos in 'uCapaDatos.pas' {CapaDatos: TDataModule},
  ufRegAlumno in 'ufRegAlumno.pas' {FRegAlumno},
  ufRegMateria in 'ufRegMateria.pas' {FRegMateria},
  ufModAlumno in 'ufModAlumno.pas' {FModAlumno},
  ufModMateria in 'ufModMateria.pas' {FModMateria},
  ufAsignarCalificacion in 'ufAsignarCalificacion.pas' {FAsignarCalif},
  uAlumnoMateria in 'uAlumnoMateria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TCapaDatos, CapaDatos);
  Application.Run;
end.
