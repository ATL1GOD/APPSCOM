import 'package:rive/rive.dart';

class RiveUtils {
  static SMIBool getRiveInput(Artboard artboard,
      {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);

    return controller.findInput<bool>("active") as SMIBool;
  }

  static void chnageSMIBoolState(SMIBool input) {
    input.change(true);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        input.change(false);
      },
    );
  }

    static StateMachineController getRiveController(Artboard artboard,
       {stateMachineName = "State Machine 1"}) {
     StateMachineController? controller =
         StateMachineController.fromArtboard(artboard, stateMachineName);
     if (controller == null) {
       throw Exception('No se pudo cargar el controlador de la máquina de estados para $stateMachineName');
     }
     artboard.addController(controller);
     return controller;

  /*static StateMachineController getRiveController(Artboard artboard,
      {stateMachineName = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(controller!);
    return controller;
  */}
}

