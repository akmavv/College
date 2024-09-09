program ReverseNumbers;
type
  TStack = record
    Items: array [1..100] of Integer; //стек с массивом Items и переменной Top для отслеживания вершины стека
    Top: Integer;
  end;

procedure InitStack(var Stack: TStack); //объявление процедуры, которая инициализирует стек, устанавливая его вершину 0
begin
  Stack.Top := 0;
end;

procedure Push(var Stack: TStack; Value: Integer); //процедура, которая добавляет значение в стек, 
//увеличивая вершину и записывая значение в соответствующую ячейку массива
begin
  Inc(Stack.Top);
  Stack.Items[Stack.Top] := Value;
end;

function Pop(var Stack: TStack): Integer; //функция, которая извлекает значение из вершины стека, уменьшая вершину на 1 и возвращая извлеченное значение
begin
  Result := Stack.Items[Stack.Top];
  Dec(Stack.Top);
end;

var
  InputFile, OutputFile: Text; //объявление перменных для работы с файлами
  Stack: TStack;
  Number: Integer;

begin
  Assign(InputFile, 'input.txt');
  Reset(InputFile);

  Assign(OutputFile, 'output.txt');
  Rewrite(OutputFile);

  InitStack(Stack);

  while not Eof(InputFile) do
  begin
    Readln(InputFile, Number);
    Push(Stack, Number);
  end;

  while Stack.Top > 0 do //цикл выполняемый пока стек не пуст
    Writeln(OutputFile, Pop(Stack)); //извлечение числа из вершины стека и запись его в файл вывода

  Close(InputFile);
  Close(OutputFile);
end.
