unit mvc.utils.imple.query;

interface

uses
  System.Rtti,
  System.SysUtils,
  mvc.utils.imple.rttihelper,
  mvc.utils.imple.rttiatributos,
  mvc.utils.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FParent: TObject;

    function Fields: String;
    function Params: String;
    function NomeTabela: String;

    constructor Create(Parent: iinterface);
    destructor Destroy; override;
  public

    class function New(Parent: iinterface): iQuery;
    function Insert: string;
    function Update: string;
    function Delete: string;
    function Select: string;
  end;
implementation

{ TQuery }

constructor TQuery.Create(Parent: iinterface);
begin
  FParent := TObject(parent);
end;

function TQuery.Delete: string;
begin

end;

destructor TQuery.Destroy;
begin

  inherited;
end;

function TQuery.Fields: String;
var
  lContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := EmptyStr;

  lContexto := TRttiContext.Create;   // manda chuva
  try
    LTipo := lContexto.GetType(FParent.ClassInfo); // passando um ponteiro

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;
      Result := Result + I.GetAttibute<Campo>.Name + ', ';
    end;


  finally
    Result := Copy(Result, 0, Result.Length - 2);
    lContexto.Free;
  end;

end;

function TQuery.Insert: string;
begin
  Result := 'INSERT INTO ' + NomeTabela;
  Result := Result + ' (' + Fields + ') ';
  Result := Result + ' VALUES (' + Params + ');';
end;

class function TQuery.New(Parent: iinterface): iQuery;
begin
  Result := TQuery.Create(Parent);
end;

function TQuery.Params: String;
var
  lContexto: TRttiContext;
  LTipo: TRttiType;
begin

  Result := EmptyStr;
  lContexto := TRttiContext.Create;

  try
    LTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        break;
      Result := Result + ':' + I.GetAttibute<campo>.name + ', ';
    end;



  finally
    Result := Copy(Result, 0, Result.Length-2);
    lContexto.free;
  end;


end;

function TQuery.Select: string;
begin
  Result := 'SELECT * FROM ' + NomeTabela;
end;

function TQuery.NomeTabela: String;
var
  lContexto: TRttiContext;
  LTipo: TRttiType;
begin

  Result := EmptyStr;
  lContexto := TRttiContext.Create;

  try
    LTipo := lContexto.GetType(FParent.ClassInfo);

    if LTipo.Tem<Tabela> then
      Result := LTipo.GetAttibute<Tabela>.name;

  finally
    lContexto.free;
  end;


end;

function TQuery.Update: string;
begin
  Result := 'UPDATE ' + NomeTabela;
end;

end.