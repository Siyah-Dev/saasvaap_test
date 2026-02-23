import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/features/home/presentation/screens/home_screen.dart';
import 'package:test1/features/landing/presentation/controllers/landing_controller_provider.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(landingControllerProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!, style: TextStyle(color: Colors.white)),
          ),
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.grey,
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
        mainAxisAlignment: .spaceBetween,
        children: [
          Stack(
            children: [
              Container(color: Colors.black87),
              ClipPath(
                clipper: DiagonalClipper(bottomLeft: 0, bottomRight: 130),
                child: Container(height: 250, color: Colors.amber),
              ),
              Positioned(
                top: 80,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Welcome", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    Text("At your service"),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              ClipPath(
                clipper: DiagonalClipper(topLeft: 120, topRight: 0),
                child: Container(height: 300, color: Colors.black),
              ),
              Positioned(
               
                left: 40,
                child: Transform.rotate(
                  angle: -0.3,
                  child: Image.asset('assets/images/car.png'),
                ),
              ),
              Positioned(
                top: 140,
                left: 20,
                child: SizedBox(
                  width: 300,
                  child: Text(
                    "we are here to make your trip memorable",
                    softWrap: true,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  DiagonalClipper({this.topLeft = 0, this.topRight = 0, this.bottomLeft = 0, this.bottomRight = 0});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, topLeft);
    path.lineTo(size.width, topRight);
    path.lineTo(size.width, size.height - bottomRight);
    path.lineTo(0, size.height - bottomLeft);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant DiagonalClipper oldClipper) {
    return topLeft != oldClipper.topLeft ||
        topRight != oldClipper.topRight ||
        bottomLeft != oldClipper.bottomLeft ||
        bottomRight != oldClipper.bottomRight;
  }
}
