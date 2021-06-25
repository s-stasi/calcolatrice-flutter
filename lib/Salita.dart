import 'package:flutter/material.dart';
import 'problems/salita.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Salita extends StatefulWidget {
  @override
  _SalitaState createState() => _SalitaState();
}

class _SalitaState extends State<Salita> {
  final gs = TextEditingController();
  final qnh = TextEditingController();
  final elev = TextEditingController();
  final fl = TextEditingController();
  final t0 = TextEditingController();
  final ff = TextEditingController();
  final vs = TextEditingController();

  @override
  void initState() {
    super.initState();
    gs.addListener(_updateGraph);
    qnh.addListener(_updateGraph);
    elev.addListener(_updateGraph);
    ff.addListener(_updateGraph);
    t0.addListener(_updateGraph);
    fl.addListener(_updateGraph);
    vs.addListener(_updateGraph);
  }

  @override
  void dispose() {
    gs.dispose();
    qnh.dispose();
    elev.dispose();
    ff.dispose();
    fl.dispose();
    t0.dispose();
    vs.dispose();
    super.dispose();
  }

  _updateGraph() {
    setState(() {});
  }

  String txt() {
    SalitaCalc _res = SalitaCalc(
        elev: double.tryParse(elev.text) ?? 0.0,
        ff: double.tryParse(ff.text) ?? 0.0,
        flightLevel: int.tryParse(fl.text) ?? 0,
        gs: double.tryParse(gs.text) ?? 0.0,
        qnh: double.tryParse(qnh.text) ?? 0.0,
        t0: double.tryParse(t0.text) ?? 0.0,
        vs: double.tryParse(vs.text) ?? 0.0,
        context: context);
    return _res.result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.menu_open, title: 'Problems'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: (int i) {
            if (i == 0) Navigator.pushNamed(context, '/salita');
            if (i == 1) Navigator.pushNamed(context, '/');
            if (i == 2) Navigator.pushNamed(context, '/ImpPag');
          },
        ),
        //drawer: SideDrawer(),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.climbTitle,
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.blue,
            ])),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                  child: TextField(
                    controller: gs,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade900, width: 3.0)),
                      labelText: 'gs',
                      helperText: 'ground speed',
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                  child: TextField(
                    controller: qnh,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade900, width: 3.0)),
                      labelText: 'qnh',
                      helperText: 'qnh',
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                    child: TextField(
                  controller: elev,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
                    labelText: 'elev',
                    helperText: 'Elevation',
                  ),
                )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                    child: TextField(
                  controller: fl,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
                    labelText: 'FL',
                    helperText: 'Flight level',
                  ),
                )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
              ]),
              Row(children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                  child: TextField(
                    controller: t0,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade900, width: 3.0)),
                      labelText: 'T0',
                      helperText: 'temperature on a/d',
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                  child: TextField(
                    controller: vs,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade900, width: 3.0)),
                      labelText: 'VS',
                      helperText: 'Vertical speed',
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
                Expanded(
                    child: TextField(
                  controller: ff,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
                    labelText: 'FF',
                    helperText: 'Fuel flow',
                  ),
                )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: 150),
              ]),
              Text(this.txt()),
              CustomPaint(
                size: Size(400, 400),
                painter: SalitaPainter(qnh: 1014.7689),
              ),
            ],
          ),
        ));
  }
}
