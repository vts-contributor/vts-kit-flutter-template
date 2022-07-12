import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample/login/welcome_screen.dart';
import 'package:sample/model/user_model.dart';
import 'package:vts_component/common/style/vts_color.dart';
import 'package:vts_component/components/base/field_control/styles.dart';
import 'package:vts_component/components/button/index.dart';

import '../model/api_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiServices _apiClient = ApiServices();
  bool _showPassword = false;
  Future<void> login() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.red.shade100,
    ));

    print("start");
    User res = await _apiClient.login(
      emailController.text,
      passwordController.text,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (res.resultCode != 200) {
      var snack = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            res.resultMessage.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } else {
      String username = res.data!['username'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomeScreen(accesstoken: username)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/assets/images/background_1.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          // SingleChildScrollView(
          // child:
          Container(
            padding: EdgeInsets.only(
                right: 35,
                left: 35,
                top: MediaQuery.of(context).size.height * 0.15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Đăng nhập",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 32,
                                fontFamily: 'Sabarun'),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 8,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Tên tài khoản",
                                    style: TextStyle(
                                        fontFamily: 'Sabarun',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: emailController,
                                    // style: TextStyle(height: 40 / 14),
                                    decoration: const InputDecoration(
                                      constraints:
                                          BoxConstraints(maxHeight: 45),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0),
                                      ),
                                      contentPadding: EdgeInsets.all(5.0),
                                    ),
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Mật khẩu",
                                    style: TextStyle(
                                        fontFamily: 'Sabarun',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      controller: passwordController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        constraints:
                                            const BoxConstraints(maxHeight: 45),
                                        suffixIcon: IconButton(
                                            icon: Icon(_isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            }),
                                        contentPadding:
                                            const EdgeInsets.all(5.0),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 2.0),
                                        ),
                                        focusColor: Colors.red,
                                      ))
                                ]),
                            const SizedBox(
                              height: 40,
                            ),
                            VTSButton(
                              onPressed: () => {},
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: VTSColors.PRIMARY_0,
                                  decoration: TextDecoration.underline),
                              text: "Quên mật khẩu",
                              vtsType: VTSButtonType.LINK,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            VTSButton(
                                onPressed: () => login(),
                                text: "Đăng nhập",
                                vtsSize: VTSButtonSize.MD),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                ImageIcon(
                                    AssetImage(
                                        "lib/assets/images/ic_faceID.png"),
                                    size: 24),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Đăng nhập bằng FaceID",
                                  style: TextStyle(color: VTSColors.BLACK_1),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    // padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Chưa có tài khoản?',
                            style: TextStyle(
                                fontFamily: 'Sabarun',
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                          VTSButton(
                            onPressed: () {},
                            textStyle: const TextStyle(
                                fontFamily: 'Sabarun',
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                            text: "Đăng ký",
                            vtsType: VTSButtonType.LINK,
                          ),
                        ]),
                  )
                ]),
          ),
          // ),
        ]),
      ),
    );
  }
}
