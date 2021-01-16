import 'package:flutter/material.dart';
import 'package:youtube_flutter/models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  List<Student> students = [
    Student.withId(1, "Fırat Can", "Yıldırım", 95),
    Student.withId(2, "Mehmet Can", "Özdemir", 55),
    Student.withId(3, "Emre", "Ürker", 25)
  ];
  @override
  Widget build(BuildContext context) {
    //return Center(child: Text("Hello World!"),);
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
        backgroundColor: Color.fromARGB(255, 0, 0, 255),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          //ekrana göre boyut ayarlama
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not : " +
                      students[index].grade.toString()),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img2.pngindir.com/20180701/eta/kisspng-computer-icons-user-profile-avatar-icon-5b3899483fa7a8.4711163815304359122607.jpg"),
                  ),
                  trailing: Icon(Icons.done),
                ); //Text(students[index].firstName);
              }),
        ),
      ],
    );
  }
}
