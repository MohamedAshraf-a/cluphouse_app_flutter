import 'package:clubhouse/models/room.dart';
import 'package:clubhouse/screens/room_screen.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback? onTap;

  const RoomCard({
    super.key,
    required this.room,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final secondaryColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;

    final handleTap = onTap ??
            () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RoomScreen(room: room),
            ),
          );
        };

    return GestureDetector(
      onTap: handleTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (room.club.isNotEmpty) ...[
                  Row(
                    children: [
                      Text(
                        room.club.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.home_rounded, size: 16, color: secondaryColor),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (room.speakers.length >= 2)
                      SizedBox(
                        width: 68,
                        height: 68,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: UserProfileImage(
                                imageUrl: room.speakers[0].imageURL,
                                size: 44,
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 20,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageURL,
                                size: 44,
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (room.speakers.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: UserProfileImage(
                          imageUrl: room.speakers[0].imageURL,
                          size: 44,
                        ),
                      ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...room.speakers.take(3).map(
                                (speaker) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${speaker.firstName} ${speaker.lastName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: textColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Icon(Icons.mic_none_rounded,
                                      size: 14, color: secondaryColor),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Text('${room.speakers.length}',
                                  style: TextStyle(color: secondaryColor, fontSize: 13)),
                              const SizedBox(width: 4),
                              Icon(Icons.person_rounded, size: 14, color: secondaryColor),
                              const SizedBox(width: 12),
                              Text('${room.speakers.length}',
                                  style: TextStyle(color: secondaryColor, fontSize: 13)),
                              const SizedBox(width: 4),
                              Icon(Icons.chat_bubble_outline_rounded,
                                  size: 13, color: secondaryColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}