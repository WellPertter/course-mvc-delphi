unit mvc.utils.interfaces;

interface

type
  iQuery = interface
    ['{032FA498-D163-419C-AFB0-DDE0A4432DF7}']
    function Insert: string;
    function Update: string;
    function Delete: string;
    function Select: string;
  end;

  iUtils = interface
    ['{4859A5DC-57C1-4A7E-BB8B-47D67A4A66C7}']
    function Query: iQuery;
  end;

implementation

end.