import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'registration_screens/enter_number_screen.dart';
import 'registration_screens/enter_gender_screen.dart';

class loginState extends StatefulWidget {
  loginState();

  @override
  State<loginState> createState() => _loginState();
}

class _loginState extends State<loginState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumberEntryScreen()),
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Welcome to VOCA',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Sign in'.tr(),
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username'.tr(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password'.tr(),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: Text(
                    'Forgot Password'.tr(),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: Text('Login'.tr()),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Row(
                  children: <Widget>[
                    Text('Does not have account?'.tr()),
                    TextButton(
                        child: Text(
                          'Sign up'.tr(),
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenderSelectionScreen()),
                          );
                        })
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          child: const Text(
                            'English',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () =>
                              context.setLocale(context.supportedLocales[0])),
                      TextButton(
                          child: const Text(
                            'Русский',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () =>
                              context.setLocale(context.supportedLocales[3])),
                      TextButton(
                        child: const Text(
                          'עברית',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () =>
                            context.setLocale(context.supportedLocales[1]),
                      ),
                      TextButton(
                          child: const Text(
                            'العربية',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () =>
                              context.setLocale(context.supportedLocales[2])),
                    ],
                  ),
                )
              ],
            )));
  }
}
