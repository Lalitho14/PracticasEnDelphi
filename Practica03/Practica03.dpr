program Practica03;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FMain},
  uPromedioC2 in 'uPromedioC2.pas',
  uPromedioC1 in 'uPromedioC1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
