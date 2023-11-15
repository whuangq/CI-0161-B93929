import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  
  final double? elevation;
  final String? title;

  const CustomCard({
    super.key,
    this.elevation,
    this.title,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Text(title ?? ''),
      ),
    );
  }
}