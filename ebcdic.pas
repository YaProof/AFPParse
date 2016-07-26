{ Source:
http://www.efg2.com/Lab/OtherProjects/ebcdic.pas
http://www.efg2.com/Lab/OtherProjects/index.html
}
{Convert
 EBCDIC character to ASCII character.

 If conversion is not appropriate, return specified character, which
 defaults to an ASCII blank.

 Copyright (C) 1996, Earl F. Glynn, EFG Software
}


UNIT EBCDIC;

INTERFACE

  FUNCTION EBCDICtoASCII(const c:  BYTE):  BYTE;
  PROCEDURE SetInvalid(const c:  BYTE);
  function EBCDIC2CHAR(TagValue: array of byte): string;


IMPLEMENTATION

  CONST
    InvalidTableEntry:  BYTE = $1A;

    Table:  ARRAY[0..255] OF BYTE =
     ($00,$01,$02,$03,$1A,$09,$1A,$7F,$1A,$1A,$1A,$0B,$0C,$0D,$0E,$0F,
      $10,$11,$12,$13,$1A,$1A,$08,$1A,$18,$19,$1A,$1A,$1C,$1D,$1E,$1F,
      $1A,$1A,$1A,$1A,$1A,$0A,$17,$1B,$1A,$1A,$1A,$1A,$1A,$05,$06,$07,
      $1A,$1A,$16,$1A,$1A,$1A,$1A,$04,$1A,$1A,$1A,$1A,$14,$15,$1A,$1A,
      $20,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$5B,$2E,$3C,$28,$2B,$21,
      $26,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$5D,$24,$2A,$29,$3B,$5E,
      $2D,$2F,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$7C,$2C,$25,$5F,$3E,$3F,
      $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$60,$3A,$23,$40,$27,$3D,$22,
      $1A,$61,$62,$63,$64,$65,$66,$67,$68,$69,$1A,$1A,$1A,$1A,$1A,$1A,
      $1A,$6A,$6B,$6C,$6D,$6E,$6F,$70,$71,$72,$1A,$1A,$1A,$1A,$1A,$1A,
      $1A,$7E,$73,$74,$75,$76,$77,$78,$79,$7A,$1A,$1A,$1A,$1A,$1A,$1A,
      $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,
      $7B,$41,$42,$43,$44,$45,$46,$47,$48,$49,$1A,$1A,$1A,$1A,$1A,$1A,
      $7D,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$1A,$1A,$1A,$1A,$1A,$1A,
      $5C,$1A,$53,$54,$55,$56,$57,$58,$59,$5A,$1A,$1A,$1A,$1A,$1A,$1A,
      $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$1A,$1A,$1A,$1A,$1A,$1A);

  VAR
    Invalid:  BYTE;


  FUNCTION EBCDICtoASCII(const c:  BYTE):  BYTE;
  BEGIN
    RESULT := Table[c];
    IF   RESULT = InvalidTableEntry
    THEN RESULT := Invalid
  END {EBCDICtoASCII};


  PROCEDURE SetInvalid(const c:  BYTE);
  BEGIN
    Invalid := c
  END {SetInvalid};

  function EBCDIC2CHAR(TagValue: array of byte): string;
  var
    i, LenArray: Integer;
    ReturnBody: string;
  begin
    LenArray := Length(TagValue);
    for i := 0 to LenArray - 1 do
      ReturnBody := ReturnBody + Char(EBCDICtoASCII(TagValue[i]));
    result := ReturnBody;
  end;


INITIALIZATION
  SetInvalid ($20);  {Return ASCII blank when conversion undefined}

END.