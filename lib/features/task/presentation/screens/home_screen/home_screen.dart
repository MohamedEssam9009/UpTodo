import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';

import '../add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(context: context, screen: AddTaskScreen());
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 24.0.sp),
              ),
              SizedBox(height: 12.0.h),
              Text(
                AppStrings.today,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 24.0.sp),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    //TODO: Need to fix the height for Date Picker
                    DateTime.now(),
                    height: 110.h,
                    //width: 327.w,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primary,
                    dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                    dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                    monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                    selectedTextColor: AppColors.white,
                    onDateChange: (date) {},
                  ),
                ],
              ),
              SizedBox(height: 50.0.h),
              // noTasksWidget(context),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(24.0),
                        height: 240.h,
                        color: AppColors.deepGrey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 48.0.h,
                              width: double.infinity,
                              child: CustomButton(
                                text: AppStrings.taskCompleted,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 24.0.h),
                            SizedBox(
                              height: 48.0.h,
                              width: double.infinity,
                              child: CustomButton(
                                text: AppStrings.deleteTask,
                                onPressed: () {},
                                backgroundColor: AppColors.orange,
                              ),
                            ),
                            SizedBox(height: 24.0.h),
                            SizedBox(
                              height: 48.0.h,
                              width: double.infinity,
                              child: CustomButton(
                                text: AppStrings.cancel,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const TaskComponent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column noTasksWidget(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        Text(
          AppStrings.noTaskTitle,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 24.0.sp),
        ),
        Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context).textTheme.displayMedium!,
        ),
      ],
    );
  }
}

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132.0.h,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task 1',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24.0),
                ),
                SizedBox(height: 8.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.timer,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      '09:33 PM - 09:48 PM',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.0.h),
                Text(
                  'Learn Dart',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24.0.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 75.0.h,
            width: 1.0.w,
            color: AppColors.white,
          ),
          SizedBox(width: 9.0.w),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
