import 'package:db_merchant_app/components/DBConfirmationComponent.dart';
import 'package:db_merchant_app/components/DBTrackComponent.dart';
import 'package:db_merchant_app/models/RecentActivity.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

  class DBTrackOrderScreen extends StatefulWidget {
  const DBTrackOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DBTrackOrderScreenState createState() => _DBTrackOrderScreenState();
}

class _DBTrackOrderScreenState extends State<DBTrackOrderScreen> {
  List<RecentActivity> recentActivities = demoRecentActivities();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
            elevation: 1,
            backgroundColor: bgColor,
            title: Text('Track Order'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: white),
              onPressed: () {
                finish(context);
              },
            ),
            automaticallyImplyLeading: false),
        body: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Today\'s Activity",
                  style: boldTextStyle(color: white.withOpacity(0.9)),
                ),
              ),
              Container(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(recentActivities.length, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              '#${index + 1} ',
                              style: boldTextStyle(
                                  size: 18, color: white.withOpacity(0.8)),
                            ),
                          ),
                          4.width,
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(recentActivities[index].date + " "+ recentActivities[index].time,
                                            style: secondaryTextStyle(
                                                color: white.withOpacity(0.6)),
                                            maxLines: 1),
                                        8.height,
                                        Text(recentActivities[index].name,
                                            style: boldTextStyle(
                                                color: white.withOpacity(0.8)),
                                            maxLines: 1),
                                        4.height,
                                        Text(recentActivities[index].phone,
                                            style: secondaryTextStyle(
                                                color: white.withOpacity(0.6)),
                                            maxLines: 1),
                                      ],
                                    ),
                                    new Text(
                                      recentActivities[index].status ==
                                          'cancelled'
                                          ? "Cancelled"
                                          : recentActivities[index].status ==
                                          'accepted'
                                          ? "Accepted"
                                          : "Cancel",
                                      style: boldTextStyle(
                                          color:
                                          recentActivities[index].status ==
                                              'cancelled'
                                              ? DBSecondaryColor
                                              : recentActivities[index]
                                              .status ==
                                              'accepted'
                                              ? greenColor
                                              : redColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(recentActivities[index].location,
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
                    ).onTap(() {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          decoration: new BoxDecoration(
                            color: bgColor,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(25.0),
                              topRight: const Radius.circular(25.0),
                            ),
                          ),
                          child: DBTrackComponent(),
                        ),
                      );
                    });
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
