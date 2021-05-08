import 'package:flutter/material.dart';
import '../../global_widgets/base_view.dart';
import '../../utils/lorem_ipsum.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      "What is Hommie?",
      "Why choose Hommie?",
      "When can i make payment?",
      "Is there a refund policy?",
      "What if the owner cancels my order?",
      "How does the referral work?",
      "How do i reset my password?",
      "Does my nationality matter?",
      "Can i pay in instalments?",
      "Can i bring pets?",
    ];

    final faqs = ListView(
      shrinkWrap: true,
      children: questions.map((question) {
        return ExpansionTile(
          title: Text(question),
          children: <Widget>[
            ListTile(
              title: Text(
                LoremIpsum.faq,
              ),
            ),
          ],
        );
      }).toList(),
    );

    return BaseView(title: "Help", body: faqs);
  }
}
