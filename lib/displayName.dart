import 'package:flutter/material.dart';

class DisplayName extends StatelessWidget {
  final String firstName;
  final String secondName;
  final String prefix;
  final String suffix;

  const DisplayName({
    required this.firstName,
    required this.secondName,
    this.prefix = '',
    this.suffix = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$prefix$firstName $secondName$suffix',
      style: TextStyle(fontSize: 24),
    );
  }
}

