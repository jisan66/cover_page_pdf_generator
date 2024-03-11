import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///-----------------------------------------------------------------------------------------------------

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            createPdf();
          },
          color: Colors.lightBlueAccent,
          child: const Text("Generate Pdf"),
        ),
      ),
    );
  }

  createPdf() async {
    var logo = (await rootBundle.load('assets/hstu.png')).buffer.asUint8List();
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(defaultTextStyle: const pw.TextStyle(fontSize: 20)),
        build: (context) {
          return pw.Center(
              child: pw.Column(
            children: [
              pw.Text("Assignment on"),
              pw.Text("Bubble Sort Algorithm"),
              pw.SizedBox(height: 100),
              pw.Text("Course Name"),
              pw.Text("Course Code"),
              pw.SizedBox(height: 100),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceAround, children: [
                pw.Column(children: [
                  pw.Text("Submitted By"),
                  pw.Text("Name"),
                  pw.Text("Level"),
                  pw.Text("Semester"),
                ]),
                pw.Column(children: [
                  pw.Text("Submitted to"),
                  pw.Text("Name"),
                  pw.Text("Designation"),
                  pw.Text("Faculty of"),
                ])
              ]),pw.SizedBox(height: 150),
              pw.Image(pw.MemoryImage(logo), height:80),
              pw.SizedBox(height: 32),
              pw.Center(child : pw.Text("Hajee Mohammad Danesh Science and Technology University",textAlign: pw.TextAlign.center))
            ],
          ));
        },
      ),
    );

    final dir = await getTemporaryDirectory();
    const fileName = "Sample.pdf";
    final savePath = join(dir.path, fileName);
    final file = File(savePath);
    await file.writeAsBytes(await doc.save());
    OpenFilex.open(file.path);
  }
}

///------------------------------------------------------------------------------------------

class Invoice {
  final String customer;
  final String address;
  final List<LineItem> items;

  Invoice(this.customer, this.address, this.items);

  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}

///------------------------------------------------------------------------------------------
