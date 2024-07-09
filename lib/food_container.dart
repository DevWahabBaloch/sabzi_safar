import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({
    super.key,
    this.textColor,
    required this.imagePath,
    required this.shopNow,
    required this.title,
    required this.title2,
  });

  final Color? textColor;
  final String imagePath;
  final void Function()? shopNow;
  final String title;
  final String title2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.83,
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              height: height * 0.22,
              width: width * 0.83,
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 30,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  title2,
                  style: TextStyle(
                      fontSize: 20,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                MaterialButton(
                  height: height * 0.025,
                  onPressed: shopNow,
                  color: Colors.green,
                  child: const Text(
                    'SHOP NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
