import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gp/Drivers/Home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // The rating value
  double? _ratingValue;

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              // image of user
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF442268),
                          size: 30,
                        ),
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));}),
                    const CircleAvatar(
                      radius: 59,
                      backgroundColor: Color(0xFF442268),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/eslam.jpeg'),
                        radius: 57,
                      ),
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFF442268),
                          size: 30,
                        ),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              contentPadding: const EdgeInsets.all(20),
                              actionsPadding:
                              const EdgeInsets.fromLTRB(0, 0, 65, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0XFF2A1540),
                              contentTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                              title: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              content: const Text(
                                  'You will cancel the trip and go to home. Are you sure?'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Yes'),
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0XFFD4C9D6),
                                      padding: EdgeInsets.all(11),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      textStyle: const TextStyle(
                                        color: Color(0xFF442268),
                                      )),
                                  child: const Text('Yes',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF442268),
                                      )),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context, 'No'),
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0XFFD4C9D6),
                                      padding: EdgeInsets.all(11),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      textStyle: const TextStyle(
                                        color: Color(0xFF442268),
                                      )),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF442268),
                                    ),
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
              ),

              Center(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    width: 500,
                    child: const Divider(
                      color: Color(0xFF442268),
                      height: 0,
                      thickness: 1.5,
                    )),
              ),

              const SizedBox(
                height: 30,
              ),

              // information of user profile
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                height: 970,
                width: 500,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    children: [

                      // user's information
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                                  child: RatingBar(
                                      initialRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 35,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.orange),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.orange,
                                          ),
                                          empty: const Icon(
                                            Icons.star_outline,
                                            color: Colors.orange,
                                          )),
                                      onRatingUpdate: (value) {
                                        setState(() {
                                          _ratingValue = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Name: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Eslam Khaled Eid",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Age: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "22",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                                SizedBox(
                                  width: 165,
                                ),
                                Text(
                                  "Gender: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Phone number: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "01064643135",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Car: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Grey | Peugeot 3008",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Distance: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "1Km",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  "Time: ",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "10min",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF442268)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),

                      // car image
                      Row(
                        children: [
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                width: 110,
                                child: const Divider(
                                  color: Color(0xFF442268),
                                  height: 0,
                                  thickness: 1.5,
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30, right: 30,top: 30),
                            child: Text(
                              "Car Image",
                              style: TextStyle(
                                  color: Color(0xFF442268),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                width: 110,
                                child: const Divider(
                                  color: Color(0xFF442268),
                                  height: 0,
                                  thickness: 1.5,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(children: [
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF442268),
                              size: 30,
                            ),
                            onPressed: () {Navigator.pop(context);}),
                        Column(
                          children: [
                            Image.asset('assets/OIP (1).jpeg',height: 250,width: 300,),
                            const Text('1/2',style: TextStyle(color: Color(0xFF442268),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),)
                          ],
                        ),
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF442268),
                              size: 30,
                            ),
                            onPressed: () {Navigator.pop(context);}),
                      ],),

                      // license image
                      Row(
                        children: [
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                width: 80,
                                child: const Divider(
                                  color: Color(0xFF442268),
                                  height: 0,
                                  thickness: 1.5,
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30, right: 30,top: 30),
                            child: Text(
                              "License Image",
                              style: TextStyle(
                                  color: Color(0xFF442268),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                width: 85,
                                child: const Divider(
                                  color: Color(0xFF442268),
                                  height: 0,
                                  thickness: 1.5,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(children: [
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF442268),
                              size: 30,
                            ),
                            onPressed: () {Navigator.pop(context);}),
                        Column(
                          children: [
                            Image.asset('assets/download.jpeg',height: 250,width: 300,),
                            const Text('1/2',style: TextStyle(color: Color(0xFF442268),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),)
                          ],
                        ),
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF442268),
                              size: 30,
                            ),
                            onPressed: () {Navigator.pop(context);}),
                      ],),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // write comment
              Row(
                children: [
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        width: 110,
                        child: const Divider(
                          color: Color(0xFF442268),
                          height: 0,
                          thickness: 1.5,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30,top: 30),
                    child: Text(
                      "Comments",
                      style: TextStyle(
                          color: Color(0xFF442268),
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        width: 110,
                        child: const Divider(
                          color: Color(0xFF442268),
                          height: 0,
                          thickness: 1.5,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:  const EdgeInsets.all(20),
                child: TextField(
                  controller: comment,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Write your comment...',
                    labelStyle: const TextStyle(
                        color: Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                    suffixIcon: IconButton(
                      color: const Color(0xFF442268),
                      // hoverColor: const Color(0xFFCF283C),
                      iconSize: 30,
                      onPressed: () {
                        print('hello');
                      },
                      icon: const Icon(Icons.send),),
                  ),
                ),

              ),

              const SizedBox(
                height: 30,
              ),

              // i am coming btn
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF3C1858),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                  child: const Text(
                    'I am coming',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        backgroundColor: Color(0xFF3C1858)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
            ],
          ),
        ));
  }
}
