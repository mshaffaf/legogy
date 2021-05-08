import 'package:flutter/material.dart';
import '../../services/alert.service.dart';
import '../custom_stepper/src/custom_stepper_view.dart';
import '../custom_stepper/src/step.dart';

class CustomStepper extends StatefulWidget {
  final List<AStep> steps;
  final VoidCallback onCompleted;

  const CustomStepper({
    Key key,
    @required this.steps,
    @required this.onCompleted,
  }) : super(key: key);
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  PageController _controller = PageController();
  int currentStep = 0;

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  switchToPage(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  onStepNext() {
    String message = widget.steps[currentStep].validation();
    if (message == null) {
      if (!_isLast(currentStep)) {
        setState(() {
          currentStep++;
        });
        FocusScope.of(context).unfocus();
        switchToPage(currentStep);
      } else {
        widget.onCompleted();
      }
    } else {
      // print(message);
      AlertService().show(
        message: message,
        type: AlertType.error,
        context: context,
      );
    }
  }

  onStepBack() {
    if (!_isFirst(currentStep)) {
      setState(() {
        currentStep--;
      });
      switchToPage(currentStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: widget.steps.map((step) {
          return CustomStepperView(
            step: step,
          );
        }).toList(),
      ),
    );

    final counter = Container(
      child: Text(
        "STEP ${currentStep + 1} OF ${widget.steps.length}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final buttons = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: onStepBack,
            child: Text(
              "BACK",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          counter,
          FlatButton(
            onPressed: onStepNext,
            child: Text(
              "NEXT",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );

    return Container(
      child: Column(
        children: [content, buttons],
      ),
    );
  }
}
