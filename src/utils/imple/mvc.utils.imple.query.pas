unit mvc.utils.imple.query;

interface

uses
  System.Generics.Collections,
  System.Rtti,
  System.SysUtils,
  mvc.utils.imple.rttihelper,
  mvc.utils.imple.rttiatributos,
  mvc.utils.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FParent: TObject;

    constructor Create(Parent: iinterface);
    destructor Destroy; override;

    function Fields: String;
    function Params: String;
    function NomeTabela: String;

    function Where: string;
    function FieldParamsUpdate: String;

  public
    class function New(Parent: iinterface): iQuery;

    procedure FieldParameter(var Value: TDictionary<String, Variant>);
    function SelectWithWhere(value: boolean): string;


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
  Result := ' DELETE FROM ' + NomeTabela;
  Result := ' WHERE ' + Where;
end;

destructor TQuery.Destroy;
begin

  inherited;
end;

procedure TQuery.FieldParameter(var Value: TDictionary<String, Variant>);
var
  lContexto: TRttiContext;
  LTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    LTipo := lContexto.GetType(FParent.ClassInfo);
     for var I in LTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        break;


      case I.GetValue(FParent).TypeInfo.Kind of

        tkInteger, tkInt64:
        begin
          if not (I.GetValue(Fparent).AsInteger <= 0) then
            Value.Add(I.GetAttibute<Campo>.Name, I.GetValue(FParent).AsInteger);
        end;
        tkFloat:
        begin
          if not (I.GetValue(Fparent).TypeInfo = TypeInfo(TDateTime)) then
            Value.Add(I.GetAttibute<Campo>.Name, StrToDateTime(I.GetValue(FParent).AsString));

          if not (I.GetValue(Fparent).TypeInfo = TypeInfo(Currency)) then
            Value.Add(I.GetAttibute<Campo>.Name, I.GetValue(FParent).AsCurrency);
        end;

        tkLString, tkWString, tkUString, tkString:
        begin
          if not (I.GetValue(Fparent).AsString.IsEmpty) then
            Value.Add(I.GetAttibute<Campo>.Name, I.GetValue(FParent).AsString);
        end;

        else
          Value.Add(I.GetAttibute<Campo>.Name, I.GetValue(FParent).AsString);

      end;
    end;


  finally
    lContexto.Free;
  end;
end;

function TQuery.FieldParamsUpdate: String;
var
  lContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := '';
  lContexto := TRttiContext.Create;
  try
    LTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        break;


      case I.GetValue(FParent).TypeInfo.Kind of

        tkInteger, tkInt64:
        begin
          if not (I.GetValue(Fparent).AsInteger <= 0) then
            Result := Result + I.GetAttibute<Campo>.Name + ' = :' + I.GetAttibute<Campo>.Name  + ', ';
        end;
        tkFloat:
        begin
          if not (I.GetValue(Fparent).TypeInfo = TypeInfo(TDateTime)) then
            Result := Result + I.GetAttibute<Campo>.Name + ', ';

          if not (I.GetValue(Fparent).TypeInfo = TypeInfo(Currency)) then
            Result := Result + I.GetAttibute<Campo>.Name + ', ';
        end;

        tkLString, tkWString, tkUString, tkString:
        begin
          if not (I.GetValue(Fparent).AsString.IsEmpty) then
            Result := Result + I.GetAttibute<Campo>.Name + ', ';
        end;

        else
          Result := Result +  I.GetAttibute<Campo>.Name + ', ';

      end;
    end;
  finally
    Result := Copy(Result, 0, Result.Length - 2);
    lContexto.Free;
  end;
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

function TQuery.SelectWithWhere(value: boolean): string;
begin
  Result := 'SELECT * FROM ' + NomeTabela;
  if not value then
    exit;
  Result := Result + ' WHERE ' + Where;
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
  Result := Result + ' SET ' + FieldParamsUpdate;
  Result := Result + ' WHERE ' + Where;
end;

function TQuery.Where: string;
var
  lContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := '';

  lContexto := TRttiContext.Create;

  try
    LTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not I.Tem<PK> then
        Continue;

      Result := Result + I.getattibute<campo>.name +' = :' +  I.GetAttibute<Campo>.name + ' AND ';
    end;


  finally
    Result := Copy(Result, 0, length(result) - 4) + ' ';
    lContexto.Free;
  end;


end;

end.
