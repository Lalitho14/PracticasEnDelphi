{
  Nombre : Jesus Eduardo Hernandez Bravo
  Fecha : 13-Ene-2025
}

unit ufRegAlumnos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAlumnosMateria;

type
  TFRegAlum = class(TForm)
    Label1: TLabel;
    in_nombre: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    in_matricula: TEdit;
    in_grado: TEdit;
    btn_AgregarAlum: TButton;
    procedure AgregarAlumno(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // Objeto para controlar registros.
    cn: TControl;
  end;

var
  FRegAlum: TFRegAlum;

implementation

{$R *.dfm}

procedure TFRegAlum.AgregarAlumno(Sender: TObject);
var
  m: Integer;
  g: Integer;
begin
  // Se comprueba si los campos de texto no estan vacios
  if (in_nombre.Text = '') or (in_matricula.Text = '') or (in_grado.Text = '')
  then
    raise Exception.Create('Hay campos vacios en el formulario.');

  // Se verifica si en el campo de texto de la matricula haya solo numeros
  try
    m := StrToInt(in_matricula.Text);
  except
    on E: EConvertError do
      raise Exception.Create
        ('Ingrese caracteres de numeros enteros en la matricula.');
  end;

  // Se verifica que la matricula sea un numero positivo entero
  if (m < 0) then
    raise Exception.Create
      ('Ingrese valores numericos validos para la matricula.');

  // Se comprueba si la matricula ya existe en el registro
  if cn.ComprobarMatricula(m) then
    raise Exception.Create('Matricula ya registrada.');

  // Se comprueba que el grado sea un numero entero
  try
    g := StrToInt(in_grado.Text);
  except
    on E: EConvertError do
      raise Exception.Create
        ('Ingrese caracteres de numeros enteros en el grado.');
  end;

  // Se verifica que el grado sea un numero positivo entero
  if (g < 0) then
    raise Exception.Create('Ingrese valores numericos validos para el grado.');

  // Se agrega un nuevo alumno al registro
  cn.AgregarAlumno(m, in_nombre.Text, g);
  // Muestra mensaje de confirmacion
  ShowMessage('Se agrego nuevo alumno.');
  // Limpia los cuadros de texto
  in_nombre.Text := '';
  in_matricula.Text := '';
  in_grado.Text := '';
end;

end.
