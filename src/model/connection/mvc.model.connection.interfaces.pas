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
    function Query(const Variant: String; Params: Array of Variant): TDataSet; overload;
  end;





implementation

end.
