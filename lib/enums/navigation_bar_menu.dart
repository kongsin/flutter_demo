enum NavigationBarMenu {

  HOME(0), NOTIFICATION(1), SCHEDULE(2), BOOKING(3), PROFILE(4);

  final int position;
  const NavigationBarMenu(this.position);

  factory NavigationBarMenu.from(int position) {
    switch (position) {
      case 0: return NavigationBarMenu.HOME;
      case 1: return NavigationBarMenu.NOTIFICATION;
      case 2: return NavigationBarMenu.SCHEDULE;
      case 3: return NavigationBarMenu.BOOKING;
      case 4: return NavigationBarMenu.PROFILE;
    }
    return NavigationBarMenu.HOME;
  }

}