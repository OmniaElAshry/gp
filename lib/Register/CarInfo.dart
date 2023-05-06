import 'package:flutter/material.dart';
import 'package:gp/Register/Verfication.dart';

class CarInfo extends StatelessWidget {
  const CarInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController carmodel = TextEditingController();
  TextEditingController carcolor = TextEditingController();
  TextEditingController carplatenumber = TextEditingController();

  TextEditingController carimage = TextEditingController();
  TextEditingController carplateimage = TextEditingController();
  TextEditingController carlicenseimage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),

              // car info
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: 80,
                    child: const Divider(
                      color: Color(0xFF442268),
                      height: 0,
                      thickness: 3.5,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Car Information',
                    style: TextStyle(
                        color: Color(0xFF442268),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: 80,
                    child: const Divider(
                      color: Color(0xFF442268),
                      height: 0,
                      thickness: 3.5,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 70.0,
              ),

              // car model & car color
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: carmodel,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Car Model',
                        labelStyle: TextStyle(
                            color: Color(0xFF836D9A),
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: carcolor,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Car Color',
                        labelStyle: TextStyle(
                            color: Color(0xFF836D9A),
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10.0,
              ),

              // car plate num
              Container(
                width: 370,
                height: 55,
                padding: const EdgeInsets.all(3),
                child: TextField(
                  controller: carplatenumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Car Plate Number',
                    labelStyle: TextStyle(
                        color: Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(
                height: 30.0,
              ),


              // upload car image
              Container(
                width: 370,
                height: 55,
                padding: const EdgeInsets.all(3),
                child: TextField(
                  controller: carimage,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Upload your car image',
                    labelStyle: const TextStyle(
                        color: Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                    suffixIcon: IconButton(
                      color: const Color(0xFF442268),
                      splashColor: const Color(0xFFCF283C),
                      iconSize: 30,
                      onPressed: () {
                        print('hello');
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                    ),
                  ),
                ),
              ),


              const SizedBox(
                height: 30.0,
              ),


              // upload car plate image
              Container(
                width: 370,
                height: 55,
                padding: const EdgeInsets.all(3),
                child: TextField(
                  controller: carplateimage,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Upload your car plate image',
                    labelStyle: const TextStyle(
                        color: Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                    suffixIcon: IconButton(
                      color: const Color(0xFF442268),
                      splashColor: const Color(0xFFCF283C),
                      iconSize: 30,
                      onPressed: () {
                        print('hello');
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30.0,
              ),


              // upload licence car image
              Container(
                width: 370,
                height: 55,
                padding: const EdgeInsets.all(3),
                child: TextField(
                  controller: carlicenseimage,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Upload your car license image',
                    labelStyle: const TextStyle(
                        color: Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                    suffixIcon: IconButton(
                      color: const Color(0xFF442268),
                      splashColor: const Color(0xFFCF283C),
                      iconSize: 30,
                      onPressed: () {
                        print('hello');
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 210.0,
              ),

              // button next
              ElevatedButton(
                child: const Text('Next'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF442268),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () {
                  print(carcolor.text);
                  print(carmodel.text);
                  print(carplatenumber.text);
                  print(carimage.text);
                  print(carplateimage.text);
                  print(carlicenseimage.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const verfication()));
                },
              ),
            ],
          )),
    );
  }
}
