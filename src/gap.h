//
// Semigroups package for GAP
// Copyright (C) 2016 James D. Mitchell
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

// This file contains everything in the kernel module for the Semigroups
// package that involves GAP directly, i.e. importing functions/variables from
// GAP and declaring functions for GAP etc.

#ifndef SRC_GAP_H_
#define SRC_GAP_H_

#include <assert.h>
#include <iostream>
#include <vector>

#include "src/data.h"
#include "src/interface.h"
#include "src/semifp.h"

#include "src/compiled.h"

// The Semigroups package uses the type T_SEMI for GAP Objs which act as
// wrappers for various C++ objects. Such a GAP Obj can be created using
// OBJ_CLASS and the C++ object can be recovered from the GAP Obj using
// CLASS_OBJ. The GAP Obj returned by OBJ_CLASS is just a bag of type T_SEMI of
// the form:
//
// [ pointer to C++ class, t_semi_subtype_t ]
//

extern UInt T_SEMI;
extern UInt T_BIPART;
extern UInt T_BLOCKS;

// Subtypes of objects that can be stored in a GAP Obj of type T_SEMI

enum t_semi_subtype_t {
  T_SEMI_SUBTYPE_SEMIGP = 0,
  T_SEMI_SUBTYPE_CONVER = 1,
  T_SEMI_SUBTYPE_UFDATA = 2,
  T_SEMI_SUBTYPE_CONG   = 3
};

// Get a new GAP Obj containing a pointer to a C++ class of type Class

template <typename Class>
inline Obj OBJ_CLASS(Class* cpp_class, t_semi_subtype_t type) {
  Obj o          = NewBag(T_SEMI, 2 * sizeof(Obj));
  ADDR_OBJ(o)[0] = reinterpret_cast<Obj>(cpp_class);
  ADDR_OBJ(o)[1] = (Obj) type;
  return o;
}

// Get a pointer to a C++ object of type Class from GAP Obj of type T_SEMI

template <typename Class> inline Class* CLASS_OBJ(Obj o) {
  return reinterpret_cast<Class*>(ADDR_OBJ(o)[0]);
}

// Get the t_semi_subtype_t out of the T_SEMI Obj

inline t_semi_subtype_t SUBTYPE_OF_T_SEMI(Obj o) {
  assert(TNUM_OBJ(o) == T_SEMI);
  return static_cast<t_semi_subtype_t>(reinterpret_cast<UInt>(ADDR_OBJ(o)[1]));
}

// Imported types and functions from the library

extern Obj HTValue;
extern Obj HTAdd;
extern Obj infinity;
extern Obj Ninfinity;
extern Obj IsBooleanMat;
extern Obj BooleanMatType;
extern Obj IsMatrixOverSemiring;
extern Obj IsTropicalMatrix;
extern Obj MaxPlusMatrixType;
extern Obj IsMaxPlusMatrix;
extern Obj MinPlusMatrixType;
extern Obj IsMinPlusMatrix;
extern Obj TropicalMinPlusMatrixType;
extern Obj IsTropicalMinPlusMatrix;
extern Obj TropicalMaxPlusMatrixType;
extern Obj IsTropicalMaxPlusMatrix;
extern Obj ProjectiveMaxPlusMatrixType;
extern Obj IsProjectiveMaxPlusMatrix;
extern Obj IsNTPMatrix;
extern Obj NTPMatrixType;
extern Obj IsIntegerMatrix;
extern Obj IntegerMatrixType;
extern Obj IsPBR;
extern Obj PBRTypes;
extern Obj PBRType;

extern Obj TYPE_BIPART;
extern Obj TYPES_BIPART;

#endif // SRC_GAP_H_
