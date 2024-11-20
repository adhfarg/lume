import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lume/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user?.displayName ?? 'N/A'}'),
            Text('Email: ${user?.email ?? 'N/A'}'),
            Text('Phone: ${user?.phoneNumber ?? 'N/A'}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement health verification process
              },
              child: const Text('Update Health Certification'),
            ),
          ],
        ),
      ),
    );
  }
}
