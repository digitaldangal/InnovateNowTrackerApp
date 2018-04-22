import 'package:uuid/uuid.dart';

enum ThingType {beacon, beaconscanner, gpstracker}
var uuid = new Uuid();

// Abstract thing properties
abstract class ThingProperties {
}

// Beacon properties
class BeaconProperties extends ThingProperties {

  String uuid;
  int major;
  int minor;

  BeaconProperties ({this.uuid, this.major, this.minor});
}

// Thing
class Thing {

  String id;
  String name;
  String description;
  ThingType type;
  ThingProperties properties;

  String topic;

  DateTime activatedAt;
  bool active;

  DateTime expiredAt;
  bool expired;

  DateTime createdAt;
  String createdBy;
  DateTime changedAt;
  String changedBy;

  Thing (id, this.name, this.description, this.type) {
    this.id = id ?? uuid.v1();
  }

  Thing.beacon (id, this.name, this.description, BeaconProperties properties) {
    this.id = id ?? uuid.v1();
    this.type = ThingType.beacon;
    this.properties = properties;
  }

  Thing.beaconscanner (id, this.name, this.description) {
    this.id = id ?? uuid.v1();
    this.type = ThingType.beaconscanner;
  }

  Thing.gpstracker (this.name, this.description) {
    this.type = ThingType.gpstracker;
  }

}