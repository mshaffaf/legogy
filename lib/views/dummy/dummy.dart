import 'package:flutter/material.dart';
import '../../global_widgets/base_view.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final content = Container();

    return BaseView(title: "Dummy", body: content);
  }
}
