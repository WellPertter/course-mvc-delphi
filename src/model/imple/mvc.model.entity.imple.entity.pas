unit mvc.model.entity.imple.entity;

interface

uses
  mvc.model.entity.interfaces, mvc.model.entity.imple.pedidos.itens;

type
  TEntity = class(TInterfacedObject, iEntity)
  private
    FCliente: iCliente;
    FProdutos: iProdutos;
    FPedidos:  iPedidos;
    FPedidosItens: iPedidosItens;
  public
    class function New: iEntity;
    function Cliente: iCliente;
    function Produtos: iProdutos;
    function Pedidos: iPedidos;
    function PedidosItens: iPedidosItens;
  end;


implementation

uses
  mvc.model.entity.imple.cliente, mvc.model.entity.imple.pedidos,
  mvc.model.entity.imple.produtos;

{ TEntity }

function TEntity.Cliente: iCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCLiente.new;
  Result := FCliente;
end;

class function TEntity.New: iEntity;
begin
  Result := self.Create;
end;

function TEntity.Pedidos: iPedidos;
begin
  if not Assigned(FPedidos) then
    FPedidos := TPedidos.new;
  Result := FPedidos;
end;

function TEntity.PedidosItens: iPedidosItens;
begin
  if not Assigned(FPedidosItens) then
    FPedidosItens := TPedidosItens.new;
  Result := FPedidosItens;
end;

function TEntity.Produtos: iProdutos;
begin
   if not Assigned(FProdutos) then
    FProdutos := TProdutos.new;
  Result := FProdutos;
end;

end.
