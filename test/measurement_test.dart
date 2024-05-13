abstract class Component {}
class AComp extends Component{}
class BComp extends Component{}
class CComp extends Component{}
class DComp extends Component{}
class EComp extends Component{}
class FComp extends Component{}
class GComp extends Component{}
class HComp extends Component{}
class IComp extends Component{}
class JComp extends Component{}

class MeasurementUtil {
  static final Map<String, DateTime> timemap = {};

  static void start(String timeName) {
    timemap[timeName] = DateTime.now();
  }

  static void end(String timeName) {
    if(timemap.containsKey(timeName)) {
      print("$timeName: ${DateTime.now().difference(timemap[timeName]!).inMilliseconds} ms");
      timemap.remove(timeName);
    }
  }
}

/// after some tests this method of testing has proven to be quite inaccurate
void main() {
  Map<int, int> value = {
    0: 0,
    1: 1,
    2: 2,
    3: 3,
    4: 4,
    5: 5,
    6: 6,
    7: 7,
    8: 8,
    9: 9,
  };

  Map<String, int> sValue = {
    "0": 0,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
  };
  Map<Type, int> tvalue = {
    AComp: 0,
    BComp: 1,
    CComp: 2,
    DComp: 3,
    EComp: 4,
    FComp: 5,
    GComp: 6,
    HComp: 7,
    IComp: 8,
    JComp: 9,
  };
  MeasurementUtil.start("int");
  for(int i = 0; i < 1000000;i++) {
    int? c = value[4]!;
  }
  MeasurementUtil.end("int");

  MeasurementUtil.start("string");
  for(int i = 0; i < 1000000;i++) {
    int? c = sValue["5"];
  }
  MeasurementUtil.end("string");

  MeasurementUtil.start("type");
  for(int i = 0; i < 1000000;i++) {
    int? c = tvalue[GComp];
  }
  MeasurementUtil.end("type");
}