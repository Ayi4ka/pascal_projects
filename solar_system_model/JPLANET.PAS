Unit jplanet;
interface
      Uses graph,crt;
      type pozition=object {��।��塞 ���� � ��⮤� ��ꥪ�-�।��}
                    x,y:integer;
                    procedure init(coordx, coordy:integer);
                    function getx:integer;
                    function gety:integer;
          end;
          startrtr=^star;
          star=object(pozition) {�।��塞 ���� � ��⮤� ��ꥪ�-��⮬��}
               visible:boolean;
               color:word;
               constructor init(coordx, coordy:integer;initcolor:word);
               destructor done;virtual;
               function isvisible:boolean;
               procedure show;virtual;
               procedure blind;virtual;
               procedure jump(nextx,nexty:integer);virtual;
          end;
          planetptr=^planet;
          planet=object(star){�।��塞 ���� � ��⮤� ��ꥪ� planet-��⮬��}
          radius:integer;    {��⮬�� ��ꥪ� star}
          p1:pointer;
          size:word;
          constructor init(coordx, coordy:integer;initcolor:word;
                           initradius:integer);
                           destructor done;virtual;
                           procedure show;virtual;procedure blind;virtual;
                           procedure jump(nextx,nexty:integer);virtual;
         end;
implementation
              {methods of object pozition}
           procedure pozition.init(coordx,coordy:integer);
           begin                   {���������� � x,y ���न����,������� � }
                x:=coordx;y:=coordy        {�ணࠬ��}
           end;
           function pozition.getx:integer;
           begin
                getx:=x
           end;
           function pozition.gety:integer;
           begin
                gety:=y
           end;
           {methods of object star}
           constructor star.init(coordx,coordy:integer;initcolor:word);
           begin
                pozition.init(coordx,coordy);
                visible:=false;
                color:=initcolor{���������� � ��६����� color ������� 梥�}
           end;
           destructor star.done;
           begin
                blind
           end;
           procedure star.show;
           begin
                visible:=true;
                putpixel(x,y,color);{��㥬 ���}
           end;
           function star.isvisible:boolean;
           begin
                isvisible:=visible
           end;
           procedure star.blind;{�楤��,������� �ꥪ� ��������}
           begin
                visible:=false;
                putpixel(x,y,getbkcolor);{��㥬 ��� 梥� 䮭� �� ����}
           end;                          {梥⭮� �窨}
           procedure star.jump;{��楤��,��६����� ��ꥪ� �� ��࠭�}
           begin
                blind;{㡨ࠥ� ��ꥪ� � �०���� ���� �� ��࠭�}
                x:=nextx; {��।��� � x,y ���न���� ������ ���������}
                y:=nexty;
                show; {���ந������ ��ꥪ� �� ����� ����}
           end;
           {methods of object planet}
           constructor planet.init(coordx,coordy:integer;initcolor:word;
                                   initradius:integer);
           begin
                star.init(coordx,coordy,initcolor);
                radius:=initradius;{��।��� � ��६����� radius ���祭��}
                                   {ࠤ��� ��㣠}
                size:=imagesize(x,y,x+2*radius,y+2*radius);{���������� � }
                {��६����� size ࠧ��� ����ࠦ���� � ���� ��אַ㣮�쭨��}
                getmem(p1,size);{�뤥�塞 ������ ��� ��६����� p1 � ࠧ���}
           end;                 {size}
           destructor planet.done;
           begin
                blind;{㡨ࠥ� � ��࠭�}
                freemem(p1,size){�᢮������� ���������� ������}
           end;
           procedure planet.show;
           var
             i:integer;
             promcolor,er:word;
           begin
                visible:=true;
                er:=getbkcolor;{���������� � er 梥� 䮭�}
                graph.setcolor(er);{��⠭�������� � ����⢥ �᭮����� 梥�}
                {��� �ᮢ���� 梥� 䮭�}
                for i:=1 to radius do
                    graph.circle(x,y,i);
                getimage(x-radius,y-radius,x+radius,y+radius,p1^);
                promcolor:=graph.getcolor;
                graph.setcolor(color);
                for i:=1 to radius do
                    graph.circle(x,y,i);
                    graph.setcolor(promcolor);
           end;
           procedure planet.blind;
           begin
                visible:=false;
                putimage(x-radius,y-radius,p1^,normalput);
           end;
           procedure planet.jump(nextx,nexty:integer);
           begin
                blind;
                x:=nextx;
                y:=nexty;
                show;
                nextx:=x;
                nexty:=y
           end;
           begin
           end.
