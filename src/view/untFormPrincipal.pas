unit untFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses mvc.model.entity.imple.cliente, mvc.utils.imple.query;

procedure TForm2.Button1Click(Sender: TObject);
begin
  var lcliente := TCliente.New;

  Memo1.Lines.Add(TQuery.New(lcliente).Insert);
end;

end.
