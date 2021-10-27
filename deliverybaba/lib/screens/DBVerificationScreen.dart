import 'dart:async';
import 'package:db_merchant_app/screens/DBMainScreen.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBImages.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DBVerificationScreen extends StatefulWidget {
  static String tag = '/DBVerificationScreen';

  @override
  DBVerificationScreenState createState() => DBVerificationScreenState();
}

class DBVerificationScreenState extends State<DBVerificationScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController codeController = TextEditingController();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  String currentText = "";

  late Timer timer;
  int counter = 60;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (counter < 1) {
            timer.cancel();
          } else {
            counter = counter - 1;
          }
        },
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgColor);
    return Scaffold(
      backgroundColor: bgColor,
      key: scaffoldKey,
      bottomNavigationBar:
      AppButton(
        width: context.width(),
        height: 53,
        child: Text(
          'Verify',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        color: DBSecondaryColor,
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        onTap: () {
          finish(context);
          DBMainScreen().launch(context);
        },
      ).paddingOnly(left: 16, right: 16, bottom: 16),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            100.height,
            Image.asset(DBSplashImage, height: 150, fit: BoxFit.fill).center(),
            30.height,
            Text('Confirm', style: boldTextStyle(size: 30,color: DBSecondaryColor)),
            8.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(db_verify_code, style: primaryTextStyle(color: white)),
                Text('+918839105236', style: boldTextStyle(size: 14,color: white)),
              ],
            ),
            30.height,
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              pastedTextStyle: TextStyle(color: DBPrimaryColor, fontWeight: FontWeight.bold, fontSize: 14),
              length: 6,
              obscureText: false,
              showCursor: false,
              animationType: AnimationType.fade,
              errorTextSpace: 30,
              validator: (v) {
                if (v!.length < 6) {
                  return "Pin is not correct. Please try again.";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 55,
                fieldWidth: 50,
                activeFillColor: DBSecondaryColor,
                inactiveFillColor: DBPrimaryColor,
                selectedFillColor: DBSecondaryColor,
                inactiveColor: DBPrimaryColor,
                selectedColor: greenColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(
                fontSize: 20,
                height: 1.6,
                color:white,
              ),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: codeController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {},
              onChanged:  (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            8.height,
            counter == 0
                ? Text("Resend", style: boldTextStyle(color: white, size: 14)).onTap(() {
                    startTimer();
                    counter = 60;
                    setState(() {});
                  })
                : Text("Resend code in $counter s", style: primaryTextStyle(size: 14, color: white)),

          ],
        ).center().paddingAll(16),
      ),
    );
  }
}
