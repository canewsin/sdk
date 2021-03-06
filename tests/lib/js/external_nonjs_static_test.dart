// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Checks for static errors using external without the @JS() annotation,
// in a library without a @JS() annotation

library external_nonjs_static_test;

import 'package:js/js.dart';

external var topLevelField;
//           ^
// [web] Only JS interop members may be 'external'.

external final topLevelFinalField;
//             ^
// [web] Only JS interop members may be 'external'.

external get topLevelGetter;
//           ^
// [web] Only JS interop members may be 'external'.

external set topLevelSetter(_);
//           ^
// [web] Only JS interop members may be 'external'.

external topLevelFunction();
//       ^
// [web] Only JS interop members may be 'external'.

class Constructors {
  external Constructors();
  //       ^
  // [web] Only JS interop members may be 'external'.

  external Constructors.namedConstructor();
  //       ^
  // [web] Only JS interop members may be 'external'.

  external factory Constructors.namedFactory();
  //               ^
  // [web] Only JS interop members may be 'external'.
}

class Members {
  external var field;
  //           ^
  // [web] Only JS interop members may be 'external'.

  external final finalField;
  //             ^
  // [web] Only JS interop members may be 'external'.

  external get instanceGetter;
  //           ^
  // [web] Only JS interop members may be 'external'.

  external set instanceSetter(_);
  //           ^
  // [web] Only JS interop members may be 'external'.

  external instanceMethod();
  //       ^
  // [web] Only JS interop members may be 'external'.
}

class StaticMembers {
  external static var staticField;
  //                  ^
  // [web] Only JS interop members may be 'external'.

  external static final staticFinalField;
  //                    ^
  // [web] Only JS interop members may be 'external'.

  external static get staticGetter;
  //                  ^
  // [web] Only JS interop members may be 'external'.

  external static set staticSetter(_);
  //                  ^
  // [web] Only JS interop members may be 'external'.

  external static staticMethod();
  //              ^
  // [web] Only JS interop members may be 'external'.
}

@anonymous
class AnonymousClass {
  external var field;
  //           ^
  // [web] Only JS interop members may be 'external'.

  external factory AnonymousClass({var field});
  //               ^
  // [web] Only JS interop members may be 'external'.
}

main() {}
