import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingStarWidget extends GetView {

  final RxInt value;
  final Icon starBorder = const Icon(Icons.star_border_outlined, size: 50, color: Colors.yellowAccent), star = const Icon(Icons.star_outlined, size: 50, color: Colors.yellowAccent);

  const RatingStarWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => value.value = value.value == 1 ? 0 : 1, borderRadius: BorderRadius.circular(90), child: value.value >= 1 ? star : starBorder),
          InkWell(onTap: () => value.value = 2, borderRadius: BorderRadius.circular(90), child: value.value >= 2 ? star : starBorder),
          InkWell(onTap: () => value.value = 3, borderRadius: BorderRadius.circular(90), child: value.value >= 3 ? star : starBorder),
          InkWell(onTap: () => value.value = 4, borderRadius: BorderRadius.circular(90), child: value.value >= 4 ? star : starBorder),
          InkWell(onTap: () => value.value = 5, borderRadius: BorderRadius.circular(90), child: value.value >= 5 ? star : starBorder),
        ],
      )
    );
  }
  
}
