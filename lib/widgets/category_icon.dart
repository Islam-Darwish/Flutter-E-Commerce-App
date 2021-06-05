import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.size, this.title, this.assetPath, this.onTap);
  final double size;
  final String title;
  final String assetPath;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size * 0.8,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: size * 0.8,
                  backgroundColor: Colors.black.withOpacity(0.05),
                ),
                MaterialButton(
                  shape: CircleBorder(),
                  elevation: 8.0,
                  child: Center(
                    child: SvgPicture.asset(
                      assetPath,
                      width: size * 0.8,
                    ),
                  ),
                  onPressed: onTap == null ? null : () => onTap,
                ),
              ],
            ),
          ),
          FittedBox(
            child: Text(
              title,
              style:
                  TextStyle(fontSize: size * 0.15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
