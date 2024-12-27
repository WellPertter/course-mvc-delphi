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
  mvc.model.connection.impl.configuration in '..\src\model\connection\impl\mvc.model.connection.impl.configuration.pas',
  mvc.model.dao.interfaces in '..\src\model\dao\mvc.model.dao.interfaces.pas',
  mvc.model.dao.imple.generico in '..\src\model\dao\imple\mvc.model.dao.imple.generico.pas',
  mvc.utils.interfaces in '..\src\utils\mvc.utils.interfaces.pas',
  mvc.utils.imple.query in '..\src\utils\imple\mvc.utils.imple.query.pas',
  mvc.utils.imple.rttihelper in '..\src\utils\imple\mvc.utils.imple.rttihelper.pas',
  mvc.utils.imple.rttiatributos in '..\src\utils\imple\mvc.utils.imple.rttiatributos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
