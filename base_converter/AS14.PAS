Program AS14;
Uses
  crt;
Var
  q,p:integer;
  w:string;
Function izDecimal(a, b: longint): string;     {�㭪�� ��ॢ��� �� 10 ��}
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
Function vDecimal(a: string; b: longint): longint; {�㭪�� ��ॢ��� � �������� ��}
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
begin  {���� ��砫쭮� � ����筮� ��}
  writeln ('��ࠢ���, ���짮��⥫�. �� ����� ��⥬� ��᫥��� ⥡� ���� ��ॢ��� �᫮?(�� 2 �� 16)');
  repeat
    readln (q);
  until
   (q>=2) and (q<=16);
  writeln ('������ �᫮, ���஥ ���� ��ॢ���(� ⮩ ��, �� ���ன ���� ��ॢ���)');
  readln (w);
  writeln ('� ����� ��⥬� ��᫥���?(�� 2 �� 16)');
  repeat
    readln (p);
  until
   (p>=2) and (p<=16);
  writeln('��ࢮ� �� ', q, ' � ', p);
  writeln(izDecimal(vDecimal(w,q), p)) {��ॢ�� � ������� �㭪権 �� �� q � �� p}
end.


