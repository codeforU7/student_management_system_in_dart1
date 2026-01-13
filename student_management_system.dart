// School Management System
// Day 08 – Task 01

// Base Class
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void displayInfo() {
    print("Name: $name");
    print("Age: $age");
  }
}

// Student Class
class Student extends Person {
  int rollNo;
  String grade;

  Student(String name, int age, this.rollNo, this.grade) : super(name, age);

  void study() {
    print("$name is studying.");
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("Roll No: $rollNo");
    print("Grade: $grade");
  }
}

// Teacher Class
class Teacher extends Person {
  String subject;
  double salary;

  Teacher(String name, int age, this.subject, this.salary) : super(name, age);

  void teach() {
    print("$name is teaching $subject.");
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("Subject: $subject");
    print("Salary: $salary");
  }
}

// Main Function
void main() {
  // Create Student object
  Student student1 = Student("Omkar", 20, 101, "A");
  print("---- Student Details ----");
  student1.displayInfo();
  student1.study();

  print("");

  // Create Teacher object
  Teacher teacher1 = Teacher("Mr. Sharma", 40, "Mathematics", 50000);
  print("---- Teacher Details ----");
  teacher1.displayInfo();
  teacher1.teach();
}
