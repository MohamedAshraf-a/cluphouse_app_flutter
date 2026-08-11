import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'user_profile_image.dart';

class UserProfileSheet extends StatelessWidget {
  final User user;

  const UserProfileSheet({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    const int rooms = 14;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF1A1A1A) : const Color(0xffF2F0E4);
    final textColor = isDark ? Colors.white : Colors.black;
    final secondaryColor = isDark ? Colors.grey.shade400 : Colors.grey.shade700;

    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: .72,
        maxChildSize: .95,
        minChildSize: .55,
        builder: (context, controller) {
          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(35),
              ),
            ),
            child: ListView(
              controller: controller,
              padding: const EdgeInsets.all(24),
              children: [
                Center(
                  child: Container(
                    width: 45,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: UserProfileImage(
                    imageUrl: user.imageURL,
                    size: 110,
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: Text(
                    "${user.firstName} ${user.lastName}",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    user.username,
                    style: TextStyle(
                      fontSize: 16,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _info(user.followers.toString(), "Followers", isDark),
                    _info(user.following.toString(), "Following", isDark),
                    _info(rooms.toString(), "Rooms", isDark),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Bio",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user.bio,
                  style: TextStyle(
                    fontSize: 15,
                    color: secondaryColor,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add_alt_1),
                  label: const Text("Follow"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.chat_bubble_text),
                  label: const Text("Send Message"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.hand_thumbsup),
                  label: const Text("Invite to Speak"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _action(CupertinoIcons.bell, "Notify", isDark),
                    _action(CupertinoIcons.link, "Share", isDark),
                    _action(CupertinoIcons.person_crop_circle_badge_plus, "Invite", isDark),
                    _action(CupertinoIcons.flag, "Report", isDark),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _info(String number, String title, bool isDark) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _action(IconData icon, String title, bool isDark) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: isDark ? Colors.grey.shade800 : Colors.white,
          child: Icon(
            icon,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.grey.shade400 : Colors.black87,
          ),
        ),
      ],
    );
  }
}