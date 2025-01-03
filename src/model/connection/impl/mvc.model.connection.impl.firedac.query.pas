unit mvc.model.connection.impl.firedac.query;

interface

uses
  mvc.model.connection.interfaces,
  Data.DB,
  FireDAC.Stan.Def,
  FireDAC.DApt,
  FireDAC.Comp.Client;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FQuery: TFDQuery;


  public
    procedure PreencheQuery(Value: String);
    procedure PreencheParams(Value: array of Variant);


    constructor Create(Conn: iConnection);
    destructor Destroy; override;
    class function New(Conn: iConnection): iQuery;
    procedure Query(const Statement: String; Params: Array of Variant); overload;
    function Query(const Statement: Variant; Params: Array of Variant): TDataSet; overload;
  end;

implementation

{ TQuery }

constructor TQuery.Create(Conn: iConnection);
begin
  FQuery :=  TFDQuery.create(nil);
  FQuery.Connection := TFDConnection(Conn.Connection);
end;

destructor TQuery.Destroy;
begin
  FQuery.free;
  inherited;
end;

class function TQuery.New(Conn: iConnection): iQuery;
begin
  Result := TQuery.create(Conn);
end;

procedure TQuery.PreencheParams(Value: array of Variant);
begin

  for var I := Low(Value) to High(Value) do
  begin
    FQuery.Params.Add;


   // FQuery.Params[I].DataType := ft;

    FQuery.Params[I].Value := Value[I];

  end;

end;

procedure TQuery.PreencheQuery(Value: String);
begin
  FQuery.close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

function TQuery.Query(const Statement: Variant;
  Params: array of Variant): TDataSet;
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FQuery.open;
  Result := FQuery;
end;

procedure TQuery.Query(const Statement: String; Params: array of Variant);
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FQuery.ExecSQL;
end;

end.
