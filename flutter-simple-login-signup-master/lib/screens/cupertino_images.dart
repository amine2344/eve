import 'package:flutter/cupertino.dart';

class CupertinoImageDotIndicator extends StatelessWidget {
  final PageController pageController;
  final List<String> images;
  final Color selectedColor;
  final Color unselectedColor;

  const CupertinoImageDotIndicator({super.key, 
    required this.pageController,
    required this.images,
    this.selectedColor = CupertinoColors.activeBlue,
    this.unselectedColor = CupertinoColors.inactiveGray,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 200, // Image height
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == pageController.page?.round()
                      ? selectedColor
                      : unselectedColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
