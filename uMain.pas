unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type TFieldLevel = (flSingle, flBegin, flEnd);

type TAFPDS = class(TObject)
  private
    fPosition: Integer;
    fLength: Integer;
    fFieldValue: Integer;
    fLevel: Integer;
  private
    function GetFieldName: String;
    function GetFieldLevel: TFieldLevel;
  public
    property Position: Integer read fPosition write fPosition;
    property Length: Integer read fLength write fLength;
    property FieldValue: Integer read fFieldValue write fFieldValue;
    property Level: Integer read fLevel;
    property FieldName: String read GetFieldName;
    property FieldLevel: TFieldLevel read GetFieldLevel;
end;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    OD: TOpenDialog;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    function ParseFile(aFileName: String): Boolean;
    function IdName(const aId: Integer): String;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses ebcdic, uAFPTriplets;

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if (not OD.Execute) then
    Exit;

  Memo1.Clear;
  ParseFile(OD.FileName);
end;

function TAFPDS.GetFieldLevel: TFieldLevel;
begin
  case fFieldValue of
    afpBAG: Result := 'Begin Active Environment Group';
    afpBBC: Result := 'Begin Bar Code Object';
    afpBCA: Result := 'Begin Color Attribute Table';
    afpBDA: Result := 'Bar Code Data';
    afpBDD: Result := 'Bar Code Data Descriptor';
    afpBDG: Result := 'Begin Document Environment Group';
    afpBDI: Result := 'Begin Document Index';
    afpBDT: Result := 'Begin Document';
    afpBFG: Result := 'Begin Form Environment Group (Obsolete)';
    afpBFM: Result := 'Begin Form Map';
    afpBGR: Result := 'Begin Graphics Object';
    afpBII: Result := 'Begin IM Image (C)';
    afpBIM: Result := 'Begin Image Object';
    afpBMM: Result := 'Begin Medium Map';
    afpBMO: Result := 'Begin Overlay';
    afpBNG: Result := 'Begin Named Page Group';
    afpBOC: Result := 'Begin Object Container';
    afpBOG: Result := 'Begin Object Environment Group';
    afpBPG: Result := 'Begin Page';
    afpBPS: Result := 'Begin Page Segment';
    afpBPT: Result := 'Begin Presentation Text Object';
    afpBR : Result := 'Begin Resource (R)';
    afpBRG: Result := 'Begin Resource Group';
    afpBSG: Result := 'Begin Resource Environment Group';
    afpCAT: Result := 'Color Attribute Table';
    afpCDD: Result := 'Container Data Descriptor';
    afpCTC: Result := 'Composed Text Control (O)';
    afpEAG: Result := 'End Active Environment Group';
    afpEBC: Result := 'End Bar Code Object';
    afpECA: Result := 'End Color Attribute Table';
    afpEDG: Result := 'End Document Environment Group';
    afpEDI: Result := 'End Document Index';
    afpEDT: Result := 'End Document';
    afpEFG: Result := 'End Form Environment Group (Obsolete)';
    afpEFM: Result := 'End Form Map';
    afpEGR: Result := 'End Graphics Object';
    afpEII: Result := 'End IM Image (C)';
    afpEIM: Result := 'End Image Object';
    afpEMM: Result := 'End Medium Map';
    afpEMO: Result := 'End Overlay';
    afpENG: Result := 'End Named Page Group';
    afpEOC: Result := 'End Object Container';
    afpEOG: Result := 'End Object Environment Group';
    afpEPG: Result := 'End Page';
    afpEPS: Result := 'End Page Segment';
    afpEPT: Result := 'End Presentation Text Object';
    afpER : Result := 'End Resource (R)';
    afpERG: Result := 'End Resource Group';
    afpESG: Result := 'End Resource Environment Group';
    afpFGD: Result := 'Form Environment Group Descriptor (Obsolete)';
    afpGAD: Result := 'Graphics Data';
    afpGDD: Result := 'Graphics Data Descriptor';
    afpICP: Result := 'IM Image Cell Position (C)';
    afpIDD: Result := 'Image Data Descriptor';
    afpIEL: Result := 'Index Element';
    afpIID: Result := 'IM Image Input Descriptor (C)';
    afpIMM: Result := 'Invoke Medium Map';
    afpIOB: Result := 'Include Object';
    afpIOC: Result := 'IM Image Output Control (C)';
    afpIPD: Result := 'Image Picture Data';
    afpIPG: Result := 'Include Page';
    afpIPO: Result := 'Include Page Overlay';
    afpIPS: Result := 'Include Page Segment';
    afpIRD: Result := 'IM Image Raster Data (C)';
    afpLLE: Result := 'Link Logical Element';
    afpMBC: Result := 'Map Bar Code Object';
    afpMCA: Result := 'Map Color Attribute Table';
    afpMCC: Result := 'Medium Copy Count';
    afpMCD: Result := 'Map Container Data';
    afpMCF: Result := 'Map Coded Font';
    afpMCF1: Result := 'Map Coded Font Format-1 (C)';
    afpMDD: Result := 'Medium Descriptor';
    afpMDR: Result := 'Map Data Resource';
    afpMFC: Result := 'Medium Finishing Control';
    afpMGO: Result := 'Map Graphics Object';
    afpMIO: Result := 'Map Image Object';
    afpMMC: Result := 'Medium Modification Control';
    afpMMO: Result := 'Map Medium Overlay';
    afpMMT: Result := 'Map Media Type';
    afpMPG: Result := 'Map Page';
    afpMPO: Result := 'Map Page Overlay';
    afpMPS: Result := 'Map Page Segment';
    afpMSU: Result := 'Map Suppression';
    afpNOP: Result := 'No Operation //EEEED3';
    afpOBD: Result := 'Object Area Descriptor';
    afpOBP: Result := 'Object Area Position';
    afpOCD: Result := 'Object Container Data';
    afpPFC: Result := 'Presentation Fidelity Control';
    afpPGD: Result := 'Page Descriptor';
    afpPGP: Result := 'Page Position';
    afpPGP1: Result := 'Page Position Format-1 (C)';
    afpPMC: Result := 'Page Modification Control';
    afpPTD: Result := 'Presentation Text Data Descriptor';
    afpPTD1: Result := 'Presentation Text Descriptor Format-1 (C)';
    afpPTX: Result := 'Presentation Text Data';
    afpTLE: Result := 'Tag Logical Element'
  else
    Result := PChar(IntToHex(aId, 4));
  end;
