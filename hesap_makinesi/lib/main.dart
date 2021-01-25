import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Hesap Makinem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hesap Makinesi'),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(_counter == 10)
        _counter = 0;
    });
  }

  @override
  static double sonuc = 0.0;
  static double sonuc2 = 0.0;
  static double islem_sonuclari = 0.0;
  static String islem_turu="";
  static String onceki_islem="";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(sonuc2.toString(),style: TextStyle(fontSize: 50,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(sonuc.toString(),style: TextStyle(fontSize: 50,),),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("C"),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("%")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("DEL")
                )],
            ),
            Row(
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("7")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("8")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("9")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("/"))
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("4")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("5")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("6")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("x"))
              ],
            ),Row(
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("1")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("2")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("3")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("-"))
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("0")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton(".")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("=")),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: getButton("+"))
              ],
            )
          ],
        )

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  getButton(String textName) {
    return (RaisedButton(
      color: Colors.green,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5.0,),
          Text(textName,style: TextStyle(fontSize: 20,))
        ],
      ),
      onLongPress: (){
      setState(() {
          findStateStatus("C");
        });
      },
      onPressed: (){
        setState(() {
          findStateStatus(textName);
        });
        print("C");
      },
    ));
  }
static int idCounter = 0;
  void findStateStatus(String textName) {
    if(textName == "C")
    {
      sonuc=0;
      sonuc2=0;
    }
    else if(textName == "DEL")
    {
      sonuc=((sonuc/10).toInt()).toDouble();
    }
    else if((textName == "/" || textName =="x" || textName=="-" ||textName=="+") && idCounter%2==0)
    {
      print("esit");
      if(idCounter > 0)
        calculate(onceki_islem);
      sonuc2 = sonuc;
      sonuc = 0;
      onceki_islem = textName;
      idCounter++;
    }
    else if((textName=="=" ||textName == "/" || textName =="x" || textName=="-" ||textName=="+") && idCounter%2!=0)
    {
      calculate(onceki_islem);
      onceki_islem = textName;
      idCounter++;
      if(onceki_islem!="=")
        sonuc=0;
    }
    else if(textName == "=")
    {
      calculate(onceki_islem);
      idCounter=0;
    }
    else if(textName == ".")
    {

    }
    else if(textName == "%")
    {
      //sonuc = sonuc2 % sonuc;
      //sonuc2 = sonuc;
    }
    else
    {
      sonuc=sonuc*10+int.parse(textName);
    }
  }

  void calculate(String onceki_islem)
  {
    //if(id==1)
      //calculate(onceki_islem, 0);
    if(onceki_islem == "/")
    {
      sonuc = sonuc2/sonuc;
      sonuc2 = sonuc;
    }
    else if(onceki_islem == "x")
    {
      sonuc = sonuc2*sonuc;
      sonuc2 = sonuc;
    }
    else if(onceki_islem == "-")
    {
      sonuc = sonuc2-sonuc;
      sonuc2=sonuc;
    }
    else if(onceki_islem == "+")
    {
      sonuc = sonuc2+sonuc;
      sonuc2=sonuc;
    }
  }
}
