import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse/models/user.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:clubhouse/widgets/user_profile_sheet.dart';

class RoomUserProfile extends StatelessWidget {
  final User user;
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;
  final VoidCallback? onMicTap;

  const RoomUserProfile({
    super.key,
    required this.user,
    required this.imageUrl,
    required this.name,
    this.size = 42,
    this.isNew = false,
    this.isMuted = false,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => UserProfileSheet(user: user),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: Hero(
                  tag: user.username,
                  child: UserProfileImage(
                    imageUrl: imageUrl,
                    size: size,
                  ),
                ),
              ),
              if (isNew)
                Positioned(
                  left: 0,
                  bottom: 2,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text("🎉", style: TextStyle(fontSize: 14)),
                  ),
                ),
              Positioned(
                right: 0,
                bottom: 2,
                child: GestureDetector(
                  onTap: onMicTap,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isMuted ? CupertinoIcons.mic_slash_fill : CupertinoIcons.mic_fill,
                      size: 16,
                      color: isMuted ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: size + 24,
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}