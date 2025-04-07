import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/presentation/modules/creating_laundry_service/creating_laundry_service_bloc.dart';

class QuantityWidget extends StatefulWidget {
  final CreatingLaundryServiceBloc bloc;
  const QuantityWidget({
    super.key,
    required this.bloc,
  });

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: widget.bloc.quantityStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            int? quantity = snapshot.data;
            return Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      widget.bloc.minusQuantity();
                    },
                    icon: ImageIcon(
                      const AssetImage(
                        "assets/minus.png",
                      ),
                      size: 25,
                      color: quantity! > 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () {
                      widget.bloc.plusQuantity();
                    },
                    icon: const ImageIcon(
                      AssetImage(
                        "assets/plus.png",
                      ),
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ],
            );
          }
          return const Text("1");
        });
  }
}
