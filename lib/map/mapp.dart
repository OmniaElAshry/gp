import 'package:flutter/material.dart';

class map extends StatelessWidget {
  const map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child:Scaffold(

        drawer: Drawer(),
        appBar: AppBar(

          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () { Scaffold.of(context).openDrawer();},
              icon: Icon(
                Icons.menu,color: Color(0xFF442268),
              ),
            );
          }),
          title: Text('HOME',
            style: TextStyle(
                color:Color(0xFF442268),
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
          actions: [

            Icon(Icons.arrow_forward_sharp ,color:Color(0xFF442268) ,),

          ],
          backgroundColor: Colors.white,


          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Book Trip',
                  style: TextStyle(
                      color:Color(0xFF442268),
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                ),
              ),

              Tab(
                child: Text(
                  'Share Car',
                  style: TextStyle(
                      color:Color(0xFF442268),
                      fontWeight: FontWeight.w500,
                      fontSize:13
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'My Trips',
                  style: TextStyle(
                      color:Color(0xFF442268),
                      fontWeight: FontWeight.w500,
                      fontSize:13
                  ),
                ),
              ),
            ],

          ),
        ),
        body: const myStatefulWidget(),

      ),
    );
  }
}

class myStatefulWidget extends StatefulWidget {
  const myStatefulWidget({Key ? key}) : super(key: key);

  @override
  State<myStatefulWidget> createState() => _myStatefulWidgetStatee();
}

class _myStatefulWidgetStatee extends State<myStatefulWidget> {

  TextEditingController start_address = TextEditingController();
  TextEditingController end_address = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(

          children:
          [
            SizedBox(height: 20.0,),
            SizedBox(height: 20.0,),
            TextField(
              controller: start_address,
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your start address',
                labelStyle: TextStyle(
                    color:Color(0xFF836D9A),
                    fontWeight: FontWeight.w300,
                    fontSize: 20

                ),
                suffixIcon: IconButton(
                  color:Colors.red,
                  splashColor: const Color(0xFFCF283C),
                  iconSize: 30,
                  onPressed: (){
                    print('hello');
                  },

                  icon: const Icon(Icons.location_on) ,



                ),
              ),
            ),


            SizedBox(height: 20.0,),
            TextField(
              controller: end_address,
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your end address',
                labelStyle: TextStyle(
                    color:Color(0xFF836D9A),
                    fontWeight: FontWeight.w300,
                    fontSize: 20

                ),
                suffixIcon: IconButton(
                  color:const Color(0xFF442268),
                  splashColor: const Color(0xFFCF283C),
                  iconSize: 30,
                  onPressed: (){
                    print('hello');
                  },

                  icon: const Icon(Icons.location_on) ,



                ),
              ),
            ),

            SizedBox(height: 80.0,),

            ElevatedButton(
              child: const Text('Next'),

              style:ElevatedButton.styleFrom(

                  primary:Color(0xFF442268) ,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),

              onPressed: () {
                print(start_address.text);
                print(end_address.text);

              },
            ),

          ]//childeren




      ),
    );


  }
}