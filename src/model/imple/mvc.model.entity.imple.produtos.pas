unit mvc.model.entity.imple.produtos;

interface

uses
  mvc.model.entity.interfaces;

type
  TProdutos = class(TInterfacedObject, iProdutos)
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Currency;
  public
    class function New: iProdutos;
    function SetCodigo(const value: integer): iProdutos;
    function GetCodigo: integer;
    function SetDescricao(const value: string): iProdutos;
    function GetDescricao: string;
    function SetPrecoVenda(const value: Currency): iProdutos;
    function GetPrecoVenda: Currency;
  end;

implementation

{ TProdutos }

function TProdutos.GetCodigo: integer;
begin
  Result := FCodigo;
end;

function TProdutos.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TProdutos.GetPrecoVenda: Currency;
begin
  Result := FPrecoVenda;
end;

class function TProdutos.New: iProdutos;
begin
  Result := self.Create;
end;

function TProdutos.SetCodigo(const value: integer): iProdutos;
begin
  Result := self;
  FCodigo := value;
end;

function TProdutos.SetDescricao(const value: string): iProdutos;
begin
  Result := self;
  FDescricao := value;
end;

function TProdutos.SetPrecoVenda(const value: Currency): iProdutos;
begin
  Result := self;
  FPrecoVenda := value;
end;

end.
