// Experiment 1b: Dart language basics



void main() {
  // ---------- 1. variables and data types ----------
  String name = 'Ravi';
  int age = 20;
  double height = 5.9;
  bool isStudent = true;
  var city = 'Mumbai'; // dart works out the type by itself
  final country = 'India'; // can be set only once
  const pi = 3.14; // fixed at compile time

  print('--- Variables ---');
  print('$name is $age years old and lives in $city, $country');
  print('Height: $height, Student: $isStudent, Pi: $pi');
  print('Name in capitals: ${name.toUpperCase()}');

  // ---------- 2. operators ----------
  int a = 10;
  int b = 3;
  print('\n--- Operators ---');
  print('a + b = ${a + b}');
  print('a - b = ${a - b}');
  print('a * b = ${a * b}');
  print('a / b = ${a / b}'); // gives a decimal
  print('a ~/ b = ${a ~/ b}'); // integer division
  print('a % b = ${a % b}');

  // ---------- 3. if / else ----------
  int marks = 72;
  print('\n--- If else ---');
  if (marks >= 90) {
    print('Grade A');
  } else if (marks >= 70) {
    print('Grade B');
  } else if (marks >= 50) {
    print('Grade C');
  } else {
    print('Fail');
  }

  // ---------- 4. loops ----------
  print('\n--- Loops ---');
  for (int i = 1; i <= 5; i++) {
    print('for loop: $i');
  }

  int count = 3;
  while (count > 0) {
    print('while loop: $count');
    count--;
  }

  // ---------- 5. list ----------
  print('\n--- List ---');
  List<String> fruits = ['apple', 'banana', 'mango'];
  fruits.add('orange');
  print(fruits);
  print('Total fruits: ${fruits.length}');
  print('First fruit: ${fruits[0]}');
  for (var f in fruits) {
    print('I like $f');
  }

  // ---------- 6. map (key : value) ----------
  print('\n--- Map ---');
  Map<String, int> subjectMarks = {'Maths': 80, 'Physics': 75};
  subjectMarks['Chemistry'] = 90; // adding a new entry
  subjectMarks.forEach((subject, m) {
    print('$subject -> $m');
  });

  // ---------- 7. functions ----------
  print('\n--- Functions ---');
  print('add(5, 7) = ${add(5, 7)}');
  print('Is 8 even? ${isEven(8)}');
  print('Is 7 even? ${isEven(7)}');

  // ---------- 8. class and object ----------
  print('\n--- Class and object ---');
  Student s1 = Student('Ravi', 20, 8.5);
  Student s2 = Student('Sita', 21, 9.1);
  s1.showDetails();
  s2.showDetails();

  // ---------- 9. null safety ----------
  print('\n--- Null safety ---');
  String? nickname; // the ? means this can be null
  print(nickname ?? 'No nickname yet'); // ?? gives a default value
  nickname = 'Ravs';
  print('Nickname: $nickname');
}
