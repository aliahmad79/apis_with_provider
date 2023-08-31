import 'package:api_with_provider/data/response/status.dart';
import 'package:api_with_provider/utils/routes/route_name.dart';
import 'package:api_with_provider/view_model/home_view_model.dart';
import 'package:api_with_provider/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // homeViewModel.getUserCarList();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.getVehicleListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Apis"),
        actions: [
          IconButton(
              onPressed: () {
                userPref.removeUser().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.loginScreen, (route) => false);
                  debugPrint(value.toString());
                });
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, vehicleModel, _) {
          if (vehicleModel.userCarList.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (vehicleModel.userCarList.status == Status.COMPLETED) {
            return ListView.builder(
              itemCount: vehicleModel.userCarList.data?.makers.length,
              itemBuilder: (context, index) {
                final item = vehicleModel.userCarList.data?.makers[index];
                if (kDebugMode) {
                  print(item!.fullName.toString());
                }
                return const ListTile(
                  title: Text("dfd"),
                  subtitle: Text("dfdfdf"),
                );
              },
            );
          } else if (vehicleModel.userCarList.status == Status.ERROR) {
            return Center(
              child: Text('Error: ${vehicleModel.userCarList.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
