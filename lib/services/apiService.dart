import 'package:dio/dio.dart';
import 'package:hinergi_kwh_meter/model/thinkspeak.dart';
import 'package:intl/intl.dart';

Future<Map> getThinkspeakData(Map rangeData) async {
  print(rangeData);
  try {
    var dio = Dio();

    String channelId = "1144738";
    String apiKey = "X5I6AG6OA780BKVA";

    String startTime = "2020-10-20";
    String endTime = "2020-10-21";

    String url = "https://api.thingspeak.com/channels/" +
        channelId +
        "/feeds.json?end=" +
        endTime +
        "&apikey=" +
        apiKey +
        "&start=" +
        startTime +
        "&timezone=Asia%2FJakarta";

    Response response = await dio.get(url);
    // print(url);
    var dataThinkspeak = Thinkspeak.fromJson(response.data);
    int panjangData = dataThinkspeak.feeds.length;
    double startKwh = double.parse(dataThinkspeak.feeds[0].field4);
    double lastKwh = double.parse(dataThinkspeak.feeds[panjangData - 1].field4);

    double enjoy = lastKwh - startKwh;
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(startTime);
    String stempDate = DateFormat("dd-MM-yyy").format(tempDate);
    print("\n date : $stempDate");
    print("panjang data : $panjangData");
    print("start data : $startKwh");
    print("last data : $lastKwh");
    print("penggunaan data : $enjoy\n");
    return response.data;
  } catch (e) {}
}
