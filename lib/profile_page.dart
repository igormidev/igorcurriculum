import 'package:flutter/material.dart';
import 'package:igorcurriculum/sections/contacts/contact_grid_view.dart';
import 'package:igorcurriculum/sections/experience/experience_section.dart';
import 'package:igorcurriculum/sections/header/header_section.dart';
import 'package:igorcurriculum/sections/packages/packages_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // print(width);
    // return Scaffold(
    //   body: Align(
    //     child: Container(
    //       height: MediaQuery.of(context).size.height - 30,
    //       width: 40,
    //       color: Colors.red,
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Builder(builder: (context) {
        if (width > 1200) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 600,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      PackagesSection(),
                      SizedBox(height: 8),
                      ExperienceSection(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 600,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      ProfileImage(),
                      SizedBox(height: 8),
                      WorkingWithMeAdvantages(),
                      ContactGridView(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return Align(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              // clipBehavior: Clip.antiAlias,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 600,
                color: Colors.red,
                child: ListView(
                  children: const [
                    SizedBox(height: 8),
                    ProfileImage(),
                    SizedBox(height: 8),
                    WorkingWithMeAdvantages(),
                    ContactGridView(),
                    SizedBox(height: 8),
                    PackagesSection(),
                    SizedBox(height: 8),
                    ExperienceSection(),
                  ],
                ),
              ),
            ),
          ),
        );
        return Center(
          child: LayoutBuilder(builder: (context, constraints) {
            print(
              'maxHeight: ${constraints.maxHeight} + ${MediaQuery.of(context).size.height}',
            );
            return FittedBox(
              alignment: Alignment.topCenter,
              fit: BoxFit.fitHeight,
              child: SizedBox(
                width: 600,
                height: constraints.maxHeight,
                // height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: const [
                    SizedBox(height: 8),
                    ProfileImage(),
                    SizedBox(height: 8),
                    WorkingWithMeAdvantages(),
                    ContactGridView(),
                    SizedBox(height: 8),
                    PackagesSection(),
                    SizedBox(height: 8),
                    ExperienceSection(),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
