//import 'dart:html';
import 'package:flutter/material.dart';

import 'Widgets/home_header.dart';
import 'file.dart';
import 'mistake_page.dart';
import 'mistake_api.dart';

/*Future<FilePickerResult?> mistakeFromPDF() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  return result;
}*/

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  void redirectToMistakePage(
      BuildContext context, List<Future<MistakeFile>> files) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MistakePage(files: files)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      bottom: true,
      // resizeToAvoidBottomInset: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('iExtract'),
          backgroundColor: const Color.fromRGBO(122, 55, 11, 1),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctxt) => const AlertDialog(
                          title: Text(
                              "This application will help you to detect academic writing mistakes and show them.\nMade by:\n- Mostafa Khaled\n- Roukaya Mohammed"),
                        ));
              },
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeHeader(),
            SafeArea(
              maintainBottomViewPadding: true,
              bottom: true,
              child: SizedBox(
                width: 720,
                height: 275,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25.0,10,0),
                  child: TextField(
                    controller: controller,
                    minLines: 10,
                    maxLines: 20,
                    decoration: InputDecoration(
                      labelText: "Enter Text",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      List<Future<MistakeFile>> files = [];
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (result != null) {
                        for (final file in result.files) {
                          final PdfDocument document =
                              PdfDocument(inputBytes: file.bytes);
                          String text = PdfTextExtractor(document).extractText();
                          files.add(mistakeFromAPI(text, file.name));
                        }
                        redirectToMistakePage(context, files);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(233, 241, 232, 1)),
                    ),
                    child: const Text(
                      'Upload PDF',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(73, 69, 7, 1),
                          fontFamily: 'Merriweather',
                          fontSize: 24,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      List<Future<MistakeFile>> files = [];
                      files.add(mistakeFromAPI(controller.text, 'unnamed'));
                      redirectToMistakePage(context, files);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(242, 238, 225, 1)),
                    ),
                    child: const Text(
                      'Analyze Text',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(73, 69, 7, 1),
                          fontFamily: 'Merriweather',
                          fontSize: 24,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
