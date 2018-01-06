unit SearchListBox;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, strutils,Buttons,StdCtrls,Controls, Dialogs,Forms,LResources;
type

  { TSearchListBox }
  TPosicao = (poTopLeft,poTopRight,poBottomLeft,poBottomRight);
  TSearchListBox = Class(TComponent)
       private
            bnt : TBitBtn;
            FFormFound    : TForm;
            FOK           : TBitBtn;
            FEdit         : TEdit;
            FListBox      : TListbox;
            FPosicao_Botao: TPosicao;
            procedure clickBnt(Sender : TObject);
            procedure FEditChange(Sender: TObject);
            procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
            procedure Found(Texto: String);
            procedure PosicionarBnt;
            procedure SetListBox(AValue: TListbox);
            procedure SetPosicao_Botao(AValue: TPosicao);
            procedure Transparencia(Frm: TForm);
       public
            constructor Create(AOwner: TComponent); override;
           destructor Destroy; override;
       published
           property ListBox : TListbox read FListBox write SetListBox;
           property Posicao_Botao: TPosicao read FPosicao_Botao write SetPosicao_Botao;
       protected
         procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  end;
procedure Register;


implementation

procedure Register;
begin
  RegisterComponents('Humberto',[TSearchListBox]);
end;

{ TSearchListBox }


procedure TSearchListBox.Transparencia(Frm : TForm);
begin
  while frm.AlphaBlendValue > 2 do
      begin
         frm.AlphaBlendValue := frm.AlphaBlendValue -1;
         frm.update;
         sleep(1);
      end;
         frm.hide;
end;

procedure TSearchListBox.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Transparencia(Sender as TForm);
end;

procedure TSearchListBox.Found(Texto : String);
var
  i : Integer;
begin
  for i := 0 to FListBox.items.Count -1 do
     begin
         if AnsiContainsStr( UpperCase( FListBox.Items.Strings[i] ), UpperCase( Texto ) ) then
             begin
                  FListBox.ItemIndex := i;
                  Break;
             end;
     end;

end;

procedure TSearchListBox.PosicionarBnt;
begin
  if Assigned(FListBox) and Assigned(Bnt)  then
    begin
         Bnt.Parent := FListBox.Parent;
         Case Posicao_Botao of
         poTopLeft :
                    begin
                        Bnt.Left   := ListBox.Left - Bnt.Width;
                        Bnt.Top    := ListBox.Top;
                    end;
         poTopRight :
                    begin
                        Bnt.Left   := ListBox.Left + Listbox.Width;
                        Bnt.Top    := ListBox.Top;
                    end;
         poBottomLeft:
                    begin
                      Bnt.Left   := ListBox.Left - Bnt.Width;
                      Bnt.Top    := ListBox.Top + (Listbox.Height - Bnt.Height);
                    end;
         poBottomRight:
                    begin
                      Bnt.Left   := ListBox.Left + Listbox.Width;
                      Bnt.Top    := ListBox.Top + (Listbox.Height - Bnt.Height);
                    end;

         end;

    end;
end;

procedure TSearchListBox.SetListBox(AValue: TListbox);
begin
  FListBox := AValue;
  if AValue <> Nil  Then
      begin
          PosicionarBnt;
      end;
end;

procedure TSearchListBox.clickBnt(Sender: TObject);
begin
 if Assigned(ListBox) then
     begin
         FFormFound     := TForm.Create(Self.Owner);
         With FFormFound do
              begin
                  AlphaBlend           := true;
                  AlphaBlendValue      := 255;    //transparencia
                  BorderStyle          := bsNone;
                  Width                := ListBox.Width;
                  OnClose              := @FormClose;
                  FEdit                := TEdit.Create(FFormFound);
                  FOK                  := TBitBtn.Create(FFormFound);
                  Height               := FEdit.Height + 2;
                  Left                 := Listbox.ClientOrigin.X;
                  Top                  := Listbox.ClientOrigin.Y - Height;
                  FEdit.Parent         := FFormFound;
                  FOk.Parent           := FFormFound;
                  FOk.Width            := 32;
                  FOk.ModalResult      := MrClose;
                  FOk.Align            := alRight;
                  FOk.Glyph.LoadFromLazarusResource('Close');
                  FEdit.Align          := alClient;
                  FEdit.OnChange       := @FEditChange;
                  ShowModal;
                  FreeandNil(FOk);
                  FreeandNil(FEdit);
                  FreeAndNil(FFormFound);
              end;

     end;
end;

procedure TSearchListBox.FEditChange(Sender: TObject);
begin
  Found(FEdit.Text);
end;



procedure TSearchListBox.SetPosicao_Botao(AValue: TPosicao);
begin
  if FPosicao_Botao=AValue then Exit;
     FPosicao_Botao:=AValue;
     PosicionarBnt;
end;


constructor TSearchListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Posicao_Botao := poBottomLeft;
  if Not(csDesigning in ComponentState) then
     begin
          Bnt           := TBitBtn.Create(Nil);
          Bnt.Parent    := TWinControl(AOwner);
          Bnt.Name      := 'mysearch';
          Bnt.Caption   := '';
          Bnt.OnClick   := @ClickBnt;
          Bnt.Width     := 28;
          //Bnt.Height    := 32;
          Bnt.Glyph.LoadFromLazarusResource('Search');
     end;
end;



destructor TSearchListBox.Destroy;
begin
  FreeAndNil(Bnt);
  FListBox := Nil;
  inherited Destroy;
end;

procedure TSearchListBox.Notification(AComponent: TComponent; Operation: TOperation
  );
begin
  if (AComponent = FListBox) and (Operation = opRemove) then
     FListBox := Nil;
   inherited;

end;

initialization
{$i SearchListBox.lrs}

end.


