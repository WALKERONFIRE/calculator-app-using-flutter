import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Calculator(),


    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}



class _CalculatorState extends State<Calculator> {
String finalResult='0';
String result='0';
double num1 =0.0;
double num2 = 0.0;
String opr='';

buttonPressed(String btnVal)
{
  if(btnVal == 'AC')
  {
    finalResult='0';
    num1 =0.0;
    num2 = 0.0;
    opr='';
  }
  else if (btnVal== '+' || btnVal== '-'||btnVal=='X'||btnVal=='/' )
  {
    num1 = double.parse(result);
    opr = btnVal;
    finalResult='0';
    result = result+btnVal;
  }
  else if (btnVal == '.')
  {
    if(finalResult.contains('.'))
    {

    }
    else
    {
      finalResult = finalResult+btnVal;
    }
  }
  else if (btnVal == '+/-')
  {
    if(result.toString().contains('-'))
    {
      result.toString().substring(1);
      finalResult=result;
    }
    else
    {
      result = '-'+result;
            finalResult=result;

    }
  }
   else if (btnVal == '%')
   {
    num2=double.parse(result);
    finalResult=(num2/100).toString();
   }
    else if (btnVal == '=')
    {
    num2=double.parse(result);

    if (opr == '+')
    {
          finalResult=(num1+num2).toString();
    }
    if (opr == '-')
    {
          finalResult=(num1-num2).toString();
    }
    if (opr == 'X')
    {
          finalResult=(num1*num2).toString();
    }
    if (opr == '/')
    {
          finalResult=(num1/num2).toString();
    }
    var parsedResult = double.tryParse(finalResult);
    if (parsedResult != null && parsedResult.floor() == parsedResult) {
      finalResult = parsedResult.toInt().toString();
    }
    }
  else 
  {
  
    finalResult = finalResult +btnVal;
  }
  
  setState(() {
    result = double.parse(finalResult).toString();
  });
}


  Widget buttonForm(String buttonTxt , Color buttonColor , Color backgroundColor )
{
 if(buttonTxt!='0')
 {
 return Container(child: RawMaterialButton(
    
    onPressed: (){

      buttonPressed(buttonTxt);
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0)
    ),
    padding: EdgeInsets.all(15),
    fillColor: backgroundColor,
    child: Text(buttonTxt ,style: TextStyle(
      fontSize: 35,
      color: buttonColor
       
    ),),
    
    ),
    
    );

 }

 else
 {
 return Container(child: RawMaterialButton(
    
    onPressed: (){
      buttonPressed(buttonTxt);
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0)
    ),
    padding: EdgeInsets.fromLTRB(36, 9 , 128 , 20),
    fillColor: backgroundColor,
    child: Text(buttonTxt ,style: TextStyle(
      fontSize: 35,
      color: buttonColor
       
    ),),
    
    ),
    
    );

 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(147, 29, 46, 57),
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Color.fromARGB(255, 29, 36, 49),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
children:[
      Text('$finalResult',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 100,
          ),
            )
],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          buttonForm('AC' , Colors.white ,Colors.blue ),
          buttonForm('+/-' , Colors.white ,Colors.blue ),
          buttonForm('%' , Colors.white ,Colors.blue ),
          buttonForm('/' , Colors.black ,Colors.white ),

          ],
          ),

SizedBox(height: 30,),
  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          buttonForm('7' , Colors.white ,Colors.blue ),
          buttonForm('8' , Colors.white ,Colors.blue ),
          buttonForm('9' , Colors.white ,Colors.blue ),
          buttonForm('X' , Colors.black ,Colors.white ),

          ],
          ),
SizedBox(height: 30,),
Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          buttonForm('4' , Colors.white ,Colors.blue ),
          buttonForm('5' , Colors.white ,Colors.blue ),
          buttonForm('6' , Colors.white ,Colors.blue ),
          buttonForm('-' , Colors.black ,Colors.white ),

          ],
          ),

SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          buttonForm('1' , Colors.white ,Colors.blue ),
          buttonForm('2' , Colors.white ,Colors.blue ),
          buttonForm('3' , Colors.white ,Colors.blue ),
          buttonForm('+' , Colors.black ,Colors.white ),

          ],
          ),


SizedBox(height: 30,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
          buttonForm('0' , Colors.white ,Colors.blue ),
          buttonForm('.' , Colors.white ,Colors.blue ),
          buttonForm('=' , Colors.black ,Colors.white ),

          ],
          ),




        ],
        
        ),
      
      ),
    );
  }
}
