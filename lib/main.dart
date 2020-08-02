import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstNum;
  int secondNum;
  String texttodisplay = "";
  String result;
  String operator;
  void btnclicked(String btnValue){
    if(btnValue == 'C'){
      texttodisplay = "";
      firstNum = 0;
      secondNum = 0;
      result = "";
    }
    else if(btnValue == '+' || btnValue == '-' || btnValue == 'X' || btnValue == '/' ){
      firstNum = int.parse(texttodisplay);
      result="";
      operator = btnValue;
    }
    else if(btnValue == '='){
      secondNum = int.parse(texttodisplay);
      if(operator == '+'){
        result = (firstNum + secondNum).toString();
      }
      if(operator == '-'){
        result = (firstNum - secondNum).toString();
      }
      if(operator == 'X'){
        result = (firstNum * secondNum).toString();
      }
      if(operator == '/'){
        result = (firstNum / secondNum).toString();
      }
    }
    else{
      result = int.parse(texttodisplay + btnValue).toString();
    }

    setState(() {
      texttodisplay = result;
    });
  }


  Widget custombutton(String btnValue){
    return Expanded(
      child: OutlineButton(
        onPressed: ()=> btnclicked(btnValue),
        padding: EdgeInsets.all(25.0),
        child: Text(
          '$btnValue',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',

        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  '$texttodisplay',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('X'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('C'),
                custombutton('0'),
                custombutton('='),
                custombutton('/'),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
