import 'package:flutter_test/flutter_test.dart';
import 'package:memora/infrastructure/services/geolocator_current_location_service.dart';

void main() {
  test('GeolocatorCurrentLocationServiceが生成できる', () {
    final service = GeolocatorCurrentLocationService();
    expect(service, isA<GeolocatorCurrentLocationService>());
  });
}
