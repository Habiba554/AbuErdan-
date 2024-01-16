import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({
    super.key,
    required TextEditingController comment,
    required this.mediaQuery,
  }) : _comment = comment;

  final TextEditingController _comment;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.mode_comment,
                  color: kPrimarycolor,
                  weight: 5,
                ),
                Text('Comments',
                    style: TextStyle(
                        color: kPrimarycolor, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _comment,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: mediaQuery.size.height * 0.017),
                      cursorColor: Colors.blueGrey,
                      decoration: const InputDecoration(
                          hintText: 'Write a comment',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x2F000000)),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0x2F000000)))),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: null,
                    ),
                  )
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt, size: 30),
                color: Colors.blueGrey,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimarycolor,
                      minimumSize: const Size(40, 38) // Background color
                      ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Post Comment',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
