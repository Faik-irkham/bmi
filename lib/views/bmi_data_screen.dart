
import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  //double calculateBmi(){
   // double heightInMeter = height / 100;
   //final h = pow(height, 2);
   // final h = (heightInMeter * heightInMeter);
    //final bmi = weight / h;
   // return bmi;
 // }

 List<Widget> generateList(Start, end){
  List<Widget> weights = [];
  for (var i = Start; i < end; i++){
    weights.add(
      Text(
        "$i",
        style: labelTextStyle!.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
  return weights;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: const Text("BMI CALCULATOR",
          style:  TextStyle(
              fontSize: 18,
               fontWeight: FontWeight.bold,
            ),
          ),
          ),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            final bmiCalculator = BmiCalculator(height: height, weight: weight);
            bmiCalculator.calculateBmi();

            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) {
                   return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                   );
                }),
              ),
            );
          },
           child: Container(
            height: 40,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff517DF6),
            ),
            child: const Center(child: Text("Calculate BMI",
            style:  TextStyle(
              fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.white,
            ),
            ),
            ),
           ),
         ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children:  [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    gender = "male";
                    setState(() {
                    });
                  },
                child: BmiCard(
                  borderColor: 
                  (gender == "male") ?Colors.white : Color(0xff517DF6),
                  child: Stack(
                    children: [
                     const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: GenderIconText(
                            icon: Icons.boy_outlined,
                            title: 'Male',
                          ),
                        ),
                      ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(Icons.check_circle,
                            color: (gender == "male") ? Colors.white : Color(0xff517DF6),
                          ),
                        ),
                    ],
                  ),
                ),
                ),
               ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor: 
                    (gender == "female") ?Colors.white : Color(0xff517DF6),
                    child: Stack(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: GenderIconText(
                              icon: Icons.girl_outlined,
                              title: 'Female',
                              ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(Icons.check_circle,
                            color: (gender == "female") ? Colors.white : Color(0xff517DF6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "HEIGHT",
                  style:  TextStyle(
              fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.black,
            ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                            value: height.toDouble(),
                            min: 80,
                            max: 200,
                            thumbColor: Colors.red,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              height = value.toInt();
                              setState(() {});
                            },
                           ),
                        ),
                    ),
                    BmiCard(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15.0,
                        ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$height",
                          style: labelTextStyle,
                          ),
                          
                          Text(
                            "cm",
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ],
                ),
                
              ],
            ),
            const SizedBox(height: 20),
            Container (
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Weight",
                          style:  TextStyle(
              fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.black,
            ),
                          ),
                        BmiCard(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                              Container(
                                height: MediaQuery.of(context).size.height * 0.15,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(initialItem: 30),
                                  itemExtent: 25,
                                 magnification: 2,
                                 useMagnifier: true,
                                onSelectedItemChanged: (val){
                                  weight = val + 20;
                                }, 
                                children: generateList(20, 220),
                                ),
                              ),
                          ],
                        ),
                  ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Age",
                          style:  TextStyle(
              fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.black,
            ),
                          ),
                        BmiCard(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    child: CupertinoPicker(
                                      scrollController: FixedExtentScrollController(initialItem: 20),
                                      itemExtent: 25,
                                     magnification: 2,
                                     useMagnifier: true,
                                    onSelectedItemChanged: (val){
                                      weight = val + 20;
                                    }, 
                                    children: generateList(0, 90),
                                    ),
                                  ),
                          ],
                        ),
                  ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, 
    this.child, 
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff517DF6),
        boxShadow: [
          BoxShadow(
            offset: Offset(6, 1),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.8))
        ],
        borderRadius: BorderRadiusDirectional.circular(15),
        border: Border.all(color: borderColor!),
      ),
      margin: const EdgeInsets.all(15),
      child: child
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, 
    required this.title, 
    required this.icon,
  }) : super(key: key);

final String title;
final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(
            icon,
            size: 80,
            color:Colors.white,
        ),
        const SizedBox(height: 15),
          Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
