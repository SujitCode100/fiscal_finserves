import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../components/colors.dart';
import '../../components/ui.dart';

class CoursePDF extends StatefulWidget {

  const CoursePDF({Key? key}) : super(key: key);


  @override
  State<CoursePDF> createState() => _CoursePDFState();
}

class _CoursePDFState extends State<CoursePDF> {

  late File Pfile;
  bool isLoading = false;
  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });
    var url = 'http://www.pdf995.com/samples/pdf.pdf';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });

    print(Pfile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
            titleShow: true, title: "Course PDF"),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
          child: Center(
            child: PDFView(
              filePath: Pfile.path,
            ),
          ),
        ),
      ),
    );
  }
}