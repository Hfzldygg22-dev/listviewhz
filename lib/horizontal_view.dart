import 'package:flutter/material.dart';
import 'detail_page.dart';

class MahasiswaHorizontalView extends StatelessWidget {
  final List<Map<String, String>> mahasiswaList;
  const MahasiswaHorizontalView({super.key, required this.mahasiswaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa (Horizontal View)'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F51B5), Color(0xFF5C6BC0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
            top: 120,
            bottom: 40,
            left: 16,
            right: 16,
          ),
          itemCount: mahasiswaList.length,
          itemBuilder: (context, index) {
            final mhs = mahasiswaList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailMahasiswaPage(data: mhs),
                  ),
                );
              },
              child: Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(mhs['foto']!),
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      mhs['nama']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      mhs['jurusan']!,
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
