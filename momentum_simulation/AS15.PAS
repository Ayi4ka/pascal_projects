Program AS15;
Uses graph, crt;

Var
 vx,vy,x,y,d,m: integer;

begin
 clrscr;
 writeln('������ ��砫��� ���न���� �� � (�� 25 �� 600)');
 readln(X);
 writeln('������ ��砫��� ���न���� �� Y (�� 25 �� 400)');
 readln(y);
 writeln('������ ��砫��� ᪮���� �� X');
 readln(vx);
 writeln('������ ��砫��� ᪮���� �� Y');
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