import 'package:db_merchant_app/components/header.dart';
import 'package:db_merchant_app/components/my_activities.dart';
import 'package:db_merchant_app/components/recent_activities.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class DBDashboardScreen extends StatefulWidget {
  const DBDashboardScreen({Key? key}) : super(key: key);

  @override
  _DBDashboardScreenState createState() => _DBDashboardScreenState();
}

class _DBDashboardScreenState extends State<DBDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgColor);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              MyActivities(),
              SizedBox(height: defaultPadding),
              RecentActivities(),
              SizedBox(height: defaultPadding),
              // ActivityDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
