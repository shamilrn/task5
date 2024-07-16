import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'displayName.dart';

class ProfileInfo extends StatefulWidget {
  final int userId;

  const ProfileInfo({required this.userId});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool _isLoading = true;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/${widget.userId}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _firstName = data['data']['first_name'];
        _lastName = data['data']['last_name'];
        _email = data['data']['email'];
        _avatar = data['data']['avatar'];
        _isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: Text("Loading..."))
        : Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(_avatar!),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DisplayName(
                  firstName: _firstName ?? '',
                  secondName: _lastName ?? '',
                ),
                SizedBox(height: 8),
                Text(
                  _email ?? '',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
