class Country {
  String name;
  String official;
  String capital;
  String region;
  String subregion;

  Country(
      {required this.name,
      required this.official,
      required this.capital,
      required this.region,
      required this.subregion});

  Country.fromJson(Map<String, dynamic> json)
      : name = (json['name'] != null && json['name']['common'] != null)
            ? json['name']['common']
            : '',
        official = (json['name'] != null && json['name']['official'] != null)
            ? json['name']['official']
            : '',
        capital = (json['capital'] != null && json['capital'][0] != null)
            ? json['capital'][0]
            : '',
        region = json['region'] ?? '',
        subregion = json['subregion'] ?? '';
}
