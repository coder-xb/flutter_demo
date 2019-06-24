import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperPage> {
  final String _titleText = 'Stepper';
  int _curStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 进程步骤显示组件
            Stepper(
              // 步骤显示组件排列方向
              // type: StepperType.horizontal,
              currentStep: _curStep, // 当前步骤
              // 步骤被点击时
              onStepTapped: (int val) {
                setState(() {
                  _curStep = val;
                });
              },
              // 步骤继续时
              onStepContinue: () {
                setState(() {
                  _curStep < 2 ? _curStep ++ : _curStep = 0;
                });
              },
              // 步骤取消时
              onStepCancel: () {
                setState(() {
                  _curStep > 0 ? _curStep -- : _curStep = 0;
                });
              },
              // 具体的步骤项
              steps: [
                Step(
                  title: Text('LOGIN'),
                  subtitle: Text('Login First'),
                  // state: StepState.editing, // 当前步骤状态
                  content: Text('Magna exercitation duis non sint eu nostrud.'),
                  isActive: _curStep == 0,
                ),
                Step(
                  title: Text('CHOOSE'),
                  subtitle: Text('Choose your Plan'),
                  content: Text('Magna exercitation duis non sint eu nostrud.'),
                  isActive: _curStep == 1,
                ),
                Step(
                  title: Text('CONFIRM'),
                  subtitle: Text('Confirm your payment method.'),
                  content: Text('Magna exercitation duis non sint eu nostrud.'),
                  isActive: _curStep == 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
