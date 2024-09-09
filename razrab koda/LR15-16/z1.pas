program z1;
var
  i: integer;
  i_ptr: ^integer; //указатель на целое число
  
begin
  i:=2;
  i_ptr:=@i; //@ получение адреса переменной
  writeln('значение: ', i_ptr^);
end.