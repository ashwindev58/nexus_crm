import 'package:flutter/material.dart';

import 'address_model.dart';
import 'company_info_model.dart';
import 'company_model_helpers.dart';

export 'address_model.dart';
export 'company_info_model.dart';
export 'company_model_helpers.dart';
export 'geo_model.dart';

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

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      CompanyModelParser.fromJson(json);
}
