program z1;

var
  a: string;
  w, l, i: integer;

begin
  w := 0;
  l := 0;
  
  writeln('Введите строку: ');
  readln(a);
  
  for i := 1 to length(a) do
  begin
    if (a[i] = ' ') or (a[i] = ',') or (a[i] = '.') or (a[i] = '!') or (a[i] = '?') then
      w := w + 1
    else
      l := l + 1;
  end;
  
  if l > 0 then
    w := w + 1;
  
  writeln('Число слов: ', w);
  writeln('Число букв: ', l);
end.