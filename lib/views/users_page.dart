import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_model.dart';
import 'package:flutter_assignments/views/widgets/profile_card_widget.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<dynamic> _users = [];
  bool _loading = true;

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _users = data['data'];
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ProfileCardWidget(
                  profile: Profile(
                    imageUrl: user['avatar'],
                    email: user['email'], 
                    name: "${user['first_name']} ${user['last_name']}",
                  ),
                );
                // return Card(
                //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       backgroundImage: NetworkImage(user['avatar']),
                //     ),
                //     title: Text("${user['first_name']} ${user['last_name']}"),
                //     subtitle: Text(user['email']),
                //   ),
                // );
              },
            ),
    );
  }
}
