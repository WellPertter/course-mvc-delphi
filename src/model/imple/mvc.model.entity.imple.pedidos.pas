unit mvc.model.entity.imple.pedidos;

interface

uses
  mvc.model.entity.interfaces;

type
  TPedidos = class(TInterfacedObject, iPedidos)
  private
    FNumeroPedido: Integer;
    FDataEmissao: TDateTime;
    FCodigoCliente: integer;
    FValorTotal: Currency;
  public
    class function New: iPedidos;
    function SetNumeroPedido(const value: integer): iPedidos;
    function GetNumeroPedido: integer;
    function SetDataEmissao(const value: TDateTime): iPedidos;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const value: integer): iPedidos;
    function GetCodigoCliente: integer;
    function SetValorTotal(const value: Currency): iPedidos;
    function GetValorTotal: Currency;
  end;

implementation

{ TProdutos }

function TPedidos.GetCodigoCliente: integer;
begin
  Result := FCodigoCliente
end;

function TPedidos.GetDataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedidos.GetNumeroPedido: integer;
begin
  Result := FNumeroPedido
end;

function TPedidos.GetValorTotal: Currency;
begin
  Result := FValorTotal
end;

class function TPedidos.New: iPedidos;
begin
  Result := self.Create;
end;

function TPedidos.SetCodigoCliente(const value: integer): iPedidos;
begin
  Result := self;
  FCodigoCliente := value;
end;

function TPedidos.SetDataEmissao(const value: TDateTime): iPedidos;
begin
  Result := self;
  FDataEmissao := value;
end;

function TPedidos.SetNumeroPedido(const value: integer): iPedidos;
begin
  Result := self;
  FNumeroPedido := value;
end;

function TPedidos.SetValorTotal(const value: Currency): iPedidos;
begin
  Result := self;
  FValorTotal := value;
end;

end.
