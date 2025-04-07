import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/creating_laundry_service_bloc.dart';

class ButtonCreateServiceWidget extends StatelessWidget {
  final CreatingLaundryServiceBloc bloc;
  final LaundryService service;
  final void Function(bool result) handleAfterCreatingSuccess;
  const ButtonCreateServiceWidget({
    super.key,
    required this.bloc,
    required this.service,
    required this.handleAfterCreatingSuccess,
  });

  Future<bool> showAlertDialog(BuildContext context) async {
    Widget cancelButton = ElevatedButton(
      child: const Text(
        "No",
        style: TextStyle(fontSize: 14),
      ),
      onPressed: () {
        Navigator.of(context).pop(false);
      },
    );
    Widget continueButton = ElevatedButton(
      child: const Text(
        "Yes",
        style: TextStyle(fontSize: 14),
      ),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Do you want to create this service?"),
      titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cancelButton,
            continueButton,
          ],
        )
      ],
    ); // show the dialog
    final result = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return result ?? false;
  }

  void _handleAddServiceButton(BuildContext context) async {
    bool result = await showAlertDialog(context);
    if (result == true) {
      String? serviceId = await bloc.createService(service);
      if (serviceId != null) {
        // bloc.updateId();
        // bloc.addIdService();
        handleAfterCreatingSuccess(result);

        Fluttertoast.showToast(
            msg: "Add success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleAddServiceButton(context);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            "Create Service",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
