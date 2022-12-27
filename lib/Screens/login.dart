import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tsc_tasc/Screens/Dashbord.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAAEmWf4VaWlnIB4AZPUea9vcDK6ch3JopwA&usqp=CAU"),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      opacity: 0.8),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontFamily: "Kanit",
                          fontWeight: FontWeight.w400),
                      softWrap: true,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'User Mail',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (() => Get.to(Dashbord())),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF3366FF),
                                  const Color(0xFF00CCFF),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
