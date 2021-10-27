import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBImages.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:db_merchant_app/utils/sliderButton/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'DBConfirmationDialog.dart';

class DBTrackComponent extends StatefulWidget {
  static String tag = '/DBTrackComponent';

  @override
  DBTrackComponentState createState() => DBTrackComponentState();
}

class DBTrackComponentState extends State<DBTrackComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                4.width,
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      dbTitleWidget(
                          title: '05-07-2021 8:10',
                          subTitle: "",
                          titleColor: yellowGreen,
                          subTitleStyle:
                          secondaryTextStyle(color: yellowGreen)),
                      4.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hemant",
                                  style: boldTextStyle(
                                      color: white.withOpacity(0.8)),
                                  maxLines: 1),
                              4.height,
                              Text("+91-8871292380",
                                  style: secondaryTextStyle(
                                      color: white.withOpacity(0.6)),
                                  maxLines: 1),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("17-Oct-2021",
                              style: secondaryTextStyle(
                                  color: white.withOpacity(0.6)),
                              maxLines: 1),
                          4.height,
                          Text("Raipur-Durg",
                              style: secondaryTextStyle(
                                  color: white.withOpacity(0.6)),
                              maxLines: 1),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Image.asset("images/map.jpg")
                  ]
              )
          )
        ],
      ),
    );
  }
}
