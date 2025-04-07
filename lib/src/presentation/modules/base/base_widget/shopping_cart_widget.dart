import 'package:flutter/material.dart';

class ShoppingCartWidget extends StatefulWidget {
  final int countService;
  const ShoppingCartWidget({super.key, required this.countService});

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ShoppingCartScreen()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.white,
              )),
          widget.countService > 0
              ? Positioned(
                  right: 7,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      widget.countService.toString(),
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
