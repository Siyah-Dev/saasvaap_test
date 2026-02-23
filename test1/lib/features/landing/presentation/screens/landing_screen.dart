import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/features/home/presentation/screens/home_screen.dart';
import 'package:test1/features/landing/presentation/controllers/landing_controller_provider.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(landingControllerProvider, (previous, next) {
      if(next.error !=null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () async {
          final isSuccess = await ref.read(landingControllerProvider.notifier).getToken();
          if (isSuccess == true && context.mounted) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.amber,
          child: Icon(Icons.arrow_forward, size: 12),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.amber),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                spacing: 5,
                children: [
                  Text("Welcome", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("At your servers"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // image: DecorationImage(image: NetworkImage('https://pxhere.com/en/photo/239853')),
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.black,
              child: Text(
                'we are here to make your trip memorable',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
