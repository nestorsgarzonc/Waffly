import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../models/freelancer_model.dart';

class FreelancerProvider extends ChangeNotifier {
  List<FreelancerModel> _freelancerData = [];
  FreelancerModel _freelancerSelected;
  FreelancerModel _freelancerUser;

  FreelancerModel get freelancer => _freelancerSelected;
  FreelancerModel get freelancerUser => _freelancerUser;

  set freelancer(FreelancerModel freelancer) {
    _freelancerSelected = freelancer;
    notifyListeners();
  }

  List<FreelancerModel> get getFreelancers => _freelancerData;

  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/data/freelancer.json');
    _freelancerData = freelancerModelFromJson(data);
    print('Frelancer data loaded');
  }

  void userToFreelancer(FreelancerModel freelancer) {
    _freelancerUser = freelancer;
    _freelancerData.add(freelancer);
    notifyListeners();
  }

  bool createService() {
    //TODO: finishFreelancerModel freelancer
    return true;
  }
}
