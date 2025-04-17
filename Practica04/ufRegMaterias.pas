{
  Nombre : Jesus Eduardo Hernandez Bravo
  Fecha : 13-Ene-2025
}

unit ufRegMaterias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAlumnosMateria;

type
  TFRegMaterias = class(TForm)
    Label1: TLabel;
    in_matricula: TEdit;
    Label2: TLabel;
    in_nombre: TEdit;
    Label3: TLabel;
    in_calif: TEdit;
    Button1: TButton;
    procedure RegistrarMateria(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // Objeto para controlar registros.s
    cn: TControl;
  end;

var
  FRegMaterias: TFRegMaterias;

implementation

{$R *.dfm}

procedure TFRegMaterias.RegistrarMateria(Sender: TObject);
var
  m: Integer;
  c: Double;
begin
  // Se comprueba si los campos de texto no estan vacios
  if (in_matricula.Text = '') or (in_nombre.Text = '') or (in_calif.Text = '')
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

  // Se comprueba si la matricula existe en el registro
  if cn.ComprobarMatricula(m) = false then
    raise Exception.Create('No existe matricula de alumno.');

  // Comprueba que la calificacion tenga caracteres numericos
  try
    c := StrToFloat(in_calif.Text);
  except
    on E: EConvertError do
      raise Exception.Create
        ('Ingrese caracteres de numeros para calificacion.');
  end;

  // Comprueba que la calificacion este entre 0 y 10
  if (c > 10) or (c < 0) then
    raise Exception.Create('La calificacion debe estar entre 0 y 10.');

  // Se agrega la materia
  cn.AgregarMateria(m, in_nombre.Text, c);
  // Mustra mensaje de confirmacion
  ShowMessage('Se agrego materia para alumno ' + in_matricula.Text + '.');
  // Limpia los campos de texto
  in_nombre.Text := '';
  in_matricula.Text := '';
  in_calif.Text := '';
end;

end.
