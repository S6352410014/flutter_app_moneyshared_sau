import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyShareUI extends StatefulWidget {
  const MoneyShareUI({Key? key}) : super(key: key);

  @override
  _MoneyShareUIState createState() => _MoneyShareUIState();
}

class _MoneyShareUIState extends State<MoneyShareUI> {
  bool? check_tip = false;
  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_ctrl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();
  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  var currentFocus;

  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFF928DC5),
        appBar: AppBar(
          title: Text(
            'แชร์เงินกันน๊ะ',
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
                  height: 180.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    top: 40.0,
                  ),
                  child: TextField(
                    controller: money_ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: TextStyle(color: Color(0xFFC9C9C9)),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillWave,
                        color: Color(0xFF5A026A),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF5A026A),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF5A026A),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    top: 20.0,
                  ),
                  child: TextField(
                    controller: person_ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: TextStyle(color: Color(0xFFC9C9C9)),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF5A026A),
                        size: 35.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF5A026A),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF5A026A),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (checked) {
                        // code เอาค่า user เลือกที่ส่งมาให้ checked มากำหนดให้กับ check_tip
                        setState(() {
                          check_tip = checked;
                          if(check_tip == false){
                            tip_ctrl.text= '';
                          }
                        });
                      },
                      value: check_tip,
                      activeColor: Color(0xFF7367FF),
                      side: BorderSide(color: Color(0xFF5A026A)),
                      //checkColor: Color(0xFF5A026A),
                    ),
                    Text(
                      'ทิปให้พนักงานเสริฟ',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    top: 10.0,
                  ),
                  child: TextField(
                    controller: tip_ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'ป้อนจำนวนเงินทริป (บาท)',
                      hintStyle: TextStyle(color: Color(0xFFC9C9C9)),
                      prefixIcon: Icon(
                        FontAwesomeIcons.coins,
                        color: Color(0xFF5A026A),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF5A026A),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF5A026A),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //สร้างตัวแปรมาเก็บผลลัพธ์ที่ได้จากการคำนวณ
                    double? moneyshare = 0;
    
                    // ตรวจสอบ และ คำนวณ
                    if (money_ctrl.text.length == 0) {
                      showWarningDialog(context, 'ป้อนเงินด้วยจ้าา...');
                      return;
                    } else if (person_ctrl.text.length == 0) {
                      showWarningDialog(context, 'ป้อนจำนวณคนด้วย');
                      return;
                    } else if (check_tip == false) {
                      //คำนวณแบบไม่มี tip
                      //moneyshare = double.parse(money_ctrl.text) / int.parse(person_ctrl.text);
                      double? money = double.parse(money_ctrl.text);
                      int? person = int.parse(person_ctrl.text);
                      moneyshare = money / person;
                    } else {
                      //ตรวจสอบว่าได้ป้อน tip หรือยัง
                      if (tip_ctrl.text.isEmpty) {
                        showWarningDialog(context, 'ป้อนทิปด้วย');
                        return;
                      } else {
                        //คำนวณแบบมี tip
                        double? money = double.parse(money_ctrl.text);
                        int? person = int.parse(person_ctrl.text);
                        double? tip = double.parse(tip_ctrl.text);
                        moneyshare = (money + tip) / person;
                      }
                    }
    
                    // ส่งข้อมูลที่ป้อน และที่คำนวณได้ไปแสดงอีกหน้า  ShowMoneyshareUI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowMoneyshareUI(
                          money: double.parse(money_ctrl.text),
                          person: int.parse(person_ctrl.text),
                          tip: double.parse(tip_ctrl.text.isEmpty ?'0': tip_ctrl.text),
                          moneyshare: moneyshare,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50,
                    ),
                    primary: Color(0xFF5A026A),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //กำหนดคำของ TextField ทั้ง 3 ตัวให้ว่าง และ CheckBox ไม่ติ๊ก},
                    setState(() {
                      money_ctrl.text = '';
                      person_ctrl.text = '';
                      tip_ctrl.text = '';
                      check_tip = false;
                    });
                  },
                  label: Text(
                    'ยกเลิก',
                  ),
                  icon: Icon(
                    FontAwesomeIcons.sync,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Created by Pong DTI',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
