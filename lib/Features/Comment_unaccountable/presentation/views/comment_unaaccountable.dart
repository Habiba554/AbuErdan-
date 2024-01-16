import 'package:abuerdan2/Features/Comment_unaccountable/presentation/views/widgets/unaccountable.dart';
import 'package:flutter/material.dart';
import 'widgets/comment.dart';

// ignore: must_be_immutable
class CommentPage extends StatelessWidget {
  CommentPage({super.key});
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _justification = TextEditingController();
  final TextEditingController _comment = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Unaccountable(quantity: _quantity, justification: _justification),
          SizedBox(height: mediaQuery.size.height * 0.03),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 199, 198, 198),
            height: 0,
            indent: 1,
            endIndent: 1,
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          Comments(comment: _comment, mediaQuery: mediaQuery),
          SizedBox(height: mediaQuery.size.height * 0.03),
        ],
      ),
    );
  }
}
