class MedicalHistory {
  final String title;

  MedicalHistory({required this.title});
}

class Services {
  final String title;

  Services({required this.title});

  // Correct the factory constructor name to match the class name.
  factory Services.fromString(String title) {
    return Services(title: title);
  }
}

class Serice {
  final String title;

  Serice({required this.title});
}
