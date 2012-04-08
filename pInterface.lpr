program pInterface;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ufrmInicial, uFodastico, uTreeview,
  uInterfaceteste, aux_interface, uacessorios, Uarquivos, Uarquivotxt, Uarrays,
  Ubaseideia, Ubasetarfa, Uclassificador, Ucoisa, Uconjugador, Udecisao,
  Uideograma, Uintencidade, Umanipulaideogramas, Umontador, Upensamento,
  Upronomes, Upronverbo, Utarefa, Uverbos
  { you can add units after this };

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.

