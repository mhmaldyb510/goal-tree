import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceTile extends StatelessWidget {
  const ResourceTile({super.key, required this.resource});

  final ResourceModel resource;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        if (resource.link.isEmpty) return;
        String url = resource.link;
        if (!url.toLowerCase().startsWith('https://') &&
            !url.toLowerCase().startsWith('http://')) {
          url = 'https://$url';
        }
        try {
          await launchUrl(Uri.parse(url));
        } on Exception catch (e) {
          debugPrint(e.toString());
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('cannot launch $url').tr()));
          }
        }
      },
      leading: Container(
        decoration: BoxDecoration(
          color: const Color(0xfff1f2f4),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(11),
        child: SvgPicture.asset('assets/icons/link_icon.svg'),
      ),
      title: Text(resource.name, style: AppTextStyles.secondaryTextStyle),
    );
  }
}
