unit mvc.utils.imple.utils;

interface

uses
  mvc.utils.interfaces,
  mvc.utils.imple.query;

type
  TUtils = class(TInterfacedObject, iUtils)
  private
    FParent: iInterface;
    FQuery: iQuery;
  public
    constructor Create(Parent: iInterface);
    destructor Destroy; override;
    class function New(Parent: iInterface): iUtils;
    function Query: iQuery;
  end;
implementation

{ TUtils }

constructor TUtils.Create(Parent: iInterface);
begin
  FParent := Parent;
end;

destructor TUtils.Destroy;
begin

  inherited;
end;

class function TUtils.New(Parent: iInterface): iUtils;
begin
  Result := self.Create(Parent);
end;

function TUtils.Query: iQuery;
begin
  if not Assigned(FQuery) then
    FQuery := TQuery.New(FParent);
  Result := FQuery;
end;

end.
