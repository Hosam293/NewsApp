import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun
{
  static Future<void> launchUrl(String url) async {
    if (!await launch('$url')) throw 'Could not launch $url';

  }
  static Future<void> copyUrl(String url) async {
    FlutterClipboard.copy('$url').then(( value ) => print('copied'));
  }
  static Future<void> shareUrl(String url) async {
    Share.share('$url', subject: 'Look what I made!');
  }
}