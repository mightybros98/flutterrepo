import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calcScreen extends StatefulWidget {
  @override
  _calcScreenState createState() => _calcScreenState();
}

class _calcScreenState extends State<calcScreen> {
  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  buttonPressed(buttonText)
  {
    if(buttonText=='CLEAR')
      {
        _output="0";
        num1=0.0;
        num2=0.0;
        operand="";
      }
    else if(buttonText=="+"||buttonText=="-"||buttonText=="X"||buttonText=="/")
      {
        num1=double.parse(output);
        operand=buttonText;
        _output="0";
      }
    else if(buttonText==".")
    {
      if(output.contains("."))
        {
          print("Already contains a decimal");
          return;
        }
      else{
        _output=_output+"."+buttonText;
      }
    }
    else if(buttonText=="=")
      {
        num2=double.parse(output);
        if(operand=="+")
          {
            _output=(num1+num2).toString();
          }

        if(operand=="-")
        {
          _output=(num1-num2).toString();
        }

        if(operand=="X")
        {
          _output=(num1*num2).toString();
        }

        if(operand=="/")
        {
          _output=(num1/num2).toString();
        }
        num1=0.0;
        num2=0.0;
        operand="";
      }
    else{
      _output=_output+buttonText;
    }
    print(_output);
    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText)
  {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24),
        child: Text(buttonText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12
          ),
          child: Text(output,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
        ),

        Expanded(
          child: Divider(),
        ),

        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ],
            ),

            Row(
              children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ],
            ),

            Row(
              children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ],
            ),

            Row(
              children: <Widget>[
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ],
            ),

            Row(
              children: <Widget>[
                buildButton("CLEAR"),
                buildButton("="),
              ],
            ),


          ],
        )
      ],
    );
  }
}

