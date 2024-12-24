unit mvc.model.connection.interfaces;

interface

uses
  Data.DB;

type
  iConnection = interface
    ['{FCA99DBF-B287-4140-A91B-29AFDB54BF5E}']
    function Connection: TCustomConnection;
  end;

  iQuery = interface
    ['{AD61B81A-AE13-4E58-96E1-CE827BC4D481}']
    procedure Query(const Statement: String; Params: Array of Variant); overload;
    function Query(const Statement: Variant; Params: Array of Variant): TDataSet; overload;
  end;

  iConfiguration = interface
    ['{0DB0B460-0FB9-4F26-B023-1B0F1666F315}']
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

end.
