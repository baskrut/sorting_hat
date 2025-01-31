import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sorting_hat/ui/widgets/common_box.dart';

class CommonButton extends StatelessWidget {
  final String? iconPath;
  final String label;
  final Color? iconColor;
  final Function() onTap;

  const CommonButton({
    required this.label,
    required this.onTap,
    this.iconColor,
    this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CommonBox(
        //in conversation in github issues dev of SVG lib told color is deprecated just to announce color filter
        header: iconPath != null
            ? SizedBox(
                height: 40.0,
                width: 30.0,
                child: SvgPicture.asset(
                  iconPath!,
                  // ignore: deprecated_member_use
                  color: iconColor,
                  fit: BoxFit.fill,
                ))
            : null,
        label: label,
        color: Colors.grey.shade300,
      ),
    );
  }
}
