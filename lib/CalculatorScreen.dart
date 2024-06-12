import 'dart:html';

import 'package:calculator/Buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:calculator/Buttons.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
    
                  child: Text('0001',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
            ),
            Wrap(  
              children: 
              Btn.buttonValues
              .map((value) => SizedBox(
                height: ScreenSize.width/5,
                width: ScreenSize.width/4,
                child: buttonWidget(value)
                )
              ).toList(),
            )
          ],
          ),
      ),
    );
  }
  Widget buttonWidget(value){
    return Padding(
      padding: EdgeInsets.all(4),
      child: Material(
        color: buttoncolor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.white24
          )
        ),
        child: InkWell(
          onTap: (){
            print("pressed");
          },
          child: Center(
            child: Text(value,
            style: TextStyle(fontSize: 25),
              ),
          )
          ),
      ),
    );
  }
  Color buttoncolor(value){
    if ([Btn.del, Btn.clr].contains(value)) {
      return const Color.fromARGB(255, 207, 72, 62);
    } else if ([Btn.add, Btn.multiply, Btn.calculate, Btn.divide, Btn.dot, Btn.subtract, Btn.per].contains(value)) {
      return Color.fromARGB(255, 43, 123, 189);
    }else if([Btn.mode].contains(value)){
      return const Color.fromARGB(255, 19, 75, 103);
    } 
    else {
      return Colors.black;
    }

  }
}