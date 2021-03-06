import 'dart:math';

import 'package:uuid/uuid.dart';
import 'package:whoshere/mock/mockTagList.dart';
import 'package:whoshere/model/user.dart';
import 'package:whoshere/service/user_location_service.dart';
import 'package:faker/faker.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';

class SemiMockUserLocationService extends UserLocationService {
  List<User>? _mockUsers;
  int _tagGenIndex = 0;

  @override
  Future<List<User>> getNearbyUsers() async {
    List<User> users = await super.getNearbyUsers();
    if (users.length < 10) {
      if (_mockUsers == null) {
        _mockUsers = [];
        for (int i = 0; i < 20; i++) {
          _mockUsers!.add(_newMockUser());
        }
      }

      users.addAll(_mockUsers!);
    }

    return users;
  }

  User _newMockUser() {
    var faker = Faker();
    var rand = Random();
    var latitudeOffset = (rand.nextDouble() - 0.5) * 0.1;
    var longitudeOffset = (rand.nextDouble() - 0.5) * 0.1;

    return User(
        userId: "mock-${const Uuid().v4()}",
        avatarPath: "/avatar_images/default_avatar_${rand.nextInt(7) + 1}.jpg",
        userName: faker.internet.userName(),
        email: faker.internet.email(),
        bio: faker.lorem.sentence(),
        location: LatLng(currentLocation.latitude + latitudeOffset,
            currentLocation.longitude + longitudeOffset),
        tags: [tagList[_tagGenIndex++ % tagList.length]]);
  }
}
