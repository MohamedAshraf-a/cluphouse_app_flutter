import 'package:clubhouse/data.dart';
import 'package:clubhouse/providers/room_provider.dart';
import 'package:clubhouse/screens/create_room_screen.dart';
import 'package:clubhouse/screens/login_screen.dart';
import 'package:clubhouse/widgets/room_card.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final backgroundColor = isDark ? kDarkBackgroundColor : kBackgroundColor;
    final roomProvider = context.watch<RoomProvider>();
    final rooms = roomProvider.rooms;

    final filteredRooms = _searchQuery.isEmpty
        ? rooms
        : rooms.where((room) {
      final query = _searchQuery.toLowerCase();
      return room.name.toLowerCase().contains(query) ||
          room.club.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: TextField(
          controller: _searchController,
          onChanged: (value) => setState(() => _searchQuery = value),
          decoration: InputDecoration(
            hintText: 'Search rooms...',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            ),
          ),
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateRoomScreen()),
              );
            },
            icon: const Icon(CupertinoIcons.add_circled, size: 28),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Messages')),
              );
            },
            icon: const Icon(CupertinoIcons.envelope_open, size: 24),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calendar')),
              );
            },
            icon: const Icon(CupertinoIcons.calendar, size: 24),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications')),
              );
            },
            icon: const Icon(CupertinoIcons.bell, size: 24),
          ),
          IconButton(
            onPressed: () => themeProvider.toggleTheme(),
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              size: 24,
            ),
            color: isDark ? Colors.amber : Colors.black87,
          ),
          // قائمة الخيارات مع تسجيل الخروج
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: isDark ? Colors.white : Colors.black87,
            ),
            onSelected: (value) {
              if (value == 'logout') {
                _logout();
              } else if (value == 'settings') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings pressed')),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              // عرض صفحة البروفايل أو أي شيء
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Profile: ${currentUser.firstName}')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: UserProfileImage(
                size: 34,
                imageUrl: currentUser.imageURL,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              itemCount: filteredRooms.length,
              itemBuilder: (context, index) {
                final room = filteredRooms[index];
                return RoomCard(room: room);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(color: backgroundColor),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CreateRoomScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                minimumSize: const Size(double.infinity, 56),
              ),
              icon: const Icon(CupertinoIcons.add),
              label: const Text(kStartRoom,
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}