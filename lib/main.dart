// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/moneyshare_ui.dart';


main(){
  runApp(
    //MaterialApp คือ widget หลักของ app
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoneyShareUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    )
  );
}