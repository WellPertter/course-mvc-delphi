unit mvc.utils.imple.rttiatributos;

interface

uses
  System.Rtti;

type
  campo = class(TCustomAttribute)
  private
    Fname: String;
  public
    constructor Create(AName: string);
    property Name: String read Fname;
  end;

  Tabela = class(TCustomAttribute)
  private
    Fname: String;
  public
    constructor Create(AName: string);
    property Name: String read Fname;
  end;

  PK = class(TCustomAttribute)
  private
    Fname: String;
  public
    constructor Create(AName: string);
    property Name: String read Fname;
  end;
implementation

{ campo }

constructor campo.Create(AName: string);
begin
  Fname := AName;
end;

{ TTabela }

constructor Tabela.Create(AName: string);
begin
  Fname := AName;
end;

{ PK }

constructor PK.Create(AName: string);
begin
  Fname := AName;
end;

end.
