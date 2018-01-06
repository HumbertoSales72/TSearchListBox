{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit PKSearchListBox;

{$warn 5023 off : no warning about unused units}
interface

uses
  SearchListBox, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('SearchListBox', @SearchListBox.Register);
end;

initialization
  RegisterPackage('PKSearchListBox', @Register);
end.
