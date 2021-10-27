import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:db_merchant_app/screens/DBDashboardScreen.dart';
import 'package:db_merchant_app/screens/DBDriverListScreen.dart';
import 'package:db_merchant_app/screens/DBWalletScreen.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'DBTransactionsScreen.dart';
import 'DBVehicleListScreen.dart';

class DBMainScreen extends StatefulWidget {
  static String tag = '/DBMainScreen';

  @override
  DBMainScreenState createState() => DBMainScreenState();
}

class DBMainScreenState extends State<DBMainScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(DBPrimaryColor);
  }

  @override
  void dispose() {
    setStatusBarColor(bgColor);
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {});
    selectedIndex = index;
  }

  static List<Widget> widgetOptions = <Widget>[
    DBDashboardScreen(),
    DBDriverListScreen(),
    DBVehicleListScreen(),
    DBNotificationScreen(),
    DBWalletScreen(),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: secondaryColor,
        activeColor: DBSecondaryColor,
        height: 60,
        elevation: 10,
        color: white.withOpacity(0.8),
        items: [
          TabItem(icon: Icons.dashboard_outlined, title: 'Dashboard'),
          TabItem(icon: Icons.people_outline_outlined, title: 'Driver List'),
          TabItem(icon: Icons.local_taxi_outlined, title: 'Vehicle List'),
          TabItem(
              icon: Center(
                  child: Text(
                '\u{20B9}',
                style: TextStyle(fontSize: 25, color: white),
              ),

              ),
              activeIcon: Center(
                child: Text(
                  '\u{20B9}',
                  style: TextStyle(fontSize: 30, color: bgColor),
                ),

              ),
              title: 'Orders'),
          TabItem(icon: Icons.account_balance_wallet, title: 'Wallet'),
        ],
        initialActiveIndex: selectedIndex,
        onTap: (int i) {
          onItemTapped(i);
        },
      ),
    );
  }
}
