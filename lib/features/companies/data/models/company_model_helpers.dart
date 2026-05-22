import 'package:flutter/material.dart';
import 'company_model.dart';

class CompanyModelParser {
  static CompanyModel fromJson(Map<String, dynamic> json) {
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
}

extension CompanyModelHelperExtension on CompanyModel {
  String get initials {
    if (company.name.isEmpty) return 'C';
    final parts = company.name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return parts[0].substring(0, 2).toUpperCase();
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
