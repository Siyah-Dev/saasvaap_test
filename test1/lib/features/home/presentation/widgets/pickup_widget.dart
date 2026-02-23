import 'package:flutter/material.dart';

class PickUpWidget extends StatelessWidget {
  const PickUpWidget({
    super.key,
    required this.leading,
    required this.subTitle,
    required this.title,
  });
  final String leading;
  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: .start,

        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey,
            child: Text(leading, style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 10,),
          Column(
            
            crossAxisAlignment: .start,
            children: [
              Text(subTitle, style: TextStyle(color: Colors.grey,fontSize: 10)),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
