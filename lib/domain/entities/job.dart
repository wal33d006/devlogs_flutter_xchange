class Job {
  final String title;
  final String companyName;
  final String description;
  final bool isRemote;
  final List<String> skills;

  Job({
    required this.title,
    required this.companyName,
    required this.description,
    required this.isRemote,
    required this.skills,
  });
}
