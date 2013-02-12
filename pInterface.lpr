program pInterface;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ufrmInicial, uFodastico, uTreeview, uInterfaceteste, ufrmabas,
  ufrmBaseTdi, aux_interface, uacessorios, Uarquivos, Uarquivotxt, Uarrays,
  Ubaseideia, Ubasetarfa, Uclassificador, Ucoisa, Uconjugador, Udecisao,
  Uideograma, Uintencidade, Umanipulaideogramas, Umontador, Upensamento,
  Upronomes, Upronverbo, Utarefa, Uverbos, ufrmInterface1
  { you can add units after this };

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAbas, frmAbas);
  Application.Run;
end.

