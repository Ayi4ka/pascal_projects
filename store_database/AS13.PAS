Program AS13;
Uses crt;
Type
 store = record
 name: string[50];
 adres: string[60];
 owner: string[40];
 work: real;
 break: real;
 weekend:real;
 nb:real;
 end;
Var
 sstore:array [1..100] of store;
 n,l,a,q: integer;
 nomer: integer;
 filen:text;
 days:real;
Begin
 ClrScr;
 assign (filen, 'AS13_1.txt');
 n:=0;
 l:=0;
 While nomer<>7 do
  begin
   Writeln ('1.Ручной ввод данных         5.Обработка данных и печать результатов');  {ввод команд}
   Writeln ('2.Чтение данных из файла     6.Запись данных в файл');
   Writeln ('3.Корректировка данных       7.Конец работы ');
   Writeln ('4.Печать данных              ');
   Write('        Введите номер операции:  ');
   Read(nomer);
   Case nomer of {множественный выбор}
    1:
     begin
      Write('Введите количество магазинов - ');
      Readln(n);
      for l:=1 to n do {для n количества магазинов ввод номера названия адреса и другое}
       begin
        with sstore[l] do
         begin
          writeln('Введите номер магазина - ');
          readln(sstore[l].nb);
          writeln('Введите название магазина - ');
          readln(sstore[l].name);
          writeln('Введите адрес магазин - ');
          readln(sstore[l].adres);
          writeln('Введите ФИО директора - ');
          readln(sstore[l].owner);
          writeln('Введите часы рабочего дня (введите через пробел два числа время начала и время конца рабочего дня) - ');
          readln(sstore[l].work);
          writeln('Введите часы перерыва (введите два числа время начала и время конца перерыва) - ');
          readln(sstore[l].break);
          writeln('Введите выходные дни недели (1-пн 2-вт и тд) - ');
          readln(sstore[l].weekend)
         end;
       end;
     end;
    2:
     begin
      clrscr;
      assign(filen, 'AS13_1.txt');  {назначение файловой переменной имя внешнего файла}
      append(filen);    {вставка содержимого в файл}
      Writeln (filen, n);
      for l:=1 to n do
       begin
        with sstore[l] do
         begin
          writeln(sstore[l].nb);         {вывод данных}
          writeln(sstore[l].name);
          writeln(sstore[l].adres);
          writeln(sstore[l].owner);
          writeln(sstore[l].work:2:2);
          writeln(sstore[l].break:2:2);
          writeln(sstore[l].weekend:2:2)
         end;
        repeat until keypressed;
       end;
     end;
    3:
     begin  {корректировка данных}
      clrscr;
      for l:=1 to n do
       begin
        writeln('Введите номер магазина, у которого хотите исправить данные');
        with sstore[l] do
         begin
          writeln('Введите номер магазина - ');
          readln(sstore[l].nb);
          writeln('Введите название магазина - ');
          readln(sstore[l].name);
          writeln('Введите адрес магазин - ');
          readln(sstore[l].adres);
          writeln('Введите ФИО директора - ');
          readln(sstore[l].owner);
          writeln('Введите часы рабочего дня - ');
          readln(sstore[l].work);
          writeln('Введите часы перерыва - ');
          readln(sstore[l].break);
          writeln('Введите выходные дни недели (1-пн 2-вт и тд) - ');
          readln(sstore[l].weekend)
         end;
       end;
      repeat until keypressed;
     end;
    4:  {вывод данных}
     begin
      clrscr;
       for l:=1 to n do
        begin
         with sstore[l] do
          begin
           writeln('Номер - ', sstore[l].nb);
           writeln('Название - ',sstore[l].name);
           writeln('Адрес - ',sstore[l].adres);
           writeln('ФИО директора - ',sstore[l].owner);
           writeln('Рабочее время - ',sstore[l].work:2:2);
           writeln('Перерыв - ',sstore[l].break:2:2);
           writeln('Выходные - ',sstore[l].weekend:2:2)
          end;
        end;
       repeat until keypressed;
     end;
    5:    {нахождение работающего магазина в определенный день недели}
     begin
      writeln('Укажите день недели (1-пн 2вт и тд)');
      readln(days);
      for l:=1 to n do
       with sstore[l] do
        if sstore[l].weekend<>days then   {если введенный день недели не совпадает с выходным, то магазин работает}
         begin
          writeln ('Данные магазины работают в этот день: ');
          writeln('Номер - ',sstore[l].nb);
          writeln('Название - ',sstore[l].name);
          writeln('Адрес - ',sstore[l].adres);
          writeln('ФИО директора - ',sstore[l].owner);
          writeln('Рабочее время - ',sstore[l].work:2:2);
          writeln('Перерыв - ',sstore[l].break:2:2);
          writeln('Выходные - ',sstore[l].weekend:2:2)
         end
        else
         writeln('В этот день недели ни один магазин не рабтает :(');
     end;
    6: {запись данных в файл}
     begin
      Assign (filen, 'AS13_1.txt');{назначение файловой переменной имя внешнего файла}
      rewrite(filen); {открытие файла в режиме записи}
      append(filen); {вставка содержимого в файл}
      for l:=1 to n do
       with sstore[l]  do
        begin
         writeln('Номер - ',sstore[l].nb);
         writeln('Название - ',sstore[l].name);
         writeln('Адрес - ',sstore[l].adres);
         writeln('ФИО директора - ',sstore[l].owner);
         writeln('Рабочее время - ',sstore[l].work:2:2);
         writeln('Перерыв - ',sstore[l].break:2:2);
         writeln('Выходные - ',sstore[l].weekend:2:2)
        end;
       repeat until keypressed;
     end;
   end;
  end
End.