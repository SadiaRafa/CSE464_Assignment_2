

import 'package:assignment_1/Widgets/Simple%20Input%20Field.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8F8);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tip Calculator", style: TextStyle(fontSize: 18, color: Colors.pink, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black38,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text("Total Bill" ,style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: textBlack)),
                    Text("\$ ${totalBillController.text}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: textBlack)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Persons", style: TextStyle(color: textLightBlack)),
                        Text("Tip Amount", style: TextStyle(color: textLightBlack))
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("05", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textLightBlack)),
                        Text("\$ 20.0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textLightBlack))
                      ],
                    ),


                  ],
                ),

              ),

              const SizedBox(
                height: 10,
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount per person", style: TextStyle(color: textLightBlack)),
                    Text("\$ 20.0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textLightBlack))
                  ],
                ),
              ),

              const Spacer(),

              SimpleInputField(controller: totalBillController,
                  title: "Total Bill",
                  iconData: Icons.attach_money,
                  hintText: "Enter Total Bill"
              ),

              SimpleInputField(controller: totalTipController,
                  title: "Tip Percentage",
                  iconData: Icons.percent,
                  hintText: "Please Enter Tip Percentage"
              ),

              SimpleInputField(controller: totalPeopleController,
                  title: "Number of people ",
                  iconData: Icons.person_4,
                  hintText: "Please Enter total number"
              ),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                      } ,
                      child: Container(
                        margin: const EdgeInsets.only(top:10),
                        padding: const EdgeInsets.symmetric(vertical:10, horizontal: 45) ,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.center,
                        child: const Text("Calculate", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  GestureDetector(
                    onTap: (){
                      formKey.currentState!.validate();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      decoration: BoxDecoration(
                          color: clearButtonColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text("Clear", style: TextStyle(color: Colors.white),),
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ) ,

    );
  }
}
