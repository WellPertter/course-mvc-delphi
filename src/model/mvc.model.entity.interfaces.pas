unit mvc.model.entity.interfaces;

interface

type
  iCliente = interface
    ['{A49C5146-5268-413A-BA67-DB2F046C8081}']
    function SetCodigo(const value: integer): iCliente;
    function GetCodigo: integer;
    function SetNome(const value: string): iCliente;
    function GetNome: string;
    function SetCidade(const value: string): iCliente;
    function GetCidade: string;
    function SetEstado(const value: string): iCliente;
    function GetEstado: string;
  end;

  iProdutos = interface
    ['{CA0CB659-4A33-4A71-B76E-9657358A04AA}']
    function SetCodigo(const value: integer): iProdutos;
    function GetCodigo: integer;
    function SetDescricao(const value: string): iProdutos;
    function GetDescricao: string;
    function SetPrecoVenda(const value: Currency): iProdutos;
    function GetPrecoVenda: Currency;
  end;

  iPedidos = interface
    ['{96172C4E-8683-413D-8F6C-0505D2CEF748}']
    function SetNumeroPedido(const value: integer): iPedidos;
    function GetNumeroPedido: integer;
    function SetDataEmissao(const value: TDateTime): iPedidos;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const value: integer): iPedidos;
    function GetCodigoCliente: integer;
    function SetValorTotal(const value: Currency): iPedidos;
    function GetValorTotal: Currency;
  end;

  iPedidosItens = interface
    ['{281527E9-674E-4761-BC44-D946DEF57622}']
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

  iEntity = interface
    ['{4CC920E5-D2B7-4636-A041-D598B323907F}']
    function Cliente: iCliente;
    function Produtos: iProdutos;
    function Pedidos: iPedidos;
    function PedidosItens: iPedidosItens;
  end;

implementation

end.
