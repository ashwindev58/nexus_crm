import 'package:flutter/material.dart';

class CompaniesNotFoundWidget extends StatelessWidget {
  const CompaniesNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 80),
        Center(
          child: Text(
            'No companies found',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
