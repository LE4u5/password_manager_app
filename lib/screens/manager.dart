import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_manager_app/screens/generator.dart';

class PWManager extends StatefulWidget {
  const PWManager({Key? key}) : super(key: key);

  @override
  _PWManagerState createState() => _PWManagerState();
}

class _PWManagerState extends State<PWManager> {
  final iData = const [
    {"iName": "Netfix", "iUsername": "Tdav", "iPassword": "DSFsdfF89d"},
    {"iName": "Google", "iUsername": "Tdav", "iPassword": "GHJ&*78gyhY"}
  ];

  @override
  Widget build(BuildContext context) {
    double headerHeight = 100;
    double screenPadding = 20;
    double listHeight =
        MediaQuery.of(context).size.height - headerHeight - (screenPadding * 2);

    return Material(
      child: Container(
        padding: EdgeInsets.all(screenPadding),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Container(
              height: headerHeight,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.cogs,
                        color: Colors.white,
                        size: 18,
                      ))
                ],
              ),
            ),
            Container(
              height: listHeight,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var currentItem = this.iData[index];
                  return _ListItemCard(
                    iName: currentItem["iName"],
                    iPassword: currentItem["iPassword"],
                    iUsername: currentItem["iUsername"],
                  );
                },
                itemCount: this.iData.length,
                scrollDirection: Axis.vertical,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListItemCard extends StatelessWidget {
  final iName;
  final iUsername;
  final iPassword;
  const _ListItemCard(
      {Key? key,
      this.iName: String,
      this.iUsername: String,
      this.iPassword: String})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController unControler =
        new TextEditingController(text: this.iUsername);
    return Container(
      child: Column(
        children: [
          Text(iName),
          TextField(
            controller: unControler,
          ),
        ],
      ),
    );
  }
}
