import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore/components/square_tile.dart';
import 'package:firestore/config/firebase_auth_service.dart';
import 'package:firestore/core/utils/image_constant.dart';
import 'package:firestore/core/utils/size_utils.dart';
import 'package:firestore/lawyerspage/lawyerplat.dart';
import 'package:firestore/routes/initial/frame_244_screen.dart';
import 'package:firestore/theme/custom_button_style.dart';
import 'package:firestore/upload.dart';
import 'package:firestore/user/phone.dart';
import 'package:firestore/user/signup_screen.dart';
import 'package:firestore/userspage/userplat.dart';
import 'package:firestore/widgets/custom_elevated_button.dart';
import 'package:firestore/widgets/custom_image_view.dart';
import 'package:firestore/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:firestore/Homecreens/Homescreen.dart';

import 'package:firestore/config/firebase_auth_service.dart';
// import 'package:firestore/homepage.dart';
import 'package:firestore/user/forgot_password.dart';
import 'package:firestore/user/signup_screen.dart';
import 'package:firestore/widgets/custom_textfield.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../widgets/custom_button.dart';
import '../theme/custom_text_style.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xfff5f5dc);
    return Scaffold(
        backgroundColor: backgroundColor,

        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Text(
                  'NYAYA BANDHU', // Added title
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gloock',
                  ),
                ),

                Container(
                  width: 400,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(), // Use CircleBorder for oval shape
                  ),
                  child: Image.asset(
                    'assets/images/emblemnew.png', // Replace with your image path
                    width: 30, // Adjust the image size as needed
                    height: 50,
                    fit: BoxFit.fill, // You can use BoxFit to specify how the image should be fitted
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Welcome Back! Glad \nto see you again",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                CustomTextfield(
                  myController: _emailController,
                  hintText: "Enter your Email",
                  isPassword: false,
                ),
                CustomTextfield(
                  myController: _passwordController,
                  hintText: "Enter your Password",
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: const Text("Forgot Password?",
                          style: TextStyle(
                            color: Color(0xff6A707C),
                            fontSize: 15,
                          )),
                    ),
                  ),
                ),
                CustomButton(
                  buttonText: "Login",
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () async {
                    try {
                      await FirebaseAuthService().login(
                          _emailController.text.trim(),
                          _passwordController.text.trim());

                      if (FirebaseAuth.instance.currentUser != null) {
                        setState(() {
                          _isLoading = true;
                        });
                        if (!mounted) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Userplat()));
                      }
                    } on FirebaseException catch (e) {
                      debugPrint("error is ${e.message}");
                      setState(
                            () {
                          _isLoading = false;
                        },
                      );

                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: const Text(
                                  " Invalid Username or password. Please register again or make sure that username and password is correct"),
                              actions: [
                                CustomElevatedButton(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
                                    },
                                    height: 47.v,
                                    text: "msg_continue_with_gmail".tr,
                                    leftIcon: Container(
                                        margin: EdgeInsets.only(
                                            right: 12.h),
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgGoog0ed88f7c1,
                                            height: 32.adaptSize,
                                            width: 32.adaptSize)),
                                    buttonStyle: CustomButtonStyles
                                        .fillOnPrimaryContainerTL23,
                                    buttonTextStyle: CustomTextStyles
                                        .titleSmallInterBlack90002)

                              ]));
                    }

                    // Navigator.push(context,
                    //    MaterialPageRoute(builder: (_) => const LoginScreen()));

                    setState(
                          () {
                        _isLoading = false;
                      },
                    );
                  },
                ),
                /*
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.15,
                        color: Colors.grey,
                      ),
                      const Text("               "),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          )),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.google,
                            // color: Colors.blue,
                          ),
                          onPressed: () async {
                            await FirebaseAuthService().logininwithgoogle();

                            if (FirebaseAuth.instance.currentUser != null) {
                              if (!mounted) return;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Homescreen()));
                            } else {
                              throw Exception("Error");
                            }
                          },
                        ),
                      ),
                      Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.apple,
                              // color: Colors.blue,
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ),
                ),
                */
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // google button
                    SquareTile(imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png'),
                    SizedBox(width: 25),

                    // ADHAAR BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyPhone()),
                        );
                      },
                      child: SquareTile(imagePath: 'assets/images/adhaaricon.png'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Don't have an account?",
                          style: TextStyle(
                            color: Color(0xff1E232C),
                            fontSize: 15,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text("  Register Now",
                            style: TextStyle(
                              color: Color(0xff35C2C1),
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _progressIndicator() {
    return const Center(
      child: SizedBox(
        height: 70,
        width: 70,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
