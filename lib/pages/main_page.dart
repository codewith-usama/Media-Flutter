// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:media/api/pdf_api.dart';
import 'package:media/pages/pdf_viewer_page.dart';
import 'package:media/screens/audio_screen.dart';
import 'package:media/widgets/button_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 197, 197),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/giphy.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'PDF File',
                  onClicked: () async {
                    final file = await PDFApi.pickFile();
                    if (file == null) return;
                    
                    openPDF(context, file);
                  },
                ),
                const SizedBox(height: 25),
                ButtonWidget(
                  text: 'Pick A Song',
                  onClicked: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AudioScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
