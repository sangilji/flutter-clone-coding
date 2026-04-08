import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/constants/common_size.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        final imgSize = size.width / 4;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: common_sm_padding * 3,
              thickness: 1,
              color: Colors.grey[200],
              indent: common_sm_padding,
              endIndent: common_sm_padding,
            );
          },
          padding: EdgeInsets.all(common_bg_padding),
          itemBuilder: (context, index) {
            return SizedBox(
              height: imgSize,
              child: Row(
                children: [
                  ExtendedImage.network('https://picsum.photos/100',
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),),
                  SizedBox(width: common_sm_padding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'data',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // SizedBox(height: 5,),
                        Text(
                          'data',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 5),
                        Text('data'),
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 15,
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.chat_bubble_2,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '31',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Icon(
                                      CupertinoIcons.heart,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '31',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 10,
        );
      },
    );
  }
}
