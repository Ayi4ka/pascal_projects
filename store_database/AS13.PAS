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
   Writeln ('1.��筮� ���� ������         5.��ࠡ�⪠ ������ � ����� १���⮢');  {���� ������}
   Writeln ('2.�⥭�� ������ �� 䠩��     6.������ ������ � 䠩�');
   Writeln ('3.���४�஢�� ������       7.����� ࠡ��� ');
   Writeln ('4.����� ������              ');
   Write('        ������ ����� ����樨:  ');
   Read(nomer);
   Case nomer of {������⢥��� �롮�}
    1:
     begin
      Write('������ ������⢮ ��������� - ');
      Readln(n);
      for l:=1 to n do {��� n ������⢠ ��������� ���� ����� �������� ���� � ��㣮�}
       begin
        with sstore[l] do
         begin
          writeln('������ ����� �������� - ');
          readln(sstore[l].nb);
          writeln('������ �������� �������� - ');
          readln(sstore[l].name);
          writeln('������ ���� ������� - ');
          readln(sstore[l].adres);
          writeln('������ ��� ��४�� - ');
          readln(sstore[l].owner);
          writeln('������ ��� ࠡ�祣� ��� (������ �१ �஡�� ��� �᫠ �६� ��砫� � �६� ���� ࠡ�祣� ���) - ');
          readln(sstore[l].work);
          writeln('������ ��� ����뢠 (������ ��� �᫠ �६� ��砫� � �६� ���� ����뢠) - ');
          readln(sstore[l].break);
          writeln('������ ��室�� ��� ������ (1-�� 2-�� � �) - ');
          readln(sstore[l].weekend)
         end;
       end;
     end;
    2:
     begin
      clrscr;
      assign(filen, 'AS13_1.txt');  {�����祭�� 䠩����� ��६����� ��� ���譥�� 䠩��}
      append(filen);    {��⠢�� ᮤ�ন���� � 䠩�}
      Writeln (filen, n);
      for l:=1 to n do
       begin
        with sstore[l] do
         begin
          writeln(sstore[l].nb);         {�뢮� ������}
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
     begin  {���४�஢�� ������}
      clrscr;
      for l:=1 to n do
       begin
        writeln('������ ����� ��������, � ���ண� ��� ��ࠢ��� �����');
        with sstore[l] do
         begin
          writeln('������ ����� �������� - ');
          readln(sstore[l].nb);
          writeln('������ �������� �������� - ');
          readln(sstore[l].name);
          writeln('������ ���� ������� - ');
          readln(sstore[l].adres);
          writeln('������ ��� ��४�� - ');
          readln(sstore[l].owner);
          writeln('������ ��� ࠡ�祣� ��� - ');
          readln(sstore[l].work);
          writeln('������ ��� ����뢠 - ');
          readln(sstore[l].break);
          writeln('������ ��室�� ��� ������ (1-�� 2-�� � �) - ');
          readln(sstore[l].weekend)
         end;
       end;
      repeat until keypressed;
     end;
    4:  {�뢮� ������}
     begin
      clrscr;
       for l:=1 to n do
        begin
         with sstore[l] do
          begin
           writeln('����� - ', sstore[l].nb);
           writeln('�������� - ',sstore[l].name);
           writeln('���� - ',sstore[l].adres);
           writeln('��� ��४�� - ',sstore[l].owner);
           writeln('����祥 �६� - ',sstore[l].work:2:2);
           writeln('����� - ',sstore[l].break:2:2);
           writeln('��室�� - ',sstore[l].weekend:2:2)
          end;
        end;
       repeat until keypressed;
     end;
    5:    {��宦����� ࠡ���饣� �������� � ��।������ ���� ������}
     begin
      writeln('������ ���� ������ (1-�� 2�� � �)');
      readln(days);
      for l:=1 to n do
       with sstore[l] do
        if sstore[l].weekend<>days then   {�᫨ �������� ���� ������ �� ᮢ������ � ��室��, � ������� ࠡ�⠥�}
         begin
          writeln ('����� �������� ࠡ���� � ��� ����: ');
          writeln('����� - ',sstore[l].nb);
          writeln('�������� - ',sstore[l].name);
          writeln('���� - ',sstore[l].adres);
          writeln('��� ��४�� - ',sstore[l].owner);
          writeln('����祥 �६� - ',sstore[l].work:2:2);
          writeln('����� - ',sstore[l].break:2:2);
          writeln('��室�� - ',sstore[l].weekend:2:2)
         end
        else
         writeln('� ��� ���� ������ �� ���� ������� �� ࠡ⠥� :(');
     end;
    6: {������ ������ � 䠩�}
     begin
      Assign (filen, 'AS13_1.txt');{�����祭�� 䠩����� ��६����� ��� ���譥�� 䠩��}
      rewrite(filen); {����⨥ 䠩�� � ०��� �����}
      append(filen); {��⠢�� ᮤ�ন���� � 䠩�}
      for l:=1 to n do
       with sstore[l]  do
        begin
         writeln('����� - ',sstore[l].nb);
         writeln('�������� - ',sstore[l].name);
         writeln('���� - ',sstore[l].adres);
         writeln('��� ��४�� - ',sstore[l].owner);
         writeln('����祥 �६� - ',sstore[l].work:2:2);
         writeln('����� - ',sstore[l].break:2:2);
         writeln('��室�� - ',sstore[l].weekend:2:2)
        end;
       repeat until keypressed;
     end;
   end;
  end
End.