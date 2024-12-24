unit mvc.model.connection.impl.firedac;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.UI,
  mvc.model.connection.interfaces,
  mvc.model.connection.impl.configuration,
  System.SysUtils;

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


{ TConnectionFireDac }

function TConnectionFireDac.Connection: TCustomConnection;
begin
  Result := Fconn;
end;

constructor TConnectionFireDac.Create;
begin
  Fconn := TFDConnection.Create(nil);
  Fconf := TConfiguration.New(ExtractFilePath(ParamStr(0)));
  try
    Fconn.Params.Clear;
    Fconn.Params.DriverID := Fconf.GetDriverName;
    Fconn.Params.UserName := Fconf.GetUsuario;
    Fconn.Params.Password := Fconf.GetSenha;
    Fconn.Params.Add('Server='+Fconf.GetServidor);

    if Fconf.GetDriverName.Equals('SQLite') then
      Fconn.Params.Add('lockingMode=Normal');


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
