class Transactions {
  final String tc_no, doneby, date, status, time,phone, location;


  Transactions({required this.time,required this.tc_no, required this.doneby, required this.date,  required this.status,required this.phone,required this.location});
}

List<Transactions> TransactionsActivity() {
  List<Transactions> TransactionsActivity = [
    Transactions(
        tc_no: "ORD123456789",
      date: "01-03-2021",
      time: "08:22",
      doneby: "Hemant",
      status: "requested",
      phone: "+91-1234567980",
      location: "Raipur - Raigarh"
    ),
    Transactions(
        tc_no: "ORD123456789",
      doneby: "Vijay",
      date: "01-03-2021",
      time: "08:22",
      status: "requested",
      phone: "+91-1234567980",
      location: "Raipur - Raigarh"
    ),
    Transactions(
        tc_no: "ORD123456789",
      doneby: "Karan",
      date: "23-02-2021",
      time: "08:22",
      status: "requested",
      phone: "+91-1234567980",
      location: "Raipur - Raigarh"
    ),
    Transactions(
        tc_no: "ORD123456789",
      doneby: "Suprit",
      date: "21-02-2021",
      time: "08:22",
      status: "requested",
      phone: "+91-1234567980",
        location: "Raipur - Raigarh"
    ),
   /* Transactions(
      tc_no: "TNS8839105236",
      doneby: "Jeetu",
      date: "23-02-2021",
      time: "08:22",
      status: "requested",
      phone: "+91-1234567980",
        location: "Raipur - Raigarh"
    ),
    Transactions(
      tc_no: "TNS8839105236",
      doneby: "Zaid",
      date: "25-02-2021",
      time: "08:22",
      status: "requested",
      phone: "+91-1234567980",
    ),
    Transactions(
      tc_no: "TNS8839105236",
      doneby: "Garima",
      date: "25-02-2021",
      time: "08:22",
      status: "requested",
      phone: "+91-1234567980",
    ),*/
  ];
  return TransactionsActivity;
}
