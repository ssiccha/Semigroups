############################################################################
##
#W  standard/semigrp.tst
#Y  Copyright (C) 2015                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: standard/semigrp.tst");
gap> LoadPackage("semigroups", false);;

#
gap> SEMIGROUPS.StartTest();;

# AsMonoid with 1 arg
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> AsMonoid(S);
<trivial transformation group of degree 0 with 1 generator>
gap> T := AsSemigroup(IsBooleanMatSemigroup, S);
<commutative semigroup of 2x2 boolean matrices with 1 generator>
gap> IsMonoid(T);
false
gap> IsMonoidAsSemigroup(T);
true
gap> AsMonoid(T);
<trivial group of 1x1 boolean matrices with 1 generator>
gap> S := AsSemigroup(IsFpSemigroup, S);
<fp semigroup on the generators [ s1 ]>
gap> AsMonoid(S);
<fp monoid on the generators [  ]>
gap> S := AsSemigroup(IsMaxPlusMatrixSemigroup, S);
<trivial group of 1x1 max-plus matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 max-plus matrices with 1 generator>
gap> S := AsSemigroup(IsMinPlusMatrixSemigroup, S);
<trivial group of 1x1 min-plus matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsMinPlusMatrixSemigroup, S);
<commutative semigroup of 2x2 min-plus matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 min-plus matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsProjectiveMaxPlusMatrixSemigroup, S);
<commutative semigroup of 2x2 projective max-plus matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 projective max-plus matrices with 1 generator>
gap> S := AsSemigroup(IsIntegerMatrixSemigroup, S);
<trivial group of 1x1 integer matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsIntegerMatrixSemigroup, S);
<commutative semigroup of 2x2 integer matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 integer matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsTropicalMaxPlusMatrixSemigroup, 3, S);
<commutative semigroup of 2x2 tropical max-plus matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 tropical max-plus matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsTropicalMinPlusMatrixSemigroup, 3, S);
<commutative semigroup of 2x2 tropical min-plus matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 tropical min-plus matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsNTPMatrixSemigroup, 3, 3, S);
<commutative semigroup of 2x2 ntp matrices with 1 generator>
gap> AsMonoid(S);
<trivial group of 1x1 ntp matrices with 1 generator>
gap> S := Semigroup(Transformation([2, 2, 3, 4]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> S := AsSemigroup(IsPBRSemigroup, S);
<commutative pbr semigroup of degree 2 with 1 generator>
gap> AsMonoid(S);
<trivial pbr group of degree 1 with 1 generator>

# AsMonoid returns fail
gap> S := InverseSemigroup(
> [Bipartition([[1, -4], [2, -1], [3, -2], [4], [-3]]),
>  Bipartition([[1, -3], [2], [3], [4, -1], [-2], [-4]])]);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsTransformationSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsPartialPermSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsBooleanMatSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsFpSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsMaxPlusMatrixSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsMinPlusMatrixSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsTropicalMaxPlusMatrixSemigroup, 3, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsTropicalMinPlusMatrixSemigroup, 3, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsProjectiveMaxPlusMatrixSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsIntegerMatrixSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsNTPMatrixSemigroup, 3, 3, S);;
gap> AsMonoid(S);
fail
gap> S := AsSemigroup(IsPBRSemigroup, S);;
gap> AsMonoid(S);
fail
gap> S := TrivialSemigroup(IsReesMatrixSemigroup); 
<Rees matrix semigroup 1x1 over Group(())>
gap> AsMonoid(S);
fail
gap> S := ReesZeroMatrixSemigroup(Group(()), [[()]]);;
gap> AsMonoid(S);
fail
gap> S := GraphInverseSemigroup(Digraph([[2], []]));
<finite graph inverse semigroup with 2 vertices, 1 edge>
gap> AsMonoid(S);
fail

# SEMIGROUPS.ClosureSemigroupDestructive 1
gap> gens :=
> [Matrix(IsBooleanMat, [[0, 0, 0, 1, 0], [0, 1, 1, 1, 1], [1, 1, 1, 1, 0],
>       [1, 0, 1, 1, 1], [0, 1, 0, 1, 1]]),
>   Matrix(IsBooleanMat, [[1, 0, 1, 1, 1], [1, 1, 0, 0, 1], [0, 0, 1, 1, 1],
>       [1, 1, 0, 0, 0], [0, 0, 1, 0, 1]]),
>   Matrix(IsBooleanMat, [[0, 0, 0, 0, 1], [1, 0, 1, 1, 1], [1, 0, 1, 0, 1],
>       [1, 0, 1, 0, 1], [1, 1, 1, 1, 0]]),
>   Matrix(IsBooleanMat, [[1, 1, 1, 0, 0], [1, 0, 1, 0, 0], [0, 1, 1, 0, 1],
>       [0, 0, 0, 1, 1], [1, 1, 1, 0, 0]]),
>   Matrix(IsBooleanMat, [[0, 1, 0, 1, 0], [1, 0, 0, 1, 0], [1, 1, 0, 0, 0],
>       [1, 0, 1, 1, 0], [0, 0, 1, 1, 0]])];;
gap> x := Matrix(IsBooleanMat, [[1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 1, 0], 
> [1, 0, 0, 1]]);;
gap> S := Semigroup(gens);
<semigroup of 5x5 boolean matrices with 5 generators>
gap> SEMIGROUPS.ClosureSemigroupDestructive(S, [x], SEMIGROUPS.OptionsRec(S));
Error, Semigroups: SEMIGROUPS.ClosureSemigroupDestructive: usage,
the arguments do not belong to the same family,
gap> SEMIGROUPS.ClosureSemigroupDestructive(S, [IdentityTransformation],
> SEMIGROUPS.OptionsRec(S));
Error, Semigroups: SEMIGROUPS.ClosureSemigroupDestructive: usage,
the arguments do not belong to the same family,

# SEMIGROUPS.ClosureSemigroupDestructive 2
gap> S := Semigroup(Transformation([2, 4, 3, 4]),
>                   Transformation([3, 3, 2, 3, 3]));;
gap> SEMIGROUPS.ClosureSemigroupDestructive(S, 
>                             [ConstantTransformation(7, 7)], 
>                             SEMIGROUPS.OptionsRec(S));
<transformation semigroup of degree 7 with 3 generators>
gap> Size(S) = Size(Semigroup(S));
true
gap> Size(S);
6

# SEMIGROUPS.ClosureSemigroupDestructive 3
gap> S := Semigroup(Transformation([2, 4, 3, 4]),
>                   Transformation([3, 3, 2, 3, 3]), rec(acting := false));;
gap> S := SEMIGROUPS.ClosureSemigroupDestructive(S, 
>                                 [ConstantTransformation(7, 7)], 
>                                 SEMIGROUPS.OptionsRec(S));
<transformation semigroup of degree 7 with 3 generators>
gap> Size(S) = Size(Semigroup(S));
true
gap> Size(S);
7

# SEMIGROUPS.ClosureSemigroupDestructive 3
gap> S := Semigroup(Transformation([2, 4, 3, 4]),
>                   Transformation([3, 3, 2, 3, 3]), rec(acting := false));;
gap> S := SEMIGROUPS.ClosureSemigroupDestructive(S, 
>                                 [Transformation([5, 5, 5, 4, 4])],
>                                 SEMIGROUPS.OptionsRec(S));
<transformation semigroup of degree 5 with 3 generators>
gap> Size(S) = Size(Semigroup(S));
true
gap> Size(S);
14

# SEMIGROUPS.ClosureSemigroupDestructive 4
gap> S := FreeBand(3);
<free band on the generators [ x1, x2, x3 ]>
gap> T := Semigroup(S.1, S.2);
<semigroup with 2 generators>
gap> T := SEMIGROUPS.ClosureSemigroupDestructive(T, [S.3], SEMIGROUPS.OptionsRec(T));
<semigroup with 3 generators>
gap> Size(T);
159
gap> T = S;
true

# SEMIGROUPS.ClosureSemigroupDestructive 5
gap> S := Semigroup(PartialPerm([1]), rec(acting := false));
<trivial partial perm group of rank 1 with 1 generator>
gap> S := SEMIGROUPS.ClosureSemigroupDestructive(S, 
>                                  [PartialPerm([3])],
>                                  SEMIGROUPS.OptionsRec(S));
<partial perm semigroup of rank 1 with 2 generators>
gap> Size(S) = Size(Semigroup(S));
true
gap> Size(S);
3

# Test IsGeneratorsOfInverseSemigroup for a semigroup 1
gap> S := InverseMonoid(PartialPerm([1, 2, 3, 5, 6, 9], [8, 4, 6, 5, 3, 2]),
>  PartialPerm([1, 3, 4, 5, 8, 9], [5, 8, 4, 1, 9, 7]),
>  PartialPerm([1, 3, 5, 6, 8], [3, 7, 5, 4, 9]),
>  PartialPerm([1, 2, 3, 5, 6, 7], [1, 10, 7, 8, 5, 9]));;
gap> IsGeneratorsOfInverseSemigroup(S);
true

# Test IsGeneratorsOfInverseSemigroup for a semigroup 2
gap> S := Monoid(
> Bipartition([[1, -8], [2, -4], [3, -6], [4], [5, -5],
>      [6, -3], [7], [8], [9, -2], [10], [-1], [-7], [-9],
>      [-10]]), 
> Bipartition([[1, -5], [2], [3, -8], [4, -4],
>      [5, -1], [6], [7], [8, -9], [9, -7], [10], [-2], [-3],
>      [-6], [-10]]), 
> Bipartition([[1, -3], [2], [3, -7], [4],
>      [5, -5], [6, -4], [7], [8, -9], [9], [10], [-1], [-2],
>      [-6], [-8], [-10]]),
> Bipartition([[1, -1], [2, -10], [3, -7], [4], [5, -8],
>      [6, -5], [7, -9], [8], [9], [10], [-2], [-3], [-4],
>      [-6]]), 
> Bipartition([[1], [2, -9], [3, -6], [4, -2],
>      [5, -5], [6, -3], [7], [8, -1], [9], [10], [-4], [-7],
>      [-8], [-10]]), 
> Bipartition([[1, -5], [2], [3], [4, -4],
>      [5, -1], [6], [7, -9], [8, -3], [9, -8], [10], [-2],
>      [-6], [-7], [-10]]),
> Bipartition([[1], [2], [3, -1], [4, -6], [5, -5], [6],
>      [7, -3], [8], [9, -8], [10], [-2], [-4], [-7], [-9],
>      [-10]]), 
> Bipartition([[1, -1], [2], [3], [4], [5, -6],
>      [6], [7, -3], [8, -5], [9, -7], [10, -2], [-4], [-8],
>      [-9], [-10]]));;
gap> IsInverseActingSemigroupRep(S);
false
gap> IsGeneratorsOfInverseSemigroup(S);
true
gap> S := Semigroup(S);;
gap> IsInverseSemigroup(S);
true
gap> IsInverseActingSemigroupRep(S);
false
gap> IsGeneratorsOfInverseSemigroup(S);
true
gap> S := InverseSemigroup(S);;
gap> IsInverseActingSemigroupRep(S) or not IsActingSemigroup(S);
true

# Test Generators 1
gap> S := JonesMonoid(5);
<regular bipartition *-monoid of degree 5 with 4 generators>
gap> I := SemigroupIdeal(S, S.4);
<regular bipartition *-semigroup ideal of degree 5 with 1 generator>
gap> Generators(I);
[ <bipartition: [ 1, -1 ], [ 2, -2 ], [ 3, -3 ], [ 4, 5 ], [ -4, -5 ]> ]

# Test Generators 2
gap> S := Group(IdentityTransformation);
<transformation group of degree 0 with 1 generator>
gap> Generators(S);
[ IdentityTransformation ]

# Test Generators 3
gap> S := DualSymmetricInverseMonoid(3);
<inverse block bijection monoid of degree 3 with 3 generators>
gap> Generators(S);
[ <block bijection: [ 1, -2 ], [ 2, -3 ], [ 3, -1 ]>, 
  <block bijection: [ 1, -2 ], [ 2, -1 ], [ 3, -3 ]>, 
  <block bijection: [ 1, 2, -3 ], [ 3, -1, -2 ]> ]

# Test Generators 4
gap> S := DualSymmetricInverseMonoid(3);;
gap> S := InverseSemigroup(S.2, S.3);;
gap> HasGeneratorsOfInverseMonoid(S);
false
gap> Generators(S);
[ <block bijection: [ 1, -2 ], [ 2, -1 ], [ 3, -3 ]>, 
  <block bijection: [ 1, 2, -3 ], [ 3, -1, -2 ]> ]
gap> HasGeneratorsOfMonoid(S);
false

# Test Generators 5
gap> S := Monoid(Transformation([2, 2]), Transformation([2, 1, 2]));;
gap> Generators(S);
[ Transformation( [ 2, 2 ] ), Transformation( [ 2, 1, 2 ] ) ]
gap> GeneratorsOfSemigroup(S);
[ IdentityTransformation, Transformation( [ 2, 2 ] ), 
  Transformation( [ 2, 1, 2 ] ) ]

# Test SemigroupByGenerators 1
gap> S := Semigroup(AsSet(FullTransformationMonoid(3)), rec(small := true));
<transformation monoid of degree 3 with 3 generators>

# Test SemigroupByGenerators 2
gap> S := Semigroup(AsSet(FullBooleanMatMonoid(2)), rec(small := true));
<monoid of 2x2 boolean matrices with 3 generators>

# Test SemigroupByGenerators 4
gap> SetInfoLevel(InfoSemigroups, 2);
gap> S := Semigroup(AsSet(FullBooleanMatMonoid(2)), rec(small := true));
<monoid of 2x2 boolean matrices with 3 generators>
gap> SetInfoLevel(InfoSemigroups, 0); 

# Test SemigroupByGenerators 5
gap> S := Semigroup(IdentityTransformation, Transformation([2, 1]),
> Transformation([2, 1]),
> rec(acting := false, small := true));
<commutative transformation monoid of degree 2 with 1 generator>

# Test SemigroupByGenerators 6
gap> S := Semigroup(BooleanMat([[1, 0], [0, 1]]), 
> AsSet(FullBooleanMatMonoid(2)), 
> rec(acting := false, small := true));
<monoid of 2x2 boolean matrices with 4 generators>

# Test SemigroupByGenerators 7
gap> S := Semigroup(PartialPerm([1, 2]), PartialPerm([1]));
<partial perm monoid of rank 2 with 2 generators>

# Test SemigroupByGenerators 8
gap> S := Semigroup(Transformation([2, 1]), Transformation([2, 1]),
> Transformation([1, 1, 2]),
> rec(small := true));
<transformation semigroup of degree 3 with 2 generators>

# Test SemigroupByGenerators 9
gap> SetInfoLevel(InfoSemigroups, 2);
gap> S := Semigroup(GeneratorsOfMonoid(FullBooleanMatMonoid(2)), 
> rec(small := true));
<semigroup of 2x2 boolean matrices with 3 generators>
gap> SetInfoLevel(InfoSemigroups, 0); 

# Test SemigroupByGenerators 10
gap> S := Semigroup(GeneratorsOfMonoid(FullTransformationMonoid(2)), 
> rec(regular := true));;
gap> IsRegularSemigroup(S);
true

# Test RegularSemigroup 1
gap> S := RegularSemigroup(BrauerMonoid(4));;
gap> Size(S);
105

# Test RegularSemigroup 2
gap> S := RegularSemigroup(BrauerMonoid(4), rec());;
gap> Size(S);
105

# Test MonoidByGenerators 1
gap> S := Monoid(AsSet(FullTransformationMonoid(3)), rec(small := true));
<transformation monoid of degree 3 with 3 generators>

# Test MonoidByGenerators 2
gap> S := Monoid(AsSet(FullBooleanMatMonoid(2)), rec(small := true));
<monoid of 2x2 boolean matrices with 3 generators>

# Test MonoidByGenerators 3
gap> S := Monoid(BrauerMonoid(4), rec(regular := true));;
gap> Size(S);
105

# Test MonoidByGenerators 4
gap> SetInfoLevel(InfoSemigroups, 2);
gap> S := Monoid(AsSet(FullBooleanMatMonoid(2)), rec(small := true));
<monoid of 2x2 boolean matrices with 4 generators>
gap> SetInfoLevel(InfoSemigroups, 0); 

# Test MonoidByGenerators 5
gap> S := Monoid(IdentityTransformation, Transformation([2, 1]));
<commutative transformation monoid of degree 2 with 1 generator>
gap> S := Monoid(IdentityTransformation, Transformation([2, 1]), 
> rec(acting := false));
<commutative transformation monoid of degree 2 with 1 generator>

# Test MonoidByGenerators 7
gap> S := Monoid(IdentityTransformation, Transformation([2, 1]),
> Transformation([2, 1]),
> rec(acting := false, small := true));
<commutative transformation monoid of degree 2 with 1 generator>

# Test MonoidByGenerators 8
gap> S := Monoid(PartialPerm([1, 2]), PartialPerm([1]));
<partial perm monoid of rank 2 with 2 generators>

# Test InverseSemigroupByGenerators 1
gap> InverseSemigroupByGenerators([Transformation([1, 1, 2])], rec());
Error, Semigroups: InverseSemigroupByGenerators: usage,
the first argument must satisfy `IsGeneratorsOfInverseSemigroup',

# Test InverseSemigroupByGenerators 2
gap> InverseSemigroup(PartialPerm([1, 2, 3]));
<trivial partial perm group of rank 3 with 1 generator>

# Test InverseSemigroupGenerators 3
gap> S := InverseSemigroup(PartialPerm([1]),
>                          PartialPerm([1], [2]), 
>                          PartialPerm([2, 1]),
>                          rec(small := true));
<inverse partial perm semigroup of rank 2 with 2 generators>

# Test InverseSemigroupGenerators 4
gap> SetInfoLevel(InfoSemigroups, 2);
gap> S := InverseSemigroup(PartialPerm([1]),
>                          PartialPerm([1], [2]), 
>                          PartialPerm([2, 1]),
>                          rec(small := true));
<inverse partial perm semigroup of rank 2 with 2 generators>
gap> SetInfoLevel(InfoSemigroups, 0); 

# Test InverseMonoidByGenerators 1
gap> InverseMonoidByGenerators([Transformation([1, 1, 2])], rec());
Error, Semigroups: InverseMonoidByGenerators: usage,
the first argument must satisfy `IsGeneratorsOfInverseSemigroup',

# Test InverseMonoidByGenerators 2
gap> InverseMonoid(PartialPerm([1, 2, 3]));
<trivial partial perm group of rank 3 with 1 generator>

# Test InverseMonoidGenerators 3
gap> S := InverseMonoid(PartialPerm([1]),
>                          PartialPerm([1], [2]), 
>                          PartialPerm([2, 1]),
>                          rec(small := true));
<inverse partial perm monoid of rank 2 with 2 generators>

# Test InverseMonoidGenerators 4
gap> SetInfoLevel(InfoSemigroups, 2);
gap> S := InverseMonoid(PartialPerm([1]),
>                          PartialPerm([1], [2]), 
>                          PartialPerm([2, 1]),
>                          rec(small := true));
<inverse partial perm monoid of rank 2 with 2 generators>
gap> SetInfoLevel(InfoSemigroups, 0); 

# Test ClosureInverseSemigroup 1
gap> S := InverseSemigroup(Bipartition([[1, -4], [2, 3, -1], [4, -2, -3]]),
> Bipartition([[1, -2, -4], [2, -3], [3, 4, -1]]),
> Bipartition([[1, 2, 3, 4, -1, -2, -3, -4]]),
> Bipartition([[1, 2, -4], [3, -3], [4, -1, -2]]));
<inverse block bijection semigroup of degree 4 with 4 generators>
gap> Size(S);
64
gap> T := ClosureInverseSemigroup(S, [S.1, S.3 * S.4 ^ -1]);
<inverse block bijection semigroup of size 64, degree 4 with 4 generators>
gap> Size(T);
64
gap> S = T;
true
gap> IsIdenticalObj(S, T);
true
gap> T := ClosureInverseSemigroup(S, 
> [Bipartition([[1, 2, 3, -1, -2, -4], [4, -3]])]);
<inverse block bijection semigroup of degree 4 with 5 generators>
gap> Size(T);
108
gap> S = T;
false

# Test ClosureInverseSemigroup 2
gap> S := SymmetricInverseMonoid(5);
<symmetric inverse monoid of degree 5>
gap> Size(S);
1546
gap> T := ClosureInverseSemigroup(S, PartialPerm([6]));
<inverse partial perm semigroup of rank 6 with 5 generators>
gap> Size(T);
1557
gap> T := ClosureInverseSemigroup(S, PartialPerm([6]), rec());
<inverse partial perm semigroup of rank 6 with 5 generators>
gap> Size(T);
1557

# Test ClosureInverseSemigroup 3
gap> S := InverseSemigroup(Bipartition([[1, -4], [2, 3, -1], [4, -2, -3]]),
> Bipartition([[1, -2, -4], [2, -3], [3, 4, -1]]),
> Bipartition([[1, 2, 3, 4, -1, -2, -3, -4]]),
> Bipartition([[1, 2, -4], [3, -3], [4, -1, -2]]));
<inverse block bijection semigroup of degree 4 with 4 generators>
gap> Size(S);
64
gap> T := ClosureInverseSemigroup(S, [], rec());
<inverse block bijection semigroup of size 64, degree 4 with 4 generators>
gap> Size(T);
64
gap> S = T;
true
gap> IsIdenticalObj(S, T);
true

# Test ClosureInverseSemigroup 4
gap> S := InverseSemigroup(Bipartition([[1, -4], [2, 3, -1], [4, -2, -3]]),
> Bipartition([[1, -2, -4], [2, -3], [3, 4, -1]]),
> Bipartition([[1, 2, 3, 4, -1, -2, -3, -4]]),
> Bipartition([[1, 2, -4], [3, -3], [4, -1, -2]]));
<inverse block bijection semigroup of degree 4 with 4 generators>
gap> Size(S);
64
gap> T := ClosureInverseSemigroup(S, 
> [Bipartition([[1, 2, -2], [3, -1], [-3]])], rec());
Error, Semigroups: ClosureInverseSemigroup: usage,
the second argument must satisfy `IsGeneratorsOfInverseSemigroup',
gap> T := ClosureInverseSemigroup(S, 
> [PartialPerm([])], rec());
Error, Semigroups: ClosureInverseSemigroup: usage,
the first argument (a semigroup) and the second argument (a multiplicative
element collection) cannot be used to generate an inverse semigroup,
gap> T := ClosureInverseSemigroup(S, 
> [Bipartition([[1, 2, -4], [3, 4, -2], [-1, -3]])], rec());
Error, Semigroups: ClosureInverseSemigroup: usage,
the second argument must satisfy `IsGeneratorsOfInverseSemigroup',

# Test ClosureInverseSemigroup 5
gap> S := InverseSemigroup(Bipartition([[1, -4], [2, 3, -1], [4, -2, -3]]),
> Bipartition([[1, -2, -4], [2, -3], [3, 4, -1]]),
> Bipartition([[1, 2, 3, 4, -1, -2, -3, -4]]),
> Bipartition([[1, 2, -4], [3, -3], [4, -1, -2]]));
<inverse block bijection semigroup of degree 4 with 4 generators>
gap> Size(S);
64
gap> T := ClosureInverseSemigroup(S, DualSymmetricInverseMonoid(4), rec());;
gap> IsMonoidAsSemigroup(T);
true
gap> Size(T) = Size(InverseSemigroup(T));
true
gap> Size(T);
339

# Test ClosureInverseSemigroup 6
gap> S := InverseSemigroup(Bipartition([[1, -1, -3], [2, 3, -2]]),
>                          Bipartition([[1, -3], [2, -2], [3, -1]]));;
gap> T := ClosureInverseSemigroup(S, DClass(PartitionMonoid(3),
> IdentityBipartition(3)));;
gap> Size(T);
25

# Test ClosureInverseSemigroupOrMonoidNC 1
gap> S := SymmetricInverseMonoid(5);
<symmetric inverse monoid of degree 5>
gap> I := SemigroupIdeal(S, S.3);
<inverse partial perm semigroup ideal of rank 5 with 1 generator>
gap> T := ClosureInverseSemigroup(I, [S.1], rec());;
gap> Size(T);
1431
gap> Size(S);
1546
gap> S.1;
(1,2,3,4,5)

# Test ClosureSemigroup 1
gap> S := Semigroup(
> [Matrix(IsBooleanMat, [[0, 1, 0, 0, 1, 1, 1, 1], [1, 1, 1, 1, 0, 1, 0, 1],
>       [1, 1, 0, 1, 0, 1, 1, 1], [0, 1, 1, 1, 1, 1, 0, 0],
>       [1, 0, 0, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 1, 0, 1],
>       [0, 0, 0, 0, 1, 1, 0, 1], [1, 1, 1, 0, 1, 0, 1, 1]]),
>   Matrix(IsBooleanMat, [[0, 1, 0, 1, 1, 1, 1, 1], [0, 1, 1, 1, 0, 0, 1, 0],
>       [1, 0, 0, 0, 1, 1, 0, 1], [0, 0, 0, 1, 1, 1, 1, 1],
>       [0, 0, 0, 1, 0, 1, 0, 1], [0, 0, 1, 0, 1, 1, 0, 0],
>       [0, 1, 0, 1, 1, 0, 0, 0], [1, 1, 0, 0, 1, 0, 0, 0]]),
>   Matrix(IsBooleanMat, [[0, 0, 1, 0, 0, 1, 1, 0], [0, 1, 0, 1, 0, 0, 1, 1],
>       [1, 1, 1, 1, 1, 0, 0, 0], [1, 0, 0, 0, 1, 0, 1, 0],
>       [1, 0, 0, 1, 0, 1, 0, 0], [1, 0, 0, 0, 0, 1, 0, 1],
>       [1, 1, 1, 0, 1, 1, 0, 1], [1, 0, 1, 1, 1, 1, 0, 1]]),
>   Matrix(IsBooleanMat, [[1, 0, 1, 0, 0, 1, 0, 1], [0, 0, 0, 0, 1, 1, 0, 1],
>       [0, 0, 0, 1, 1, 1, 0, 1], [0, 0, 0, 1, 1, 0, 0, 1],
>       [1, 0, 0, 1, 0, 1, 0, 1], [0, 1, 0, 1, 0, 0, 0, 1],
>       [1, 0, 0, 0, 1, 0, 0, 0], [1, 1, 0, 1, 1, 0, 0, 1]]),
>   Matrix(IsBooleanMat, [[1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 0, 0, 0, 1, 0, 0],
>       [1, 1, 0, 0, 0, 1, 0, 0], [1, 0, 0, 1, 1, 1, 1, 0],
>       [1, 1, 1, 1, 1, 1, 1, 1], [0, 1, 0, 1, 1, 1, 0, 0],
>       [0, 1, 0, 0, 1, 0, 0, 1], [0, 1, 1, 1, 0, 0, 0, 1]]),
>   Matrix(IsBooleanMat, [[1, 1, 1, 0, 0, 0, 1, 0], [0, 0, 1, 0, 0, 1, 0, 0],
>       [0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 1, 1, 0, 0, 0, 1],
>       [0, 1, 1, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 0, 0, 1],
>       [0, 0, 1, 1, 0, 0, 1, 0], [0, 1, 0, 0, 1, 0, 1, 1]]),
>   Matrix(IsBooleanMat, [[0, 1, 0, 0, 0, 1, 1, 1], [0, 1, 0, 0, 0, 1, 0, 0],
>       [0, 0, 0, 0, 0, 0, 1, 1], [0, 0, 1, 0, 1, 1, 0, 1],
>       [0, 0, 0, 0, 1, 1, 1, 1], [1, 0, 0, 1, 1, 0, 0, 1],
>       [1, 0, 0, 1, 0, 1, 0, 0], [0, 0, 0, 0, 0, 1, 1, 0]]),
>   Matrix(IsBooleanMat, [[1, 0, 0, 1, 0, 1, 1, 1], [0, 1, 0, 0, 0, 1, 0, 1],
>       [1, 0, 0, 0, 1, 0, 1, 1], [1, 0, 1, 0, 0, 1, 0, 0],
>       [0, 0, 0, 1, 0, 1, 0, 0], [0, 1, 1, 0, 0, 0, 1, 0],
>       [1, 1, 1, 1, 1, 0, 1, 0], [1, 1, 0, 0, 1, 1, 0, 0]]),
>   Matrix(IsBooleanMat, [[1, 0, 0, 0, 1, 1, 0, 0], [1, 0, 0, 0, 1, 1, 0, 0],
>       [1, 0, 1, 0, 0, 0, 0, 1], [1, 1, 1, 1, 1, 1, 1, 1],
>       [1, 0, 1, 0, 1, 1, 1, 1], [1, 0, 0, 1, 0, 1, 0, 1],
>       [0, 0, 1, 1, 1, 0, 0, 1], [0, 0, 1, 1, 0, 1, 0, 1]]),
>   Matrix(IsBooleanMat, [[1, 1, 0, 1, 1, 0, 1, 1], [0, 0, 0, 0, 0, 1, 1, 1],
>       [1, 1, 0, 1, 0, 1, 0, 1], [0, 0, 1, 0, 0, 1, 1, 0],
>       [0, 1, 0, 1, 1, 0, 0, 1], [0, 1, 0, 1, 1, 1, 0, 0],
>       [1, 0, 1, 1, 1, 1, 1, 1], [0, 1, 0, 1, 1, 0, 0, 0]])]);
<semigroup of 8x8 boolean matrices with 10 generators>
gap> Size(S);
266
gap> x := Matrix(IsBooleanMat, [[0, 0, 0, 1, 0, 1, 0, 0], [1, 0, 0, 0, 1, 1, 0, 0],
>  [0, 0, 1, 0, 0, 0, 1, 1], [0, 1, 1, 1, 1, 1, 1, 0],
>  [1, 0, 0, 1, 1, 0, 0, 1], [0, 0, 0, 1, 1, 0, 1, 0],
>  [1, 0, 0, 1, 0, 1, 1, 0], [1, 1, 1, 1, 0, 0, 0, 1]]);;
gap> T := ClosureSemigroup(S, [x, S.2]);
<semigroup of 8x8 boolean matrices with 11 generators>
gap> Size(T);
315
gap> Size(T) = Size(Semigroup(T));
true
gap> T := ClosureSemigroup(S, S.2);
<semigroup of size 266, 8x8 boolean matrices with 10 generators>
gap> Size(T);
266
gap> Size(T) = Size(Semigroup(T));
true
gap> IsIdenticalObj(S, T);
true
gap> T := ClosureSemigroup(S, x);
<semigroup of 8x8 boolean matrices with 11 generators>
gap> Size(T);
315
gap> Size(T) = Size(Semigroup(T));
true
gap> T := ClosureSemigroup(S, x, rec());
<semigroup of 8x8 boolean matrices with 11 generators>
gap> Size(T);
315
gap> Size(T) = Size(Semigroup(T));
true

# Test ClosureSemigroup 2
gap> S := FullTransformationMonoid(2);
<full transformation monoid of degree 2>
gap> T := ClosureSemigroup(S, FullTransformationMonoid(4));;
gap> Size(T);
256
gap> T = FullTransformationMonoid(4);
true

# Test ClosureSemigroup 3
gap> S := Semigroup(Bipartition([[1, 3, -3], [2], [-1, -2]]),
>                   Bipartition([[1, -3], [2, 3, -1], [-2]]));;
gap> T := ClosureSemigroup(S, IdentityBipartition(4));
Error, Semigroups: ClosureSemigroup: usage,
the first argument (a semigroup) and the second argument (a multiplicative
element collection) cannot be used to generate a semigroup,

# Test ClosureSemigroup 4
gap> S := Semigroup(Bipartition([[1, 3, -3], [2], [-1, -2]]),
>                   Bipartition([[1, -3], [2, 3, -1], [-2]]));;
gap> T := ClosureSemigroup(S, DClass(PartitionMonoid(3),
> IdentityBipartition(3)));;
gap> Size(T);
103

# Test SubsemigroupByProperty 1
gap> func := function(x)
>      local n;
>      n := DegreeOfTransformation(x);
>      return 1 ^ x <> 1 and ForAll([1 .. n], y -> y = 1 or y ^ x = y); 
>    end;;
gap> T := SubsemigroupByProperty(FullTransformationSemigroup(3), func);
<transformation semigroup of size 2, degree 3 with 2 generators>
gap> T := SubsemigroupByProperty(FullTransformationSemigroup(4), func);
<transformation semigroup of size 3, degree 4 with 3 generators>
gap> T := SubsemigroupByProperty(FullTransformationSemigroup(5), func);
<transformation semigroup of size 4, degree 5 with 4 generators>

# Test SubsemigroupByProperty 2
gap> func := function(x)
>      return 1 ^ x > 3; 
>    end;;
gap> T := SubsemigroupByProperty(FullTransformationSemigroup(3), func);
fail

# Test InverseSubsemigroupByProperty 1
gap> IsIsometryPP := function(f)
> local n, i, j, k, l;
>  n := RankOfPartialPerm(f);
>  for i in [1 .. n - 1] do
>    k := DomainOfPartialPerm(f)[i];
>    for j in [i + 1 .. n] do
>      l := DomainOfPartialPerm(f)[j];
>      if not AbsInt(k ^ f - l ^ f) = AbsInt(k - l) then
>        return false;
>      fi;
>    od;
>  od;
>  return true;
> end;;
gap> S := InverseSubsemigroupByProperty(SymmetricInverseSemigroup(5),
> IsIsometryPP);;
gap> Size(S);
142

# Test InverseSubsemigroupByProperty 2
gap> func := function(x)
>      return 1 ^ x > 3; 
>    end;;
gap> T := InverseSubsemigroupByProperty(SymmetricInverseMonoid(3), func);
fail

# Test StabilizerInverseSemigroup 1
gap> BruteForceStabilizerInverseSemigroup := function(S, pnt)
>     return SortedList(Filtered(AsList(S), x -> pnt ^ x = pnt));
> end;;
gap> S := InverseSemigroup(
>     PartialPermNC([1, 2, 3, 4], [1, 8, 3, 6]),
>     PartialPermNC([1, 2, 3, 4, 5], [6, 7, 2, 8, 5]),
>     PartialPermNC([1, 2, 3, 4, 5, 6], [4, 6, 8, 5, 1, 3]),
>     PartialPermNC([1, 2, 4, 5, 6, 8], [3, 5, 6, 1, 7, 4]),
>     rec(acting := true)
> );;
gap> Size(S);
16448
gap> stab := StabilizerInverseSemigroup(S, 3);;
gap> Size(stab);
724
gap> bf := BruteForceStabilizerInverseSemigroup(S, 3);;
gap> AsSortedList(stab) = bf;
true

# Test StabilizerInverseSemigroup 2
gap> StabilizerInverseSemigroup(S, 9);
Error, S must be defined on pnt!

# Test Random (for a semigroup with AsList)
gap> S := FullTransformationMonoid(4);;
gap> AsList(S);;
gap> Random(S);;

# Test SEMIGROUPS.DefaultRandomInverseSemigroup 1
gap> S := SEMIGROUPS.DefaultRandomInverseSemigroup(IsTransformationSemigroup, 
> [2, 4]);;
gap> IsInverseSemigroup(S) and IsTransformationSemigroup(S);
true
gap> S := SEMIGROUPS.DefaultRandomInverseSemigroup(IsTropicalMaxPlusMatrixSemigroup, 
> [2, 4, 10]);;
gap> IsInverseSemigroup(S) and IsTropicalMaxPlusMatrixSemigroup(S);
true
gap> S := SEMIGROUPS.DefaultRandomInverseSemigroup(IsNTPMatrixSemigroup, 
> [2, 4, 5, 6]);;
gap> IsInverseSemigroup(S) and IsNTPMatrixSemigroup(S);
true
gap> S := SEMIGROUPS.DefaultRandomInverseSemigroup(IsNTPMatrixMonoid, 
> [2, 4, 5, 6, 10]);;
Error, Semigroups: SEMIGROUPS.DefaultRandomInverseSemigroup: usage,
the second arg must have length 2 to 4,

# Test SEMIGROUPS.DefaultRandomInverseMonoid 1
gap> S := SEMIGROUPS.DefaultRandomInverseMonoid(IsTransformationMonoid, 
> [2, 4]);;
gap> IsInverseMonoid(S) and IsTransformationMonoid(S);
true
gap> S := SEMIGROUPS.DefaultRandomInverseMonoid(IsTropicalMaxPlusMatrixMonoid, 
> [2, 4, 10]);;
gap> IsInverseMonoid(S) and IsTropicalMaxPlusMatrixMonoid(S);
true
gap> S := SEMIGROUPS.DefaultRandomInverseMonoid(IsNTPMatrixMonoid, 
> [2, 4, 5, 6]);;
gap> IsInverseMonoid(S) and IsNTPMatrixMonoid(S);
true
gap> S := SEMIGROUPS.DefaultRandomInverseMonoid(IsNTPMatrixMonoid, 
> [2, 4, 5, 6, 10]);;
Error, Semigroups: SEMIGROUPS.DefaultRandomInverseMonoid: usage,
the second arg must have length 2 to 4,

# Test RandomSemigroup 1
gap> RandomSemigroup(2, 4);;
gap> RandomSemigroup(IsTransformationSemigroup, 2, 4);;
gap> RandomSemigroup(fail, 2, 4);;
Error, Semigroups: RandomSemigroup: usage,
the first argument must be a filter,
gap> RandomSemigroup(IsTransformationSemigroup);;
gap> RandomSemigroup(IsTropicalMinPlusMatrixSemigroup, 2, 4, 1);;
gap> RandomSemigroup(IsTropicalMinPlusMatrixSemigroup, 2, 4);;
gap> RandomSemigroup(IsNTPMatrixSemigroup, 2, 4);;
gap> RandomSemigroup(IsNTPMatrixSemigroup, 2, 4, 5, 6);;
gap> RandomSemigroup(IsNTPMatrixSemigroup, 2, 4, 5, "a");;
Error, Semigroups: RandomSemigroup: usage,
the fifth argument (semiring period) must be a pos int,
gap> RandomSemigroup(IsTransformationSemigroup, "a");;
Error, Semigroups: RandomSemigroup: usage,
the second argument (number of generators) must be a pos int,
gap> RandomSemigroup(IsReesMatrixSemigroup);;
gap> RandomSemigroup(IsReesMatrixSemigroup, 2);;
gap> RandomSemigroup(IsReesMatrixSemigroup, 2, 3);;
gap> RandomSemigroup(IsReesMatrixSemigroup, 2, 3, SymmetricGroup(3));;
gap> RandomSemigroup(IsReesMatrixSemigroup, 2, 3, SymmetricGroup(3), fail);;
Error, Semigroups: RandomSemigroup: usage,
there must be at most four arguments,
gap> RandomSemigroup(IsReesMatrixSemigroup, 2, 3, DihedralGroup(2));;
Error, Semigroups: RandomSemigroup: usage,
the fourth argument must be a perm group,
gap> RandomSemigroup(IsReesMatrixSemigroup, fail, 3, DihedralGroup(2));;
Error, Semigroups: RandomSemigroup: usage,
the second argument (number of rows) must be a pos int,

# Test RandomMonoid 1
gap> RandomMonoid(2, 4);;
gap> RandomMonoid(IsTransformationMonoid, 2, 4);;
gap> RandomMonoid(fail, 2, 4);;
Error, Semigroups: RandomMonoid: usage,
the first argument must be a filter,
gap> RandomMonoid(IsTransformationMonoid);;
gap> RandomMonoid(IsTropicalMinPlusMatrixMonoid, 2, 4, 1);;
gap> RandomMonoid(IsTropicalMinPlusMatrixMonoid, 2, 4);;
gap> RandomMonoid(IsNTPMatrixMonoid, 2, 4);;
gap> RandomMonoid(IsNTPMatrixMonoid, 2, 4, 5, 6);;
gap> RandomMonoid(IsNTPMatrixMonoid, 2, 4, 5, "a");;
Error, Semigroups: RandomMonoid: usage,
the fifth argument (semiring period) must be a pos int,
gap> RandomMonoid(IsTransformationMonoid, "a");;
Error, Semigroups: RandomMonoid: usage,
the second argument (number of generators) must be a pos int,

# Test RandomInverseSemigroup 1
gap> RandomInverseSemigroup(2, 4);;
gap> RandomInverseSemigroup(IsTransformationSemigroup, 2, 4);;
gap> RandomInverseSemigroup(fail, 2, 4);;
Error, Semigroups: RandomInverseSemigroup: usage,
the first argument must be a filter,
gap> RandomInverseSemigroup(IsTransformationSemigroup);;
gap> RandomInverseSemigroup(IsTropicalMinPlusMatrixSemigroup, 2, 4, 1);;
gap> RandomInverseSemigroup(IsTropicalMinPlusMatrixSemigroup, 2, 4);;
gap> RandomInverseSemigroup(IsNTPMatrixSemigroup, 2, 4);;
gap> RandomInverseSemigroup(IsNTPMatrixSemigroup, 2, 4, 5, 6);;
gap> RandomInverseSemigroup(IsNTPMatrixSemigroup, 2, 4, 5, "a");;
Error, Semigroups: RandomInverseSemigroup: usage,
the fifth argument (semiring period) must be a pos int,
gap> RandomInverseSemigroup(IsTransformationSemigroup, "a");;
Error, Semigroups: RandomInverseSemigroup: usage,
the second argument (number of generators) must be a pos int,

# Test RandomInverseMonoid 1
gap> RandomInverseMonoid(2, 4);;
gap> RandomInverseMonoid(IsTransformationMonoid, 2, 4);;
gap> RandomInverseMonoid(fail, 2, 4);;
Error, Semigroups: RandomInverseMonoid: usage,
the first argument must be a filter,
gap> RandomInverseMonoid(IsTransformationMonoid);;
gap> RandomInverseMonoid(IsTropicalMinPlusMatrixMonoid, 2, 4, 1);;
gap> RandomInverseMonoid(IsTropicalMinPlusMatrixMonoid, 2, 4);;
gap> RandomInverseMonoid(IsNTPMatrixMonoid, 2, 4);;
gap> RandomInverseMonoid(IsNTPMatrixMonoid, 2, 4, 5, 6);;
gap> RandomInverseMonoid(IsNTPMatrixMonoid, 2, 4, 5, "a");;
Error, Semigroups: RandomInverseMonoid: usage,
the fifth argument (semiring period) must be a pos int,
gap> RandomInverseMonoid(IsTransformationMonoid, "a");;
Error, Semigroups: RandomInverseMonoid: usage,
the second argument (number of generators) must be a pos int,

# Test AsSemigroup 1
gap> S := Monoid(Transformation([3, 4, 2, 4]), Transformation([2, 4, 1, 4]),
>                Transformation([4, 3, 1, 4]), Transformation([3, 1, 4, 4]));
<transformation monoid of degree 4 with 4 generators>
gap> T := AsSemigroup(IsTransformationSemigroup, S);
<transformation monoid of degree 4 with 4 generators>
gap> IsIdenticalObj(S, T);
true

# Test AsSemigroup 2
gap> S := Semigroup(
> [Transformation([7, 12, 8, 7, 18, 23, 11, 2, 12, 11, 1, 8, 7, 8, 1, 2, 17,
>       22, 35, 32, 22, 5, 27, 45, 42, 27, 6, 2, 1, 11, 12, 19, 35, 5, 32, 22,
>       32, 18, 19, 19, 18, 24, 45, 6, 42, 27, 42, 23, 24, 24, 23, 5, 35, 6, 45,
>      1]), Transformation([8, 11, 7, 8, 19, 24, 12, 1, 11, 12, 2, 7, 8, 7,
>       2, 1, 17, 32, 5, 22, 32, 35, 42, 6, 27, 42, 45, 1, 2, 12, 11, 18, 5, 35,
>      22, 32, 22, 19, 18, 18, 19, 23, 6, 45, 27, 42, 27, 24, 23, 23, 24, 35, 5,
>      45, 6, 2]), Transformation([9, 13, 15, 9, 20, 25, 28, 30, 13, 28, 3,
>       15, 9, 15, 3, 30, 17, 33, 36, 38, 33, 40, 43, 46, 48, 43, 50, 30, 3, 28,
>      13, 52, 36, 40, 38, 33, 38, 20, 52, 52, 20, 54, 46, 50, 48, 43, 48, 25,
>       54, 54, 25, 40, 36, 50, 46, 3]),
>   Transformation([10, 14, 16, 10, 21, 26, 29, 31, 14, 29, 4, 16, 10, 16, 4,
>       31, 17, 34, 37, 39, 34, 41, 44, 47, 49, 44, 51, 31, 4, 29, 14, 53, 37,
>       41, 39, 34, 39, 21, 53, 53, 21, 55, 47, 51, 49, 44, 49, 26, 55, 55, 26,
>       41, 37, 51, 47, 4]), Transformation([1, 2, 17, 2, 5, 6, 7, 8, 17, 8,
>      11, 12, 17, 11, 17, 7, 17, 18, 19, 17, 19, 22, 23, 24, 17, 24, 27, 17,
>       12, 17, 1, 32, 17, 32, 35, 17, 5, 17, 22, 17, 35, 42, 17, 42, 45, 17, 6,
>      17, 27, 17, 45, 17, 18, 17, 23, 5]),
>   Transformation([11, 8, 17, 17, 22, 27, 1, 12, 17, 17, 7, 2, 17, 17, 17,
>       17, 17, 5, 32, 17, 17, 18, 6, 42, 17, 17, 23, 17, 17, 17, 17, 35, 17,
>       17, 19, 17, 17, 17, 17, 17, 17, 45, 17, 17, 24, 17, 17, 17, 17, 17, 17,
>       17, 17, 17, 17, 6])]);
<transformation semigroup of degree 56 with 6 generators>
gap> AsSemigroup(IsReesZeroMatrixSemigroup, S);;

# Test AsMonoid 1
gap> S := Monoid(Transformation([3, 4, 2, 4]), Transformation([2, 4, 1, 4]),
>                Transformation([4, 3, 1, 4]), Transformation([3, 1, 4, 4]));
<transformation monoid of degree 4 with 4 generators>
gap> T := AsMonoid(IsTransformationMonoid, S);
<transformation monoid of degree 4 with 4 generators>
gap> IsIdenticalObj(S, T);
true
gap> T := AsMonoid(IsPartialPermMonoid, S);;
gap> T := AsMonoid(IsFpMonoid, S);
<fp monoid on the generators [ m1, m2, m3, m4 ]>
gap> T := AsMonoid(IsBooleanMatMonoid, S);;

# Test ClosureSemigroup
gap> S := FullTransformationMonoid(5);;
gap> T := Semigroup(One(S));
<trivial transformation group of degree 0 with 1 generator>
gap> U := ClosureSemigroup(T, AsSet(S));;
gap> Length(GeneratorsOfSemigroup(U)) <= 20;
true
gap> T;
<trivial transformation group of degree 0 with 1 generator>
gap> gens :=
> [Matrix(GF(5 ^ 2), [[Z(5 ^ 2), Z(5 ^ 2) ^ 13],
>                     [0 * Z(5), Z(5 ^ 2) ^ 14]]),
>  Matrix(GF(5 ^ 2), [[Z(5 ^ 2) ^ 21, Z(5) ^ 0],
>                     [Z(5) ^ 0, 0 * Z(5)]]),
>  Matrix(GF(5 ^ 2), [[Z(5 ^ 2) ^ 23, Z(5 ^ 2) ^ 5],
>                     [Z(5 ^ 2) ^ 20, Z(5 ^ 2) ^ 20]])];;
gap> S := Semigroup(gens[1], rec(acting := true));
<commutative semigroup of 2x2 matrices over GF(5^2) with 1 generator>
gap> Size(S);
24
gap> S := ClosureSemigroup(S, gens[2]);
<semigroup of 2x2 matrices over GF(5^2) with 2 generators>
gap> Size(S);
124800
gap> S := ClosureSemigroup(S, gens[3]);
<semigroup of 2x2 matrices over GF(5^2) with 3 generators>
gap> Size(S);
374400

# Test IsGeneratorsOfInverseSemigroup
gap> S := Semigroup(SymmetricInverseMonoid(3), rec(acting := true));;
gap> IsGeneratorsOfInverseSemigroup(S);
true
gap> S := Semigroup(Transformation([1, 1]));;
gap> IsGeneratorsOfInverseSemigroup(S);
false

# Test ClosureMonoid
gap> S := Semigroup(PartialPerm([1]));;
gap> T := ClosureMonoid(S, [PartialPerm([2 .. 5])]);
<partial perm monoid of rank 5 with 2 generators>
gap> One(T);
<identity partial perm on [ 1, 2, 3, 4, 5 ]>
gap> T := ClosureSemigroup(S, [PartialPerm([2 .. 5])]);
<partial perm semigroup of rank 4 with 2 generators>
gap> One(T);
fail
gap> T := ClosureMonoid(SymmetricInverseMonoid(3), PartialPerm([1 .. 4]));
<partial perm monoid of rank 4 with 6 generators>
gap> T := ClosureMonoid(SymmetricInverseMonoid(3), PartialPerm([1 .. 4]),
> rec());
<partial perm monoid of rank 4 with 6 generators>
gap> Size(T);
35
gap> One(T);
<identity partial perm on [ 1, 2, 3, 4 ]>
gap> M := ClosureMonoid(SymmetricInverseMonoid(2), SymmetricInverseMonoid(3));;
gap> Size(M);
34
gap> M = SymmetricInverseMonoid(3);
true
gap> M := ClosureMonoid(POPI(3), DClass(M, PartialPerm([1 .. 3])));
<partial perm monoid of rank 3 with 4 generators>
gap> Size(M);
34
gap> M = SymmetricInverseMonoid(3);
true
gap> M := ClosureMonoid(OrderEndomorphisms(3),
>                       DClass(M, PartialPerm([1 .. 3])));
Error, Semigroups: ClosureMonoid: usage,
the first argument (a monoid) and the second argument (a multiplicative
element with one collection) cannot be used to generate a monoid,

# Test IsTrivial immediate method for monoids
gap> S := Monoid(PartialPerm([1]));
<trivial partial perm group of rank 1 with 1 generator>
gap> S := Monoid(IdentityTransformation);
<trivial transformation group of degree 0 with 1 generator>

# InverseSemigroupByGenerators, enumerable semigroup rep
gap> S := InverseSemigroup(PartialPerm([2, 1, 3]), rec(acting := false));;
gap> S := InverseMonoid(PartialPerm([2, 1, 3]), rec(acting := false));;

# Test ClosureSemigroup for an empty list
gap> S := Semigroup(Transformation([1, 1]));;
gap> ClosureSemigroup(S, [], rec()) = S;
true
gap> IsIdenticalObj(ClosureSemigroup(S, [], rec()), S);
true
gap> S := Semigroup(Transformation([1, 1]));;
gap> ClosureSemigroupOrMonoidNC(Semigroup, S, [], rec()) = S;
true
gap> IsIdenticalObj(ClosureSemigroupOrMonoidNC(Semigroup, S, [], rec()), S);
true

# Test ClosureInverseMonoid
gap> ClosureInverseMonoid(SymmetricInverseMonoid(3), PartialPerm([4 .. 6]));
<inverse partial perm monoid of rank 6 with 5 generators>
gap> ClosureInverseMonoid(SymmetricInverseMonoid(3), PartialPerm([4 .. 6]),
> rec());
<inverse partial perm monoid of rank 6 with 5 generators>
gap> ClosureInverseMonoid(DualSymmetricInverseMonoid(3),
> Bipartition([[1, 2, -2], [3, -1], [-3]]));
Error, Semigroups: ClosureInverseMonoid: usage,
the second argument must satisfy `IsGeneratorsOfInverseSemigroup',
gap> ClosureInverseMonoid(DualSymmetricInverseMonoid(3),
> DualSymmetricInverseMonoid(4));
Error, Semigroups: ClosureInverseMonoid: usage,
the first argument (a semigroup) and the second argument (a multiplicative
element collection) cannot be used to generate an inverse monoid,
gap> ClosureInverseMonoid(DualSymmetricInverseMonoid(3),
> DClass(DualSymmetricInverseMonoid(3), IdentityBipartition(3)));
<inverse block bijection monoid of degree 3 with 3 generators>
gap> S := InverseMonoid(DualSymmetricInverseMonoid(3), rec(acting := false));
<inverse block bijection monoid of degree 3 with 3 generators>
gap> ClosureInverseMonoid(S, DClass(S, IdentityBipartition(3)));
<inverse block bijection monoid of degree 3 with 3 generators>

# Test ClosureInverseMonoid for an empty list
gap> S := InverseMonoid(PartialPerm([1]));;
gap> ClosureInverseMonoid(S, [], rec()) = S;
true
gap> IsIdenticalObj(ClosureInverseMonoid(S, [], rec()), S);
true
gap> S := InverseMonoid(PartialPerm([1]));;
gap> ClosureInverseSemigroupOrMonoidNC(InverseMonoid, S, [], rec()) = S;
true
gap> IsIdenticalObj(S,
> ClosureInverseSemigroupOrMonoidNC(InverseMonoid, S, [], rec()));
true

# Test RandomSemigroup
gap> RandomSemigroup(IsTropicalMaxPlusMatrixSemigroup, 3, 3, "a");
Error, Semigroups: RandomSemigroup: usage,
the fourth argument (semiring threshold) must be a pos int,
gap> RandomSemigroup(IsSemigroup, 3, 3, "a");
Error, Semigroups: RandomSemigroup: usage,
there must be at most three arguments,
gap> RandomSemigroup(IsSemigroup, 3, "a");
Error, Semigroups: RandomSemigroup: usage,
the third argument (degree or dimension) must be a pos int,
gap> RandomMonoid(IsMonoid);;

# Test AsSemigroup for a filter, ring, and semigroup
gap> S := FullTransformationMonoid(3);;
gap> AsSemigroup(IsMatrixOverFiniteFieldSemigroup, GF(3), S);
<monoid of 3x3 matrices over GF(3) with 3 generators>
gap> AsMonoid(IsMatrixOverFiniteFieldMonoid, GF(3), S);
<monoid of 3x3 matrices over GF(3) with 3 generators>

#E#
gap> SEMIGROUPS.StopTest();
gap> STOP_TEST("Semigroups package: standard/semigrp.tst");
