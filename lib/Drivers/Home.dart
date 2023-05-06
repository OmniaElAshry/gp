import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gp/Drivers/ProfilePage.dart';

import '../Register/LoginPage.dart';
import '../Register/SignupPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>, TickerProviderStateMixin {
  // GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
    Tab(
      child: Text(
        "Book Trip",
      ),
    ),
    Tab(
      child: Text(
        "Share Car",
      ),
    ),
    Tab(
      child: Text(
        "My Trips",
      ),
    ),
  ];

  // The rating value
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: AppBar(
              iconTheme: const IconThemeData(color: Color(0xFF442268)),
              centerTitle: true,
              title: const Text(
                'Drivers',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF442268)),
              ),
              actions: <Widget>[
                // cancel Icon
                IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xFF442268),
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
              backgroundColor: const Color(0xFFFAFAFA),

              // tab bar
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabBar(
                    labelColor: const Color(0xFF442268),
                    labelStyle:
                    const TextStyle(fontSize: 27.5, fontWeight: FontWeight.w400),
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 3,
                    indicatorColor: const Color(0xFF442268),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.all(0),
                    isScrollable: true,
                    physics: const BouncingScrollPhysics(),
                    onTap: (int index) {
                      print('Tab $index is tapped');
                    },
                    enableFeedback: true,
                    // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                    // controller: _tabController,
                    tabs: _tabs,
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF442268),
                ),
                child: Text('Drawer Header',style: TextStyle(color: Colors.white,),),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Color(0xFF442268),
                ),
                title: const Text('Login'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.train,
                  color: Color(0xFF442268),
                ),
                title: const Text('SignUp'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(7)),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      margin: const EdgeInsets.all(20),
                      height: 180,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        border: Border.all(color: Colors.black12, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                                backgroundColor: Color(0xFF442268),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/eslam.jpeg'),
                                  radius: 43.5,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text("Name:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                                      Text("Eslam Khaled Eid",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Phone number:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      //SizedBox(width: 10,),
                                      Text("01064643135",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Car:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      Text("Grey | Peugeot 3008",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Distance:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      Text("1Km",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                      SizedBox(width: 60,),
                                      Text("Time:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      Text("10min",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // implement the rating bar
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                            child: RatingBar(
                                initialRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 30,
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
                      ),),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      margin: const EdgeInsets.all(20),
                      height: 180,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        border: Border.all(color: Colors.black12, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                                backgroundColor: Color(0xFF442268),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/sh.jpg'),
                                  radius: 43.5,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text("Name:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                                      Text("Eslam Khaled Eid",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Phone number:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      //SizedBox(width: 10,),
                                      Text("01011223344",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Car:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      Text("red | honda | gh125",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Distance:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      Text("1Km",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                      SizedBox(width: 60,),
                                      Text("Time:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                      Text("10min",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // implement the rating bar
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                            child: RatingBar(
                                initialRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 30,
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
                      ),),
                    onTap:() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                  ),
                ],
              ),
            ),
            const Center(child: Text('Content of Tab Two')),
            const Center(child: Text('Content of Tab Three'))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
