program MVC;

uses
  Vcl.Forms,
  untFormPrincipal in '..\src\view\untFormPrincipal.pas' {Form2},
  mvc.model.entity.interfaces in '..\src\model\mvc.model.entity.interfaces.pas',
  mvc.model.entity.imple.cliente in '..\src\model\imple\mvc.model.entity.imple.cliente.pas',
  mvc.model.entity.imple.produtos in '..\src\model\imple\mvc.model.entity.imple.produtos.pas',
  mvc.model.entity.imple.pedidos in '..\src\model\imple\mvc.model.entity.imple.pedidos.pas',
  mvc.model.entity.imple.pedidos.itens in '..\src\model\imple\mvc.model.entity.imple.pedidos.itens.pas',
  mvc.model.entity.imple.entity in '..\src\model\imple\mvc.model.entity.imple.entity.pas',
  mvc.model.connection.interfaces in '..\src\model\connection\mvc.model.connection.interfaces.pas',
  mvc.model.connection.impl.firedac in '..\src\model\connection\impl\mvc.model.connection.impl.firedac.pas',
  mvc.model.connection.impl.firedac.query in '..\src\model\connection\impl\mvc.model.connection.impl.firedac.query.pas',
  mvc.model.connection.impl.configuration in '..\src\model\connection\impl\mvc.model.connection.impl.configuration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
