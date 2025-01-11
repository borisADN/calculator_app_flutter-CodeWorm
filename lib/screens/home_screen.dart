import 'package:calculator_app/provider/cal_provider%20.dart';
import 'package:calculator_app/screens/widgets_data.dart';
import 'package:calculator_app/wigdets/cal_button.dart';
import 'package:calculator_app/wigdets/textfield.dart';
import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
    final decoration = const BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );

    return Consumer<CalculatorProvider>(
      builder: (context,provider,_) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text(
              'Calculator',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              CustomTextField( controller: provider.compController),
              const Spacer(),
              Container(
                height: screenHeight * 0.6,
                width: double.infinity,
                padding: padding,
                decoration: decoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => buttonList[index]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => buttonList[index + 4]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => buttonList[index + 8]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    3, (index) => buttonList[index + 12]),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    3, (index) => buttonList[index + 15]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        CalculateButton()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
