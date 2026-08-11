import 'dart:math';
import 'package:clubhouse/data.dart';
import 'package:clubhouse/models/room.dart';
import 'package:clubhouse/widgets/room_user_profile.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/theme_provider.dart';
import '../constant.dart';

class RoomScreen extends StatefulWidget {
  final Room room;
  const RoomScreen({super.key, required this.room});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late List<bool> _speakerMuted;
  late List<bool> _followedMuted;
  late List<bool> _othersMuted;
  bool _handRaised = false;
  bool _isSelfMuted = false;

  @override
  void initState() {
    super.initState();
    _speakerMuted = List.generate(widget.room.speakers.length, (_) => false);
    _followedMuted =
        List.generate(widget.room.followedBySpeakers.length, (_) => false);
    _othersMuted = List.generate(widget.room.others.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final backgroundColor = isDark ? kDarkBackgroundColor : kBackgroundColor;
    final cardColor = isDark ? kDarkCardColor : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leadingWidth: 120,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.chevron_down, size: 20),
          label: const Text(kHallway, style: TextStyle(fontSize: 15)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share room')),
              );
            },
            icon: const Icon(CupertinoIcons.doc, size: 24),
          ),
          IconButton(
            onPressed: () => themeProvider.toggleTheme(),
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              size: 24,
            ),
            color: isDark ? Colors.amber : Colors.black87,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile: ${currentUser.firstName}')),
                );
              },
              child: Stack(
                children: [
                  UserProfileImage(
                    size: 38,
                    imageUrl: currentUser.imageURL,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _isSelfMuted = !_isSelfMuted);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_isSelfMuted ? 'Muted' : 'Unmuted'),
                          ),
                        );
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 4),
                          ],
                        ),
                        child: Icon(
                          _isSelfMuted
                              ? CupertinoIcons.mic_slash_fill
                              : CupertinoIcons.mic_fill,
                          size: 12,
                          color: _isSelfMuted ? Colors.red : Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // باقي الكود (body و bottomSheet) يظل كما هو دون تغيير
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
          bottom: true,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.room.club.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                          ),
                        ),
                        Icon(CupertinoIcons.ellipsis,
                            size: 20, color: isDark ? Colors.white : Colors.black),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.room.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(CupertinoIcons.person_3_fill,
                            size: 16,
                            color: isDark ? Colors.grey.shade500 : Colors.grey.shade600),
                        const SizedBox(width: 6),
                        Text(
                          '${widget.room.speakers.length} speakers · ${widget.room.others.length} others',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 28, bottom: 16),
                sliver: _buildUserGrid(
                  users: widget.room.speakers,
                  size: 80,
                  crossCount: 3,
                  isDark: isDark,
                  muteList: _speakerMuted,
                  onMuteToggle: (index) =>
                      setState(() => _speakerMuted[index] = !_speakerMuted[index]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        'Followed by Speakers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.grey.shade400 : Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: kSeedColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${widget.room.followedBySpeakers.length}',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold, color: kSeedColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: _buildUserGrid(
                  users: widget.room.followedBySpeakers,
                  size: 64,
                  crossCount: 4,
                  isDark: isDark,
                  muteList: _followedMuted,
                  onMuteToggle: (index) =>
                      setState(() => _followedMuted[index] = !_followedMuted[index]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        'Others in the room',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.grey.shade400 : Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: kSeedColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${widget.room.others.length}',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold, color: kSeedColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 30),
                sliver: _buildUserGrid(
                  users: widget.room.others,
                  size: 64,
                  crossCount: 4,
                  isDark: isDark,
                  muteList: _othersMuted,
                  onMuteToggle: (index) =>
                      setState(() => _othersMuted[index] = !_othersMuted[index]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red.shade500,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 2,
                  shadowColor: Colors.red.shade200,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("✌️", style: TextStyle(fontSize: 20)),
                    SizedBox(width: 8),
                    Text(kLeave,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invite others')),
                      );
                    },
                    icon: Icon(CupertinoIcons.add,
                        size: 30, color: isDark ? Colors.white : Colors.black87),
                    splashRadius: 24,
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() => _handRaised = !_handRaised);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_handRaised ? 'Hand raised ✋' : 'Hand lowered'),
                        ),
                      );
                    },
                    icon: Icon(
                      _handRaised ? CupertinoIcons.hand_raised_fill : CupertinoIcons.hand_raised,
                      size: 28,
                      color: _handRaised ? Colors.amber : (isDark ? Colors.white : Colors.black87),
                    ),
                    splashRadius: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverGrid _buildUserGrid({
    required List<User> users,
    required double size,
    required int crossCount,
    required bool isDark,
    required List<bool> muteList,
    required Function(int) onMuteToggle,
  }) {
    if (users.isEmpty) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) => const SizedBox.shrink(),
          childCount: 1,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1,
        ),
      );
    }

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final user = users[index];
          return RoomUserProfile(
            user: user,
            imageUrl: user.imageURL,
            name: user.firstName,
            size: size,
            isNew: Random().nextBool(),
            isMuted: muteList[index],
            onMicTap: () => onMuteToggle(index),
          );
        },
        childCount: users.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        childAspectRatio: 0.7,
        mainAxisSpacing: 16,
        crossAxisSpacing: 10,
      ),
    );
  }
}