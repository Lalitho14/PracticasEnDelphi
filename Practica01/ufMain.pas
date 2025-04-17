{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Fecha: 08 - Enero - 2025
}

unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFMain = class(TForm)
    num_01: TEdit;
    num_02: TEdit;
    btn_Suma: TButton;
    btn_Resta: TButton;
    btn_Division: TButton;
    btn_Multiplicacion: TButton;
    btn_Igual: TButton;
    l_op: TLabel;
    procedure SumaProcedimiento(Sender: TObject);//Procedimiento Suma
    procedure RestaProcedimiento(Sender: TObject);//Procedimiento Resta
    procedure MostrarResultadoDivision(Sender:TObject);//Muestra Division
    procedure MostrarResultadoMultiplicacion(Sender:TObject);//Muestra mult
    procedure LimpiarValores(Sender: TObject);
  private
    { Private declarations }
    {Variables para recuperar la informacion
    que el usuario ingreso}
    numero1 : Integer;
    numero2 : Integer;

    {Funciones}
    {Devuelve la divison de dos numeros enviados por parametro}
    function DivisionFuncion(aNumero1 : Integer; aNumero2 : Integer) : Double;
    {Devuelve la multiplicacion de dos numeros enviados por parametro}
    function MultiplicacionFuncion(aNumero1:Integer; aNumero2:Integer) : Integer;

  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

//Funcion que divide dos numeros
function TFMain.DivisionFuncion(aNumero1: Integer; aNumero2: Integer): Double;
begin
  //Se realiza y devuelve la division de los numeros
  Result := aNumero1 / aNumero2;
end;

//Funcion que multiplica dos numeros
function TFMain.MultiplicacionFuncion(aNumero1: Integer; aNumero2: Integer): Integer;
begin
  //Se realiza y devuelve la multiplicacion de los numeros
  Result := aNumero1 * aNumero2;
end;

procedure TFMain.MostrarResultadoMultiplicacion;
var
  resultado : Integer;
begin
  {Se indica la operacion que se realizara}
  l_op.Caption := '*';
  {Se recupera el valor que el usuario
  ingreso en el TEdit}
  numero1 := StrToInt(num_01.Text);//Guardamos el primer numero
  numero2 := StrToInt(num_02.Text);//Guardamos el segundo numero

  //Se guarda el resultado de la division
  resultado := MultiplicacionFuncion(numero1,numero2);

  {Se muestra en una ventana el resultado de la operacion}
  ShowMessage('La multiplicacion es igual a '+ FloatToStr(resultado));
end;

procedure TFMain.LimpiarValores(Sender: TObject);
begin
  l_op.Caption  := '';
  num_01.Text := '';
  num_02.Text := '';
end;

procedure TFMain.MostrarResultadoDivision;
var
  resultado : Double;
begin
  {Se indica la operacion que se realizara}
  l_op.Caption := '/';
  {Se recupera el valor que el usuario
  ingreso en el TEdit}
  numero1 := StrToInt(num_01.Text);//Guardamos el primer numero
  numero2 := StrToInt(num_02.Text);//Guardamos el segundo numero

  //Se guarda el resultado de la division
  resultado := DivisionFuncion(numero1,  numero2);

  {Se muestra en una ventana el resultado de la operacion}
  ShowMessage('La division es igual a '+ FloatToStr(resultado));
end;

//Resta dos numeros enteros
procedure TFMain.RestaProcedimiento(Sender: TObject);
begin
  {Se indica la operacion que se realizara}
  l_op.Caption := '-';
  {Se recupera el valor que el usuario
  ingreso en el TEdit}
  numero1 := StrToInt(num_01.Text);//Guardamos el primer numero
  numero2 := StrToInt(num_02.Text);//Guardamos el segundo numero

  {Se muestra en una ventana el resultado de la operacion}
  ShowMessage('La resta es igual a '+IntToStr(numero1-numero2));
end;

//Suma dos numeros enteros
procedure TFMain.SumaProcedimiento(Sender: TObject);
begin
  {Se indica la operacion que se realizara}
  l_op.Caption := '+';
  {Se recupera el valor que el usuario
  ingreso en el TEdit}
  numero1 := StrToInt(num_01.Text);//Guardamos el primer numero
  numero2 := StrToInt(num_02.Text);//Guardamos el segundo numero

  {Se  muestra en una ventana el resultado de la operacion}
  ShowMessage('La suma es igual a '+IntToStr(numero1+numero2));
end;
end.


