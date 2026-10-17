import 'dart:ffi';

//Q1 - task_1

double calculateTotal(double price, int quantity) {
  return price * quantity;
}

void main() {
  print('calculateTotal =  ${calculateTotal(50, 6)}');
}

// Q2 - task_2

String greetUser(String name, [String? greeting]) {
  return '$name ${greeting ?? 'Hello'}';
}

void main() {
  print(greetUser('Amir', 'Welcom'));
}

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
  print(calculateOrder(20, 5));
}

// Q4 - task_4

List<int> filterNumbers(
  List<int> numbers, {
  int min = 0,
  int max = 100,
  bool includeEven = true,
}) {
  return numbers
      .where(
        (number) =>
            number >= min &&
            number <= max &&
            ((includeEven && number % 2 == 0) ||
                (!includeEven || number % 2 == 0)),
      )
      .toList();
}

void main() {
  print(
    filterNumbers(
      [1, 2, 5, 8, 10, 11, 12, 15],
      min: 2,
      max: 12,
      includeEven: false,
    ),
  );
}

//  Q5 - task_5

double calculateCartTotal(
  List<double> prices, {
  double discountPercent = 0,
  double taxPercent = 14,
  double deliveryFee = 0,
  bool isMember = false,
  double maxDiscount = 100,
}) {
  double subtotal = 0;
  for (var price in prices) {
    subtotal += price;
  }
  if (isMember == true) {
    discountPercent += 5;
  }
  if (discountPercent > maxDiscount) {
    discountPercent = maxDiscount;
  }
  subtotal = subtotal - (subtotal * (discountPercent / 100));
  subtotal += (subtotal * (taxPercent / 100));
  subtotal += deliveryFee;
  return subtotal;
}

void main() {
  print(calculateCartTotal([100, 200, 50]));

  print(
    calculateCartTotal(
      [100, 200, 50],
      discountPercent: 10,
      taxPercent: 14,
      deliveryFee: 25,
    ),
  );
  print(
    calculateCartTotal(
      [100, 200, 50],
      discountPercent: 10,
      isMember: true,
      maxDiscount: 12,
    ),
  );

  print(calculateCartTotal([]));
}
