import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import './screens/login_screen.dart';
import 'screens/registration_screens/enter_number_screen.dart';
import 'screens/registration_screens/enter_gender_screen.dart';
import 'screens/registration_screens/enter_sickness_screen.dart';
import 'screens/registration_screens/enter_time_of_sickness.dart';
import 'screens/registration_screens/enter_medicians_screen.dart';
import 'screens/registration_screens/enter_age_screen.dart';
import 'screens/fill_in_buttom.dart';
import 'screens/record_screen.dart';
import 'screens/try.dart';




 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(), 
    supportedLocales: const [Locale("en"), Locale("he"), Locale("ar"),Locale("ru")] ,
    fallbackLocale: const Locale("en"),
    path: "lang")
    );
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
 
  static String _title = 'Voca App';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,


      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title), centerTitle: true),
        // body: loginState()
        body:  FillingButtom("eeehaahha", Duration(seconds: 5), true),
        // body: RecordingScreen(),
        // body: Home(),
      ),
    );
  }
}
 