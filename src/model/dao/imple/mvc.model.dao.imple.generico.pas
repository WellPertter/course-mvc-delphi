unit mvc.model.dao.imple.generico;

interface

uses
  System.Generics.Collections,
  Data.DB,
  mvc.model.dao.interfaces,
  mvc.model.connection.interfaces;

type
  TDao = class(TInterfacedObject, iDAO)
  private
    FParent: IInterface;

    FConexao: iConnection;
    FQuery: iQuery;
    FDataSet: TDataSet;
    FLista : TDictionary<String, Variant>;
  public
    constructor Create(Parent: IInterface);
    destructor Destroy; override;
    class function New(Parent: IInterface): iDao;

    function Listar: iDAO;
    function ListarPorId: iDAO;
    function Excluir: iDAO;
    function Atualizar: iDAO;
    function Inserir: iDAO;
    function DataSet: TDataset;
  end;

implementation

uses
  mvc.model.connection.impl.firedac,
  mvc.model.connection.impl.firedac.query,
  mvc.utils.imple.utils;

{ TDao }

function TDao.Atualizar: iDAO;
begin
  Result:= self;
end;

constructor TDao.Create(Parent: IInterface);
begin
  FParent  := Parent;
  FConexao := TConnectionFireDac.New;
  FQuery   := TQuery.New(FConexao);
  FDataSet := TDataSet.Create(nil);
  FLista   := TDictionary<String, Variant>.Create;

  TUtils.New(FParent).Query.FieldParameter(Flista);
end;

function TDao.DataSet: TDataset;
begin
  Result := FDataSet;
end;

destructor TDao.Destroy;
begin

  inherited;
end;

function TDao.Excluir: iDAO;
begin
   Result:= self;
end;

function TDao.Inserir: iDAO;
begin
  Result:= self;
  var LQuery := TUtils.New(FParent).Query.Insert;
  FQuery.Query(LQuery, FLista.Values.ToArray);
end;

function TDao.Listar: iDAO;
begin
  Result:= self;
end;

function TDao.ListarPorId: iDAO;
begin
  Result:= self;
end;

class function TDao.New(Parent: IInterface): iDao;
begin
  Result := self.Create((Parent));
end;

end.
