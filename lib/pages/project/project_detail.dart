import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/widgets/cards/project_card.dart';

import '../../responsive.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  const ProjectDetail({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(project.name),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          project.year.toString(),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Hero(
                        tag: project.name,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Responsive(
                            mobile: Image.network(
                              project.imageURl,
                              fit: BoxFit.cover,
                            ),
                            tablet: Image.network(
                              project.imageURl,
                              fit: BoxFit.cover,
                            ),
                            desktop: SizedBox(
                              height: 350,
                              child: Image.network(
                                project.imageURl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Technologies",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HorizontalTechView(
                        teachList: project.technologiesUsed ?? [],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        project.description,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalTechView extends StatelessWidget {
  final List<String> teachList;
  const HorizontalTechView({Key? key, required this.teachList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: teachList.length,
        itemBuilder: ((context, index) {
          return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              margin: const EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
              child: Text(teachList[index],
                  style: const TextStyle(color: Colors.black)));
        }),
      ),
    );
  }
}
