import 'package:entitas_ff/entitas_ff.dart';
import 'package:flutter_test/flutter_test.dart';

import 'components.dart';

abstract class Stand extends Component {
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
    + StickyFingers();

    expect(buccelati.getOrNull<StickyFingers>()?.standCry, "Ari Ari Ari Ari"); // finds sticky fingers
    expect(buccelati.getOrNull<Stand>()?.standCry, null); // does not find stand
  });

  test("Create a stand user with two stands", () {
    EntityManager em = EntityManager();

    final buccelati = em.createEntity()
        + Name("Bruno Buccelati")
        + GoldExperience()
        + StickyFingers();

    expect(buccelati.getOrNull<StickyFingers>()?.standCry, "Ari Ari Ari Ari"); // finds sticky fingers
    expect(buccelati.getOrNull<GoldExperience>()?.standCry, "Muda Muda Muda Muda"); // finds sticky fingers
    expect(buccelati.getOrNull<Stand>()?.standCry, null); // does not find stand
  });
}