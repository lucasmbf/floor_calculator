import 'package:floor_calculator/models/floor_model.dart';
import 'package:floor_calculator/models/result_model.dart';
import 'package:floor_calculator/models/room_model.dart';

class CalculatorController {
  final floor = FloorModel();
  final room = RoomModel();

  double _parse(String value) {
    return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
  }

  void setFloorWidth(String value) {
    floor.width = _parse(value);
  }

  void setFloorLenght(String value) {
    floor.lenght = _parse(value);
  }

  void setRoomWidth(String value) {
    room.width = _parse(value);
  }

  void setRoomLenght(String value) {
    room.lenght = _parse(value);
  }

  ResultModel calculate() {
    final result = ResultModel();
    result.piecesByLenght = (room.lenght / floor.lenght).ceil();
    result.piecesByWidth = (room.width / floor.width).ceil();
    result.areaFloor = floor.lenght * floor.width;
    return result;
  }
}
