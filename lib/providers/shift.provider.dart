import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/shift.model.dart';
import 'package:medical_booking_app/services/shift.service.dart';

class ShiftProvider extends ChangeNotifier {
  List<Shift> shifts = [];
  List<DateTime> dateTimes = [];
  String? errorMessage = "";
  bool isLoading = false;
  bool isLoadingId = false;
  // Phương thức lấy danh sách các phòng ban
  Future<void> getShifts() async {
    isLoading = true;
    shifts = await ShiftService.getAllShift();
    isLoading = false;
    notifyListeners();
  }

  Future<int> getShiftId(String time, DateTime dateTime) async {
    isLoading = true;
    int id = shifts
        .firstWhere(
            (element) => element.date == dateTime && element.time == time)
        .id;
    isLoading = false;
    notifyListeners();
    return id;
  }

  Future<void> getDateTimeOfShifts() async {
    isLoading = true;
    shifts = await ShiftService.getAllShift();
    isLoading = false;
    notifyListeners();
  }
}
