import 'package:db_merchant_app/screens/DBVerificationScreen.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBImages.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class DBSignInScreen extends StatefulWidget {
  static String tag = '/DBSignInScreen';

  @override
  DBSignInScreenState createState() => DBSignInScreenState();
}

class DBSignInScreenState extends State<DBSignInScreen> {
  TextEditingController mobileController = TextEditingController();

  FocusNode mobileFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           /* AppButton(
              child: Row(
                children: [
                  Image.asset(DBFacebookLogo, width: 20, height: 20),
                  8.width,
                  Text('Facebook', style: primaryTextStyle(color: white)),
                ],
              ),
              onTap: () {},
              width: (context.width() - (3 * 16)) * 0.5,
              color: DBFacebookColor,
              elevation: 0,
            ).cornerRadiusWithClipRRect(20),
            16.width,
            AppButton(
              child: Row(
                children: [
                  Image.asset(DBGoogleLogo, width: 20, height: 20),
                  8.width,
                  Text('Google', style: primaryTextStyle(color: black)),
                ],
              ),
              onTap: () {},
              width: (context.width() - (3 * 16)) * 0.5,
              elevation: 0,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 1, color: grey)),
            ),*/
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,
            Image.asset(DBSplashImage, height: 150, fit: BoxFit.fill).center(),
            50.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!', style: boldTextStyle(size: 25, color: DBSecondaryColor,fontFamily: fontPt)),
                Text('Delivery Partner', style: boldTextStyle(size: 25, color: DBPrimaryColor,fontFamily: fontAbril)),
              ],
            ),
            30.height,
            AppTextField(
              controller: mobileController,
              textFieldType: TextFieldType.PHONE,
              textStyle: primaryTextStyle(size: 16,color: white),
              focus: mobileFocus,
              maxLength: 10,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                filled: true,
                fillColor: grey.withOpacity(0.5),
                hintText: 'Mobile Number',
                hintStyle: secondaryTextStyle(color: white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
            16.height,
            dbAppButtonWidget(context, 'Sign In', () {
              DBVerificationScreen().launch(context);
            }),
            70.height,
          /*  Row(
              children: [
                Divider(thickness: 2,color: white.withOpacity(0.2),).expand(),
                8.width,
                Text('Or Sign In with', style: secondaryTextStyle()),
                8.width,
                Divider(thickness: 2,color: white.withOpacity(0.2),).expand(),
              ],
            ),*/
            16.height,
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
