import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = " ";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Your BMI')),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Container(
            width: 300,
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Weight'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in Inch)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
                        if (wt != "" && ft != "" && inch != "") {
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;

                          var tcm = tInch * 2.54;

                          var tM = tcm / 100;

                          var bmi = iWt / (tM * tM);

                          var msg =" ";

                          if(bmi>25){
                           msg = "You're OverWeight";
                           //bgColor = Colors.red.shade200;
                          }else if(bmi<18){
                            msg = "You're UnderWeight";
                            //bgColor = Colors.red.shade200;
                          }else {
                            msg = "You're Healthy";
                            //bgColor = Colors.red.shade200;
                          }

                          setState(() {
                            result = '$msg \nYour BMI is : $bmi';
                          });
                        } else {
                          setState(() {
                            result = "Please fillup all requred filed";
                          });
                        }
                      },
                      child: const Text('Calculate',style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 16,),
                  Container(
                    color: Colors.grey.shade300,
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
