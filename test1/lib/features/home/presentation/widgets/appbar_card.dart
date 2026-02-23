import 'package:flutter/material.dart';
import 'package:test1/features/home/presentation/widgets/pickup_widget.dart';

class AppbarCard extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCard({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withAlpha(150)),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PickUpWidget(leading: 'A', subTitle: "Pickup", title: "150 Street New York, USA"),
                PickUpWidget(leading: 'B', subTitle: "Drop Off", title: "30 Street Boston, USA"),
              ],
            ),
            const Icon(Icons.swap_vert, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
