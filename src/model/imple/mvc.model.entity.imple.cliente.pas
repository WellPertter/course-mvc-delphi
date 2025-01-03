unit mvc.model.entity.imple.cliente;

interface

uses
  mvc.utils.imple.rttiatributos,
  mvc.model.entity.interfaces;

type
  [Tabela('CLIENTE')]
  TCliente = class(TInterfacedObject, iCliente)
  private

    [Campo('CODIGO')]
    FCodigo: integer;
    [Campo('NOME')]
    FNome: string;
    [Campo('CIDADE')]
    FCidade: string;
    [Campo('UF')]
    FEstado: string;
  public
    class function New: iCliente;
    function SetCodigo(const value: integer): iCliente;
    function GetCodigo: integer;
    function SetNome(const value: string): iCliente;
    function GetNome: string;
    function SetCidade(const value: string): iCliente;
    function GetCidade: string;
    function SetEstado(const value: string): iCliente;
    function GetEstado: string;
  end;


implementation

{ TCliente }

function TCliente.GetCidade: string;
begin
  Result := FCidade
end;

function TCliente.GetCodigo: integer;
begin
  Result := FCodigo
end;

function TCliente.GetEstado: string;
begin
  Result := FEstado
end;

function TCliente.GetNome: string;
begin
  Result := FNome
end;

class function TCliente.New: iCliente;
begin
   Result := Self.Create;
end;

function TCliente.SetCidade(const value: string): iCliente;
begin
  Result := Self;
  FCidade := value;
end;

function TCliente.SetCodigo(const value: integer): iCliente;
begin
  Result := Self;
  FCodigo := value;
end;

function TCliente.SetEstado(const value: string): iCliente;
begin
  Result := Self;
  FEstado := value;
end;

function TCliente.SetNome(const value: string): iCliente;
begin
  Result := Self;
  FNome := value;
end;

end.
