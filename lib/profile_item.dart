import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  String title;
  String subTitle;
  String image;
  int index;
  int length;

  ProfileItem(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.index,
      required this.length,
      super.key});

  @override
  State<ProfileItem> createState() => _ProfileItemState();

}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    print(widget.length);
    print(widget.index);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 97,
        width: 382,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    widget.subTitle,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                widget.image,
                color: widget.index == widget.length-1 ? Colors.red : Colors.white,
                height: 32,
                width: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
