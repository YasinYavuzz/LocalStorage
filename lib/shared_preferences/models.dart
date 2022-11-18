enum Gender { female, male, other }

enum ProgrammingLanguages{dart ,kotlin, swift, javascript}

class Settings {

  String? userName;
  Gender? gender;
  Set<ProgrammingLanguages>? programmingLanguages;
  bool? isEmployed;

  Settings({
    this.userName,
    this.gender,
    this.programmingLanguages,
    this.isEmployed
  });

}
