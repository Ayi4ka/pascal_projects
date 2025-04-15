Program AS14;
Uses
  crt;
Var
  q,p:integer;
  w:string;
Function izDecimal(a, b: longint): string;     {Функция перевода из 10 сс}
 var
  l: string;
 const
  cc: string[16] = '0123456789ABCDEF';
 begin
  l:= '';
  while a<>0 do
   begin
   l:= cc[(a mod b)+1]+l;
   a:=a div b
   end;
  izDecimal:=l
 end;
Function vDecimal(a: string; b: longint): longint; {Функция перевода в десятичную сс}
 var
  u,i: longint;
 const
  cc: string[16] = '0123456789ABCDEF';
 begin
  u:= 0;
  while a[1] = '0' do
   delete(a,1,1);
  for i:=1 to length(a) do
   u:= u*b + pos(a[i],cc) - 1;
  vDecimal:=u
 end;
begin  {ввод начальное и конечной сс}
  writeln ('Здравствуй, пользователь. Из какой системы счисление тебе надо перевести число?(от 2 до 16)');
  repeat
    readln (q);
  until
   (q>=2) and (q<=16);
  writeln ('Введите число, которое надо перевести(в той сс, из которой надо перевести)');
  readln (w);
  writeln ('В какую сичтему счисления?(от 2 до 16)');
  repeat
    readln (p);
  until
   (p>=2) and (p<=16);
  writeln('Первод из ', q, ' в ', p);
  writeln(izDecimal(vDecimal(w,q), p)) {перевод с помощью функций из сс q в сс p}
end.


