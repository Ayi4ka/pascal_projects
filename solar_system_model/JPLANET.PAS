Unit jplanet;
interface
      Uses graph,crt;
      type pozition=object {определяем поля и методы объекта-предка}
                    x,y:integer;
                    procedure init(coordx, coordy:integer);
                    function getx:integer;
                    function gety:integer;
          end;
          startrtr=^star;
          star=object(pozition) {оределяем поля и методы объекта-потомка}
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
          planet=object(star){оределяем поля и методы объекта planet-потомка}
          radius:integer;    {потомка объекта star}
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
           begin                   {запоминаем в x,y координаты,заданные в }
                x:=coordx;y:=coordy        {программе}
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
                color:=initcolor{запоминаем в переменной color заданный цвет}
           end;
           destructor star.done;
           begin
                blind
           end;
           procedure star.show;
           begin
                visible:=true;
                putpixel(x,y,color);{рисуем точку}
           end;
           function star.isvisible:boolean;
           begin
                isvisible:=visible
           end;
           procedure star.blind;{роцедура,делающая бъект невидимым}
           begin
                visible:=false;
                putpixel(x,y,getbkcolor);{рисуем точку цвета фона на месте}
           end;                          {цветной точки}
           procedure star.jump;{процедура,перемещающая объект по экрану}
           begin
                blind;{убираем объект с прежнего места на экране}
                x:=nextx; {передаем в x,y координаты нового положения}
                y:=nexty;
                show; {воспроизводим объект на новом месте}
           end;
           {methods of object planet}
           constructor planet.init(coordx,coordy:integer;initcolor:word;
                                   initradius:integer);
           begin
                star.init(coordx,coordy,initcolor);
                radius:=initradius;{передаем в переменную radius значение}
                                   {радиуса круга}
                size:=imagesize(x,y,x+2*radius,y+2*radius);{запоминаем в }
                {переменной size размер изображения в виде прямоугольника}
                getmem(p1,size);{выделяем память под переменную p1 в размере}
           end;                 {size}
           destructor planet.done;
           begin
                blind;{убираем с экрана}
                freemem(p1,size){освобождаем динамическую память}
           end;
           procedure planet.show;
           var
             i:integer;
             promcolor,er:word;
           begin
                visible:=true;
                er:=getbkcolor;{запоминаем в er цвет фона}
                graph.setcolor(er);{устанавливаем в качестве основного цвета}
                {для рисования цвет фона}
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
