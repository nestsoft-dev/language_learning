import 'package:share_plus/share_plus.dart';

void shareInvite()async{
  final result = await Share.shareWithResult('check out these language learning app i use in learning, Download it form the link here: https://play.google.com/store/apps/details?id=com.enginesos.language.language_learning&hl=en&gl=US');

if (result.status == ShareResultStatus.success) {
   
}
}

void readToUser(String text,String langCode)async{
  
}