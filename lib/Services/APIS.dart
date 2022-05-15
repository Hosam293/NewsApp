import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Articles.dart';
class APIS
{
  static String apiKey= '0414a5df728d45c6a28732845daa8f20';

 static  fetchArticles() async {
    List<Articles> listArticles=[];
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    for(var i in responseBody)
    {
      var x = Articles(i['title'],i['description'], i['url'], i['urlToImage']);
      listArticles.add(x);
    }
    return listArticles;

  }
 static  fetchCatArticles(String category) async {
    List<Articles> listCatArticles=[];
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    for(var i in responseBody)
    {
      var x = Articles(i['title'],i['description'], i['url'], i['urlToImage']);
      listCatArticles.add(x);
    }
    return listCatArticles;

  }
}