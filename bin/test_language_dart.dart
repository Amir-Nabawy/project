//
//
// Q1 - task_1

double calculateTotal(double a, double b, double c) => a + b + c;
double calculateAverage(double total) => total / 3;
String getResult(double average) => average >= 50 ? " pass" : " Fail ";
void main() {
  double total = calculateTotal(10, 50, 6);
  double average = calculateAverage(total);
  String result = getResult(average);

  print(total);
  print(average);
  print(result);
}
