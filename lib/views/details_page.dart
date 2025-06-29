import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_model.dart';

class DetailsPage extends StatelessWidget {
  final Profile details;

  const DetailsPage({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Details")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: details.imageUrl.toString().startsWith("assets")
                ? AssetImage(details.imageUrl) as ImageProvider<Object>
                : NetworkImage(details.imageUrl) as ImageProvider<Object>,
            ),
            const SizedBox(height: 20),
            Text(details.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            infoRow("Email", details.email),
            infoRow("Contact", details.contact ?? "No Contact Available"),
            infoRow("Role", details.role ?? "No Role Available"),
            infoRow("Expertise", details.expertise ?? "No Expertise Available"),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true); // Back to previous screen
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Follow", style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
