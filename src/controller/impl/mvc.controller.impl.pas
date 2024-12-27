unit mvc.controller.impl;

interface

uses
  mvc.controller.interfaces,
  mvc.model.entity.interfaces,
  mvc.model.dao.interfaces;

type
  TController = class(TInterfacedObject, iController)
  private
    FEntity: iEntity;
    FDao: iDao;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;

    function Entity: iEntity;
    function Dao(Value: iInterface): iDao;
  end;

implementation

uses
  mvc.model.entity.imple.entity, mvc.model.dao.imple.generico;

{ TController }

constructor TController.Create;
begin

end;

function TController.Dao(Value: iInterface): iDao;
begin
  if not assigned(FDao) then
    FDao := TDao.New(Value);
  Result := FDao;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Entity: iEntity;
begin
  if not Assigned(FEntity) then
    FEntity := TEntity.New;
  Result := FEntity;
end;

class function TController.New: iController;
begin

end;

end.
