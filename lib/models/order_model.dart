class Orders {
  final String name;
  final String location;
  final String houseDescription;
  final String houseNumber;
  final int cost;
  final String paymentMethod;
  final String status;
  final String type;
  Orders({
    required this.name,
    required this.location,
    required this.houseDescription,
    required this.houseNumber,
    required this.cost,
    required this.paymentMethod,
    required this.type,
    required this.status,
  });

  static List list = [
    Orders(
      name: 'Kwame Gyesi',
      location: 'Dansoman/Accra',
      houseDescription: 'Yellow gates beside the St.Mark school',
      houseNumber: 'GHA-445-4323',
      cost: 5,
      paymentMethod: 'Cash',
      type: 'Instant pickup',
      status: 'Completed',
    ),
    Orders(
      name: 'Mary Nkoumah',
      location: 'Dansoman/Accra',
      houseDescription: 'Green gate after the filling station',
      houseNumber: 'GHA-232-2343',
      cost: 5,
      paymentMethod: 'Cash',
      type: 'Instant pickup',
      status: 'Pending',
    ),
    Orders(
      name: 'Yaw Gbedeseh',
      location: 'Dansoman/Accra',
      houseDescription: 'Compound house at the bridge room 3 from',
      houseNumber: 'GHA-232-2343',
      cost: 5,
      paymentMethod: 'Cash',
      type: 'Instant pickup',
      status: 'Pending',
    ),
  ];
}
