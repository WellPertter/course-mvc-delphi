unit mvc.controller.interfaces;

interface

uses
  mvc.model.entity.interfaces,
  mvc.model.dao.interfaces;

type
  iController = interface
    ['{A1F5C5C4-6AF3-4AB8-A4A0-20C645492E01}']
    function Entity: iEntity;
    function Dao(Value: iInterface): iDao;
  end;

implementation

end.
