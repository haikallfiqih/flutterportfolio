import 'package:flutter/material.dart';
import 'package:my_portfolio/example/projects.dart';
import 'package:my_portfolio/widgets/cards/intro_card.dart';
import 'package:my_portfolio/widgets/cards/project_card.dart';
import 'package:my_portfolio/widgets/header/header.dart';
import 'package:share_plus/share_plus.dart';

import '../../responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(
              'Check out my portfolio! https://my-portfolio-c246f.web.app/#/');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.share),
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    const SizedBox(
                      height: 25, // Vertical Spacing of 25 pixels
                    ),
                    const Text(
                      "Projects",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10, // Vertical Spacing of 10 pixels
                    ),
                    Responsive(
                        mobile: mobileTabletBuilder(350),
                        tablet: mobileTabletBuilder(450),
                        desktop: desktopBuilder())
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

Widget mobileTabletBuilder(double height) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    ),
  );
}

Widget desktopBuilder() {
  return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      });
}
