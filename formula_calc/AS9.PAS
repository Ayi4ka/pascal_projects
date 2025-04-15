Program AS9;
Uses
  crt;
Var
  A,B:real;
  x,p,c,k,o,v:array [1..1000] of real;
  i,n:integer;
  error,t:array[1..55] of string;
Begin
  clrscr;
  Writeln ('Введите количество пар');
  Readln(n);
  For  i:=1 to n do
           begin
     Writeln('Введите x и p');
     Readln(x[i]);
     Readln(p[i])
           end;
  for i:=1 to n do
   begin             {начало проверки условий для решения выражения}
    If (x[i]<0) then
     error[i]:=' подкоренное выражение < 0'
    else
     If((sqr(x[i])-6*p[i])<=0) then
      error[i]:=' выражение под логорифмом <=0'
     else
      If ((sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1))<(-1))
       or ((sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1))>(1)) then
        error[i]:=' модуль синуса <= 1 '
      else
       If (sqrt(x[i])+sqr(p[i])+1)<0 then
        error[i]:=' подкоренное выражение <0'
       else
        If sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1)=0 then
         error[i]:='знаменатель =0'
        else
         If x[i]<0 then
          error[i]:='подкоренное выражение <0'
         else
          begin                    {окончание проверки, подсчеты}
           A:=ln(sqr(x[i])-6*p[i])-p[i]/2-8.5;
           B:=sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1);
           C[i]:=A/B;
          end;
   end;
  for i:=1 to n do
              if x[i]>0 then {проверка условия х>0 для сортировки }
               writeln (x[i]:2:2,'         ', p[i]:2:2, '        ', c[i]:2:2, '          ', error[i])
                {вывод значений для положительных х}
              else
               begin {сохранение отрицательных и нулевых значений}
                k[i]:=x[i];
                o[i]:=p[i];
                v[i]:=c[i];
                t[i]:=error[i]
               end;
  for i:=1 to n do
   writeln (k[i]:2:2,'         ', o[i]:2:2, '        ', v[i]:2:2, '          ', t[i]); {вывод отрицательных и нулевых значений}
  Writeln ('Спасибо за использование программы, с любовью, Айтен :3');
  Writeln ('-_- нажмите на любую клавишу для выхода');
  Repeat Until KeyPressed;
End.