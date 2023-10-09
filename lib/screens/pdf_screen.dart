import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PdfScreen extends StatefulWidget {
  final File file;
  const PdfScreen({
    super.key,
    required this.file,
  });

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: pages >= 2
            ? [
                Center(child: Text(text)),
                IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 32,
                  ),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 32,
                  ),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SafeArea(
          child: PDFView(
            filePath: widget.file.path,
            // autoSpacing: false,
            swipeHorizontal: true,
            // pageSnap: false,
            // pageFling: false,
            onRender: (pages) => setState(() => this.pages = pages!),
            onViewCreated: (controller) =>
                setState(() => this.controller = controller),
            onPageChanged: (indexPage, _) =>
                setState(() => this.indexPage = indexPage!),
          ),
        ),
      ),
    );
  }
}