class Team {
  String id;
  String name;
  String country;
  String country_code;
  String abbreviation;

  Team(this.id, this.name, this.country, this.country_code, this.abbreviation);

  Team.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        country = json['country'],
        country_code = json['country_code'],
        abbreviation = json['abbreviation'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'country': country,
        'country_code': country_code,
        'abbreviation': abbreviation,
      };
}
