unit mvc.model.connection.impl.firedac;

interface

uses
  mvc.model.connection.interfaces,
  mvc.model.connection.impl.configuration,
  Data.DB,
  FireDAC.Stan.Def,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.UI,
  System.SysUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.SQLite;

type
  TConnectionFireDac = class(TInterfacedObject, iConnection)
  private
    Fconn : TFDConnection;
    Fconf: iConfiguration;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: iConnection;
    function Connection: TCustomConnection;
  end;

implementation

uses
  System.Classes;


{ TConnectionFireDac }

function TConnectionFireDac.Connection: TCustomConnection;
begin
  Result := Fconn;
end;

constructor TConnectionFireDac.Create;
begin

  Fconn := TFDConnection.Create(nil);
  Fconf := TConfiguration.New(ExtractFilePath(ParamStr(0)) + 'conf.ini');
  try
    Fconn.Params.Clear;
    Fconn.Params.DriverID := Fconf.GetDriverName;
    Fconn.Params.Database := Fconf.GetCaminho;
    Fconn.Params.UserName := Fconf.GetUsuario;
    Fconn.Params.Password := Fconf.GetSenha;

   // Fconn.Params.Add('LibraryName=C:SGQ\libmysql.dll');
   // Fconn.Params.Add('Server='+Fconf.GetServidor);

    if Fconf.GetDriverName.Equals('SQLite') then
      Fconn.Params.Add('lockingMode=Normal');

    Fconn.Connected := True;
  except
    raise Exception.Create('Erro ao realizar a conex�o com o banco de dados!');
  end;
end;

destructor TConnectionFireDac.Destroy;
begin
  Fconn.free;
  inherited;
end;

class function TConnectionFireDac.New: iConnection;
begin
  Result := TConnectionFireDac.Create;
end;

end.
