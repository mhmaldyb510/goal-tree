import 'package:flutter/material.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/goal_details/model/info_model.dart';

class InfoTable extends StatelessWidget {
  final List<InfoModel> information;
  const InfoTable({super.key, required this.information});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        ...List.generate(
          information.length,
          (index) => TableRow(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  ),
                  Text(
                    information[index].infoKey,
                    style: AppTextStyles.secondaryTextStyle.copyWith(
                      color: Color(0xff637387),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  ),
                  Text(
                    information[index].infoValue,
                    style: AppTextStyles.secondaryTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
