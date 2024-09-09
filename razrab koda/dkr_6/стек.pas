program dkr_6;

uses crt;

type
  StackNode = ^Node;
  Node = record
    data: integer;
    next: StackNode;
  end;

var
  topDynamic: StackNode;
  topStatic: integer;
  stackStatic: array[1..100] of integer;

procedure pushDynamic(value: integer); // добавление элемента динам
var
  newNode: StackNode;
begin
  new(newNode);
  newNode^.data := value;
  newNode^.next := topDynamic;
  topDynamic := newNode;
end;

function popDynamic: integer; // извлечение элемента из вершины
var
  temp: StackNode;
  value: integer;
begin
  if topDynamic <> nil then
  begin
    temp := topDynamic;
    value := temp^.data;
    topDynamic := temp^.next;
    dispose(temp);
    popDynamic := value;
  end
  else
  begin
    writeln('Стек пуст');
    popDynamic := -1; 
  end;
end;

procedure printStackDynamic; //вывод динам стека
var
  currentNode: StackNode;
begin
  writeln('Стек (динамический):');
  currentNode := topDynamic;
  while currentNode <> nil do
  begin
    write(currentNode^.data, ' ');
    currentNode := currentNode^.next;
  end;
  writeln;
end;

procedure pushStatic(value: integer); //добавление элемента стат
begin
  if topStatic = 100 then
    writeln('Массив полный')
  else
  begin
    Inc(topStatic);
    stackStatic[topStatic] := value;
  end;
end;

function popStatic: integer; //извлечение элемента стат
var
  value: integer;
begin
  if topStatic > 0 then
  begin
    value := stackStatic[topStatic];
    stackStatic[topStatic] := 0; 
    Dec(topStatic);
    popStatic := value;
  end
  else
  begin
    writeln('Массив пустой');
    popStatic := -1; 
  end;
end;

procedure printStackStatic; //вывод стат стека
var
  i: integer;
begin
  writeln('Стек (статический):');
  for i := 1 to topStatic do
    write(stackStatic[i], ' ');
  writeln;
end;

var
  choice, value: integer;

begin
  topDynamic := nil;
  topStatic := 0;
  
  repeat
    writeln('1. Вставить в стек (динамическая память)');
    writeln('2. Изъять из стека (динамическая память)');
    writeln('3. Вывести стек (динамическая память)');
    writeln('4. Вставить в стек (статическая память)');
    writeln('5. Изъять из стека (статическая память)');
    writeln('6. Вывести стек (статическая память)');
    writeln('7. Выход');
    write('Введите нужный параметр: ');
    readln(choice);
    
    case choice of
      1:
        begin
          write('Введите значение для вставки: ');
          readln(value);
          pushDynamic(value);
        end;
      2:
      writeln(popDynamic); 
      3:
      printStackDynamic;
      4:
        begin
          write('Введите значение для вставки: ');
          readln(value);
          pushStatic(value);
        end;
      5:
      writeln(popStatic); 
      6:
      printStackStatic;
      7:
      break;
    else
      writeln('Неверный выбор');
    end;
    
  until false;
  
end.