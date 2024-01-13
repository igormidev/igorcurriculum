import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:igorcurriculum/sections/contact_grid_view.dart';
import 'package:igorcurriculum/sections/experience_section.dart';
import 'package:igorcurriculum/sections/header_section.dart';
import 'package:igorcurriculum/sections/packages_section.dart';
import 'package:igorcurriculum/sections/source_code_card.dart';
import 'package:igorcurriculum/shared/shimmer_build_delay_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Builder(builder: (context) {
        if (width > 1200) {
          final packagesExperienceSection = [
            const SizedBox(height: 8),
            ...packagesSection(context),
            const SizedBox(height: 32),
            ...experienceSection(context),
            const Divider(height: 32),
            const SourceCodeCard(),
            const SizedBox(height: 20),
          ];

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: Constants.screenWidth,
                child: ListView.builder(
                  itemCount: packagesExperienceSection.length,
                  itemBuilder: (context, index) {
                    return packagesExperienceSection[index];
                  },
                ),
              ),
              SizedBox(
                width: Constants.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      ShimmerBuildDelayWrapper(
                        duration: Constants.profileHeaderDelay,
                        height: 260,
                        child: const ProfileImage(),
                      ),
                      const SizedBox(height: 8),
                      ShimmerBuildDelayWrapper(
                        duration: Constants.howIcanHelpYouDelay,
                        height: 370,
                        child: const WorkingWithMeAdvantages(),
                      ),
                      const SizedBox(height: 8),
                      ...contactGridView,
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        final newwidgets = [
          const SizedBox(height: 8),
          const ProfileImage(),
          const SizedBox(height: 8),
          const WorkingWithMeAdvantages(),
          const SizedBox(height: 8),
          ...contactGridView,
          const SizedBox(height: 8),
          ...packagesSection(context),
          const SizedBox(height: 8),
          ...experienceSection(context),
          const SizedBox(height: 8),
          const SourceCodeCard(),
          const SizedBox(height: 20),
        ]
            // .asMap().entries.map((e) {
            //   return Builder(builder: (context) {
            //     print('builded ${e.key} | ${e.value}');
            //     return e.value;
            //   });
            // }).toList()
            //
            ;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return newwidgets[index];
                }, childCount: newwidgets.length),
              ),
            ],
          ),
        );
      }),
    );
  }
}
