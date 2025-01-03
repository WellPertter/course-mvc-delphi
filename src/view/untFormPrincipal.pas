unit untFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  mvc.model.connection.impl.configuration,
  mvc.controller.interfaces,
  mvc.controller.impl;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  var lController := TController.new;
  var lCliente := lController.Entity.Cliente
    .SetNome('Deus � bom')
    .SetCidade('Macei�')
    .SetEstado('AL');

  ShowMessage(lCliente.GetNome + lCliente.GetCidade + lCliente.GetEstado);
  // t� tendo um problema no insert
 lController.Dao(lCliente).Inserir;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  var Fconf := TConfiguration.New(ExtractFilePath(ParamStr(0)) + 'conf.ini');
  ShowMessage(Fconf.GetCaminho);
end;

end.
