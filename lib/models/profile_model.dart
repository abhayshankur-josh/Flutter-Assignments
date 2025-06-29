class Profile{
  final String imageUrl;
  final String name;
  final String email;
  final String? contact;
  final String? role;
  final String? expertise;

  const Profile({
    required this.imageUrl,
    required this.name,
    required this.email,
    this.contact,
    this.role,
    this.expertise,
  });

}