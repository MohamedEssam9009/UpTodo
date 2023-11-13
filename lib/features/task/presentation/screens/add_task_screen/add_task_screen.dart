import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/task/presentation/components/add_task_component.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        centerTitle: false,
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<TaskCubit>(context);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Title
                    AddTaskComponent(
                      title: AppStrings.title,
                      hintText: AppStrings.titleHint,
                      controller: titleController,
                    ),
                    SizedBox(height: 24.0.h),
                    //! Note
                    AddTaskComponent(
                      title: AppStrings.note,
                      hintText: AppStrings.noteHint,
                      controller: noteController,
                    ),
                    SizedBox(height: 24.0.h),
                    //! Date
                    AddTaskComponent(
                      title: AppStrings.date,
                      hintText: DateFormat.yMd().format(cubit.currentDate),
                      controller: noteController,
                      readOnly: true,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          cubit.getDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0.h),
                    //! Start Time
                    Row(
                      children: [
                        Expanded(
                          child: AddTaskComponent(
                            readOnly: true,
                            title: AppStrings.startTime,
                            hintText: cubit.startTime,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                cubit.getStartTime(context);
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 27.0.w),
                        //! End Time
                        Expanded(
                          child: AddTaskComponent(
                            readOnly: true,
                            title: AppStrings.endTime,
                            hintText: cubit.endTime,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                cubit.getEndTime(context);
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //! Color
                    SizedBox(height: 24.0.h),
                    SizedBox(
                      height: 68.0.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Color
                          Text(
                            AppStrings.color,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 8.0.h),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12.0.w),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    cubit.changeCheckMarkIndex(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: cubit.getColor(index),
                                    child: index == cubit.currentIndex
                                        ? const Icon(Icons.check)
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //! Add Task Button
                    SizedBox(height: 92.0.h),
                    SizedBox(
                      height: 48.0.h,
                      width: double.infinity,
                      child: CustomButton(
                        text: AppStrings.createTask,
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
