{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}
unit ufModMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uAlumnoMateria, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.ExtCtrls, cxButtons;

type
  TFModMateria = class(TForm)
    Label1: TLabel;
    in_buscar_nombre: TEdit;
    Label2: TLabel;
    in_nombre: TEdit;
    ActionList: TActionList;
    ABuscarMateria: TAction;
    AModMateria: TAction;
    ZModificarMateria: TZQuery;
    btn_Buscar: TcxButton;
    btn_Actualizar: TcxButton;
    Panel1: TPanel;
    ACancelar: TAction;
    cxButton1: TcxButton;
    procedure ABuscarMateriaExecute(Sender: TObject);
    procedure AModMateriaExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
  private
    { Private declarations }
    // Guarda la materia a modificar
    materia: TMateria;
  public
    { Public declarations }
  end;

var
  FModMateria: TFModMateria;

implementation

// Importa unidad de capa de datos
uses
  uCapaDatos;

{$R *.dfm}

// Buscar la materia a modificar en la base de datos
procedure TFModMateria.ABuscarMateriaExecute(Sender: TObject);
begin
  // Verifica que no haya campos vacios
  if (in_buscar_nombre.Text = '') then
    raise Exception.Create('Ingrese nombre de materia.');

  // Realiza consulta que recupera materia a modificar
  with CapaDatos.ZMostrarMateria do
  begin
    Close;
    ParamByName('nombre').AsString := in_buscar_nombre.Text;
    Open;

    // Si existe guarda la materia
    if RecordCount > 0 then
    begin
      // Desactiva campos de texto de busqueda
      Label1.Enabled := false;
      in_buscar_nombre.Enabled := false;
      btn_Buscar.Enabled := false;

      // Activa campos de texto para actualizar
      Label2.Enabled := true;
      in_nombre.Enabled := true;
      btn_Actualizar.Enabled := true;

      // Muestra el nombre de la materia en el campo de texto
      // a actualizar
      in_nombre.Text := FieldByName('nombre').AsString;
      // Guarda los datos en el TMateria
      materia.id := FieldByName('id').AsInteger;
      materia.nombre := FieldByName('nombre').AsString;
    end
    else
      // Sino muestra el mensaje
      ShowMessage('No existe materia con ese nombre.');
  end;

end;

// Cierra el formulario
procedure TFModMateria.ACancelarExecute(Sender: TObject);
begin
  Close;
end;

// Modifica materia en la base datos
procedure TFModMateria.AModMateriaExecute(Sender: TObject);
begin
  // Verifica que no haya campos vacios
  if in_nombre.Text = '' then
    raise Exception.Create('Ingrese un nombre para la materia.');

  // Se actualiza el nombre de la materia en memoria
  materia.nombre := in_nombre.Text;

  // Realiza consulta para actualizar materia
  with ZModificarMateria do
  begin
    Close;
    ParamByName('id').AsInteger := materia.id;
    ParamByName('nombre').AsString := materia.nombre;
    ExecSQL;
  end;

  // Activa campos de texto de busqueda
  Label1.Enabled := true;
  in_buscar_nombre.Enabled := true;
  btn_Buscar.Enabled := true;

  // Desactiva campos de texto de actualizacion
  btn_Actualizar.Enabled := false;
  Label2.Enabled := false;
  in_nombre.Enabled := false;

  // Limpia los campos de texto
  in_buscar_nombre.Text := '';
  in_nombre.Text := '';
  // Muestra mensaje de confirmacion
  ShowMessage('Se modifico materia con exito.');

  // Cierra el formulario con el estado mrOk
  ModalResult := mrOk;
end;

end.
