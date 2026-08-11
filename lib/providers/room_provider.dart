import 'package:flutter/material.dart';
import 'package:clubhouse/models/room.dart';
import 'package:clubhouse/data.dart';

class RoomProvider extends ChangeNotifier {
  List<Room> _rooms = List.from(roomList);

  List<Room> get rooms => _rooms;

  void addRoom(Room room) {
    _rooms.insert(0, room); // نضيف الغرفة في البداية لتظهر أولاً
    notifyListeners();
  }
}