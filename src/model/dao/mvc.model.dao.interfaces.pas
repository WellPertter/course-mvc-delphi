unit mvc.model.dao.interfaces;

interface

uses
  Data.DB;

type
 iDAO = interface
   ['{9B9FC941-A967-4CE4-BF89-D72F2C4E7818}']
   function Listar: iDAO;
   function ListarPorId: iDAO;
   function Excluir: iDAO;
   function Atualizar: iDAO;
   function Inserir: iDAO;
   function DataSet: TDataset;
 end;

implementation

end.
