unit mvc.model.entity.imple.pedidos.itens;

interface

uses
  mvc.model.entity.interfaces;

type
  TPedidosItens = class(TInterfacedObject, iPedidosItens)
  private
    FId: Integer;
    FNumeroPedido: Integer;
    FCodigoPedido: Integer;
    FQuantidade: Integer;
    FValorUnitario: Currency;
    FValorTotal: Currency;
  public
    class function New: iPedidosItens;
    function SetId(const value: integer): iPedidosItens;
    function GetId: integer;
    function SetNumeroPedido(const value: integer): iPedidosItens;
    function GetNumeroPedido: integer;
    function SetCodigoProduto(const value: integer): iPedidosItens;
    function GetCodigoProduto: integer;
    function SetQuantidade(const value: integer): iPedidosItens;
    function GetQuantidade: integer;
    function SetValorUnitario(const value: Currency): iPedidosItens;
    function GetValorUnitario: Currency;
    function SetValorTotal(const value: Currency): iPedidosItens;
    function GetValorTotal: Currency;
  end;


implementation

{ TPedidosItens }

function TPedidosItens.GetCodigoProduto: integer;
begin
  Result := FCodigoPedido;
end;

function TPedidosItens.GetId: integer;
begin
  Result := FId;
end;

function TPedidosItens.GetNumeroPedido: integer;
begin
  Result := FNumeroPedido;
end;

function TPedidosItens.GetQuantidade: integer;
begin
  Result := FQuantidade;
end;

function TPedidosItens.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidosItens.GetValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

class function TPedidosItens.New: iPedidosItens;
begin
  Result := self.Create;
end;

function TPedidosItens.SetCodigoProduto(const value: integer): iPedidosItens;
begin
  Result := self;
  FCodigoPedido := value;
end;

function TPedidosItens.SetId(const value: integer): iPedidosItens;
begin
  Result := self;
  FId := value;
end;

function TPedidosItens.SetNumeroPedido(const value: integer): iPedidosItens;
begin
  Result := self;
  FNumeroPedido := value;
end;

function TPedidosItens.SetQuantidade(const value: integer): iPedidosItens;
begin
  Result := self;
  FQuantidade := value;
end;

function TPedidosItens.SetValorTotal(const value: Currency): iPedidosItens;
begin
  Result := self;
  FValorTotal := value;
end;

function TPedidosItens.SetValorUnitario(const value: Currency): iPedidosItens;
begin
  Result := self;
  FValorUnitario := value;
end;

end.
