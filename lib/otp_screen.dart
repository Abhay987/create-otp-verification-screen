import 'package:flutter/material.dart';
import 'package:otp_screen/textfield_data.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
 final TextEditingController firstOtp = TextEditingController();
 final TextEditingController secondOtp = TextEditingController();
 final TextEditingController thirdOtp = TextEditingController();
  final TextEditingController fourthOtp = TextEditingController();
 final _formKey = GlobalKey<FormState>();
 @override
 void dispose() {
   super.dispose();
   firstOtp.dispose();
   secondOtp.dispose();
   thirdOtp.dispose();
   firstOtp.dispose();
 }

 @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding:  const EdgeInsets.all(20),
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.2,
                    child: const Icon(
                      Icons.message,
                      size: 90,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.1,
                    child: const Text(
                      'Verification Code',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.1,
                    child: const Text(
                      'Please enter the OTP sent to your email',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.1,
                    child: Form(
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*.2,
                              child: TextFormFieldData.getTextFormField(context, firstOtp)),
                          SizedBox(width: MediaQuery.of(context).size.width*.2,
                            child: TextFormFieldData.getTextFormField(context, secondOtp),),
                          SizedBox(width: MediaQuery.of(context).size.width*.2,
                              child: TextFormFieldData.getTextFormField(context, thirdOtp)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width*.2,
                              child: TextFormFieldData.getTextFormField(context, fourthOtp)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      child: OutlinedButton(onPressed: (){
                        if (_formKey.currentState!.validate()){
                          debugPrint("The pin code is : ${firstOtp.text} ${secondOtp.text} ${thirdOtp.text} ${fourthOtp.text}");
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.white,
                              elevation: 0,
                              duration: Duration(seconds: 1),
                              content: Text(" OTP can't be null ",
                            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)));
                        }

                      },child: const Text('Submit'),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
