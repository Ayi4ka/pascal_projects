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
  Writeln ('������ ������⢮ ���');
  Readln(n);
  For  i:=1 to n do
           begin
     Writeln('������ x � p');
     Readln(x[i]);
     Readln(p[i])
           end;
  for i:=1 to n do
   begin             {��砫� �஢�ન �᫮��� ��� �襭�� ��ࠦ����}
    If (x[i]<0) then
     error[i]:=' �����७��� ��ࠦ���� < 0'
    else
     If((sqr(x[i])-6*p[i])<=0) then
      error[i]:=' ��ࠦ���� ��� �����䬮� <=0'
     else
      If ((sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1))<(-1))
       or ((sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1))>(1)) then
        error[i]:=' ����� ᨭ�� <= 1 '
      else
       If (sqrt(x[i])+sqr(p[i])+1)<0 then
        error[i]:=' �����७��� ��ࠦ���� <0'
       else
        If sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1)=0 then
         error[i]:='�������⥫� =0'
        else
         If x[i]<0 then
          error[i]:='�����७��� ��ࠦ���� <0'
         else
          begin                    {����砭�� �஢�ન, �������}
           A:=ln(sqr(x[i])-6*p[i])-p[i]/2-8.5;
           B:=sin(sqrt(sqrt(x[i])+sqr(p[i])+1)-1);
           C[i]:=A/B;
          end;
   end;
  for i:=1 to n do
              if x[i]>0 then {�஢�ઠ �᫮��� �>0 ��� ���஢�� }
               writeln (x[i]:2:2,'         ', p[i]:2:2, '        ', c[i]:2:2, '          ', error[i])
                {�뢮� ���祭�� ��� ������⥫��� �}
              else
               begin {��࠭���� ����⥫��� � �㫥��� ���祭��}
                k[i]:=x[i];
                o[i]:=p[i];
                v[i]:=c[i];
                t[i]:=error[i]
               end;
  for i:=1 to n do
   writeln (k[i]:2:2,'         ', o[i]:2:2, '        ', v[i]:2:2, '          ', t[i]); {�뢮� ����⥫��� � �㫥��� ���祭��}
  Writeln ('���ᨡ� �� �ᯮ�짮����� �ணࠬ��, � ����, ��⥭ :3');
  Writeln ('-_- ������ �� ���� ������� ��� ��室�');
  Repeat Until KeyPressed;
End.