end;

function TAFPDS.GetFieldName: String;
begin
  case fFieldValue of
    afpBAG: Result := 'Begin Active Environment Group';
    afpBBC: Result := 'Begin Bar Code Object';
    afpBCA: Result := 'Begin Color Attribute Table';
    afpBDA: Result := 'Bar Code Data';
    afpBDD: Result := 'Bar Code Data Descriptor';
    afpBDG: Result := 'Begin Document Environment Group';
    afpBDI: Result := 'Begin Document Index';
    afpBDT: Result := 'Begin Document';
    afpBFG: Result := 'Begin Form Environment Group (Obsolete)';
    afpBFM: Result := 'Begin Form Map';
    afpBGR: Result := 'Begin Graphics Object';
    afpBII: Result := 'Begin IM Image (C)';
    afpBIM: Result := 'Begin Image Object';
    afpBMM: Result := 'Begin Medium Map';
    afpBMO: Result := 'Begin Overlay';
    afpBNG: Result := 'Begin Named Page Group';
    afpBOC: Result := 'Begin Object Container';
    afpBOG: Result := 'Begin Object Environment Group';
    afpBPG: Result := 'Begin Page';
    afpBPS: Result := 'Begin Page Segment';
    afpBPT: Result := 'Begin Presentation Text Object';
    afpBR : Result := 'Begin Resource (R)';
    afpBRG: Result := 'Begin Resource Group';
    afpBSG: Result := 'Begin Resource Environment Group';
    afpCAT: Result := 'Color Attribute Table';
    afpCDD: Result := 'Container Data Descriptor';
    afpCTC: Result := 'Composed Text Control (O)';
    afpEAG: Result := 'End Active Environment Group';
    afpEBC: Result := 'End Bar Code Object';
    afpECA: Result := 'End Color Attribute Table';
    afpEDG: Result := 'End Document Environment Group';
    afpEDI: Result := 'End Document Index';
    afpEDT: Result := 'End Document';
    afpEFG: Result := 'End Form Environment Group (Obsolete)';
    afpEFM: Result := 'End Form Map';
    afpEGR: Result := 'End Graphics Object';
    afpEII: Result := 'End IM Image (C)';
    afpEIM: Result := 'End Image Object';
    afpEMM: Result := 'End Medium Map';
    afpEMO: Result := 'End Overlay';
    afpENG: Result := 'End Named Page Group';
    afpEOC: Result := 'End Object Container';
    afpEOG: Result := 'End Object Environment Group';
    afpEPG: Result := 'End Page';
    afpEPS: Result := 'End Page Segment';
    afpEPT: Result := 'End Presentation Text Object';
    afpER : Result := 'End Resource (R)';
    afpERG: Result := 'End Resource Group';
    afpESG: Result := 'End Resource Environment Group';
    afpFGD: Result := 'Form Environment Group Descriptor (Obsolete)';
    afpGAD: Result := 'Graphics Data';
    afpGDD: Result := 'Graphics Data Descriptor';
    afpICP: Result := 'IM Image Cell Position (C)';
    afpIDD: Result := 'Image Data Descriptor';
    afpIEL: Result := 'Index Element';
    afpIID: Result := 'IM Image Input Descriptor (C)';
    afpIMM: Result := 'Invoke Medium Map';
    afpIOB: Result := 'Include Object';
    afpIOC: Result := 'IM Image Output Control (C)';
    afpIPD: Result := 'Image Picture Data';
    afpIPG: Result := 'Include Page';
    afpIPO: Result := 'Include Page Overlay';
    afpIPS: Result := 'Include Page Segment';
    afpIRD: Result := 'IM Image Raster Data (C)';
    afpLLE: Result := 'Link Logical Element';
    afpMBC: Result := 'Map Bar Code Object';
    afpMCA: Result := 'Map Color Attribute Table';
    afpMCC: Result := 'Medium Copy Count';
    afpMCD: Result := 'Map Container Data';
    afpMCF: Result := 'Map Coded Font';
    afpMCF1: Result := 'Map Coded Font Format-1 (C)';
    afpMDD: Result := 'Medium Descriptor';
    afpMDR: Result := 'Map Data Resource';
    afpMFC: Result := 'Medium Finishing Control';
    afpMGO: Result := 'Map Graphics Object';
    afpMIO: Result := 'Map Image Object';
    afpMMC: Result := 'Medium Modification Control';
    afpMMO: Result := 'Map Medium Overlay';
    afpMMT: Result := 'Map Media Type';
    afpMPG: Result := 'Map Page';
    afpMPO: Result := 'Map Page Overlay';
    afpMPS: Result := 'Map Page Segment';
    afpMSU: Result := 'Map Suppression';
    afpNOP: Result := 'No Operation //EEEED3';
    afpOBD: Result := 'Object Area Descriptor';
    afpOBP: Result := 'Object Area Position';
    afpOCD: Result := 'Object Container Data';
    afpPFC: Result := 'Presentation Fidelity Control';
    afpPGD: Result := 'Page Descriptor';
    afpPGP: Result := 'Page Position';
    afpPGP1: Result := 'Page Position Format-1 (C)';
    afpPMC: Result := 'Page Modification Control';
    afpPTD: Result := 'Presentation Text Data Descriptor';
    afpPTD1: Result := 'Presentation Text Descriptor Format-1 (C)';
    afpPTX: Result := 'Presentation Text Data';
    afpTLE: Result := 'Tag Logical Element'
  else
    Result := PChar(IntToHex(aId, 4));
  end;
