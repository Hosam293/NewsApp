import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../Services/Fun.dart';
class DefCard extends StatefulWidget {
String urlToImage;
String title;
String url;
DefCard({required this.urlToImage, required this.title,required this.url});

@override
  State<DefCard> createState() => _DefCardState();
}

class _DefCardState extends State<DefCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: textColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],


      ),


      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Card(
        child: Column(
          children:
          [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: (widget.urlToImage == 'null')? NetworkImage('https://png.pngtree.com/element_our/20200610/ourmid/pngtree-not-found-image_2238448.jpg'):NetworkImage(
                      '${widget.urlToImage}',

                    ),
                    fit: BoxFit.cover
                ),
              ),


            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                '${widget.title}',
                style: TextStyle(
                    color: textColor,
                    fontSize: fontsmaller,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children:
              [
                IconButton(onPressed: ()
                {
                  Fun.shareUrl('${widget.url}').then((value)
                  {
                    final snackBar = SnackBar(content: Text('shared'),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  );
                }, icon: Icon(Icons.share,size: 25.0,
                  color: textColor,
                )),
                IconButton(onPressed: ()
                {
                  Fun.copyUrl('${widget.url}').then((value)
                  {
                    final snackBar = SnackBar(content: Text('copied'),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }, icon: Icon(Icons.copy_outlined,size: 25.0,
                  color: textColor,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
