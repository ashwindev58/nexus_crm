import 'package:flutter/material.dart';

class CompanyModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final CompanyInfo company;

  // UI Enrichment Fields
  final String status;
  final String lastActive;
  final Color themeColor;
  final List<String> teamAvatars;

  const CompanyModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
    this.status = 'active',
    this.lastActive = '2h ago',
    this.themeColor = const Color(0xFF4F46E5),
    this.teamAvatars = const ['A', 'B'],
  });

  // Getters for visual presentation
  String get initials {
    if (company.name.isEmpty) return 'C';
    final parts = company.name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return parts[0].substring(0, 2).toUpperCase();
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: CompanyInfo.fromJson(json['company'] as Map<String, dynamic>),
      status: json['status'] as String? ?? 'active',
      lastActive: json['lastActive'] as String? ?? '2h ago',
      themeColor: json['themeColor'] != null
          ? Color(json['themeColor'] as int)
          : const Color(0xFF4F46E5),
      teamAvatars: json['teamAvatars'] != null
          ? List<String>.from(json['teamAvatars'] as List)
          : const ['A', 'B'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
      'status': status,
      'lastActive': lastActive,
      'themeColor': themeColor.toARGB32(),
      'teamAvatars': teamAvatars,
    };
  }

  CompanyModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    CompanyInfo? company,
    String? status,
    String? lastActive,
    Color? themeColor,
    List<String>? teamAvatars,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
      status: status ?? this.status,
      lastActive: lastActive ?? this.lastActive,
      themeColor: themeColor ?? this.themeColor,
      teamAvatars: teamAvatars ?? this.teamAvatars,
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }
}

class Geo {
  final String lat;
  final String lng;

  const Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

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
