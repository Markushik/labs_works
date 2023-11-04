{
    Лабараторная работа №6.
    Заполнить массив вещественного (или целого) типа, записать в другой массив
    элементы, которые меньше среднего арифметического данного массива.
}

program project;

const
  n = 5;
type
  IntArray = Array[1..n] of Integer;

function SumOfElements(n: Integer; arr1: IntArray): Integer;
  var i, sum: Integer;
  begin
    sum := 0;
    for i := 1 to n do
        sum := sum + arr1[i];
  end;

function CountAverage(n: Integer; sum: Integer): Real;
  var average: Real;
  begin
    average := sum / n;
  end;

procedure SelectElement(n: Integer; average: Real; arr1: IntArray; var arr2: IntArray; var j: Integer);
  var i: Integer;
  begin
    j := 0;

    for i:=1 to n do
        if (arr1[i] < average) then
          begin
            j := j + 1;
            arr2[j] := arr1[i];
          end;
  end;

procedure OutputElements(k: Integer; j: Integer; arr2: IntArray);
  begin
    for k:=1 to j do
     WriteLn('Элемент нового массива: ', arr2[k]);
  end;

var
  arr1, arr2: IntArray;
  sum, j, k: Integer;
  average: Real;

begin

  // --- Ввод данных ---
  for k:=1 to n do
   begin
     Write('Введите ',k,' элемент: ');
     ReadLn(arr1[k]);
   end;

  WriteLn();
  sum := SumOfElements(n, arr1);
  WriteLn('Сумма элементов: ', sum);
  average := CountAverage(n, sum);
  WriteLn('Среднее арифметическое: ', average:1:2);
  WriteLn();

  SelectElement(n, average, arr1, arr2, j);
  OutputElements(k, j, arr2);

  ReadLn();

end.
