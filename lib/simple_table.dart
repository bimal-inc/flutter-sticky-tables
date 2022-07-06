import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:switcher/core/switcher_size.dart';

import 'package:switcher/switcher.dart';

import 'data/user.dart';

class SimpleTablePage extends StatefulWidget {
  const SimpleTablePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  State<SimpleTablePage> createState() => _SimpleTablePageState();
}

class _SimpleTablePageState extends State<SimpleTablePage> {
  @override
  void initState() {
    widget.user.initData(100);
    super.initState();
  }

//add new text field
  List<DynamicWidget> list = [];
  addDynamic() {
    list.add(new DynamicWidget());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Table')),
      body: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        isFixedFooter: true,
        footerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black38,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 100),
      _getTitleItemWidget('Status', 100),
      _getTitleItemWidget('Phone', 200),
      _getTitleItemWidget('Register', 100),
      _getTitleItemWidget('Termination', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(widget.user.userInfo[index].name),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              // Icon(
              //     widget.user.userInfo[index].status
              //         ? Icons.notifications_off
              //         : Icons.notifications_active,
              //     color: widget.user.userInfo[index].status
              //         ? Colors.red
              //         : Colors.green),

              Switcher(
                value: false,
                size: SwitcherSize.small,
                switcherButtonRadius: 50,
                enabledSwitcherButtonRotate: false,
                iconOff: Icons.lock,
                iconOn: Icons.lock_open,
                colorOff: Color.fromARGB(255, 241, 18, 7).withOpacity(0.3),
                colorOn: Colors.green,
                onChanged: (bool state) {
                  //
                },
              )
              //MaterialButton(onPressed: () {}, child: Text("Edit")),
              //Text(widget.user.userInfo[index].status ? 'Disabled' : 'Active')
            ],
          ),
        ),
        Container(
          width: 200,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: TextField(),
        ),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(widget.user.userInfo[index].registerDate),
        ),
        Container(
          width: 200,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(widget.user.userInfo[index].terminationDate),
        ),
      ],
    );
  }
}

class DynamicWidget extends StatelessWidget {
  const DynamicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter project',
        ),
      ),
    );
  }
}
