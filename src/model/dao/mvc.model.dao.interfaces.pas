unit mvc.model.dao.interfaces;

interface

uses
  Data.DB;

type
 iDAO<T: Iinterface> = interface
   ['{9B9FC941-A967-4CE4-BF89-D72F2C4E7818}']
   function Listar: iDAO<T>;
   function ListarPorId(Id: Variant): iDAO<T>;
   function Excluir: iDAO<T>;
   function Atualizar: iDAO<T>;
   function Inserir: iDAO<T>;
   function DataSet: TDataset;
 end;

implementation

end.
