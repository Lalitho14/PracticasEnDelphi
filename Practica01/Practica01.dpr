program Practica01;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
