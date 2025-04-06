import 'dart:io';

void main() {
  print('Enter number of students:');
  int n = int.parse(stdin.readLineSync()!);
  List<Map<String, dynamic>> students = [];  //Here i create a Map

  for (int i = 0; i < n; i++) { //Each time it will take one students information
    print('Enter name of student:');
    String name = stdin.readLineSync()!;

    print('Enter scores separated by space:');
    List<int> scores = stdin
        .readLineSync()!
        .split(' ')
        .map((e) => int.parse(e))
        .toList(); //Taking scores and store in List

    students.add({"name": name, "scores": scores}); //Add those taken name and scores in the map
  }

  Map<String, double> avgScores = {}; //Created another Map for store average scores and name
  for (var student in students) {
    String name = student["name"];
    List<int> scores = List<int>.from(student["scores"]);

    int total = 0;
    for (var score in scores) {
      total += score; // Adding those scores together
    }

    double avg = total / scores.length;
    avg = double.parse(avg.toStringAsFixed(2));
    avgScores[name] = avg;
    //At a time take one student information and convert scores Map to List and average them. Then add all into new Map
  }

  var sortedList = avgScores.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value)); //Sort the list in descending order. Just comparing and store

  //Here i can sort the List but can't sort the Map so i did it on List.
  //Now put the List into Map

  Map<String, double> sortedMap = {
    for (var i in sortedList) i.key: i.value
  };

  print(sortedMap);
}


//Take the students information as input
//Average given scores
//tore the results in a map, where the student’s name is the key and their average score is the value.
//Sort the map in descending order of average scores and print the final sorted result.