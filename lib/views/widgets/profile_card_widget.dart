import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_model.dart';
import 'package:flutter_assignments/views/details_page.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

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
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/profilePic.png',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Abhay Shankur',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Flutter Developer | ROR Developer',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Profile profile = Profile(
                  imageUrl: 'assets/profilePic.png', 
                  name: 'Abhay Shankur', 
                  email: "abhayshankur1@gmail.com", 
                  contact: "8600679220", 
                  role: "Intern", 
                  expertise: 'Flutter Developer | ROR Developer'
                );
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