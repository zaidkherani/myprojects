class RecentActivity {
  final String phone, date, name, status, time, location;
  

  RecentActivity({required this.time,required this.phone, required this.location, required this.date, required this.name, required this.status});
}

List<RecentActivity> demoRecentActivities() {
  List<RecentActivity> demoRecentActivities = [
    RecentActivity(
      phone: "+918839105236",
      date: "01-03-2021",
      time: "08:22",
      name: "Hemant",
      status: "accepted",
      location: "Raipur - Durg",
    ),
    RecentActivity(
      phone: "+918839105236",
      date: "01-03-2021",
      time: "08:22",
      name: "Zaid",
      status: "cancelled",
      location: "Raipur - Champa",
    ),
    RecentActivity(
      phone: "+918839105236",
      date: "23-02-2021",
      time: "08:22",
      name: "Hemant",
      status: "accepted",
      location: "Raipur - Champa",
    ),
    RecentActivity(
      phone: "+918839105236",
      date: "21-02-2021",
      time: "08:22",
      name: "Hemant",
      status: "cancelled",
      location: "Raipur - Bhilai",
    ),
    /*RecentActivity(
      phone: "+918839105236",
      title: "Order Cancelled",
      date: "23-02-2021",
      time: "08:22",
      name: "Zaid",
      status: "accepted",
      location: "Raipur to Durg",
    ),
    RecentActivity(
      phone: "+918839105236",
      title: "Sales Report",
      date: "25-02-2021",
      time: "08:22",
      name: "Vijay",
      status: "accepted",
      location: "Raipur to Korba",
    ),
    RecentActivity(
      phone: "+918839105236",
      title: "Driver Added",
      date: "25-02-2021",
      time: "08:22",
      name: "Hemant",
      status: "cancelled",
      location: "Raipur to Janjgir",
    ),*/
  ];
  return demoRecentActivities;
}
