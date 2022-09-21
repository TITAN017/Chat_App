import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isObscure = true;
  late GlobalKey key;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Color color = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    key = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColors.CHAT,
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          reverse: true,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: height * 0.75,
              width: width,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              decoration: BoxDecoration(
                color: CustomColors.DEFAULT_COLOR,
                borderRadius: CustomInsets.SIGNIN_BORDER_RADIUS,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Sign in text
                  Text(
                    "Sign-in",
                    style: GoogleFonts.acme(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Inner Form
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.acme(
                              fontSize: 23,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //Email Field
                          TextFormField(
                            controller: email,
                            validator: (val) => null,
                            decoration: InputDecoration(
                              hintText: "Your Email",
                              hintStyle: GoogleFonts.acme(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Password",
                            style: GoogleFonts.acme(
                              fontSize: 23,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //Password Field
                          TextFormField(
                            controller: password,
                            obscureText: isObscure,
                            validator: (val) => null,
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  }),
                              hintStyle: GoogleFonts.acme(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          //Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.acme(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Submit Button
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 6,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Submit',
                                style: GoogleFonts.acme(
                                  color: CustomColors.DEFAULT_COLOR,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.acme(color: Colors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Already have an Account?",
                                  ),
                                  TextSpan(
                                    text: "  Login!",
                                    style: GoogleFonts.acme(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Divider(
                                color: Colors.grey,
                                thickness: 2,
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Text(
                                  'Or Signin With',
                                  style: GoogleFonts.acme(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}