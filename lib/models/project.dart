class Project {
  String name;
  int year;
  String description;
  String imageURl;
  List<String>? technologiesUsed;

  Project({
    required this.name,
    required this.year,
    required this.description,
    required this.imageURl,
    this.technologiesUsed,
  });
}
