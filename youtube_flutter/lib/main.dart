import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:youtube_flutter/models/student.dart';
import 'package:youtube_flutter/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Fırat Can", "Yıldırım", 95),
    Student.withId(2, "Mehmet Can", "Özdemir", 45),
    Student.withId(3, "Emre", "Ürker", 25)
  ];
  Student selectedStudent = Student.withId(0, "", "", 0);
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
                      students[index].grade.toString() +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img2.pngindir.com/20180701/eta/kisspng-computer-icons-user-profile-avatar-icon-5b3899483fa7a8.4711163815304359122607.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                    print(selectedStudent.firstName + " seçildi");
                  },
                  onLongPress: () {
                    print("uzun tıklandı");
                  },
                ); //Text(students[index].firstName);
              }),
        ),
        Text("Seçili öğrenci : " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Yeni öğrenci")
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) => StudentAdd(students)));
                  },
                )
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.black12,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("güncelle")
                    ],
                  ),
                  onPressed: () {
                    print("güncelle");
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("sil")
                    ],
                  ),
                  onPressed: () {
                    print("sil");
                  },
                ))
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.done);
    else if (grade > 40) return Icon(Icons.album);
    return Icon(Icons.clear);
  }
}
