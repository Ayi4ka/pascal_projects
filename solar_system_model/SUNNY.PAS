Program Sunny;  {не хочу писать комментарии :((}

Uses crt, graph, Jplanet;

Const
 pi=3.1415;

Var  {тут задаем переменные для 4 планет, 3 спутников, звезды и солнышка}

 Sun, Aplanet, Bplanet, Cplanet, Dplanet, sCplanet, sDplanet, ssDplanet: planet;
 rSun, rAplanet, rBplanet, rCplanet, rDplanet, rsCplanet, rsDplanet, rssDplanet: integer;
 xSun, xAplanet, xBplanet, xCplanet, xDplanet, xsCplanet, xsDplanet, xssDplanet: integer;
 ySun, yAplanet, yBplanet, yCplanet, yDplanet, ysCplanet, ysDplanet, yssDplanet: integer;
 stars: array [0..255] of star;
 xstars,ystars: array [0..255] of integer;
 i,k:integer;


Begin

 rSun:=55;    {радиусыыы}
 rAplanet:=4;
 rBplanet:=8;
 rCplanet:=10;
 rDplanet:=7;
 rsCplanet:=3;
 rsDplanet:=3;
 rssDplanet:=2;

 randomize;
 for i:=1 to 255 do     {массивчик координат икс и игрик звезд}
  begin
   xstars[i]:=random(640);
   ystars[i]:=random(480);
  end;

 Initgraph(xSun,ySun,'');  {рисуем солнышко по серединке}
 xSun:=320;
 ySun:=240;

 Sun.Init(xSun,ySun,yellow,rSun);
 Sun.Show;

 Repeat

  For i:=1 to 255 do             {создаем звездочки, много звездочек}

   begin
    stars[i].init(xstars[i],ystars[i],white);
    stars[i].show;
   end;

  xAplanet:=xSun-round(90*cos(4*k*pi/180));    {эта странная штука}
  yAplanet:=ySun+round(90*sin(4*k*pi/180)); {уравнение движения по окружности}

  xBplanet:=xSun-round(125*cos(3*k*pi/180));
  yBplanet:=ySun+round(125*sin(3*k*pi/180));

  xCplanet:=xSun-round(160*cos(2*k*pi/180));
  yCplanet:=ySun+round(160*sin(2*k*pi/180));

  xsCplanet:=xCplanet-round(30*cos(10*k*pi/180));
  ysCplanet:=yCplanet+round(30*sin(10*k*pi/180));

  xDplanet:=xSun-round(220*cos(k*pi/180));
  yDplanet:=ySun+round(220*sin(k*pi/180));

  xsDplanet:=xDplanet-round(20*cos(5*k*pi/180));
  ysDplanet:=yDplanet+round(20*sin(5*k*pi/180));

  xssDplanet:=xDplanet-round(40*cos(10*k*pi/180));
  yssDplanet:=yDplanet+round(40*sin(10*k*pi/180));


  k:=k+1;

  For i:=0 to 255 do   {проверка чтобы звезды не мешали планетам и гасли}
   begin                                 {когда надо}
    if
     ((xstars[i]>xAplanet-rAplanet) and (xstars[i]<xAplanet+rAplanet) and
      (ystars[i]>yAplanet-rAplanet) and (ystars[i]<yAplanet+rAplanet)) or

     ((xstars[i]>xBplanet-rBplanet) and (xstars[i]<xBplanet+rBplanet) and
      (ystars[i]>yBplanet-rBplanet) and (ystars[i]<yBplanet+rBplanet)) or

     ((xstars[i]>xCplanet-rCplanet) and (xstars[i]<xCplanet+rCplanet) and
      (ystars[i]>yCplanet-rCplanet) and (ystars[i]<yCplanet+rCplanet)) or

     ((xstars[i]>xDplanet-rDplanet) and (xstars[i]<xDplanet+rDplanet) and
      (ystars[i]>yDplanet-rDplanet) and (ystars[i]<yDplanet+rDplanet)) or

     ((xstars[i]>xsCplanet-rsCplanet) and (xstars[i]<xsCplanet+rsCplanet) and
      (ystars[i]>ysCplanet-rsCplanet) and (ystars[i]<ysCplanet+rsCplanet)) or

     ((xstars[i]>xsDplanet-rsDplanet) and (xstars[i]<xsDplanet+rsDplanet) and
      (ystars[i]>ysDplanet-rsDplanet) and (ystars[i]<ysDplanet+rsDplanet)) or

     ((xstars[i]>xssDplanet-rssDplanet) and (xstars[i]<xssDplanet+rssDplanet) and
      (ystars[i]>yssDplanet-rssDplanet) and (ystars[i]<yssDplanet+rssDplanet))

     then
      stars[i].blind;
   end;

                   {создаем планетки}
  Aplanet.init(xAplanet,yAplanet,darkgray,rAplanet);
  Bplanet.init(xBplanet,yBplanet,blue,rBplanet);
  Cplanet.init(xCplanet,yCplanet,green,rCplanet);
  Dplanet.init(xDplanet,yDplanet,red,rDplanet);
  sCplanet.init(xsCplanet,ysCplanet,lightgray,rsCplanet);
  sDplanet.init(xsDplanet,ysDplanet,darkgray,rsDplanet);
  ssDplanet.init(xsDplanet,ysDplanet,darkgray,rsDplanet);
                    {показываем их}
  Aplanet.show;
  Bplanet.show;
  Cplanet.show;
  Dplanet.show;
  sCplanet.show;
  sDplanet.show;
  ssDplanet.show;
                     {меняем координаты}
  Aplanet.jump(xAplanet,yAplanet);
  Bplanet.jump(xBplanet,yBplanet);
  Cplanet.jump(xCplanet,yCplanet);
  Dplanet.jump(xDplanet,yDplanet);
  sCplanet.jump(xsCplanet,ysCplanet);
  sDplanet.jump(xsDplanet,ysDplanet);
  ssDplanet.jump(xssDplanet,yssDplanet);

  delay(200);

  Aplanet.done;     {очищаем место}
  Bplanet.done;
  Cplanet.done;
  Dplanet.done;
  sCplanet.done;
  sDplanet.done;
  ssDplanet.done;
 until keypressed;

 end.