import 'package:cdp_training/screens/home/VentanaDescripcion.dart';
import 'package:cdp_training/screens/home/listaEjercicios.dart';
import 'package:cdp_training/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:flare_flutter/flare_actor.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Ejercicio> entries = <Ejercicio>[
    new Ejercicio('Entry A', ValueKey(1)),
    new Ejercicio('Entry B', ValueKey(2)),
    new Ejercicio('Entry C', ValueKey(3))
  ];

  int _indexOfKey(Key key) {
    return entries.indexWhere((Ejercicio d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);
    final draggedItem = entries[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      entries.removeAt(draggingIndex);
      entries.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = entries[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.entry}}");
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          formattedDate,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
        ),
        elevation: 6,
        centerTitle: true,
        actions: <Widget>[
          Container(
            width: 100,
            alignment: AlignmentDirectional.bottomEnd,
            child: FlareActor("images/intro.flr",
                animation: "cdp",
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomRight),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Como me siento hoy?",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: new TextField(
                maxLines: 5,
                style: new TextStyle(
                    fontSize: 16.0,
                    // height: 2.0,
                    color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'etc.',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: ReorderableList(
                onReorder: this._reorderCallback,
                onReorderDone: this._reorderDone,
                child: ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VentanaDescripcion(entries[index].entry),
                          ),
                        );
                      },
                      title: Item(
                        data: entries[index],
                        isFirst: index == 0,
                        isLast: index == entries.length - 1,
                      ),
                      trailing: Checkbox(
                        value: entries[index].isChecked,
                        onChanged: (bool value) {
                          print(value);
                          setState(() {
                            entries[index].isChecked = value;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
