program z4; //односвязный список

type
NodePtr = ^Node;
Node = record
data: Integer;
next: NodePtr;
end;

function FindMaxElement(head: NodePtr): Integer; //функция принимает указатель на голову списка и возвращает мин элемент в списке
var
current: NodePtr;
maxElement: Integer;
begin
current := head;
maxElement := head^.data;

while current <> nil do // поиск максимального элемента
begin
if current^.data > maxElement then
maxElement := current^.data;

current := current^.next; //переход к сдледующему узлу
end;

FindMaxElement := maxElement; //возвращает найденным максимальный элемент
end;

function FindMinElement(head: NodePtr): Integer; //поиск минимального элемента
var
current: NodePtr;
minElement: Integer;
begin
current := head;
minElement := head^.data;

while current <> nil do
begin
if current^.data < minElement then
minElement := current^.data;

current := current^.next;
end;

FindMinElement := minElement; //возращает минимальный элемент
end;

var
head, current, newNode: NodePtr;
f: TextFile;
i, value: Integer;
begin
AssignFile(f, 'num.txt');
Reset(f);

New(head);
current := head; //создание нового узла и установка текущего указателя current на него

while not EOF(f) do
begin
Readln(f, value);
New(newNode);
newNode^.data := value;
newNode^.next := nil;

current^.next := newNode;
current := newNode;
end;
//чтение данных из файла и добавление новых узлов в список
CloseFile(f);

current := head^.next;
writeln('Список:');
while current <> nil do
begin
write(current^.data, ' ');
current := current^.next;
end;
writeln;

writeln('Максимальный элемент: ', FindMaxElement(head^.next));
writeln('Минимальный элемент: ', FindMinElement(head^.next));
end.