import 'package:db_merchant_app/models/WalletActivity.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class DBWalletScreen extends StatefulWidget {
  const DBWalletScreen({Key? key}) : super(key: key);

  @override
  _DBWalletScreenState createState() => _DBWalletScreenState();
}

class _DBWalletScreenState extends State<DBWalletScreen> {
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
              SizedBox(height: defaultPadding),
              Wallet(),
              SizedBox(height: defaultPadding),
              WalletActivity(),
            ],
          ),
        ),
      ),
    );
  }
}

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [DBSecondaryColor, DBPrimaryColor])),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Balance,',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ' \u{20B9}',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: white),
                              ),
                            ),
                            Text(
                              '6,354.00',
                              style: GoogleFonts.mulish(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),

                            /*
                             Icon(Icons.refresh_outlined, color: white, size: 22),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(40)
                                ),

                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.refresh_outlined),
                                  color: Colors.orangeAccent,
                                  iconSize: 24,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Positioned(
                      right: -160,
                      top: -220,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: Colors.orange,
                      ),
                    ),
                    /* Positioned(
                      left: -160,
                      top: -190,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: Colors.lightBlue,
                      ),
                    ),
                    Positioned(
                      right: -170,
                      bottom: -170,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: Colors.yellowAccent,
                      ),
                    ),
                    Positioned(
                      right: -160,
                      bottom: -190,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: Colors.yellow,
                      ),
                    )*/
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      gradient:
                      LinearGradient(colors: [DBPrimaryColor,DBSecondaryColor])),
                  child: RaisedButton.icon(
                    color: white,

                      onPressed: null,
                      icon: Icon(Icons.account_balance_wallet_outlined),
                      label: Text(
                        "Withdraw",
                        style: TextStyle(color: white),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      gradient:
                      LinearGradient(colors: [DBPrimaryColor,DBSecondaryColor])),
                  child: RaisedButton.icon(
                      color: white,

                      onPressed: null,
                      icon: Icon(Icons.account_balance_wallet_outlined),
                      label: Text(
                        "Transfer",
                        style: TextStyle(color: white),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WalletActivity extends StatefulWidget {
  const WalletActivity({Key? key}) : super(key: key);

  @override
  _WalletActivityState createState() => _WalletActivityState();
}

class _WalletActivityState extends State<WalletActivity> {
  List<walletActivity> WalletActivities = demoWalletActivity();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            "Transaction\'s",
                            style: boldTextStyle(
                                color: white.withOpacity(0.9), size: 18),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children:
                                List.generate(WalletActivities.length, (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
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
                                            size: 18,
                                            color: white.withOpacity(0.8)),
                                      ),
                                    ),
                                    4.width,
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      WalletActivities[index]
                                                          .trans_id,
                                                      style: secondaryTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.6)),
                                                      maxLines: 1),
                                                  6.height,
                                                  Text(
                                                      WalletActivities[index]
                                                          .merchant,
                                                      style: boldTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.8)),
                                                      maxLines: 1),
                                                  4.height,
                                                  Text(
                                                      WalletActivities[index]
                                                              .amount +
                                                          ' \u{20B9}',
                                                      style: boldTextStyle(
                                                          size: 15,
                                                          color:
                                                              white.withOpacity(
                                                                  0.6)),
                                                      maxLines: 1),
                                                  Text(
                                                      WalletActivities[index]
                                                          .phone,
                                                      style: secondaryTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.6)),
                                                      maxLines: 1),
                                                ],
                                              ),
                                              new Text(
                                                WalletActivities[index]
                                                            .status ==
                                                        'Received'
                                                    ? "Received"
                                                    : WalletActivities[index]
                                                                .status ==
                                                            'Sent'
                                                        ? "Sent"
                                                        : "Cancel",
                                                style: boldTextStyle(
                                                    color: WalletActivities[
                                                                    index]
                                                                .status ==
                                                            'Received'
                                                        ? cyan
                                                        : WalletActivities[
                                                                        index]
                                                                    .status ==
                                                                'Sent'
                                                            ? orange
                                                            : yellow),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  WalletActivities[index].date +
                                                      " " +
                                                      WalletActivities[index]
                                                          .time,
                                                  style: secondaryTextStyle(
                                                      color: white
                                                          .withOpacity(0.6)),
                                                  maxLines: 1),
                                              4.height,
                                              Text(
                                                  WalletActivities[index]
                                                      .location,
                                                  style: secondaryTextStyle(
                                                      color: white
                                                          .withOpacity(0.6)),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.80,
                                          decoration: new BoxDecoration(
                                            color: bgColor,
                                            borderRadius: new BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(25.0),
                                              topRight:
                                                  const Radius.circular(25.0),
                                            ),
                                          ),
                                          child: WalletActivity(),
                                        ));
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ).paddingOnly(bottom: 16, top: 16),
          ),
        ],
      ),
    );
  }
}
