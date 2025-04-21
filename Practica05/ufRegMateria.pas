{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}
unit ufRegMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.ExtCtrls, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
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
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TFRegMateria = class(TForm)
    Label1: TLabel;
    in_nombre: TEdit;
    ActionList: TActionList;
    AInsertarMateria: TAction;
    ZInsertarMateria: TZQuery;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ACerrar: TAction;
    procedure AInsertarMateriaExecute(Sender: TObject);
    procedure ACerrarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegMateria: TFRegMateria;

implementation

// Importa unidad de la capa de datos
uses
  uCapaDatos;

{$R *.dfm}

// Cierra el formulario
procedure TFRegMateria.ACerrarExecute(Sender: TObject);
begin
  Close;
end;

// Inserta una nueva materia a la base de datos
procedure TFRegMateria.AInsertarMateriaExecute(Sender: TObject);
begin
  // Se comprueba si los campos de texto no estan vacios
  if (in_nombre.Text = '') then
    raise Exception.Create('Hay campos vacios en el formulario.');

  // Realiza la consulta con el nombre de la materia ingresado
  with CapaDatos.ZMostrarMateria do
  begin
    Close;
    ParamByName('nombre').AsString := in_nombre.Text;
    Open;

    // Si existe una materia con ese nombre realiza la siguiente
    // excepcion
    if RecordCount > 0 then
      raise Exception.Create('Ya existe materia con ese nombre.');
  end;

  // Realiza la consulta para ingresar nueva materia
  with ZInsertarMateria do
  begin
    Close;
    ParamByName('nom_materia').AsString := in_nombre.Text;
    ExecSQL;
  end;

  // Muestra mensaje de confirmacion
  ShowMessage('Se registro materia.');
  // Limpia el campo de texto
  in_nombre.Text := '';

  // Cierra el formulario con el estado mrOk
  ModalResult := mrOk;
end;

end.
