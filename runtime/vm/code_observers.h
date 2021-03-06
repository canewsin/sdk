// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#ifndef RUNTIME_VM_CODE_OBSERVERS_H_
#define RUNTIME_VM_CODE_OBSERVERS_H_

#include "vm/allocation.h"
#include "vm/globals.h"

#include "include/dart_api.h"

#if !defined(PRODUCT)
namespace dart {

class CodeComments;

// Object observing code creation events. Used by external profilers and
// debuggers to map address ranges to function names.
class CodeObserver {
 public:
  CodeObserver() {}

  virtual ~CodeObserver() {}

  // Returns true if this observer is active and should be notified
  // about newly created code objects.
  virtual bool IsActive() const = 0;

  // Notify code observer about a newly created code object with the
  // given properties.
  virtual void Notify(const char* name,
                      uword base,
                      uword prologue_offset,
                      uword size,
                      bool optimized,
                      const CodeComments* comments) = 0;

 private:
  DISALLOW_COPY_AND_ASSIGN(CodeObserver);
};

class Mutex;

class CodeObservers : public AllStatic {
 public:
  static void Init();

  static void RegisterExternal(Dart_CodeObserver observer);

  static void Register(CodeObserver* observer);

  // Notify all active code observers about a newly created code object.
  static void NotifyAll(const char* name,
                        uword base,
                        uword prologue_offset,
                        uword size,
                        bool optimized,
                        const CodeComments* comments);

  // Returns true if there is at least one active code observer.
  static bool AreActive();

  static void Cleanup();

  static Mutex* mutex() { return mutex_; }

 private:
  static Mutex* mutex_;
  static intptr_t observers_length_;
  static CodeObserver** observers_;
};

}  // namespace dart
#endif  // !defined(PRODUCT)

#endif  // RUNTIME_VM_CODE_OBSERVERS_H_
