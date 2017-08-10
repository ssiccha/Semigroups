#############################################################################
##
#W  semigrp.gd
#Y  Copyright (C) 2013-15                                James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

# This file contains operations for creating semigroups, subsemigroups, and
# closures.

# The following true method is required since IsInverseSemigroup is a property
# of semigroups and so objectifying something using IsInverseSemigroup does not
# result in a semigroup.

InstallTrueMethod(IsSemigroup, IsInverseSemigroup);

DeclareOperation("SemigroupByGenerators",
                 [IsMultiplicativeElementCollection, IsRecord]);
DeclareOperation("MonoidByGenerators",
                 [IsMultiplicativeElementCollection, IsRecord]);
DeclareOperation("InverseMonoidByGenerators",
                 [IsMultiplicativeElementWithOneCollection, IsRecord]);
DeclareOperation("InverseSemigroupByGenerators",
                 [IsMultiplicativeElementCollection, IsRecord]);

InstallTrueMethod(IsStarSemigroup,
                  IsAssociativeElementWithStarCollection and
                  IsInverseSemigroup and IsGeneratorsOfInverseSemigroup);

DeclareOperation("ClosureInverseSemigroup",
                 [IsInverseSemigroup and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElementCollection]);
DeclareOperation("ClosureInverseSemigroup",
                 [IsInverseSemigroup and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElementCollection,
                  IsRecord]);
DeclareOperation("ClosureInverseSemigroup",
                 [IsInverseSemigroup and IsGeneratorsOfInverseSemigroup,
                  IsListOrCollection and IsEmpty,
                  IsRecord]);
DeclareOperation("ClosureInverseSemigroup",
                 [IsInverseSemigroup and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElement]);
DeclareOperation("ClosureInverseSemigroup",
                 [IsInverseSemigroup and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElement, IsRecord]);

DeclareOperation("ClosureInverseMonoid",
                 [IsInverseMonoid and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElementCollection]);
DeclareOperation("ClosureInverseMonoid",
                 [IsInverseMonoid and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElementCollection,
                  IsRecord]);
DeclareOperation("ClosureInverseMonoid",
                 [IsInverseMonoid and IsGeneratorsOfInverseSemigroup,
                  IsListOrCollection and IsEmpty,
                  IsRecord]);
DeclareOperation("ClosureInverseMonoid",
                 [IsInverseMonoid and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElement]);
DeclareOperation("ClosureInverseMonoid",
                 [IsInverseMonoid and IsGeneratorsOfInverseSemigroup,
                  IsMultiplicativeElement, IsRecord]);

DeclareOperation("ClosureInverseSemigroupOrMonoidNC",
                 [IsFunction, IsSemigroup, IsList and IsFinite, IsRecord]);

DeclareOperation("ClosureSemigroup",
                 [IsSemigroup, IsMultiplicativeElementCollection, IsRecord]);
DeclareOperation("ClosureSemigroup",
                 [IsSemigroup, IsMultiplicativeElementCollection]);
DeclareOperation("ClosureSemigroup",
                 [IsSemigroup, IsListOrCollection and IsEmpty, IsRecord]);
DeclareOperation("ClosureSemigroup",
                 [IsSemigroup, IsMultiplicativeElement, IsRecord]);
DeclareOperation("ClosureSemigroup",
                 [IsSemigroup, IsMultiplicativeElement]);

DeclareOperation("ClosureMonoid",
                 [IsMonoid,
                  IsMultiplicativeElementWithOneCollection,
                  IsRecord]);
DeclareOperation("ClosureMonoid",
                 [IsMonoid, IsMultiplicativeElementWithOneCollection]);
DeclareOperation("ClosureMonoid",
                 [IsMonoid, IsListOrCollection and IsEmpty, IsRecord]);
DeclareOperation("ClosureMonoid",
                 [IsMonoid, IsMultiplicativeElementWithOne, IsRecord]);
DeclareOperation("ClosureMonoid",
                 [IsMonoid, IsMultiplicativeElementWithOne]);

DeclareOperation("ClosureSemigroupOrMonoidNC",
                 [IsFunction, IsSemigroup, IsList and IsFinite, IsRecord]);

DeclareOperation("AsSemigroup", [IsFunction, IsSemigroup]);
DeclareOperation("AsSemigroup", [IsFunction, IsRing, IsSemigroup]);
DeclareOperation("AsSemigroup", [IsFunction, IsPosInt, IsSemigroup]);
DeclareOperation("AsSemigroup", [IsFunction, IsPosInt, IsPosInt, IsSemigroup]);

DeclareConstructor("IsomorphismSemigroup",
                   [IsSemigroup, IsSemigroup]);
DeclareConstructor("IsomorphismSemigroup",
                   [IsSemigroup, IsRing, IsSemigroup]);
DeclareConstructor("IsomorphismSemigroup",
                   [IsSemigroup, IsPosInt, IsSemigroup]);
DeclareConstructor("IsomorphismSemigroup",
                   [IsSemigroup, IsPosInt, IsPosInt, IsSemigroup]);

DeclareOperation("AsMonoid", [IsFunction, IsSemigroup]);
DeclareOperation("AsMonoid", [IsFunction, IsRing, IsSemigroup]);
DeclareOperation("AsMonoid", [IsFunction, IsPosInt, IsSemigroup]);
DeclareOperation("AsMonoid", [IsFunction, IsPosInt, IsPosInt, IsSemigroup]);

DeclareConstructor("IsomorphismMonoid",
                   [IsSemigroup, IsSemigroup]);
DeclareConstructor("IsomorphismMonoid",
                   [IsSemigroup, IsRing, IsSemigroup]);
DeclareConstructor("IsomorphismMonoid",
                   [IsSemigroup, IsPosInt, IsSemigroup]);
DeclareConstructor("IsomorphismMonoid",
                   [IsSemigroup, IsPosInt, IsPosInt, IsSemigroup]);

#TODO move this to attributes!
DeclareAttribute("Generators", IsSemigroup);

#TODO move this to examples!
DeclareGlobalFunction("RandomSemigroup");
DeclareConstructor("RandomSemigroupCons", [IsSemigroup, IsList]);
DeclareGlobalFunction("RandomMonoid");
DeclareConstructor("RandomMonoidCons", [IsMonoid, IsList]);
DeclareGlobalFunction("RandomInverseSemigroup");
DeclareConstructor("RandomInverseSemigroupCons", [IsSemigroup, IsList]);
DeclareGlobalFunction("RandomInverseMonoid");
DeclareConstructor("RandomInverseMonoidCons", [IsMonoid, IsList]);

DeclareConstructor("SEMIGROUPS_ProcessRandomArgsCons",
                   [IsSemigroup, IsList]);

DeclareOperation("SubsemigroupByProperty", [IsSemigroup, IsFunction]);
DeclareOperation("SubsemigroupByProperty",
                 [IsSemigroup, IsFunction, IsPosInt]);

DeclareOperation("InverseSubsemigroupByProperty",
                 [IsSemigroup, IsFunction]);
DeclareOperation("InverseSubsemigroupByProperty",
                 [IsInverseSemigroup and IsGeneratorsOfInverseSemigroup,
                  IsFunction,
                  IsPosInt]);

DeclareOperation("StabilizerInverseSemigroup",
                 [IsActingSemigroup and IsInverseSemigroup
                 and IsPartialPermSemigroup,
                 IsPosInt]);

# undocumented
DeclareGlobalFunction("RegularSemigroup");
