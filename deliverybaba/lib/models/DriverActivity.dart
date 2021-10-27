class DriverActivity {
  final String license, vehicle, date, status, time, location,phone;


  DriverActivity({required this.time,required this.license, required this.location, required this.vehicle, required this.date,  required this.status,required this.phone});
}

List<DriverActivity> demoDriverActivity() {
  List<DriverActivity> demoDriverActivity = [
      DriverActivity(
        license: "CG8839105236",
      date: "01-03-2021",
      time: "08:22",
      vehicle: "Vijay",
      status: "Online",
      location: "Raipur",
        phone: "+91-0123456789"
    ),
    DriverActivity(
      license: "+CG8839105236",
      vehicle: "Zaid",
      date: "01-03-2021",
      time: "08:22",
      status: "Offline",
      location: "Basna",
        phone: "+91-0123456789"
    ),
    DriverActivity(
      license: "+CG8839105236",
      vehicle: "Praveen",
      date: "23-02-2021",
      time: "08:22",
      status: "Online",
      location: "Champa",
        phone: "+91-0123456789"
    ),
    DriverActivity(
      license: "+CG8839105236",
      vehicle: "Asif",
      date: "21-02-2021",
      time: "08:22",
      status: "Offline",
      location: "Bhilai",
        phone: "+91-0123456789"
    ),
    DriverActivity(
      license: "+CG8839105236",
      vehicle: "Hemant",
      date: "23-02-2021",
      time: "08:22",
      status: "Online",
      location: "Durg",
        phone: "+91-0123456789"
    ),
   /* DriverActivity(
      license: "+CG8839105236",
      vehicle: "Nagesh",
      date: "25-02-2021",
      time: "08:22",
      status: "Online",
      location: "Korba",
    ),
    DriverActivity(
      license: "+CG8839105236",
      vehicle: "Mrityunjay",
      date: "25-02-2021",
      time: "08:22",
      status: "Offline",
      location: "Raipur",
    ),*/
  ];
  return demoDriverActivity;
}
