  import 'package:clubhouse/models/room.dart';
  import 'package:clubhouse/models/user.dart';

  // ====== Current User ======
  const User currentUser = User(
    firstName: "Asem",
    lastName: "Saafan",
    username: "@asem_saafan",
    imageURL:
    "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    bio: "Software Engineer | Flutter Developer",
    followers: 1500,
    following: 320,
  );

  // ====== Sample Users ======
  const List<User> sampleUsers = [
    User(
      firstName: "Ahmed",
      lastName: "Ibrahim",
      username: "@ahmed_ibrahim",
      imageURL:
      "https://images.unsplash.com/photo-1581803118522-7b72a50f7e9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      bio: "Tech Enthusiast | Coder",
      followers: 1200,
      following: 400,
    ),
    User(
      firstName: "Zaki",
      lastName: "Ahmed",
      username: "@zaki_ahmed",
      imageURL:
      "https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      bio: "UI/UX Designer",
      followers: 950,
      following: 210,
    ),
    User(
      firstName: "Abdo",
      lastName: "Kefah",
      username: "@abdo_kefah",
      imageURL:
      "https://images.unsplash.com/photo-1548372290-8d01b6c8e78c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      bio: "Backend Developer | Python",
      followers: 2300,
      following: 500,
    ),
    User(
      firstName: "Ahmed",
      lastName: "Leo",
      username: "@ahmed_leo",
      imageURL:
      "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80",
      bio: "Product Manager",
      followers: 3100,
      following: 600,
    ),
    User(
      firstName: "Mohamed",
      lastName: "Elsayed",
      username: "@mo_elsayed",
      imageURL:
      "https://images.unsplash.com/photo-1565464027194-7957a2295fb7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      bio: "Full Stack Developer",
      followers: 1800,
      following: 250,
    ),
    User(
      firstName: "Omar",
      lastName: "Abdo",
      username: "@omar_abdo",
      imageURL:
      "https://images.unsplash.com/photo-1583195764036-6dc248ac07d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1055&q=80",
      bio: "Data Scientist",
      followers: 1450,
      following: 300,
    ),
    User(
      firstName: "Mohamed",
      lastName: "Abdelnaser",
      username: "@mo_abdelnaser",
      imageURL:
      "https://images.unsplash.com/photo-1590086783191-a0694c7d1e6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      bio: "Mobile Developer | iOS & Android",
      followers: 2100,
      following: 450,
    ),
    User(
      firstName: "Ibrahim",
      lastName: "Zaki",
      username: "@ibrahim_zaki",
      imageURL:
      "https://images.unsplash.com/photo-1592827095305-68f21edefb82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      bio: "Cloud Architect",
      followers: 1100,
      following: 150,
    ),
    User(
      firstName: "Aamer",
      lastName: "Salama",
      username: "@aamer_s",
      imageURL:
      "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      bio: "DevOps Engineer",
      followers: 800,
      following: 200,
    ),
    User(
      firstName: "Hassan",
      lastName: "Mohamed",
      username: "@hassan_m",
      imageURL:
      "https://images.unsplash.com/photo-1583341612074-ccea5cd64f6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
      bio: "AI Researcher",
      followers: 2500,
      following: 320,
    ),
    User(
      firstName: "Fahd",
      lastName: "Ahmed",
      username: "@fahd_ahmed",
      imageURL:
      "https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      bio: "Software Tester / QA",
      followers: 900,
      following: 180,
    ),
    User(
      firstName: "Mohamed",
      lastName: "Elsayed",
      username: "@mo_elsayed2",
      imageURL:
      "https://images.unsplash.com/photo-1546567850-8a49d669d37a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80",
      bio: "Game Developer",
      followers: 3200,
      following: 400,
    ),
    User(
      firstName: "Ibrahim",
      lastName: "Ahmed",
      username: "@ibrahim_ahmed",
      imageURL:
      "https://images.unsplash.com/photo-1544266401-0c13025c8fd6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      bio: "Cybersecurity Analyst",
      followers: 1750,
      following: 290,
    ),
    User(
      firstName: "Omar",
      lastName: "Saafan",
      username: "@omar_saafan",
      imageURL:
      "https://images.unsplash.com/photo-1541855492-581f618f69a0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      bio: "Freelance Designer",
      followers: 1340,
      following: 560,
    ),
    User(
      firstName: "Abdelnaser",
      lastName: "Ibrahim",
      username: "@abdelnaser_i",
      imageURL:
      "https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      bio: "Database Administrator",
      followers: 600,
      following: 120,
    ),
    User(
      firstName: "Ahmed",
      lastName: "Mohamed",
      username: "@ahmed_mohamed",
      imageURL:
      "https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=695&q=80",
      bio: "Web Developer",
      followers: 2150,
      following: 380,
    ),
    User(
      firstName: "Mohamed",
      lastName: "Clay",
      username: "@mo_clay",
      imageURL:
      "https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      bio: "Blockchain Developer",
      followers: 4100,
      following: 800,
    ),
    User(
      firstName: "Ahmed",
      lastName: "Afify",
      username: "@ahmed_afify",
      imageURL:
      "https://images.unsplash.com/photo-1507038732509-8b1a9623223a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      bio: "System Analyst",
      followers: 1200,
      following: 150,
    ),
    User(
      firstName: "Maged",
      lastName: "Ahmed",
      username: "@maged_ahmed",
      imageURL:
      "https://images.unsplash.com/photo-1566753323558-f4e0952af115?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2122&q=80",
      bio: "Entrepreneur",
      followers: 5200,
      following: 950,
    ),
    User(
      firstName: "Omar",
      lastName: "Elsayed",
      username: "@omar_elsayed",
      imageURL:
      "https://images.unsplash.com/photo-1562159278-1253a58da141?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      bio: "Tech Content Creator",
      followers: 8500,
      following: 200,
    ),
  ];

  // ====== Sample Rooms ======
  // ====== Sample Rooms ======
   List<Room> roomList = [
    Room(
      club: 'Flutter Time',
      name: 'Special Time to play with Flutter & Dart',
      speakers: [sampleUsers[0], sampleUsers[1], sampleUsers[2], sampleUsers[3]],
      followedBySpeakers: [sampleUsers[4], sampleUsers[5], sampleUsers[6]],
      others: [sampleUsers[7], sampleUsers[8], sampleUsers[9], sampleUsers[10]],
    ),
    Room(
      club: 'The best Room',
      name: '⏰ A Very Important Person on Good Time',
      speakers: [sampleUsers[4], sampleUsers[7], sampleUsers[12]],
      followedBySpeakers: [sampleUsers[1], sampleUsers[3], sampleUsers[5]],
      others: [sampleUsers[13], sampleUsers[14], sampleUsers[15]],
    ),
    Room(
      club: 'Cryptocurrency Time',
      name: 'love and bitcoin edition 💰',
      speakers: [sampleUsers[16], sampleUsers[17], sampleUsers[18]],
      followedBySpeakers: [sampleUsers[2], sampleUsers[8], sampleUsers[10]],
      others: [sampleUsers[19], sampleUsers[0], sampleUsers[1]],
    ),
    Room(
      club: 'Hello World Time',
      name: 'Think with Developers about anything',
      speakers: [sampleUsers[5], sampleUsers[11], sampleUsers[15], sampleUsers[19]],
      followedBySpeakers: [sampleUsers[14], sampleUsers[16], sampleUsers[18]],
      others: [sampleUsers[2], sampleUsers[4], sampleUsers[6], sampleUsers[9]],
    ),
    // ================= الغرف الجديدة =================
    Room(
      club: 'Design Thinkers',
      name: 'UI/UX Future Trends 🎨',
      speakers: [sampleUsers[1], sampleUsers[13], sampleUsers[8]],
      followedBySpeakers: [sampleUsers[0], sampleUsers[4]],
      others: [sampleUsers[5], sampleUsers[7], sampleUsers[11]],
    ),
    Room(
      club: 'Startup Hustle',
      name: 'How to pitch to investors 🚀',
      speakers: [sampleUsers[18], sampleUsers[3], sampleUsers[15]],
      followedBySpeakers: [sampleUsers[19], sampleUsers[12]],
      others: [sampleUsers[2], sampleUsers[6], sampleUsers[9], sampleUsers[10]],
    ),
    Room(
      club: 'AI & Future',
      name: 'Will AI replace programmers? 🤖',
      speakers: [sampleUsers[9], sampleUsers[5], sampleUsers[17]],
      followedBySpeakers: [sampleUsers[2], sampleUsers[1], sampleUsers[14]],
      others: [sampleUsers[3], sampleUsers[8], sampleUsers[16]],
    ),
    Room(
      club: 'Game Devs Hub',
      name: 'Indie Game Development Q&A 🎮',
      speakers: [sampleUsers[11], sampleUsers[7], sampleUsers[10]],
      followedBySpeakers: [sampleUsers[0], sampleUsers[13]],
      others: [sampleUsers[4], sampleUsers[12], sampleUsers[18]],
    ),
    Room(
      club: 'Open Source',
      name: 'Contributing to open source projects 💻',
      speakers: [sampleUsers[0], sampleUsers[2], sampleUsers[14]],
      followedBySpeakers: [sampleUsers[15], sampleUsers[17]],
      others: [sampleUsers[1], sampleUsers[5], sampleUsers[9], sampleUsers[19]],
    ),
    Room(
      club: 'Cybersecurity Alert',
      name: 'Protecting your data online 🔒',
      speakers: [sampleUsers[12], sampleUsers[8], sampleUsers[16]],
      followedBySpeakers: [sampleUsers[3], sampleUsers[7], sampleUsers[11]],
      others: [sampleUsers[0], sampleUsers[6], sampleUsers[10], sampleUsers[13]],
    ),
  ];