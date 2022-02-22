import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/moneyshare_ui.dart';

class ShowMoneyshareUI extends StatefulWidget {
  //ส่งค่าตัวแปรรับค่ามาอีกจอ
  double? money;
  int? person;
  double? tip;
  double? moneyshare;

  //ที่คอนสตรัส เอาตัวที่สร้างมารับค่าจากอีกหน้าหนึ่ง
  ShowMoneyshareUI({
    Key? key,
    this.money,
    this.person,
    this.tip,
    this.moneyshare,
  }) : super(key: key);

  @override
  _ShowMoneyshareUIState createState() => _ShowMoneyshareUIState();
}

class _ShowMoneyshareUIState extends State<ShowMoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF928DC5),
      appBar: AppBar(
        title: Text(
          'ผลการแชร์เงิน',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5A026A),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.money.toString(),
                style: TextStyle(
                  color: Color(0xFF5A026A),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนคน',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  color: Color(0xFF5A026A),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินทิป',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.tip.toString(),
                style: TextStyle(
                  color: Color(0xFF5A026A),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'สรุปว่าหารกันคนละ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80.0,
                height: 80.0,
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Text(
                  widget. moneyshare.toString(),
                  style: TextStyle(
                    color: Color(0xFFC11717),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
