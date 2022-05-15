import 'package:flutter/material.dart';
import 'package:skynews/view/Widgets/DefCard.dart';

import '../../Constants.dart';
import '../../Services/APIS.dart';
class CateScreen extends StatefulWidget {
  String textNews;

  CateScreen({required this.textNews});

  @override
  State<CateScreen> createState() => _CateScreenState();
}

class _CateScreenState extends State<CateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGround,
        body: Padding(
          padding:  EdgeInsets.only(left: 10.0,top: MediaQuery.of(context).size.height/20,right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Text(
                '${widget.textNews}',
                style: TextStyle(
                    color: textColor,
                    fontSize: fonttitel,
                    fontWeight: FontWeight.w800
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                  child: FutureBuilder(
                    future: APIS.fetchCatArticles(widget.textNews),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                    {
                      return (snapshot.hasData)? ListView.separated(separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.0,),
                        itemBuilder: (BuildContext context, int index) => DefCard(title:'${snapshot.data[index].title}', urlToImage: '${snapshot.data[index].urlToImage}', url: '${snapshot.data[index].url}',),
                        itemCount: snapshot.data.length,

                      ): Center(child: CircularProgressIndicator());

                    },


                  )
              )

            ],
          ),
        ),

      ),
    );
  }
}
