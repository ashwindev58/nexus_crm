import 'package:flutter/material.dart';

import '../../../../core/widgets/tittle_widget.dart';

PreferredSizeWidget companiesAppBar() {
  return AppBar(
        backgroundColor: const Color(0xFFF8F9FF),
        elevation: 0,
        centerTitle: false,
        title: tittileWidget(text: 'Companies'),
      );  
}