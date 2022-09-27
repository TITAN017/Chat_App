import 'package:chat_app/services/auth.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:chat_app/shared/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  VoidCallback toggle;
  Login(this.toggle);

  @override
  State<Login> createState() => _SigninState();
}

class _SigninState extends State<Login> {
  bool isObscure = true;
  late GlobalKey<FormState> key;
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/bgimage2.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.25),
            BlendMode.darken,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: height,
          child: SingleChildScrollView(
            //physics: BouncingScrollPhysics(),
            reverse: true,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                //height: height * 0.78,
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
                      "Log-in",
                      style: CustomFonts.HEADER,
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
                              style: CustomFonts.FIELDS,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //Email Field
                            TextFormField(
                              controller: email,
                              validator: (val) =>
                                  val!.length > 6 ? null : 'Invalid Email',
                              decoration: InputDecoration(
                                hintText: "Your Email",
                                hintStyle: CustomFonts.HINT_TEXT,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Password",
                              style: CustomFonts.FIELDS,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //Password Field
                            TextFormField(
                              controller: password,
                              obscureText: isObscure,
                              validator: (val) =>
                                  val!.isNotEmpty ? null : 'Invalid Password',
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    }),
                                hintStyle: CustomFonts.HINT_TEXT,
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
                                  style: CustomFonts.FORGOT_PWD,
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
                                onPressed: () async {
                                  try {
                                    if (key.currentState!.validate()) {
                                      await Authenticate.login(
                                          email.text, password.text);
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                  } finally {
                                    email.clear();
                                    password.clear();
                                  }
                                },
                                child: Text(
                                  'Submit',
                                  style: CustomFonts.SUBMIT,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //Signin option
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an Account?",
                                ),
                                GestureDetector(
                                  onTap: widget.toggle,
                                  child: Text(
                                    " Signin!",
                                    style: CustomFonts.SUBMIT.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //ordivider
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
                                    'Or Login With',
                                    style: GoogleFonts.acme(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.DEFAULT_COLOR,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300]!,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                    //color: CustomColors.CHAT,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.email),
                                    onPressed: () {},
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.DEFAULT_COLOR,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300]!,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                    //color: CustomColors.CHAT,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.email),
                                    onPressed: () {},
                                    color: Colors.red,
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
      ),
    );
  }
}
