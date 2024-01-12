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
          const packagesExperienceSection = [
            SizedBox(height: 8),
            PackagesSection(),
            Divider(height: 32),
            ExperienceSection(),
            Divider(height: 32),
            SourceCodeCard(),
            SizedBox(height: 20),
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
                      ShimmerBuildDelayWrapper(
                        duration: Constants.contactGrid,
                        height: 154,
                        child: const ContactGridView(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return Builder(builder: (context) {
          final widgets = [
            const SizedBox(height: 8),
            const ProfileImage(),
            const SizedBox(height: 8),
            const WorkingWithMeAdvantages(),
            const SizedBox(height: 8),
            const ContactGridView(),
            const SizedBox(height: 8),
            const PackagesSection(),
            const SizedBox(height: 8),
            const ExperienceSection(),
            const SizedBox(height: 8),
            const SourceCodeCard(),
            const SizedBox(height: 20),
          ];

          final widgetsnew = <Widget>[
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            const SliverToBoxAdapter(
              child: ProfileImage(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            const SliverToBoxAdapter(
              child: WorkingWithMeAdvantages(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            const SliverToBoxAdapter(
              child: ContactGridView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            const PackagesSection(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            const ExperienceSection(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            const SliverToBoxAdapter(
              child: SourceCodeCard(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ];
          return CustomScrollView(
            slivers: widgetsnew,
          );
        });
      }),
    );
  }
}
