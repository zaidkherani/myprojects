import 'package:db_merchant_app/components/DBConfirmationComponent.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DBCompletedOrderScreen extends StatefulWidget {
  const DBCompletedOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DBCompletedOrderScreenState createState() => _DBCompletedOrderScreenState();
}

class _DBCompletedOrderScreenState extends State<DBCompletedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: bgColor,
              title: Text('Completed Order\'s'),
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                          '1',
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
                                    Text("ORD0123456789",
                                        style: secondaryTextStyle(
                                            color: white.withOpacity(0.6)),
                                        maxLines: 1),
                                    8.height,
                                    Text("Hemant",
                                        style: boldTextStyle(
                                            color: white.withOpacity(0.8)),
                                        maxLines: 1),
                                    4.height,
                                    Text("+91-0123456789",
                                        style: secondaryTextStyle(
                                            color: white.withOpacity(0.6)),
                                        maxLines: 1),
                                  ],
                                ),
                                new Text("Completed",
                                    style: boldTextStyle(
                                      color: Colors.green,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("21-May-2021",
                                    style: secondaryTextStyle(
                                        color: white.withOpacity(0.6)),
                                    maxLines: 1),
                                4.height,
                                Text("Raipur - Durg",
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
                )/*.onTap(() {
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
                child: DBConfirmationComponent(),
              ),
            );
          }),*/
              ],
            ),
          )),
    );
  }
}
