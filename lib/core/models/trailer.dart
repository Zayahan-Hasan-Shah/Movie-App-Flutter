class TrailerModel {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? offical;
  final DateTime? publishAt;
  final String? id;

  TrailerModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.offical,
    required this.publishAt,
    required this.id,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      iso6391: json['iso639_1'],
      iso31661: json['iso3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      offical: json['offical'],
      publishAt: DateTime.tryParse(json['publish_at'] ?? ''),
      id: json['id'],
    );
  }
}
