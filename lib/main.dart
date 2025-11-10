import 'package:flutter/material.dart';
import 'list_view.dart';
import 'grid_view.dart';
import 'horizontal_view.dart';

void main() {
  runApp(const MahasiswaApp());
}

class MahasiswaApp extends StatefulWidget {
  const MahasiswaApp({super.key});

  @override
  State<MahasiswaApp> createState() => _MahasiswaAppState();
}

class _MahasiswaAppState extends State<MahasiswaApp> {
  int _selectedIndex = 0;

  final List<Map<String, String>> mahasiswaList = const [
    {
      'nama': 'Muhamad Alvin Alfarizi',
      'nim': '220101001',
      'jurusan': 'Teknik Informatika',
      'foto': 'assets/images/profil.png',
    },
    {
      'nama': 'Hafizh Zaldy Alghani',
      'nim': '220101002',
      'jurusan': 'Sistem Informasi',
      'foto': 'assets/images/profil.png',
    },
    {
      'nama': 'Masyrip Hidayatullah',
      'nim': '220101003',
      'jurusan': 'Teknik Komputer',
      'foto': 'assets/images/profil.png',
    },
    {
      'nama': 'Imam Suyuti',
      'nim': '220101004',
      'jurusan': 'Manajemen Informatika',
      'foto': 'assets/images/profil.png',
    },
    {
      'nama': 'Nevi Arumsari',
      'nim': '220101005',
      'jurusan': 'Teknik Informatika',
      'foto': 'assets/images/profil.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      MahasiswaListView(mahasiswaList: mahasiswaList),
      MahasiswaGridView(mahasiswaList: mahasiswaList),
      MahasiswaHorizontalView(mahasiswaList: mahasiswaList),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Mahasiswa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: pages[_selectedIndex],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.list), label: 'List'),
            NavigationDestination(icon: Icon(Icons.grid_view), label: 'Grid'),
            NavigationDestination(
              icon: Icon(Icons.view_carousel),
              label: 'Horizontal',
            ),
          ],
        ),
      ),
    );
  }
}
