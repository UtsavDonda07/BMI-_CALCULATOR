import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'calculate.dart';
import 'result.dart';
import 'reusableCard.dart';
import 'constant.dart';


enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;

  // void updateColor(Gender Selectedgender){
  //   if(Selectedgender==Gender.male){
  //     //male
  //     if(maleCardColor==inActiveCardColor){
  //       maleCardColor=ActiveCardColor;
  //       femaleCardColor=inActiveCardColor;
  //     }
  //     else{
  //       maleCardColor=inActiveCardColor;
  //     }
  //   }
  //   //female
  //   else {
  //     if(femaleCardColor==inActiveCardColor){
  //       femaleCardColor=ActiveCardColor;
  //       maleCardColor=inActiveCardColor;
  //     }
  //     else{
  //       femaleCardColor=inActiveCardColor;
  //     }
  //   }
  // }

  Gender? SelectedGender;
  int height = 150;
  int age = 18;
  int weight = 55;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedGender = Gender.male;
                        // updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      cardcolor: SelectedGender == Gender.male
                          ? ActiveCardColor
                          : inActiveCardColor,
                      childCard: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'images/male.png',
                              height: 130,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedGender = Gender.female;
                        // updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      cardcolor: SelectedGender == Gender.female
                          ? ActiveCardColor
                          : inActiveCardColor,
                      childCard: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'images/female.png',
                              height: 130,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // second Container
          Expanded(
            child: Row(

              children: [
                Expanded(
                  child: ReusableCard(
                    cardcolor: ActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(fontSize: 20),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,


                          children: [
                            Text(
                              '${height}',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w800),
                            ),
                            Text('cm', style: TextStyle(
                              fontSize: 20,),),
                          ],
                        ),


                        Slider(
                          min: 100,
                          max: 250,
                          value: height.toDouble(),
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF0A0E34),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                              // print(height);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardcolor: ActiveCardColor,
                    childCard: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(Icons.remove, size: 40),
                              ),
                            ),
                            Container(
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardcolor: ActiveCardColor,
                    childCard: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'AGE',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(Icons.remove, size: 40),
                              ),
                            ),
                            Container(
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          FlatButton(
            onPressed: () {
             Calculate c = Calculate(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result(bmianswer: c.CalculateBMI(),result: c.getResult(),interpretation: c.getInterpretation());
                  },
                ),
              );
            },

            child: Column(

              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: bottomContainerHeight,
                  color: bottomContainerColor,
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
