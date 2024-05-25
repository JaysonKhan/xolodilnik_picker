enum FirstButtonType {
  backButton,
  fridge;

  bool get isBackButton => this == FirstButtonType.backButton;
  bool get isFridge => this == FirstButtonType.fridge;
}
