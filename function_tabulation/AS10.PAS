Program AS10;     
Uses
  crt;
Var
  x,p: array [0..15, 0..15] of real;
  c: array [1..10, 1..10] of real;
  A,B,hp,hx,x1,x2,p1,p2,np,nx:real;
  max:real;
  i,n,j,q:integer;
  error:array[1..10, 1..10] of string;
Begin
  clrscr;
  Writeln ('Введите шаг для x');  {ввод шагов для х}
  Read(hx);
  Writeln('Введите x1');
  Read(x1);
  Writeln('Введите x2');
  Read(x2);
  If (hx > 0) and (x1 > x2) then  {проверка условий}
   repeat exit until keypressed;
  If (hx < 0) and (x1 < x2) then
   repeat exit until keypressed;
  Writeln('Введите шаг для p ');  {ввод шагов для p}
  Read(hp);
  Writeln('Веедите p1');
  Read(p1);
  Writeln('Введите p2');
  Read(p2);
  If (hp > 0) and (p1 > p2) then  {проверка условий}
   repeat exit until keypressed;
  If (hp < 0) and (p1 < p2) then
   repeat exit until keypressed;
  nx:= abs((x2-x1)/hx)+1;
  If (nx >= 11) then
   begin
    writeln ('Много шагов для x');
    exit;
   end;
  np:= abs((p2-p1)/hp)+1;
  If (np  >= 11) then
   begin
    writeln ('Много шагов для p');
    exit;
   end;
  n:= round(nx);
  q:= round(np);
  For j:=1 to n do
   begin
    x[0,j]:=x1;
    x1:=x1+hx;
   end;
  For i:=1 to q do
   begin
    p[i,0]:=p1;
    p1:=p1+hp;
   end;
  Writeln(' ');
  Write('x/p':4);
  For i:=1 to q do
   write(p[i,0]:7:3);
  Writeln;
  For j:=1 to n do
   writeln(x[0,j]:2:3);
  For i:=1 to q do
   for j:=1 to n do
    begin             {начало проверки условий для решения выражения}
     If (x[0,j]<0) then
      error[i,j]:='*'
     else
      If((sqr(x[0,j])-6*p[i,0])<=0) then
       error[i,j]:='**'
      else
       If ((sin(sqrt(sqrt(x[0,j])+sqr(p[i,0])+1)-1))<(-1))
        or ((sin(sqrt(sqrt(x[0,j])+sqr(p[i,0])+1)-1))>(1)) then
         error[i,j]:='***'
       else
        If (sqrt(x[0,j])+sqr(p[i,0])+1)<0 then
         error[i,j]:='*'
        else
         If sin(sqrt(sqrt(x[0,j])+sqr(p[i,0])+1)-1)=0 then
          error[i,j]:='****'
         else
          If x[0,j]<0 then
           error[i,j]:='*'
          else
           begin                    {окончание проверки, подсчеты}
            A:=ln(sqr(x[0,j])-6*p[i,0])-p[i,0]/2-8.5;
            B:=sin(sqrt(sqrt(x[0,j])+sqr(p[i,0])+1)-1);
            c[i,j]:=A/B;
           end;
    end;
  Readkey;
  ClrScr;
  Write('X/P   ');                 {вывод таблицы}
  For i:=1 to q do
   write(p[i,0]:7:3, '     ');
  Writeln;
  For j:=1 to n do
   begin
    writeln;
    writeln(x[0,j]:2:3, '     ');
    for i:=1 to q do
     begin
      if (error[i,j]='') then
       write(C[i,j]:14:3);
      if (error[i,j]<> '') then
       write(error[i,j]:10);
     end;
   end;
  Writeln;
  max:=-100;
  For j:=1 to n do      {нахождение наибольших отрицательных значений строк}
   begin
    Writeln ('Наибольшие отрицательны значения строки: ');
    for i:=1 to q  do
      if (C[i,j]<0) and (C[i,j]>max) then
       max:=C[i,j];
    if max<>-100 then
     writeln (max)
    else writeln ('нет')
   end;
  Writeln ('* - подкоренное выражние меньше 0');   {вывод значений *}
  Writeln ('** - выражение под логорифмом меньше или равно 0');
  Writeln ('*** - модуль синуса меньше или равно 0');
  Writeln ('**** - знаменатель ноль');
  Readkey;
  Writeln ('Спасибо за использование программы, с любовью, Айтен :3');
  Writeln ('-_- нажмите на любую клавишу для выхода');
  Repeat Until KeyPressed;
End.