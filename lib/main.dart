import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTP(),
    ),
  );
}

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  List p = [];
  Random r = Random();
  int ans = 0;
  int? L;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff15172B),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff15172B),
        child: Column(
          children: [
            const Text(
              "OTP GENERATOR",
              style: TextStyle(
                color: Color(0xffF6DB87),
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    L = int.parse(val);
                    p.isEmpty;
                  });
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                decoration: InputDecoration(
                  hintText: "Ente OTP Length",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFCF6BA),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffFCF6BA),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            InkWell(
              onTap: () {
                setState(() {
                  if (L == 4 || L == 6 || L == 8) {
                    for (int i = 0; i <= 100; i++) {
                      p.clear();
                      ans = r.nextInt(1000000);
                      p.add(ans);
                    }
                  } else {
                    p.clear();
                    p.add("Invalid Input Length");
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffF6DB87),
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                  gradient: const LinearGradient(
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight,
                    colors: [
                      Color(0xffFFE8B8),
                      Color(0xffF6DB87),
                    ],
                  ),
                ),
                child: const Text(
                  "Generate OTP",
                  style: TextStyle(
                    color: Color(0xff15172B),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight,
                  colors: [
                    Color(0xffFFE8B8),
                    Color(0xffF6DB87),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...p.map(
                    (e) => Text(
                      "$e",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90),
            InkWell(
              onTap: () {
                setState(() {
                  ans = 0;
                  L = 0;
                  p.clear();
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight,
                    colors: [
                      Color(0xffFFE8B8),
                      Color(0xffF6DB87),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: Color(0xff15172B),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
