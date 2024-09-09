unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    But1: TButton;
    mod1: TButton;
    Minus: TButton;
    Multiply: TButton;
    div1: TButton;
    But0: TButton;
    Plus: TButton;
    Equal: TButton;
    But2: TButton;
    Del2: TButton;
    CE: TButton;
    Del: TButton;
    But3: TButton;
    But4: TButton;
    But5: TButton;
    But6: TButton;
    But7: TButton;
    But8: TButton;
    But9: TButton;
    Edit1: TEdit;
    procedure mod1Click(Sender: TObject);
    procedure EqualClick(Sender: TObject);
    procedure Del2Click(Sender: TObject);
    procedure CEClick(Sender: TObject);
    procedure DelClick(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  a, b, c : Integer;
  znak : String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ClickZnak(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Пожалуйста, введите сначала число.');
    Exit;
  end;

  if (Edit1.Text = '+') or (Edit1.Text = '-') or (Edit1.Text = '*') or (Edit1.Text = 'div') or (Edit1.Text = 'mod') then
  begin
    ShowMessage('Ошибка: Нельзя использовать два знака операции подряд.');
    Exit;
  end;

  a := StrToInt(Edit1.Text); // Преобразование введенного значения в число a
  Edit1.Clear; // Очистка поля ввода

  znak := TButton(Sender).Caption; // Сохранение выбранного арифметического знака
end;

procedure TForm1.ClickBut(Sender: TObject);
begin

  Edit1.Text := Edit1.Text + (Sender as TButton).Caption; // Добавление числа или знака на экран
end;

procedure TForm1.DelClick(Sender: TObject);
var
  str: String;
begin
  str := Edit1.Text; // Считывание текущего текста с экрана
  if Length(str) > 0 then
    Delete(str, Length(str), 1); // Удаление последнего символа
  Edit1.Text := str; // Обновление отображаемого текста
end;

// Процедуры для дополнительных функций калькулятора
procedure TForm1.CEClick(Sender: TObject);
begin
  Edit1.Clear; // Очистка поля ввода
end;

procedure TForm1.mod1Click(Sender: TObject);
begin

end;

procedure TForm1.EqualClick(Sender: TObject);
begin
  if (Edit1.Text = '') or (znak = '') then
  begin
    ShowMessage('Пожалуйста, введите число и выберите арифметическую операцию.');
    Exit;
  end;
  if (Edit1.Text = '+') or (Edit1.Text = '-') or (Edit1.Text = '*') or (Edit1.Text = 'div') or (Edit1.Text = 'mod') then
  begin
    ShowMessage('Ошибка!');
    Exit;
  end;
  b := StrToInt(Edit1.Text); // Преобразование текущего значения на экране в число b
  Edit1.Clear; // Очистка поля ввода

  try
    case znak of
      '+' : c := a + b;
      '-' : c := a - b;
      '*' : c := a * b;
      'div' : c := a div b;
      'mod' : c := a mod b;
    end;
    Edit1.Text := FloatToStr(c); // Вывод результата на экран
  except
    on E: Exception do
      ShowMessage('Ошибка: ' + E.Message); // Обработка и вывод сообщения об ошибке
  end;
end;




procedure TForm1.Del2Click(Sender: TObject);
begin
  Edit1.Clear; // Очистка поля ввода
  a := 0; // Обнуление переменной a
  b := 0; // Обнуление переменной b
  c := 0; // Обнуление переменной Del2
end;


end.

