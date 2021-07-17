import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'todo.dart';
import 'expmkt.dart';

// ignore: must_be_immutable
class Explanations extends StatelessWidget {
  final kRouteName = '/explanations';
  late List<String> titles;
  final List<Widget> expWidgets = [ExpMTK()];
  final List<Widget> solveWidgets = [ToDo()];
  final icons = [Icons.mode_night];

  @override
  Widget build(BuildContext context) {
    titles = [AppLocalizations.of(context)!.expMachToKnots];
    var width = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              title: Text(
                titles[index],
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => solveWidgets[index])
                            );
                          },
                          child: Text('solve'),
                        ),
                      ),
                      Container(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => expWidgets[index])
                            );
                          },
                          child: Text('Explanation'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 5,
          );
        },
      ),
    );
  }
}
