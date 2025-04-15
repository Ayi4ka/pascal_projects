program AS_1_kakaya_eto_popitka; {Задаем название программы, надеюсь я сейчас сдам эту прекраснную программу}

Uses System, System.IO, crt; {Объявляем необходимые модули}

var {Объявляем необходимые переменные}
  nomer: integer;
  newf, ffileway, dfile, fileway, fileways, words, choose: string;
  v: array of string;

begin
  ClrScr;
  Writeln('Привет! Добро пожаловать в эту кривую программу, она тебе поможет обитать в данном пространсве');
  Readln;
  
  ffileway := Environment.GetEnvironmentVariable('userprofile') + '\Desktop'; {Меняет директорию на рабочий стол}
  
  while nomer <> 7 do
  begin
    ffileway := Path.GetFullPath(ffileway); {оператор который приводит путь к нормальному виду}
    
    Writeln('Дорогой друг, скажи, пожалуйста что ты вообще хочешь, варианты ниже, просто цифру введи, не тупи дааа'); {вводим список команд}
    Writeln('1.Хочу узнать что тут находится');
    Writeln('2.Хочу быть создателем папки / текстового файла');
    Writeln('3.Хочу видеть содержимое выбранного текстового файла');
    Writeln('4.Хочу удалить все к чертику');
    Writeln('5.Хочу копировать/ вставить файл');
    Writeln('6.Хочу переместиться в другую папку');
    Writeln('7.Хочу покинуть эту бренную программу');
    Readln(nomer);
    case nomer of {вводим оператор множественного выбора}
      1: {Нажимая цифру 1 узнаем содержание данной директории}
        begin
          v := System.IO.Directory.GetDirectories(ffileway);
          for var i := 1 to v.Length - 1 do writeln(v[i]); {выводим папки}
          v := system.IO.Directory.GetFiles(ffileway);
          for var i := 1 to v.Length - 1 do writeln(v[i]); {выводим файлы}
          Readln;
        end;
      2: {Нажимая цифру 2 создаем папку или текстовый файл}
        begin
          writeln('Что хочешь создать? Файл(1) или папку(2)?'); {Делаем выборку}
          Readln(choose); 
          if (choose = '1') then {При выборе 1, создаем файл}
          begin
            Writeln('Название файла:'); 
            readln(newf);
            Writeln('Введите текст:'); 
          readln(words);
          System.IO.File.WriteAllText(ffileway + '\' + newf, words) {Оператор создания файла,к полному пути добавляем название нового файла, и записываем текст}
          end else if (choose = '2') then {При выборе 2, создаем папку}
            begin
              Writeln('Названreие папки:'); 
              readln(newf);
              Directory.CreateDirectory(ffileway + '\' + newf); {Создаем новую папку, к полному пути добавляем название новой папки и создаем ее}
            end;
        end;
      3: {Нажимая цифру 3 выбираем файл, у которого хотим узнать содержание}
        begin
          writeln('Введи имя файла у которого вывести содержимое'); 
          readln(dfile);
          ClrScr;
          Writeln(System.IO.File.ReadAllText(ffileway + '\' + dfile)); {Оператор чтение этого файла, к полному пути добавляется имя файла у которого необходимо вывести содержание, и оно считывается}
          Readln;
        end;
      4: {Нажимая цифру 4 выбираем файл, который хотим удалить}
        begin
          writeln('Введи имя файла который надо удалить');Directory.Delete('asdasd', true) {удааааалиии}
          readln(dfile);
          System.IO.File.Delete(ffileway + '\' + dfile) {Оператор удаления файла, к полному пути добавляется имя файла который надо удалить}
        end;
      5: {Нажимая цифру 5 копируем и вставляем файл}
        begin
          writeln('Введи путь файла который нужно скопировать'); 
          readln(fileway);
          writeln('Введи путь куда необходимо скопировать файл');
          readln(fileways);
          System.IO.File.Copy(fileway, fileways); {Оператор, который скопирует файл из одного пути(заданный сначала) в другой(заданный в конце)}
        end;
      6: {Нажимая цифру 6 меняем папку}
        begin
          writeln('Куда переместиться (наберите полный путь)');
          Readln(ffileway);
        end;
    end;
    
  end;
end.