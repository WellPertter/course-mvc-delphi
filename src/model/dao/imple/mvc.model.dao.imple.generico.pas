unit mvc.model.dao.imple.generico;

interface

uses
  Data.DB,
  mvc.model.dao.interfaces;

type
  TDao<T: Iinterface> = class(TInterfacedObject, iDao<T>)

  private
    constructor Create;
    destructor Destroy; override;

  public
    class function New: iDao<T>;

    function Listar: iDAO<T>;
    function ListarPorId(Id: Variant): iDAO<T>;
    function Excluir: iDAO<T>;
    function Atualizar: iDAO<T>;
    function Inserir: iDAO<T>;
    function DataSet: TDataset;
  end;

implementation


{ TDao<T> }

function TDao<T>.Atualizar: iDAO<T>;
begin

end;

constructor TDao<T>.Create;
begin

end;

function TDao<T>.DataSet: TDataset;
begin

end;

destructor TDao<T>.Destroy;
begin

  inherited;
end;

function TDao<T>.Excluir: iDAO<T>;
begin

end;

function TDao<T>.Inserir: iDAO<T>;
begin

end;

function TDao<T>.Listar: iDAO<T>;
begin

end;

function TDao<T>.ListarPorId(Id: Variant): iDAO<T>;
begin

end;

class function TDao<T>.New: iDao<T>;
begin

end;

end.
