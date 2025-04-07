import 'package:flutter/material.dart';

class InforServiceWidget extends StatefulWidget {
  final String serviceInfo;
  const InforServiceWidget({super.key, required this.serviceInfo});

  @override
  State<InforServiceWidget> createState() => _InforServiceWidgetState();
}

class _InforServiceWidgetState extends State<InforServiceWidget> {
  bool open = false;
  @override
  void initState() {
    open = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Service Info:",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    open = !open;
                  });
                },
                icon: Icon(open ? Icons.arrow_drop_up : Icons.arrow_drop_down))
          ],
        ),
        Text(
          open ? widget.serviceInfo : "",
        )
      ],
    );
  }
}
