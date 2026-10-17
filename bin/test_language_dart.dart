void main() {
  
  List<Map<String, dynamic>> students = [
    {
      'name': 'Amir',
      'grades': {'Math': 95, 'English': 90, 'Science': 85}
    },
    {
      'name': 'Haneen',
      'grades': {'Math': 90, 'English': 85, 'Science': 88}
    },
    {
      'name': 'Ahmed',
      'grades': {'Math': 45, 'English': 50, 'Science': 48}
    },
    {
      'name': 'Mona',
      'grades': {'Math': 88, 'English': 92, 'Science': 90}
    }
  ];

  double totalClassSum = 0;
  int passedCount = 0;
  String topStudent = '';
  double highestAvg = -1;
  String lowestStudent = '';
  double lowestAvg = 99999;
  List<String> allAbove80 = [];

  for (var student in students) {
    String name = student['name'];
    Map<String, int> grades = student['grades'];

    double sum = 0;
    int count = grades.length;
    bool above80InAll = true;

    for (var grade in grades.values) {
      sum += grade;
      if (grade < 80) {
        above80InAll = false;
      }
    }
    double avg = count > 0 ? sum / count : 0;
    student['average'] = avg;
    String status = '';
    if (avg >= 85) {
      status = 'Excellent';
    } else if (avg >= 70) {
      status = 'Good';
    } else if (avg >= 50) {
      status = 'Pass';
    } else {
      status = 'Fail';
    }
    student['status'] = status;
    totalClassSum += avg;

    if (avg >= 50) {
      passedCount++;
    }
    if (avg > highestAvg) {
      highestAvg = avg;
      topStudent = name;
    }
    if (avg < lowestAvg) {
      lowestAvg = avg;
      lowestStudent = name;
    }
    if (above80InAll && count > 0) {
      allAbove80.add(name);
    }
  }
  double classAverage = students.isNotEmpty ? totalClassSum / students.length : 0;
  print('               ');
  for (var student in students) {
    print('Name: ${student['name']} | Average: ${student['average'].toStringAsFixed(2)} | Status: ${student['status']}');
  }
  print('Class Average: ${classAverage.toStringAsFixed(2)}');
  print('Top Student: $topStudent (Avg: ${highestAvg.toStringAsFixed(2)})');
  print('Lowest Student: $lowestStudent (Avg: ${lowestAvg.toStringAsFixed(2)})');
  print('Passed Students Count: $passedCount');
  print('Students with >= 80 in every subject: $allAbove80\n');
  String searchName = 'Mona';
  bool found = false;
  print('SEARCH');
  for (var student in students) {
    if (student['name'] == searchName) {
      found = true;
      print('Student Found: ${student['name']}');
      print('Grades: ${student['grades']}');
      print('Average: ${student['average'].toStringAsFixed(2)}');
      break;
    }
  }
  if (!found) {
    print('Student not found');
  }
  print('');
  int menuChoice = 1;
  print('=== MENU (Choice: $menuChoice) ===');
  switch (menuChoice) {
    case 1:
      print('Option 1: Print all students');
      for (var student in students) {
        print('- ${student['name']} (${student['status']})');
      }
    case 2:
      print('Option 2: Show class average -> ${classAverage.toStringAsFixed(2)}');
    case 3:
      print('Option 3: Show top student -> $topStudent');
    case 4:
      print('Option 4: Search for a student executed above.');
    case 5:
      print('Option 5: Exit');
    default:
      print('Invalid choice');
  }
}

