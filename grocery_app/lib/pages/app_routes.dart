import 'package:flutter/material.dart';
import 'package:village_banking_app/pages/login.dart';
import 'package:village_banking_app/pages/onboarding.dart';



final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => LoginPage(key: UniqueKey(), onTap: () {  },),
  '/home_page': (BuildContext context) => const HomePage(),
};
