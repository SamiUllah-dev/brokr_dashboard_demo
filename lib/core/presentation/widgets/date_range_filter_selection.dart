import 'package:brokr_dashboard_demo/core/constants/drawables.dart';
import 'package:brokr_dashboard_demo/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateRangeFilterSelection extends StatelessWidget {
  const DateRangeFilterSelection({
    super.key,
    required this.onDateRangeSelected,
  });

  final void Function(DateTime startDate, DateTime endDate) onDateRangeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          Drawables.calendarRegular,
          height: 24,
          width: 24,
        ),
        Text(
          'From',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff3F3E45),
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Select from date Demo'),
              ),
            );
          },
          child: Text(
            'Select a date',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          'to',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff3F3E45),
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Select to date Demo'),
              ),
            );
          },
          child: Text(
            'Select a date',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
