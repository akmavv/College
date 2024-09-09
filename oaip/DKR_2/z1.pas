program z1;
var
  arr: array[1..100] of integer;
  n, i, j, c: integer;
  d: boolean;

begin
  write('Введите количество элементов в массиве: ');
  readln(n);
  
  write('Введите элементы массива: ');
  for i := 1 to n do
  begin
    read(arr[i]);
  end;
  
  c:= 0;
  
  for i := 1 to n do
  begin
    d := true;
    for j := 1 to i - 1 do
    begin
      if arr[i] = arr[j] then
      begin
        d := false;
        break;
      end;
    end;
    
    if d then
    begin
      c := c + 1;
    end;
  end;
  
  writeln('Количество различных элементов в массиве равно: ', c);
end.