program AFPDS_parse;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  ebcdic in 'ebcdic.pas',
  uAFPTriplets in 'uAFPTriplets.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
