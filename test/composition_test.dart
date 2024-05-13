import 'package:entitas_ff/entitas_ff.dart';
import 'package:flutter_test/flutter_test.dart';

import 'components.dart';

// stand user component
class StandUser implements Component {
  final Stand stand;
  // constructor
  StandUser({required this.stand});
}

// Stand only defines a interface
abstract class Stand {
  String get standCry;
}

class StickyFingers implements Stand {
  @override
  String get standCry => "Ari Ari Ari Ari";
}

class GoldExperience implements Stand {
  @override
  String get standCry => "Muda Muda Muda Muda";
}

/// test to check how inheritance works with the current ECS paradigm
/// Inheritance does not work correctly and allows for one entity to have
/// multiples [Stand] components. This should not be allowed. (check composition_test)
main() {
  test("Create a stand user and check how inheritance works", () {
    EntityManager em = EntityManager();

    final buccelati = em.createEntity()
        + Name("Bruno Buccelati")
        + Age(20)
        /// + StickyFingers(); - this no longer works because Stand is not a component
        + StandUser(stand: StickyFingers()); // this works

    expect(buccelati.getOrNull<StandUser>()?.stand.standCry, "Ari Ari Ari Ari"); // generic
  });

  test("Create a stand user with two stands", () {
    EntityManager em = EntityManager();

    /// GoldExperience will be overwritten by StickyFingers, meaning only one stand will be present
    final buccelati = em.createEntity()
        + Name("Bruno Buccelati")
        + StandUser(stand: GoldExperience())
        + StandUser(stand: StickyFingers());

    expect(buccelati.getOrNull<StandUser>()?.stand.standCry, "Ari Ari Ari Ari"); // generic
  });

}