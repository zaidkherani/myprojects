import 'package:db_merchant_app/components/DBConfirmationComponent.dart';
import 'package:db_merchant_app/components/DBTransactionAccepted.dart';
import 'package:db_merchant_app/components/DBTransactionComponent.dart';
import 'package:db_merchant_app/components/notification_tab_request_component.dart';
import 'package:db_merchant_app/components/notification_tab_accepted_component.dart';
import 'package:db_merchant_app/models/AcceptedActivity.dart';
import 'package:db_merchant_app/models/TransactionsActivity.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class DBNotificationScreen extends StatefulWidget {
  static String tag = '/DBActivityScreen';

  @override
  DBNotificationScreenState createState() => DBNotificationScreenState();
}

class DBNotificationScreenState extends State<DBNotificationScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  String selectedDays = 'Monthly';


  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                activityTabBar(context, tabController: tabController),
                TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          NotificationTabRequestComponent(),
                          TransactionList(),
                        ],
                      ),
                      ),
                    SingleChildScrollView(child: Column(
                      children: [
                        NotificationTabAcceptedComponent(),
                        TransactionAccepted(),
                      ],
                    ),
                    ),
                  ],
                ).expand(),

              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget activityTabBar(BuildContext context, {required TabController tabController}) {
  return Container(
    height: 40,
    margin: EdgeInsets.only(left: context.width() * 0.1, right: context.width() * 0.1),
    decoration: BoxDecoration(
      color: DBSecondaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: TabBar(
      labelPadding: EdgeInsets.all(0),
      indicatorPadding: EdgeInsets.all(0),
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      labelColor: DBSecondaryColor,
      unselectedLabelColor: Colors.white,
      tabs: [
        Tab(text: 'Requests'),
        Tab(text: 'Accepted'),
      ],
    ),
  ).paddingOnly(left: 0, right: 0, top: 16);
}


class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);


  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transactions> TransactionsActivities = TransactionsActivity();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child:Container(

              child:  Row(
                children: <Widget>[

                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: List.generate(TransactionsActivities.length, (index) {
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
                                                  Text(TransactionsActivities[index].tc_no,
                                                      style: secondaryTextStyle(
                                                          color: white.withOpacity(0.6)),
                                                      maxLines: 1),
                                                  8.height,
                                                  Text(TransactionsActivities[index].doneby,
                                                      style: boldTextStyle(
                                                          color: white.withOpacity(0.8)),
                                                      maxLines: 1),
                                                  4.height,
                                                  Text(TransactionsActivities[index].phone,
                                                      style: secondaryTextStyle(
                                                          color: white.withOpacity(0.6)),
                                                      maxLines: 1),
                                                ],
                                              ),
                                              OutlineButton(
                                                  child: new Text(
                                                    TransactionsActivities[index].status ==
                                                        'cancelled'
                                                        ? "Cancelled"
                                                        : TransactionsActivities[index].status ==
                                                        'accepted'
                                                        ? "Accepted"
                                                        : "Cancel",
                                                    style: boldTextStyle(
                                                        color:
                                                        TransactionsActivities[index].status ==
                                                            'cancelled'
                                                            ? DBSecondaryColor
                                                            : TransactionsActivities[index]
                                                            .status ==
                                                            'accepted'
                                                            ? greenColor
                                                            : redColor),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: TransactionsActivities[index].status ==
                                                          'cancelled'
                                                          ? DBSecondaryColor
                                                          : TransactionsActivities[index].status ==
                                                          'accepted'
                                                          ? greenColor
                                                          : redColor),
                                                  onPressed: () {},
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius:
                                                      new BorderRadius.circular(20.0))),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(TransactionsActivities[index].date + "  " +TransactionsActivities[index].time ,
                                                  style: secondaryTextStyle(
                                                      color: white.withOpacity(0.6)),
                                                  maxLines: 1),
                                              4.height,
                                              Text(TransactionsActivities[index].location,
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
                                    child: DBTransactionComponent(status: TransactionsActivities[index].status),
                                  ),
                                );
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ).paddingOnly(bottom: 16,top: 16),
          ),
        ],
      ),
    );
  }
}


class TransactionAccepted extends StatefulWidget {
  const TransactionAccepted({Key? key}) : super(key: key);

  @override
  _TransactionAcceptedState createState() => _TransactionAcceptedState();
}

class _TransactionAcceptedState extends State<TransactionAccepted> {
  List<TransactionsAccept> AcceptedActivities = TransactionsAccepted();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child:Container(
              child:  Row(
                children: <Widget>[

                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: List.generate(AcceptedActivities.length, (index) {
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
                                                  Text(AcceptedActivities[index].tc_no,
                                                      style: secondaryTextStyle(
                                                          color: white.withOpacity(0.8)),
                                                      maxLines: 1),
                                                  8.height,
                                                  Text(AcceptedActivities[index].doneby,
                                                      style: boldTextStyle(
                                                          color: white.withOpacity(0.8)),
                                                      maxLines: 1),
                                                  4.height,
                                                  Text(AcceptedActivities[index].phone,
                                                      style: secondaryTextStyle(
                                                          color: white.withOpacity(0.6)),
                                                      maxLines: 1),
                                                ],
                                              ),
                                              new Text(
                                                AcceptedActivities[index].status ==
                                                    'Cancelled'
                                                    ? "Cancelled"
                                                    : AcceptedActivities[index].status ==
                                                    'Accepted'
                                                    ? "Accepted"
                                                    : "Cancel",
                                                style: boldTextStyle(
                                                    color:
                                                    AcceptedActivities[index].status ==
                                                        'Cancelled'
                                                        ? DBSecondaryColor
                                                        : AcceptedActivities[index]
                                                        .status ==
                                                        'Accepted'
                                                        ? greenColor
                                                        : redColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(AcceptedActivities[index].date + "  " +AcceptedActivities[index].time ,
                                                  style: secondaryTextStyle(
                                                      color: white.withOpacity(0.6)),
                                                  maxLines: 1),
                                              4.height,

                                              Text(AcceptedActivities[index].location,
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
                                    child: DBTransactionAccepted(status: AcceptedActivities[index].status,),
                                  ),
                                );
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ).paddingOnly(bottom: 16,top: 16),
          ),
        ],
      ),
    );
  }
}