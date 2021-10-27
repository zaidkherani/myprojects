class VehicleActivity {
  final String rc_no, vehicle, date, status, time, location,capacity;


  VehicleActivity({required this.time,required this.capacity,required this.rc_no, required this.location, required this.vehicle, required this.date,  required this.status});
}

List<VehicleActivity> demoVehicleActivity() {
  List<VehicleActivity> demoVehicleActivity = [
    VehicleActivity(
      rc_no: "CGXXXXXXX",
      date: "01-03-2021",
      time: "08:22",
      vehicle: "Sumo Gold",
      status: "Booked",
      capacity: "2.0 Ton",
      location: "Raipur - Raigarh",
    ),
    VehicleActivity(
      rc_no: "CGXXXXXXX",
      vehicle: "Mazda",
      date: "01-03-2021",
      time: "08:22",
      status: "requested",
      capacity: "2.5 Ton",
      location: "Raipur - Champa",
    ),
    VehicleActivity(
      rc_no: "CGXXXXXXX",
      vehicle: "Isuzu",
      date: "23-02-2021",
      time: "08:22",
      status: "Available",
      capacity: "1.35 Ton",
      location: "Raipur - Champa",
    ),
    VehicleActivity(
      rc_no: "CGXXXXXXX",
      vehicle: "Supro",
      date: "21-02-2021",
      time: "08:22",
      status: "Available",
      capacity: "0.6 Ton",
      location: "Raipur - Bhilai",
    ),
  /*  VehicleActivity(
        rc_no: "CGXXXXXXX",
      vehicle: "Jeeto",
      date: "23-02-2021",
      time: "08:22",
      status: "accepted",
      capacity: "0.75 Ton",
      location: "Raipur - Durg",
    ),
    VehicleActivity(
      rc_no: "CGXXXXXXX",
      vehicle: "Sumo",
      date: "25-02-2021",
      time: "08:22",
      status: "Booked",
      capacity: "1.2 Ton",
      location: "Raipur to Korba",
    ),
    VehicleActivity(
      rc_no: "CGXXXXXXX",
      vehicle: "Pik-Up 1.7T",
      date: "25-02-2021",
      time: "08:22",
      status: "Available",
      capacity: "1.7 Ton",
      location: "Raipur to Janjgir",
    ),*/
  ];
  return demoVehicleActivity;
}
