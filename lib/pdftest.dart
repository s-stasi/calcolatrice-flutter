import 'pdfcr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'SideDrawer.dart';

class PdfTest extends StatelessWidget {
  PdfTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'pdftest',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => 0,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ])),
        ),
      ),
      body: Center(
          child: Container(
              margin: EdgeInsets.only(top: 30),
              height: 40,
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Get Report',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    reportView(context);
                  }))),
    );
  }
}
