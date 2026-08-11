import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:clubhouse/models/room.dart';
import 'package:clubhouse/models/user.dart';
import 'package:clubhouse/data.dart';
import 'package:clubhouse/providers/room_provider.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clubController = TextEditingController();
  final List<User> _selectedSpeakers = [];

  void _toggleSpeaker(User user) {
    setState(() {
      if (_selectedSpeakers.contains(user)) {
        _selectedSpeakers.remove(user);
      } else {
        _selectedSpeakers.add(user);
      }
    });
  }

  void _createRoom() {
    if (_formKey.currentState!.validate()) {
      if (_selectedSpeakers.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one speaker')),
        );
        return;
      }

      final newRoom = Room(
        club: _clubController.text.trim(),
        name: _nameController.text.trim(),
        speakers: List.from(_selectedSpeakers),
        followedBySpeakers: [],
        others: [],
      );

      context.read<RoomProvider>().addRoom(newRoom);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Room'),
        actions: [
          TextButton(
            onPressed: _createRoom,
            child: const Text('Create', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Room Name',
                  prefixIcon: Icon(CupertinoIcons.chat_bubble_text),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter room name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _clubController,
                decoration: const InputDecoration(
                  labelText: 'Club (optional)',
                  prefixIcon: Icon(Icons.group),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Select Speakers',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              // عرض قائمة المستخدمين المتاحين
              ...sampleUsers.map((user) => CheckboxListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.username),
                secondary: CircleAvatar(
                  backgroundImage: NetworkImage(user.imageURL),
                ),
                value: _selectedSpeakers.contains(user),
                onChanged: (_) => _toggleSpeaker(user),
              )),
            ],
          ),
        ),
      ),
    );
  }
}