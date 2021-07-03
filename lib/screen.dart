import 'package:flutter/material.dart';
import './leftbar.dart';
import './rightside.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  // ignore: unused_field
  String _textresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Colors.amber),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        color: Colors.amber.withOpacity(.9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.amber),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        color: Colors.amber.withOpacity(.9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(
                  () {
                    _bmiresult = _w / (_h * _h);
                    if (_bmiresult > 25) {
                      _textresult = "Over weight";
                    } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                      _textresult = "Normal weight";
                    } else {
                      _textresult = "Under weight";
                    }
                  },
                );
              },
              child: Container(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.amber),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                _bmiresult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: Colors.amber),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textresult.isNotEmpty,
              child: Container(
                child: Text(
                  _textresult,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 60,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 100),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 100),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
