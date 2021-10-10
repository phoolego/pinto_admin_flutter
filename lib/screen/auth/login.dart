import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/service/auth.dart';
import 'package:pinto_admin_flutter/constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errorMessage = '';
  bool _loading = false;
  _login(BuildContext context) async {
    try {
      setState(() {
        _loading = true;
      });
      await Auth.login(email, password);
      Navigator.pushReplacementNamed(context, '/');
    } catch (err) {
      print(err);
      errorMessage = err.toString();
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: Text('กำลังลงชื่อเข้าใช้'))
            : SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/Icons.jpg'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ผู้ดูแลระบบ',
                            style: kNormalTextStyle,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ลงชื่อเข้าใช้',
                        style: kLoginHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'อีเมล',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกอีเมล';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'รหัสผ่าน',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              // validate password must longer than 6 character
                              return 'กรุณากรอกรหัสผ่าน';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(errorMessage,style: kStatusNotCompleteTextColor,),
                      PintoButton(
                          width: screenWidth * 0.4,
                          label: 'เข้าสู่ระบบ',
                          function: () async {
                            if (_formKey.currentState!.validate()) {
                              await _login(context);
                            }
                          },
                          buttonColor: deepBlue),
                      SizedBox(height: 10),
                      // PintoButton(
                      //     width: screenWidth * 0.4,
                      //     label: 'สร้างบัญชี',
                      //     function: () async {
                      //       Navigator.pushNamed(context, '/register');
                      //     },
                      //     buttonColor: lightBlue),
                      SizedBox(height: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
