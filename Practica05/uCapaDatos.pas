{
  Elaboro : Jesus Eduardo Hernandez Bravo
  Feha : 16-Ene-2025
}

unit uCapaDatos;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxImageList, cxGraphics, System.Actions, Vcl.ActnList;

type
  TCapaDatos = class(TDataModule)
    ZConexion: TZConnection;
    ZMostrarAlumno: TZQuery;
    ZMostrarMateria: TZQuery;
    ZMostrarAlumnos: TZQuery;
    cxImageList1: TcxImageList;
    ZMostrarMaterias: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CapaDatos: TCapaDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//Conexion inicial
procedure TCapaDatos.DataModuleCreate(Sender: TObject);
begin
  ZConexion.Connect;
end;

//Desconectar de la base al terminar
procedure TCapaDatos.DataModuleDestroy(Sender: TObject);
begin
  ZConexion.Disconnect;
end;

end.
