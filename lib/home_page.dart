import 'package:flutter/material.dart';
import 'package:sabzi_safar/food_container.dart';
import 'package:sabzi_safar/food_item_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationRightController;
  late AnimationController _animationTopController;
  late AnimationController _animationLeftController;
  late AnimationController _animationDownController;
  late AnimationController _animationFadeController;

  late Animation<Offset> _slideRightAnimation;
  late Animation<Offset> _slideTopAnimation;
  late Animation<Offset> _slideLeftAnimation;
  late Animation<Offset> _slideDownAnimation;
  late Animation<double> _fadeAnimation;

  final slideRightTween = Tween<Offset>(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  );
  final slideTopTween = Tween<Offset>(
    begin: const Offset(0, -1),
    end: const Offset(0, 0),
  );
  final slideLeftTween = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  );
  final slideDownTween = Tween<Offset>(
    begin: const Offset(0, 200),
    end: const Offset(0, 0),
  );
  final fadeTween = Tween<double>(
    begin: 0,
    end: 1,
  );

  @override
  void initState() {
    super.initState();
    _animationRightController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationTopController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationLeftController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationDownController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationFadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _slideRightAnimation = slideRightTween.animate(
      CurvedAnimation(
          parent: _animationRightController,
          curve: Curves.fastEaseInToSlowEaseOut),
    );
    _slideTopAnimation = slideTopTween.animate(
      CurvedAnimation(
          parent: _animationTopController,
          curve: Curves.fastEaseInToSlowEaseOut),
    );
    _slideLeftAnimation = slideLeftTween.animate(
      CurvedAnimation(
          parent: _animationLeftController,
          curve: Curves.fastEaseInToSlowEaseOut),
    );
    _slideDownAnimation = slideDownTween.animate(
      CurvedAnimation(
          parent: _animationDownController,
          curve: Curves.fastEaseInToSlowEaseOut),
    );
    _fadeAnimation = fadeTween.animate(
      CurvedAnimation(
          parent: _animationFadeController,
          curve: Curves.fastEaseInToSlowEaseOut),
    );
    _animationRightController.forward();
    _animationTopController.forward();
    _animationLeftController.forward();
    _animationDownController.forward();
    _animationFadeController.forward();
  }

  @override
  void dispose() {
    _animationRightController.dispose();
    _animationTopController.dispose();
    _animationDownController.dispose();
    _animationLeftController.dispose();
    _animationFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      floatingActionButton: Image.asset(
        'assets/whatsapp.png',
        height: height * 0.08,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            SlideTransition(
              position: _slideTopAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.035,
                          width: width * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/location.png',
                              color: Colors.white,
                              height: height * 0.02,
                            ),
                          ),
                        ),
                        const Text(
                          'Change',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Sabzi',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'SAFAR',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/bells.png',
                      height: height * 0.027,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: SearchBar(
                  leading: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Image.asset(
                      'assets/loupe.png',
                      height: height * 0.025,
                      color: Colors.black,
                    ),
                  ),
                  side: WidgetStatePropertyAll(
                    BorderSide(color: Colors.green, width: width * 0.005),
                  ),
                  hintText: '   Search Products',
                  hintStyle: const WidgetStatePropertyAll(
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  elevation: const WidgetStatePropertyAll(0),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SlideTransition(
                position: _slideRightAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FoodContainer(
                        title: 'Groceries',
                        title2: 'Convenient Shopping\nwith Unlideals',
                        shopNow: () {},
                        imagePath: 'assets/vegetables.jpg',
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      FoodContainer(
                        title: 'Groceries',
                        title2: 'Convenient Shopping\nwith Unlideals',
                        shopNow: () {},
                        imagePath: 'assets/ff2.jpg',
                        // textColor: Colors.white,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      FoodContainer(
                        title: 'Groceries',
                        title2: 'Convenient Shopping\nwith Unlideals',
                        shopNow: () {},
                        imagePath: 'assets/sweet.jpg',
                        // textColor: Colors.white,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      FoodContainer(
                        title: 'Groceries',
                        title2: 'Convenient Shopping\nwith Unlideals',
                        shopNow: () {},
                        imagePath: 'assets/ff.jpg',
                        // textColor: Colors.white,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      FoodContainer(
                        title: 'Groceries',
                        title2: 'Convenient Shopping\nwith Unlideals',
                        shopNow: () {},
                        imagePath: 'assets/sweet.jpg',
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _slideLeftAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _slideRightAnimation,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.035,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/veg.png'),
                          ),
                          Text(
                            'Vegetables',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/fruits.jpg'),
                          ),
                          Text(
                            'Fruits',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'assets/ggg.jpg',
                            ),
                          ),
                          Text(
                            'Groceries',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/meat.jpg'),
                          ),
                          Text(
                            'Meat',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/veg.png'),
                          ),
                          Text(
                            'Vegetables',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/fruits.jpg'),
                          ),
                          Text(
                            'Fruits',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'assets/ggg.jpg',
                            ),
                          ),
                          Text(
                            'Groceries',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/meat.jpg'),
                          ),
                          Text(
                            'Meat',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _slideDownAnimation,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.045, vertical: height * 0.03),
                    child: Row(
                      children: [
                        FoodItemsContainer(
                          onAddCart: () {},
                          imagePath: 'assets/pngegg (64).png',
                          title: 'Pepsi 125ml',
                          description: 'Rs 100',
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        FoodItemsContainer(
                          onAddCart: () {},
                          imagePath: 'assets/pngegg (79).png',
                          title: 'Cerelac',
                          description: 'Rs 500',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.045, vertical: height * 0.03),
                    child: Row(
                      children: [
                        FoodItemsContainer(
                          onAddCart: () {},
                          imagePath: 'assets/pngegg (71).png',
                          title: 'Red Bull',
                          description: 'Rs 900',
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        FoodItemsContainer(
                          onAddCart: () {},
                          imagePath: 'assets/pngegg (77).png',
                          title: 'Coffee',
                          description: 'Rs 300',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.045, vertical: height * 0.03),
                    child: Row(
                      children: [
                        FoodItemsContainer(
                          onAddCart: () {},
                          imagePath: 'assets/pngegg (73).png',
                          title: 'Tide Powder',
                          description: 'Rs 250',
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        FoodItemsContainer(
                          onAddCart: () {},
                          imagePath: 'assets/pngegg (75).png',
                          title: 'Flour',
                          description: 'Rs 700',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