end;

function TfrmMain.ParseFile(aFileName: String): Boolean;
const
  cBeginBlock: byte = $5A;
var
  sMem: TStream;
  buf: Byte;
  LenTag: SmallInt;
  IdTag: Integer;
  SaveEAX: Integer;
begin
  sMem := TFileStream.Create(aFileName, fmOpenRead or fmShareExclusive);
  try
    sMem.Position := 0;
    while sMem.Position < sMem.Size do
    begin
      sMem.Read(buf, 1);
      if (buf <> cBeginBlock) then
        continue;

      LenTag := 0;
      sMem.Read(LenTag, 2);
      asm// меняем байты местами, SwapBytes
        ror LenTag, 8;
      end;

      IdTag := 0;
      sMem.Read(IdTag, 3);
      asm
        mov SaveEAX, eax;
        mov eax, IdTag;
        BSWAP eax;
        mov IdTag, eax;
        ror IdTag, 8
        mov eax, SaveEAX;
      end;

      //Memo1.Lines.Add(PChar(IntToStr(IdTag)));
      Memo1.Lines.Add(IdName(IdTag));
      //OutputDebugString(PChar(IntToHex(IdTag, 4)));
      sMem.Position := sMem.Position + (LenTag - (2 + 3));
    end;
  finally
    FreeAndNil(sMem);
  end;
  ShowMessage('ok');
end;


end.
