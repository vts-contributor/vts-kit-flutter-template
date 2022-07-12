import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/api_services.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String accesstoken;
  const WelcomeScreen({Key? key, required this.accesstoken}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background_1.png'),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: size.width,
                height: size.height,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome ' + widget.accesstoken,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Sabarun'),
                  ),
                ))));
  }
}
