begin
  var spisok: array of integer; //массив для хранения целых чисел
  var spisok_chetnyh: array of integer; //массив для хранения четных чисел
  SetLength(spisok, 11);
  SetLength(spisok_chetnyh, 11);
  var t:=1;
  
  for var i:=1 to 10 do begin //цикл от 1 до 10 присваивает каждому элементу массива случайное число от -100 до 100
    spisok[i]:=random(-100,100);
    print(spisok[i]);
    
    if spisok[i] mod 2 = 0 then begin //проверяет является ли элемент четным
      spisok_chetnyh[t]:=spisok[i]; //если да то записывает в массив и увеличивает t
      t += 1;
    end;
    
  end;
  println();
  for var i:=1 to t-1 do //второй цикл от 1 до t-1 (кол-во найденных четных элементов)
    print(spisok_chetnyh[i]);
end.