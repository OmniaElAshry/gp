import 'package:flutter/material.dart';

class verfication extends StatelessWidget {
  const verfication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: myStatefulWidget());
  }
}

class myStatefulWidget extends StatefulWidget {
  const myStatefulWidget({Key? key}) : super(key: key);

  @override
  State<myStatefulWidget> createState() => _myStatefulWidgetState();
}

class _myStatefulWidgetState extends State<myStatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 600,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F3F9),
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Verfication',
                  style: TextStyle(
                      color: Color(0xFF442268),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Please enter the code sent to the e-mail you entered: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textFieldOTP(first: true, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: true),
                    ]),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Please Enter the code',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Send again?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  width: 400,
                  child: const Divider(
                    color: Color(0xFF442268),
                    height: 0,
                    thickness: 2.5,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  'Please enter the code sent to the Phone number you entered:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textFieldOTP(first: true, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: true),
                    ]),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Please Enter the code',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Send again?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ]),
            ),
          ),

          const SizedBox(
            height: 60.0,
          ),

          // button next
          ElevatedButton(
            child: const Text('Next'),
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFF442268),
                padding:
                const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _textFieldOTP({bool first = true, last}) {
    return Container(
      height: 50,
      width: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
