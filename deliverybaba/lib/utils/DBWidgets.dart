import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

Widget dbAppTextFieldWidget(TextEditingController controller, String hintText, TextFieldType textFieldType, {FocusNode? focus, FocusNode? nextFocus}) {
  return AppTextField(
    controller: controller,
    textFieldType: textFieldType,
    textStyle: primaryTextStyle(size: 14),
    focus: focus,
    nextFocus: nextFocus,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      filled: true,
      fillColor: grey.withOpacity(0.1),
      hintText: hintText,
      hintStyle: secondaryTextStyle(),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
  );
}

Widget dbAppButton(Color color, Function onTap, BuildContext context, String text) {
  return AppButton(
    width: context.width(),
    color: color,
    child: Text(
      text,
      style: primaryTextStyle(color: white),
    ),
    onTap: onTap,
  );
}


Widget dbAppButtonWidget(BuildContext context, String text, Function onTap) {
  return AppButton(
    text: text,
    textStyle: boldTextStyle(color: white),
    color: DBSecondaryColor,
    onTap: onTap,
    width: context.width(),
  ).cornerRadiusWithClipRRect(30);
}

AppBar dbAppBarWidget(BuildContext context, {String? title}) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          finish(context);
        }),
    title: Text('$title', style: boldTextStyle(color: black, size: 20)),
    backgroundColor: white,
    centerTitle: true,
  );
}

BoxDecoration dbGradientBoxDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF1761C5), Color(0xFF0BB8E4)],
      begin: FractionalOffset(0.0, 1.0),
      end: FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}

Widget dbCircularProgress() {
  return CircularPercentIndicator(
    radius: 180.0,
    animation: true,
    center: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('\$148.2', style: boldTextStyle(size: 24)),
        4.height,
        Text('left of \$2,744 budget', style: secondaryTextStyle()),
      ],
    ),
    animationDuration: 2000,
    lineWidth: 16.0,
    percent: 0.8,
    startAngle: 10,
    curve: Curves.easeIn,
    linearGradient: LinearGradient(
      colors: [Colors.deepOrange, Colors.yellow],
      tileMode: TileMode.clamp,
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [1.0, 0.0],
    ),
    rotateLinearGradient: true,
    reverse: false,
    arcBackgroundColor: Colors.grey,
    arcType: ArcType.HALF,
    circularStrokeCap: CircularStrokeCap.round,
    backgroundColor: Colors.transparent,
  );
}

Widget homeWidget({required String icon, required String title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(30),
          gradient: LinearGradient(
            colors: [Color(0xFF1761C5), Color(0xFF0BB8E4)],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Image.asset(
          icon,
          height: 16,
          width: 16,
          fit: BoxFit.fill,
          color: Colors.white,
        ),
      ),
      4.height,
      Text(title, style: primaryTextStyle(size: 12)),
    ],
  );
}

Widget dbTitleWidget({String? title, Color? titleColor, TextStyle? subTitleStyle, String? subTitle}) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title!, style: primaryTextStyle(size: 14, color: Colors.white.withOpacity(0.6),)),
      Spacer(),
      Expanded(child: Align(
          alignment: Alignment.centerRight,
          child: Text(subTitle!, style: subTitleStyle))),
    ],
  );
}

Widget dbNextCircleWidget() {
  return Container(
    height: 40,
    width: 40,
    decoration: boxDecorationWithRoundedCorners(
      borderRadius: radius(40),
      backgroundColor: Colors.grey,
    ),
    child: Icon(Icons.calendar_today, color: bgColor),
  );
}


Widget dbBackCircleWidget() {
  return Container(
    height: 40,
    width: 40,
    decoration: boxDecorationWithRoundedCorners(
      borderRadius: radius(40),
      backgroundColor: Colors.grey,
    ),
    child: Icon(Icons.calendar_today_outlined, color: bgColor),
  );
}


InputDecoration dbInputDecoration(BuildContext context, {String? hintText, Widget? prefixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    filled: true,
    fillColor: grey.withOpacity(0.1),
    hintText: hintText,
    hintStyle: secondaryTextStyle(),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    prefixIcon: prefixIcon,
  );
}

Future<void> launchURL(String url, {bool forceWebView = false}) async {
  await launch(url, enableJavaScript: true, forceWebView: forceWebView).catchError((e) {
    throw '$url is not valid';
  });
}


Widget mTop(BuildContext context, var title, {List<Widget>? actions, bool showBack = false}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: Stack(
      children: [
        AppBar(
            elevation: 0,
            backgroundColor: bgColor,
            leading: showBack
                ? IconButton(
              icon: Icon(Icons.arrow_back, color: white),
              onPressed: () {
                finish(context);
              },
            )
                : null,
            actions: actions,
            title: Text(
              title,
              style: boldTextStyle(color: Colors.white, size: 25),
            ),
            automaticallyImplyLeading: false),
        Container(
          margin: EdgeInsets.only(top: 60),
          decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 30, topLeft: 30), backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        ),
      ],
    ),
  );
}
