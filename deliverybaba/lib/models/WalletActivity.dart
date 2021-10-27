class walletActivity {
  final String trans_id, merchant, date, status, time, location, phone,amount;

  walletActivity(
      {required this.time,
      required this.trans_id,
      required this.location,
      required this.merchant,
      required this.date,
      required this.status,
      required this.amount,
      required this.phone});
}

List<walletActivity> demoWalletActivity() {
  List<walletActivity> demoWalletActivity = [
    walletActivity(
        trans_id: "CG8839105236",
        amount: "25264",
        date: "01-03-2021",
        time: "08:22",
        merchant: "Vijay",
        status: "Received",
        location: "Raipur",
        phone: "+91-0123456789"),
    walletActivity(
        trans_id: "+CG8839105236",
        merchant: "Zaid",
        amount: "25264",
        date: "01-03-2021",
        time: "08:22",
        status: "Received",
        location: "Basna",
        phone: "+91-0123456789"),
    walletActivity(
        trans_id: "+CG8839105236",
        merchant: "Praveen",
        amount: "25264",
        date: "23-02-2021",
        time: "08:22",
        status: "Sent",
        location: "Champa",
        phone: "+91-0123456789"),
    walletActivity(
        trans_id: "+CG8839105236",
        merchant: "Asif",
        amount: "25264",
        date: "21-02-2021",
        time: "08:22",
        status: "Received",
        location: "Bhilai",
        phone: "+91-0123456789"),
    walletActivity(
        trans_id: "+CG8839105236",
        merchant: "Hemant",
        amount: "25264",
        date: "23-02-2021",
        time: "08:22",
        status: "Sent",
        location: "Durg",
        phone: "+91-0123456789"),
  ];
  return demoWalletActivity;
}
