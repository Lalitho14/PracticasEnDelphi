{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}

unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uCapaDatos,
  System.Actions, Vcl.ActnList;

type
  TFMain = class(TForm)
    btn_AbrirRegAlumno: TButton;
    btn_AbrirRegMateria: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btn_ModAlumno: TButton;
    btn_ModMateria: TButton;
    btn_AsigCalificacion: TButton;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    DSAlumnos: TDataSource;
    ActionList: TActionList;
    AActualizarTabla: TAction;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    // Consulta para mostrar alumnos con sus respectivas calificaciones.
    ZMostrarAlumnosMaterias: TZQuery;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    { Procedimientos }
    // Abre el formulario de registro de alumnos.
    procedure AbrirRegistrarAlumno(Sender: TObject);
    // Abre el formulario de registro de materias.
    procedure AbrirRegistrarMateria(Sender: TObject);
    // Abre el formulario para modificar alumno.
    procedure ModificarAlumno(Sender: TObject);
    // Abre el formulario para modificar materia.
    procedure ModificarMateria(Sender: TObject);
    // Abre el formulario para asignar calificacion de materia a alumno.
    procedure AsignarCalificacion(Sender: TObject);
    // Actualiza el contenido de la tabla.
    procedure AActualizarTablaExecute(Sender: TObject);
    // Inicializacion del formulario.
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

// Importacion de unidades.
uses
  ufRegAlumno, ufRegMateria, ufModAlumno, ufModMateria, ufAsignarCalificacion;

{$R *.dfm}

// Actualiza el contendio de la tabla.
procedure TFMain.AActualizarTablaExecute(Sender: TObject);
begin
  // Se realiza la consulta para mostrar alumnos
  with ZMostrarAlumnosMaterias do
  begin
    Close;
    Open;
  end;
  // Se ajusta el ancho de las columnas segun los datos.
  cxGrid1DBTableView1.ApplyBestFit;
end;

// Abre el formulario para el registro de alumnos
procedure TFMain.AbrirRegistrarAlumno(Sender: TObject);
begin
  // Crea la ventana nueva
  with TFRegAlumno.Create(nil) do
    try
      // Muestra la venta
      ShowModal;
      if ModalResult = mrOk then
        // Actualiza el contenido de la tabla al cerrar el formulario.
        self.AActualizarTabla.Execute;
    finally
      // Libera los recursos del formulario
      Free;
    end;

end;

// Abre el formulario para el registro de materias
procedure TFMain.AbrirRegistrarMateria(Sender: TObject);
begin
  // Crea la ventana nueva
  with TFRegMateria.Create(nil) do
    try
      // Muestra la venta
      ShowModal;
      if ModalResult = mrOk then
        // Actualiza el contenido de la tabla al cerrar el formulario.
        self.AActualizarTabla.Execute;
    finally
      // Libera los recursos del formulario
      Free;
    end;
end;

// Abre el formulario para asignar calificaciones
procedure TFMain.AsignarCalificacion(Sender: TObject);
begin
  // Crea la ventana nueva
  with TFAsignarCalif.Create(nil) do
    try
      // Muestra la venta
      ShowModal;
      if ModalResult = mrOk then
        // Actualiza el contenido de la tabla al cerrar el formulario.
        self.AActualizarTabla.Execute;
    finally
      // Libera los recursos del formulario
      Free;
    end;
end;

// Inicializa el formulario principal
procedure TFMain.FormShow(Sender: TObject);
begin
  // Actualiza los datos de la tabla
  AActualizarTabla.Execute;
end;

// Abre el formulatio para modificar alumno
procedure TFMain.ModificarAlumno(Sender: TObject);
begin
  // Crea la ventana nueva
  with TFModAlumno.Create(nil) do
    try
      // Muestra la venta
      ShowModal;
      if ModalResult = mrOk then
        // Actualiza el contenido de la tabla al cerrar el formulario.
        self.AActualizarTabla.Execute;
    finally
      // Libera los recursos del formulario
      Free;
    end;
end;

// Abre el formulario para modificar materias
procedure TFMain.ModificarMateria(Sender: TObject);
begin
  // Crea la ventana nueva
  with TFModMateria.Create(nil) do
    try
      // Muestra la venta
      ShowModal;
      if ModalResult = mrOk then
        // Actualiza el contenido de la tabla al cerrar el formulario.
        self.AActualizarTabla.Execute;
    finally
      // Libera los recursos del formulario
      Free;
    end;
end;

end.
