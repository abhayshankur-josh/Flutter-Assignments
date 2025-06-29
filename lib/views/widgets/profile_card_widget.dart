import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_model.dart';
import 'package:flutter_assignments/views/details_page.dart';

class ProfileCardWidget extends StatelessWidget {
  final Profile profile;

  const ProfileCardWidget({
    super.key,
    this.profile = const Profile(
      name: 'Abhay Shankur',
      email: 'abhayshankur@example.com',
      imageUrl: 'assets/profilePic.png',
      expertise: 'Flutter Developer',
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: profile.imageUrl.toString().startsWith("assets")
                ? AssetImage(profile.imageUrl) as ImageProvider<Object>
                : NetworkImage(profile.imageUrl) as ImageProvider<Object>,
            ),
            const SizedBox(height: 12),
            Text(
              profile.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              profile.expertise ?? profile.email,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final res = await Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsPage(details: profile)));
                if(context.mounted && res is bool && res){
                  const snackBar = SnackBar(content: Text('Thanks for following'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('View', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}