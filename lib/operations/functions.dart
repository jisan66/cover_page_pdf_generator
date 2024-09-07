import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Operations {
  createPdf(
      String title,
      courseCode,
      courseName,
      submittedByName,
      submittedById,
      submittedByLevel,
      submittedBySemester,
      submittedToName,Size size) async {
    var logo = (await rootBundle.load('assets/hstu.png')).buffer.asUint8List();
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(defaultTextStyle: const pw.TextStyle(fontSize: 20)),
        build: (context) {
          return pw.Center(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text("Assignment on"),
              pw.Text(title),
              pw.SizedBox(height: size.height/10),
              pw.Text("Course Name"),
              pw.Text(courseName),
              pw.Row(
                  mainAxisAlignment:pw.MainAxisAlignment.center, children: [
                pw.Text("Course Code"),
                pw.Text(courseCode),
              ]),
              pw.SizedBox(height: size.height/10),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Expanded(flex:1, child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Submitted By"),
                          pw.Row(children: [
                            pw.Text("Name :"),
                            pw.Text(submittedByName),
                          ]),
                          pw.Row(children: [
                            pw.Text("ID :"),
                            pw.Text(submittedById),
                          ]),
                          pw.Row(children: [
                            pw.Text("Level :"),
                            pw.Text(submittedByLevel),
                          ]),
                          pw.Row(children: [
                            pw.Text("Semester :"),
                            pw.Text(submittedBySemester),
                          ]),
                        ])),
                    pw.Expanded(flex:1, child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                      pw.Text("Submitted to"),
                      pw.Row(children: [
                        pw.Text("Name"),
                        pw.Text(submittedBySemester),
                      ]),
                      pw.Row(children: [
                        pw.Text("Associate Professor"),
                      ]),
                      pw.Text("Faculty of Computer Science and Engineering"),
                    ]))
                  ]),
              pw.SizedBox(height: size.height/5),
              pw.Image(pw.MemoryImage(logo), height: size.height/12),
              pw.SizedBox(height: size.height/16),
              pw.Center(
                  child: pw.Text(
                      "Hajee Mohammad Danesh Science and Technology University",
                      textAlign: pw.TextAlign.center))
            ],
          ));
        },
      ),
    );

    final dir = await getTemporaryDirectory();
    const fileName = "Cover Page";
    final savePath = join(dir.path, fileName);
    final file = File(savePath);
    await file.writeAsBytes(await doc.save());
    OpenFilex.open(file.path);
  }
}
