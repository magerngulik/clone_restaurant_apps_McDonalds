Map<String, InputControllerState> inputControllers = {};

class Input1 {
  static get(String id) {
    return inputControllers[id]!.getValue();
  }
}

class InputControllerState {
  setValue(value) {}
  getValue() {}
}
