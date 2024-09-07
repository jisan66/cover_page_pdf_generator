import 'package:flutter/material.dart';
import 'package:pdf_generator/operations/functions.dart';

import '../../common_widgets/custom_text_field.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  TextEditingController assignmentTitle = TextEditingController();
  TextEditingController courseName = TextEditingController();
  TextEditingController courseCode = TextEditingController();
  TextEditingController submittedByName = TextEditingController();
  TextEditingController submittedById = TextEditingController();
  TextEditingController submittedByLevel = TextEditingController();
  TextEditingController submittedBySemester = TextEditingController();
  TextEditingController submittedToName = TextEditingController();

  @override
  void dispose() {
    assignmentTitle.dispose();
    courseCode.dispose();
    courseName.dispose();
    submittedByLevel.dispose();
    submittedByName.dispose();
    submittedById.dispose();
    submittedBySemester.dispose();
    submittedToName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Information Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter Assignment Title :"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(
                controller: assignmentTitle,
                maxLines: 4,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Enter Course Code :"),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                  width: size.width / 2,
                  child: CustomTextField(controller: courseCode)),
              const SizedBox(
                height: 8,
              ),
              const Text("Enter Course Title :"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(controller: courseName),
              const SizedBox(
                height: 8,
              ),
              const Text("Submitted By Name:"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(controller: submittedByName),
              const SizedBox(
                height: 8,
              ),
              const Text("Submitted By ID:"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(controller: submittedById),
              const SizedBox(
                height: 8,
              ),
              const Text("Submitted By Level:"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(controller: submittedByLevel),
              const SizedBox(
                height: 8,
              ),
              const Text("Submitted By Semester:"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(controller: submittedBySemester),
              const SizedBox(
                height: 8,
              ),
              const Text("Submitted To Name:"),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(controller: submittedToName),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 1),content: Text("Creating PDF...")));
                        await Operations().createPdf(
                          assignmentTitle.text.toString(),
                          courseCode.text.toString(),
                          courseName.text.toString(),
                          submittedByName.text.toString(),
                          submittedById.text.toString(),
                          submittedByLevel.text.toString(),
                          submittedBySemester.text.toString(),
                          submittedToName.text.toString(),
                          size
                        );
                      },
                      child: const Text(
                        "Create PDF",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
