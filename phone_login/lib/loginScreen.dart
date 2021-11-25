import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_login/otp_controller.dart';
import 'package:lottie/lottie.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "+91";
  TextEditingController _controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
               /*  image: DecorationImage(
            image: AssetImage("images/screen1.jpg"),
            fit: BoxFit.cover,
          ), */
       gradient: LinearGradient(
         begin: Alignment.topRight,
         end: Alignment.bottomLeft,

         colors: [
               Color(0xff44C554),
              // Color(0xffC2BA36),
               Color(0xff2653A8)
         ]
       ),

      ),
    child: Column(
      children: [

        Padding(
          padding: EdgeInsets.only(left: 28.0, right: 28.0),
          child: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_GTEqBh.json")
        ),

        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 20,
          shadowColor: Colors.greenAccent,
          color: Color(0xffb6d4d6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          child: Container(

              width:330,

              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(


                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  CountryCodePicker(
                    onChanged: (country) {
                      setState(() {
                        dialCodeDigits = country.dialCode!;
                      });
                    },

                    initialSelection: "IN",
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    showDropDownButton: true,
                    flagWidth: 25,
                    boxDecoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(12)
                    ),

                  ),
                  TextField(
                    cursorHeight: 30,
                    cursorWidth: 3,
                    cursorColor: Colors.red,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)

                ),
                  hintText: " enter phone Number",
                  prefix: Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(dialCodeDigits),
                  )),
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: _controller,
          ),

          ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => OTPControllerScreen(
                        phone: _controller.text,
                        codeDigits: dialCodeDigits,
                      )));
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
      ),
    );


  }
}
