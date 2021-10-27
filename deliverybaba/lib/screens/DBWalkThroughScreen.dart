import 'package:db_merchant_app/utils/DBImages.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'DBSignInScreen.dart';

class DBWalkThroughScreen extends StatefulWidget {
  static String tag = '/DBWalkThroughScreen';

  @override
  DBWalkThroughScreenState createState() => DBWalkThroughScreenState();
}

class DBWalkThroughScreenState extends State<DBWalkThroughScreen> {
  List<String> mPages = <String>[DBWalkThroughImage1, DBWalkThroughImage2, DBWalkThroughImage3];

  int position = 0;

  PageController? pageController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController = PageController(initialPage: position, viewportFraction: 0.75);
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
      body: Stack(
        children: [
          Column(
            children: [
              70.height,
              Container(
                height: context.height() * 0.5,
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: mPages.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: 500.milliseconds,
                      height: index == position ? context.height() * 0.5 : context.height() * 0.45,
                      margin: EdgeInsets.only(left: 16, right: 8),
                      child: Image.asset(
                        mPages[index],
                        fit: BoxFit.cover,
                        width: context.width(),
                      ).cornerRadiusWithClipRRect(16),
                    );
                  },
                  onPageChanged: (value) {
                    setState(() {
                      position = value;
                    });
                  },
                ),
              ),
              20.height,
              DotIndicator(pageController: pageController!, pages: mPages, indicatorColor: DBSecondaryColor, unselectedIndicatorColor: DBPrimaryColor,),
              16.height,
              Text('Welcome to Delivery Baba', style: boldTextStyle(size: 20,color: white)).paddingOnly(left: 16, right: 16),
              16.height,
              Text('Delivery Baba is an app which is serve users to deliver their package.', style: secondaryTextStyle(), textAlign: TextAlign.center).paddingOnly(left: 16, right: 16),
              16.height,
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  width: (context.width() - (3 * 16)) * 0.5,
                  height: 60,
                  text: 'Skip',
                  textStyle: boldTextStyle(),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  onTap: () {
                    DBSignInScreen().launch(context);
                  },
                  color: DBPrimaryColor,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                ),
                16.width,
                AppButton(
                  width: (context.width() - (3 * 16)) * 0.5,
                  text: position < 2 ? 'Next' : 'Finish',
                  height: 60,
                  elevation: 0,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: DBSecondaryColor,
                  textStyle: boldTextStyle(color: white),
                  onTap: () {
                    setState(() {
                      if (position < 2) {
                        pageController!.nextPage(duration: Duration(microseconds: 300), curve: Curves.linear);
                      } else if (position == 2) {
                        DBSignInScreen().launch(context);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }
}
