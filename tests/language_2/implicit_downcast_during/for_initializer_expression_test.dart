// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

import "package:expect/expect.dart";

void main() {
  Object b = 0;
  int i;
  for (i = b; i < 1; i++) {} // No error
  b = new Object();
  Expect.throwsTypeError(() {
    for (i = b; i < 1; i++) {}
  });
}
