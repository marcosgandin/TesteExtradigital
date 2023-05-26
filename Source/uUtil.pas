unit uUtil;

interface

uses
  SysUtils, StdCtrls, Controls;

  function TestaCpf( Dado:String ):Boolean;
  function TestaCgc(Dado: String):Boolean;

implementation

function TestaCpf( Dado:String ):Boolean;
var
  D1 : array[1..9] of byte;
  I, DF1, DF2, DF3, DF4,
  DF5, DF6, Resto1, Resto2,
  PrimeiroDigito, SegundoDigito : integer;
begin
  Result := True;

  if Length(Dado) = 11 then
  begin
    for I := 1 to 9 do
    if CharInSet(Dado[I], ['0'..'9']) then
      D1[I] := StrToInt(Dado[I])
    else
      Result := False;

    if Result then
    begin
      DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
             4*D1[7] + 3*D1[8] + 2*D1[9];
      DF2 := DF1 div 11;
      DF3 := DF2 * 11;
      Resto1 := DF1 - DF3;

      if (Resto1 = 0) or (Resto1 = 1) then
        PrimeiroDigito := 0
      else
        PrimeiroDigito := 11 - Resto1;

      DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
             5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PrimeiroDigito;
      DF5 := DF4 div 11;
      DF6 := DF5 * 11;
      Resto2 := DF4 - DF6;

      if (Resto2 = 0) or (Resto2 = 1) then
        SegundoDigito := 0
      else
        SegundoDigito := 11 - Resto2;

      if (PrimeiroDigito <> StrToInt(Dado[10])) or
         (SegundoDigito <> StrToInt(Dado[11])) then
        Result := false;
    end;
  end
  else
    if Length(Dado) <> 0 then
      Result := false;
end;

function TestaCgc(Dado: String):Boolean;
var
  D1 : array[1..12] of byte;
  I, DF1, DF2, DF3, DF4,
  DF5, DF6, Resto1, Resto2,
  PrimeiroDigito, SegundoDigito : integer;
begin
  Result := True;

  if Length(Dado) = 14 then
  begin
    for I := 1 to 12 do
     if CharInSet(Dado[I], ['0'..'9']) then
       D1[I] := StrToInt(Dado[I])
     else
       Result := False;

    if Result then
    begin
      DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
             7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
      DF2 := DF1 div 11;
      DF3 := DF2 * 11;
      Resto1 := DF1 - DF3;

      if (Resto1 = 0) or (Resto1 = 1) then
        PrimeiroDigito := 0
      else
        PrimeiroDigito := 11 - Resto1;

      DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
             8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
             2*PrimeiroDigito;
      DF5 := DF4 div 11;
      DF6 := DF5 * 11;
      Resto2 := DF4 - DF6;

      if (Resto2 = 0) or (Resto2 = 1) then
        SegundoDigito := 0
      else
        SegundoDigito := 11 - Resto2;

      if (PrimeiroDigito <> StrToInt(Dado[13])) or
         (SegundoDigito <> StrToInt(Dado[14])) then
        Result := False;
    end;
  end
  else
   if Length(Dado) <> 0 then
     Result := False;
end;

end.
