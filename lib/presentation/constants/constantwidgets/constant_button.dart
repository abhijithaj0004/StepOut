import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  const KButton({super.key, required this.label, this.onClick});
  final Widget label;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: size.height * 0.07,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: label,
      ),
    );
  }
}
