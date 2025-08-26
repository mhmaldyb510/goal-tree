import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesList extends StatelessWidget {
  final List<ResourceModel> resources;
  const ResourcesList({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resources.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          launchUrl(Uri.parse(resources[index].link));
        },
        leading: Container(decoration: BoxDecoration(
          color: const Color(0xfff1f2f4),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(11),
          child: SvgPicture.asset('assets/icons/link_icon.svg',)),
        title: Text(resources[index].name,style: AppTextStyles.secondaryTextStyle ),

      ),
    );
  }
}
