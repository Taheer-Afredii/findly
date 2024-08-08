import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
    required this.topPadding,
    required this.child,
    this.height,
  });
  final double topPadding;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.sw,
      margin: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(containerColor),
          fit: BoxFit.fill,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: child,
    );
  }
}

class BlueContainer extends StatelessWidget {
  const BlueContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(bluecontainer), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}

class DeepBlueContainer extends StatelessWidget {
  const DeepBlueContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(deepblue), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(container), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
