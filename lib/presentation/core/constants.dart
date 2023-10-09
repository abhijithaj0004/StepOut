import 'package:flutter/material.dart';

const kheight20 = SizedBox(
  height: 20,
);
const kheight10 = SizedBox(
  height: 10,
);
const kheight30 = SizedBox(
  height: 30,
);

class StepOutImg extends StatelessWidget {
  const StepOutImg({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/presentation/images/stepoutblack.png',
      height: height,
    );
  }
}

const kWidth10 = SizedBox(
  width: 10,
);
const kWidth20 = SizedBox(
  width: 20,
);

