unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, SearchListBox;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Panel1: TPanel;
    SearchListBox1: TSearchListBox;
    SearchListBox2: TSearchListBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  ListBox1.Items.Add('1 - Humberto Sales de Oliveira');
  ListBox1.Items.Add('2 - Denis Monica de Oliveira');
  ListBox1.Items.Add('3 - Gilberto Henrique de Oliveira');
  ListBox1.Items.Add('4 - Alberto Marcelo de Oliveira');
  ListBox1.Items.Add('5 - Humberto Santos');
  ListBox1.Items.Add('Av dos Boiadeiros');
  ListBox1.Items.Add('Av Sete de Setembro');
  ListBox1.Items.Add('Av Agostinho Prado');
  ListBox1.Items.Add('HUMBERTO CARLOS');
  ListBox1.Items.Add('DENIS PARREIRA');
  ListBox1.Items.Add('ANTONIO BRITO');

  ListBox2.Items.Add('1 - Humberto Sales de Oliveira');
  ListBox2.Items.Add('2 - Denis Monica de Oliveira');
  ListBox2.Items.Add('3 - Gilberto Henrique de Oliveira');
  ListBox2.Items.Add('4 - Alberto Marcelo de Oliveira');
  ListBox2.Items.Add('5 - Humberto Santos');
  ListBox2.Items.Add('Av dos Boiadeiros');
  ListBox2.Items.Add('Av Sete de Setembro');
  ListBox2.Items.Add('Av Agostinho Prado');
  ListBox2.Items.Add('HUMBERTO CARLOS');
  ListBox2.Items.Add('DENIS PARREIRA');
  ListBox2.Items.Add('ANTONIO BRITO');
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  Listbox1.Sorted:= CheckBox1.Checked;
end;

end.

