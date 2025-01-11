import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/provider/cal_provider%20.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CalculatorProvider>(context, listen: false).setValue('=');
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        height: 160,
        width: 60,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            '=',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
