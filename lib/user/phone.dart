
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class OtpVerificationPage extends StatefulWidget {
  final String verificationId;

  const OtpVerificationPage({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController _otpController = TextEditingController();

  // Verify OTP
  void verifyOTP() async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: _otpController.text,
    );

    try {
      UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      // Handle successful verification, e.g., navigate to the next screen
      // You can add your logic here.
    } catch (e) {
      print('Error verifying OTP: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter the OTP sent to your phone',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verifyOTP(); // Verify OTP when the button is pressed
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xfff5f5dc);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NYAYA BANDHU', // Added title
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gloock',
                ),
              ),
              Image.asset(
                'assets/images/adhaar.jpg',
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Gloock'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Your Adhaar Registered Phone Number",
                style: TextStyle(
                  fontSize: 16,
                    fontFamily: 'Gloock',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Phone Number",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pushNamed(context, 'verify');
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}