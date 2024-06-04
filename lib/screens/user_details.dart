import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //this accepts the user details
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username:${user.username}'),
            Text('Username:\t\t${user.email}'),
          ],
        ),
      ),
    );
  }
}
