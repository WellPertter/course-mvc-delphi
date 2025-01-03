unit mvc.model.connection.impl.configuration;

interface

uses
  System.SysUtils,
  IniFiles,
  FireDAC.Stan.Def,
  FireDAC.DApt,
  mvc.model.connection.interfaces;

type
  TConfiguration = class(TInterfacedObject, iConfiguration)
  const
    SECTION = 'CONFIG';
    CAMINHO = 'CAMINHO';
    PORTA = 'PORTA';
    SERVIDOR = 'SERVIDOR';
    USUARIO = 'USERNAME';
    SENHA = 'PASSWORD';
    DRIVERNAME = 'DRIVERNAME';

  private
    Farq: TiniFile;

    constructor Create(fileName: string);
    destructor Destroy; override;
  public
    class function New(fileName: string): iConfiguration;

    function GetProtocolo: string;
    function SetServidor(const Value: string): iConfiguration;
    function GetServidor: string;
    function SetPorta(const Value: Integer): iConfiguration;
    function GetPorta: Integer;
    function SetUsuario(const Value: string): iConfiguration;
    function GetUsuario: string;
    function SetSenha(const Value: string): iConfiguration;
    function GetSenha: string;
    function SetCaminho(const Value: string): iConfiguration;
    function GetCaminho: string;
    function SetDriverName(const Value: string): iConfiguration;
    function GetDriverName: string;
  end;
implementation

{ TConfiguration }


{ TConfiguration }

constructor TConfiguration.Create(fileName: string);
begin
  Farq := TIniFile.Create(fileName);
end;

destructor TConfiguration.Destroy;
begin
  Farq.free;
  inherited;
end;

function TConfiguration.GetCaminho: string;
begin
  Result := Farq.ReadString(SECTION, CAMINHO, '');
end;

function TConfiguration.GetDriverName: string;
begin
  Result := Farq.ReadString(SECTION, DRIVERNAME, '');
end;

function TConfiguration.GetPorta: Integer;
begin
  Result := Farq.ReadInteger(SECTION, PORTA, 0);
end;

function TConfiguration.GetProtocolo: string;
begin
  Result := 'LOCAL';
  if not ((Farq.ReadString(SECTION, SERVIDOR, '').Equals('LOCALHOST')) or
  (Farq.ReadString(SECTION, SERVIDOR, '').Equals('127.0.0.1'))) then
    Result := 'TCP';
end;

function TConfiguration.GetSenha: string;
begin
  Result := Farq.ReadString(SECTION, SENHA, '');
end;

function TConfiguration.GetServidor: string;
begin
  Result := Farq.ReadString(SECTION, SERVIDOR, '');
end;

function TConfiguration.GetUsuario: string;
begin
  Result := Farq.ReadString(SECTION, USUARIO, '');
end;

class function TConfiguration.New(fileName: string): iConfiguration;
begin
  Result := self.Create(fileName);
end;

function TConfiguration.SetCaminho(const Value: string): iConfiguration;
begin
  Result := self;
  Farq.WriteString(SECTION, CAMINHO, Value);
end;

function TConfiguration.SetDriverName(const Value: string): iConfiguration;
begin
  Result := self;
  Farq.WriteString(SECTION, DRIVERNAME, Value);
end;

function TConfiguration.SetPorta(const Value: Integer): iConfiguration;
begin
  Result := self;
  Farq.WriteInteger(SECTION, PORTA, Value);
end;

function TConfiguration.SetSenha(const Value: string): iConfiguration;
begin
  Result := self;
  Farq.WriteString(SECTION, SENHA, Value);
end;

function TConfiguration.SetServidor(const Value: string): iConfiguration;
begin
  Result := self;
  Farq.WriteString(SECTION, SERVIDOR, Value);
end;

function TConfiguration.SetUsuario(const Value: string): iConfiguration;
begin
  Result := self;
  Farq.WriteString(SECTION, USUARIO, Value);
end;

end.
