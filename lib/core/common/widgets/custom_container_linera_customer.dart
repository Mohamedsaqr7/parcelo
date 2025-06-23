import 'package:flutter/material.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';

class CustomContainerLinearCustomer extends StatelessWidget {
  const CustomContainerLinearCustomer({
    required this.height,
    required this.width,
    required this.child,
    super.key,
    this.lastRadius,
  });

  final double height;
  final double width;
  final Widget child;
  final double? lastRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(lastRadius ?? 20),
        ),
        gradient: LinearGradient(
          colors: [
            context.color.greenLight!.withOpacity(1),
            context.color.greenLight!.withOpacity(0.8),
            // context.color.greenDark!.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            color: context.color.containerShadow1!.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          // BoxShadow(
          //   color: context.color.containerShadow2!.withOpacity(0.3),
          //   offset: const Offset(0, 4),
          //   blurRadius: 2,
          // ),
        ],
      ),
      child: child,
    );
  }
}
