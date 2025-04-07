import 'package:flutter/material.dart';

class TableHistoryService extends StatefulWidget {
  const TableHistoryService({super.key});

  @override
  State<TableHistoryService> createState() => _TableHistoryServiceState();
}

class _TableHistoryServiceState extends State<TableHistoryService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 470),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber[800] ?? Colors.black),
      ),
      child: Container(
        height: 120,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border(
            bottom:
                BorderSide(color: Colors.amber[800] ?? Colors.black, width: 1),
          ),
        ),
        child: const Align(
          alignment: Alignment.topCenter,
          child: Text(
            "History",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // child: Container(
      //   width: MediaQuery.sizeOf(context).width,
      //   decoration: BoxDecoration(
      //       border: Border.all(color: Colors.amber[800] ?? Colors.black),
      //       color: Colors.amber[800] ?? Colors.black),
      //   child: const Center(
      //     child: Text(
      //       "History",
      //       style: TextStyle(
      //           color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
    );
  }
}
