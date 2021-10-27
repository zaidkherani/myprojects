import 'package:db_merchant_app/utils/DBImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DBConfirmationDialog extends StatefulWidget {
  static String tag = '/DBConfirmationDialog';

  @override
  DBConfirmationDialogState createState() => DBConfirmationDialogState();
}

class DBConfirmationDialogState extends State<DBConfirmationDialog> {
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
      padding: EdgeInsets.only(top: 50, bottom: 50, right: 16, left: 16),
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (c, s) => s.connectionState == ConnectionState.done
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        db_done,
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                        color: black,
                      ),
                      30.height,
                      Text("Complete", style: boldTextStyle(size: 20)),
                      8.height,
                      Text(
                        'Order accepted!',
                        style: primaryTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        db_processing,
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                        color: black,
                      ),
                      16.height,
                      Text("Processing...", style: boldTextStyle(size: 20)),
                      8.height,
                      Text(
                        'Just hold a seconds, we are processing your order',
                        style: primaryTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
