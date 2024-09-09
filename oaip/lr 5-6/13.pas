program z13;
var
arr: array[1..20] of Integer;
i, max, min, temp: Integer;

begin
// Заполняем массив случайными числами
Randomize;
for i := 1 to 20 do
arr[i] := Random(100);

// Находим индексы наибольшего и наименьшего элементов массива
max := 1;
min := 1;
for i := 2 to 20 do
begin
if arr[i] > arr[max] then
max:= i;
if arr[i] < arr[min] then
  min := i;
end;

// Меняем местами наибольший и наименьший элементы массива
temp := arr[max];
arr[max] := arr[min];
arr[min] := temp;

// Выводим результат
for i := 1 to 20 do
Write(arr[i], ' ')
end.