unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

  TfEdit = class(TForm)
    bCancel: TBitBtn;
    bSave: TBitBtn;
    CBNote: TComboBox;
    eISBN: TEdit;
    eIzdat: TEdit;
    eStran: TEdit;
    eAvtor: TEdit;
    eName: TEdit;
    fEdit: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure eISBNKeyPress(Sender: TObject; var Key: char);
    procedure eStranKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

procedure TfEdit.eISBNKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #127, #8]) then
    Key := #0; // Отменить ввод нецифрового символа
end;

procedure TfEdit.eStranKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #127, #32, #8]) then
    Key := #0; // Отменить ввод нецифрового символа
end;

procedure TfEdit.Label1Click(Sender: TObject);
begin

end;

procedure TfEdit.Label6Click(Sender: TObject);
begin

end;

end.

