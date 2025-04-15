Program AS15;
Uses graph, crt;

Var
 vx,vy,x,y,d,m: integer;

begin
 clrscr;
 writeln('Введите начальную координату по Х (от 25 до 600)');
 readln(X);
 writeln('Введите начальную координату по Y (от 25 до 400)');
 readln(y);
 writeln('Введите начальную скорость по X');
 readln(vx);
 writeln('Введите начальную скорость по Y');
 readln(vy);
 d:=detect;
 InitGraph(d,m,'C:');
 repeat
  delay(100);
  setfillstyle(1,Green);
  bar(10,10,625,425);
  circle(x,y,10);
  x:=x+vx;
  y:=y+vy;
  if (y<25) or (y>400) then  vy:=-vy;
  if (x<25)  or (x>600) then vx:=-vx;
 until keypressed;
 closegraph;
end.