//
//
// Q1 - task_1

import 'dart:js_interop';

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

//
//
// Q2 - task_2

class Student {
  String? name;
  int? age;
  double? grade;

  Student({this.name, this.age, this.grade});

  void displayInfo() {
    print(' Name : $name , Age : $age , Grade : $grade');
  }

  bool isPassed() => grade! >= 50;
}

Student findTopStudent(List<Student> students) {
  if (students.isEmpty) {
    throw Error();
  }

  Student topStudent = students.first;
  for (var student in students) {
    if ((student.grade!) > (topStudent.grade!)) {
      topStudent = student;
    }
  }
  return topStudent;
}

void main() {
  Student student1 = Student(name: 'Amir', age: 19, grade: 92);
  Student student2 = Student(name: 'Haneen', age: 19, grade: 85);
  Student student3 = Student(name: 'Ahmed', age: 15, grade: 40);

  student1.displayInfo();
  student2.displayInfo();
  student3.displayInfo();
  print(student1.isPassed());
  print(student2.isPassed());
  print(student3.isPassed());
  Student top = findTopStudent([student1, student2, student3]);
  top.displayInfo();
}

//
//
// Q3  task_3

class BankAccount {
  String? accountHolder;
  double? _balance;

  BankAccount({this.accountHolder, double? balance}) {
    if (balance != null && balance >= 0) {
      _balance = balance;
    } else {
      _balance = 0.0;
    }
  }

  double? get balance => _balance;
  set balance(double? value) {
    if (value != null && value >= 0) {
      _balance = value;
    } else {
      print('Error');
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance = (_balance ?? 0) + amount;
      print(' ok deposit $amount  banace . $_balance');
    } else {
      print('Not deposited');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= (_balance ?? 0)) {
      _balance = (_balance ?? 0) - amount;
      print(" ok withdraw $amount . $_balance");
    } else {
      print("Not withdraw");
    }
  }
}

void main() {
  BankAccount myAccount = BankAccount(accountHolder: 'Amir');
  myAccount.deposit(900);
  myAccount.withdraw(100);
}

//
//
// Q4 - task_4

class Product {
  String? name;
  int? id;
  num? _price;
  int? _quantity;

  Product({this.name, this.id, num? price, int? quantity}) {
    if (price != null && price >= 0) {
      _price = price;
    } else {
      _price = 0;
    }
    if (quantity != null && quantity >= 0) {
      _quantity = quantity;
    } else {
      _quantity = 0;
    }
  }
  num? get price => _price;
  int? get quantity => _quantity;

  set price(num? value) {
    if (value != null && value >= 0) {
      _price = value;
    } else {
      print("Error");
    }
  }

  set quantity(int? value) {
    if (value != null && value >= 0) {
      _quantity = value;
    } else {
      print('Error');
    }
  }

  void updateStock(int amount) {
    if ((_quantity ?? 0) + amount >= 0) {
      quantity = (_quantity ?? 0) + amount;
      print('Updated successfully, current quantity:  $_quantity ');
    } else {
      print("Error");
    }
  }

  num calculateTotalValue() => (price ?? 0.0) * (quantity ?? 0);

  static Product? findProduct(List<Product> products, int searchId) {
    for (var product in products) {
      if (product.id == searchId) {
        return product;
      }
    }
    return null;
  }
}

void main() {
  List<Product> inventory = [
    //0
    Product(name: ' Ipon ', id: 123, price: 98000, quantity: 10),
    //1
    Product(name: 'sumsung ', id: 124, price: 40000, quantity: 10),
    //2
    Product(name: 'oppo', id: 135, price: 12000, quantity: 15),
  ];

  print('Total Value of phones: ${inventory[1].calculateTotalValue()}');

  Product? search = Product.findProduct(inventory, 124);
  if (search != null) {
    print('search product = ${search.name} , price ${search._price} ');
  } else {
    print('Product not search');
  }

  inventory[1].updateStock(5);
}
