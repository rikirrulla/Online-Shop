import 'package:online_shop/src/business_logic/services/api_services/api.dart';
import 'package:online_shop/src/business_logic/services/database_services/network_helper.dart';

class DatabaseMysql{

  Future<dynamic> getData() async{
    NetworkHelper networkHelper = NetworkHelper(Api.urlPrefix+'');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


}