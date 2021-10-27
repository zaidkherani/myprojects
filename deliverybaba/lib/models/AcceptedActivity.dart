class TransactionsAccept {
  final String tc_no, doneby, date, status, time,phone,location;


  TransactionsAccept({required this.time,required this.tc_no, required this.doneby, required this.date,  required this.status,required this.phone,required this.location});
}

List<TransactionsAccept> TransactionsAccepted() {
  List<TransactionsAccept> TransactionsAccepted = [
    TransactionsAccept(
      tc_no: "ORD123456789",
      date: "01-03-2021",
      time: "08:22",
      doneby: "Hemant",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",

    ),
    TransactionsAccept(
      tc_no: "ORD123456789",
      doneby: "Vijay",
      date: "01-03-2021",
      time: "08:22",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",
    ),
    TransactionsAccept(
      tc_no: "ORD123456789",
      doneby: "Karan",
      date: "23-02-2021",
      time: "08:22",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",
    ),
    TransactionsAccept(
      tc_no: "ORD123456789",
      doneby: "Suprit",
      date: "21-02-2021",
      time: "08:22",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",
    ),
   /* TransactionsAccept(
      tc_no: "ORD123456789",
      doneby: "Jeetu",
      date: "23-02-2021",
      time: "08:22",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",
    ),
    TransactionsAccept(
      tc_no: "ORD123456789",
      doneby: "Zaid",
      date: "25-02-2021",
      time: "08:22",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",
    ),
    TransactionsAccept(
      tc_no: "ORD123456789",
      doneby: "Garima",
      date: "25-02-2021",
      time: "08:22",
      status: "Accepted",
      phone: "+91-1234567980",
      location: "Raipur - Durg",
    ),*/
  ];
  return TransactionsAccepted;
}
