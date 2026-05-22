class CompanyInfo {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyInfo({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
