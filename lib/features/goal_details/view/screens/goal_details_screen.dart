import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goal_tree/core/app_constants.dart';
import 'package:goal_tree/core/models/resource_model.dart';
import 'package:goal_tree/core/theme/app_text_styles.dart';
import 'package:goal_tree/features/goal_details/model/info_model.dart';
import 'package:goal_tree/features/goal_details/view/widgets/goal_details_app_bar.dart';
import 'package:goal_tree/features/goal_details/view/widgets/info_table.dart';
import 'package:goal_tree/features/goal_details/view/widgets/resources_list.dart';

class GoalDetailsScreen extends StatelessWidget {
  const GoalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: GoalDetailsAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text('Learn New Language', style: AppTextStyles.headText),
          SizedBox(height: 16),
          Text(
            'Master conversational Spanish within 6 months Manage your profile information to enhance travel experiences and connect with new cultures.',
            style: AppTextStyles.primaryTextStyle,
          ),
          SizedBox(height: 16),
          InfoTable(
            information: [
              InfoModel(
                infoKey: 'DeadLine',
                infoValue: DateFormat('MMMM, dd, yyyy').format(DateTime.now()),
              ),
              InfoModel(infoKey: 'Priority', infoValue: 'High'),
              InfoModel(infoKey: 'Progress', infoValue: '25%'),
            ],
          ),
          SizedBox(height: 50),
          Text('25%', style: AppTextStyles.primaryTextStyle),
          SizedBox(height: 8),
          LinearProgressIndicator(
            color: Color(0xff121417),
            value: 0.25,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          SizedBox(height: 32),
          Text('Goal Tree', style: AppTextStyles.headText),
          SizedBox(height: 32),
          Card(
            clipBehavior: Clip.hardEdge,
            color: Colors.blueGrey,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).width - 32,
              child: Placeholder(
                // TODO: add a snippet for the goal tree
              ),
            ),
          ),
          SizedBox(height: 32),
          Text('Notes', style: AppTextStyles.headText),
          SizedBox(height: 12),
          Text(
            'Focus on daily practice using language learning apps and engage in weekly conversation sessions with native speakers.',
            style: AppTextStyles.secondaryTextStyle,
          ),
          SizedBox(height: 32),
          Text('Resources', style: AppTextStyles.headText),
          SizedBox(height: 12),
          ResourcesList(
            resources: [
              ResourceModel(
                name: 'Duolingo',
                link: 'https://www.duolingo.com/',
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffF0F2F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Edit Goal',
                  style: AppTextStyles.secondaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppConstants.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Mark Completed',
                  style: AppTextStyles.secondaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
