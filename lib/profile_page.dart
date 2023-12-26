import 'package:flutter/material.dart';
import 'package:igorcurriculum/sections/contacts/contact_grid_view.dart';
import 'package:igorcurriculum/sections/experience/experience_section.dart';
import 'package:igorcurriculum/sections/header/header_section.dart';
import 'package:igorcurriculum/sections/packages/packages_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const Column(
              children: [
                // SizedBox(
                //   height: 300,
                //   child: Placeholder(
                //     fallbackWidth: double.maxFinite,
                //     color: Colors.purple,
                //     child: Text('Header'),
                //   ),
                // ),
                HeaderSection(),
                SizedBox(height: 8),
                WorkingWithMeAdvantages(),
                ContactGridView(),
                SizedBox(height: 8),
                PackagesSection(),
                SizedBox(height: 8),
                ExperienceSection(),
                // SizedBox(
                //   height: 300,
                //   child: Placeholder(
                //     fallbackWidth: double.maxFinite,
                //     color: Colors.red,
                //     child: Text('Contact'),
                //   ),
                // ),
                // SizedBox(
                //   height: 1200,
                //   child: Placeholder(
                //     fallbackHeight: 1200,
                //     fallbackWidth: double.maxFinite,
                //     color: Colors.blueGrey,
                //     child: Text('Previous Work'),
                //   ),
                // ),
                // SizedBox(
                //   height: 2000,
                //   child: Placeholder(
                //     fallbackHeight: 2000,
                //     fallbackWidth: double.maxFinite,
                //     color: Colors.brown,
                //     child: Text('Projects'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
