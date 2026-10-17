/** Q1 - task_1

double calculateTotal(double price, int quantity) {
  return price * quantity;
}

void main() {
  print('calculateTotal =  ${calculateTotal(50 , 6)}');
}

// Q2 - task_2
String greetUser(String name, [String? greeting]) {
  return '$name ${greeting ?? 'Hello'}';
}

void main() {
  print(greetUser('Amir', 'Welcom'));
}
**/
// Q3 - task_3
dynamic calculateOrder(
  double price,
  int quantity, [
  double discount = 0,
  double deliveryFee = 0,
]) {
  return (price * quantity) - discount + deliveryFee;
}

void main() {
  print(calculateOrder(20, 5, 5, 10));
}
