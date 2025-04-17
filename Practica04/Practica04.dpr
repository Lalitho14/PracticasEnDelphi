program Practica04;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {FMain},
  uAlumnosMateria in 'uAlumnosMateria.pas',
  ufRegAlumnos in 'ufRegAlumnos.pas' {FRegAlum},
  ufRegMaterias in 'ufRegMaterias.pas' {FRegMaterias};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
