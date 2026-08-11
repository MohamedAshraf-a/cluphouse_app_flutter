class User {
  final String firstName;
  final String lastName;
  final String imageURL;
  final String username;
  final String bio;
  final int followers;
  final int following;

  const User({
    required this.firstName,
    required this.lastName,
    required this.imageURL,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });
}