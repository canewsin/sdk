// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// Dart test program testing overridden messageNotUnderstood.

// @dart = 2.9

library OverriddenNoSuchMethodTest.dart;

import "package:expect/expect.dart";
part "overridden.dart";

main() {
  OverriddenNoSuchMethod.testMain();
}
