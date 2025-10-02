import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorScreen> {
  var wtController = TextEditingController();
  var htController = TextEditingController();

  var result = "";

  var bgColor = Colors.black;
  var category = "";
  var message ="";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //Header
      Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.teal.shade200,
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 1)
                        ) ] ,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            Colors.teal.shade800
                          ])
                    ),
                    child: Column(
                      children: [
                        Text("BMI Calculator",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                        Text('Calculate Your Body Mass Index',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
          SizedBox(height: 27,),
          Column(
            children: [
              Padding(
                //TEXT FIELD FOR WEIGHT ✅
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your in kg'),
                    prefixIcon: Icon(Icons.line_weight),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2
                      )
                    )
                ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                //TEXT FIELD FOR HEIGHT ✅
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: htController,
                  decoration: InputDecoration(
                    label: Text("Enter your height in cm"),
                    prefixIcon: Icon(Icons.height),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2
                      )
                    )
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              //Calculate BMI Button ✅
              ElevatedButton(onPressed:(){
                var wt = wtController.text.toString();
                var ht = htController.text.toString();


                if(wt != "" &&  ht != ""){
                  var iwt = int.parse(wt);
                  var iht = int.parse(ht)/100;

                  var bmi = iwt/(iht*iht);


                  setState(() {
                    message = "Your BMI IS:";
                    result = "${bmi.toStringAsFixed(2)}";


                    if(bmi < 18.5){
                      category = "UNDERWEIGHT";
                      bgColor = Colors.yellow.shade800;
                    }else if(bmi < 25){
                      category = "NORMAL";
                      bgColor = Colors.green;
                    }else if(bmi < 30){
                      category = "OVERWEIGHT";
                      bgColor = Colors.orange.shade700;
                    }else{
                      category = "OBESE";
                      bgColor = Colors.red;
                    }
                  });
                }else{
                  setState(() {
                    message = '';
                    result = "Please fill all the requied blanks!!";
                    category = '';
                  });
                }

              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade500
                ), child: Text("Calculate BMI",
                  style: TextStyle(
                    color: Colors.white
                  ),
              )
              ),
              SizedBox(height: 15,),
              if(result == "Please fill all the requied blanks!!")
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )else
                  Column(
                    children: [
                      Text(message,style: TextStyle(fontSize:20,color: bgColor,height: 1.0 ),),
                      Text(result,style: TextStyle(fontSize: 40,color: bgColor,fontWeight: FontWeight.bold,height: 1.0),),
                      Text(category,style: TextStyle(fontSize: 25,color: bgColor,fontWeight: FontWeight.bold,height: 1.0),)
                    ],
                  )
            ],
          )
        ],
      ),
    );
  }
}