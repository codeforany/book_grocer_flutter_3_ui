import 'package:book_grocer/common/color_extenstion.dart';
import 'package:flutter/material.dart';

class SearchGridCell extends StatelessWidget {
  final Map sObj;
  final int index;
  const SearchGridCell({super.key, required this.sObj, required this.index});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: TColor.searchBGColor[index % TColor.searchBGColor.length],
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
      child: Column(
        children: [
          Text(
            sObj["name"].toString(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              sObj["img"].toString(),
              width: media.width * 0.23,
              height: media.width * 0.23 * 1.6,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
