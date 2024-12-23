unit mvc.model.connection.impl.firedac;

interface

uses
  Data.DB,
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.UI,
  mvc.model.connection.interfaces;

type
  TConnectionFireDac = class(TInterfacedObject, iConnection)
  private
    Fconn : TFDConnection;
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
  try

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