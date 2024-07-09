import 'package:flutter/material.dart';

class FoodItemsContainer extends StatelessWidget {
  const FoodItemsContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onAddCart,
    // required this.height,
    // required this.width,
  });

  final String imagePath;
  final String title;
  final String description;
  final void Function()? onAddCart;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.23,
      width: width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade600,
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(4, 4)),
          const BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(-4, -4)),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.09, vertical: height * 0.007),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  height: height * 0.11,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  height: height * 0.025,
                  onPressed: () {},
                  color: Colors.green,
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.015, horizontal: width * 0.02),
                child: Image.asset(
                  'assets/heart.png',
                  height: height * 0.025,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
