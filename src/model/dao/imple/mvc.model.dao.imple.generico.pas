unit mvc.model.dao.imple.generico;

interface

uses
  Data.DB,
  mvc.model.dao.interfaces;

type
  TDao = class(TInterfacedObject, iDAO)
  private
    FParent: IInterface;
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


{ TDao<T> }

function TDao.Atualizar: iDAO;
begin

end;

constructor TDao.Create(Parent: IInterface);
begin
  FParent := Parent;
end;

function TDao.DataSet: TDataset;
begin

end;

destructor TDao.Destroy;
begin

  inherited;
end;

function TDao.Excluir: iDAO;
begin

end;

function TDao.Inserir: iDAO;
begin

end;

function TDao.Listar: iDAO;
begin

end;

function TDao.ListarPorId: iDAO;
begin

end;

class function TDao.New(Parent: IInterface): iDao;
begin
  Result := self.Create((Parent));
end;

end.
