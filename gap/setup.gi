############################################################################
##
#W  setup.gi
#Y  Copyright (C) 2013                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

###############################################################################
# Setup - install the basic things required for specific acting semigroups    #
###############################################################################

InstallTrueMethod(IsInverseSemigroup, IsActingSemigroupWithInverseOp);

InstallImmediateMethod(IsActingSemigroupGreensClass, IsGreensClass, 0, 
x-> IsActingSemigroup(Parent(x)));

# the number of points in the action

InstallMethod(ActionDegree, 
"for associative element with action collection",
[IsAssociativeElementWithActionCollection], 
s-> ActionDegree(Representative(s)));

InstallMethod(ActionDegree, "for a partial perm collection",
[IsPartialPermCollection], DegreeOfPartialPermCollection);

#

InstallMethod(ActionDegree, "for a transformation",
[IsTransformation], DegreeOfTransformation);

InstallMethod(ActionDegree, "for a partial perm",
[IsPartialPerm], RankOfPartialPerm);

InstallMethod(ActionDegree, "for a bipartition",
[IsBipartition], DegreeOfBipartition);

# the number of points in the range of the action

InstallMethod(ActionRank, "for a transformation",
[IsTransformation], RankOfTransformation);

InstallMethod(ActionRank, "for a partial perm",
[IsPartialPerm], RankOfPartialPerm);

InstallMethod(ActionRank, "for a bipartition",
[IsBipartition], RankOfBipartition);

# the minimum possible rank of an element

InstallMethod(MinActionRank, "for a transformation semigroup",
[IsTransformationSemigroup], x-> 1);

InstallMethod(MinActionRank, "for a partial perm semigroup",
[IsPartialPermSemigroup], x-> 0);

InstallMethod(MinActionRank, "for a bipartition semigroup",
[IsBipartitionSemigroup], x-> 0);

# options passed to LambdaOrb(s) when it is created

InstallMethod(LambdaOrbOpts, "for a transformation semigroup",
[IsTransformationSemigroup], s-> rec(forflatplainlists:=true));

InstallMethod(LambdaOrbOpts, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> rec(forflatplainlists:=true));

InstallMethod(LambdaOrbOpts, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> rec());

InstallMethod(RhoOrbOpts, "for a transformation semigroup",
[IsTransformationSemigroup], s-> rec(forflatplainlists:=true));

InstallMethod(RhoOrbOpts, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> rec(forflatplainlists:=true));

InstallMethod(RhoOrbOpts, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> rec());

# the lambda and rho acts

InstallMethod(LambdaAct, "for a transformation semigroup",
[IsTransformationSemigroup], x-> OnPosIntSetsTrans);

InstallMethod(LambdaAct, "for a partial perm semigroup",
[IsPartialPermSemigroup], x-> OnPosIntSetsPartialPerm);

InstallMethod(LambdaAct, "for a bipartition semigroup",
[IsBipartitionSemigroup], x-> OnRightBlocks);

#

InstallMethod(RhoAct, "for a transformation semigroup",
[IsTransformationSemigroup], x-> ON_KERNEL_ANTI_ACTION);

# JDM new c method for this!
InstallMethod(RhoAct, "for a partial perm semigroup",
[IsPartialPermSemigroup], s->       
  function(set, f) 
    return OnPosIntSetsPartialPerm(set, f^-1);
  end);

InstallMethod(RhoAct, "for a partial perm semigroup",
[IsBipartitionSemigroup], x-> OnLeftBlocks);

# the seed or dummy start point for LambdaOrb

InstallMethod(LambdaOrbSeed, "for a transformation semigroup",
[IsTransformationSemigroup], s-> [0]);

InstallMethod(LambdaOrbSeed, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> [0]);

InstallMethod(LambdaOrbSeed, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> EmptyBlocks);

# the seed or dummy start point for RhoOrb

InstallMethod(RhoOrbSeed, "for a transformation semigroup",
[IsTransformationSemigroup], s->[0]);

InstallMethod(RhoOrbSeed, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> [0]);

InstallMethod(RhoOrbSeed, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> EmptyBlocks);

# the function calculating the lambda or rho value of an element

InstallMethod(LambdaFunc, "for a transformation semigroup",
[IsTransformationSemigroup], x-> IMAGE_SET_TRANS);

InstallMethod(LambdaFunc, "for a partial perm semigroup",
[IsPartialPermSemigroup], x-> IMAGE_SET_PPERM);

InstallMethod(LambdaFunc, "for a bipartition semigroup",
[IsBipartitionSemigroup], x-> RightBlocks);

#

InstallMethod(RhoFunc, "for a transformation semigroup",
[IsTransformationSemigroup], x-> FLAT_KERNEL_TRANS);

InstallMethod(RhoFunc, "for a partial perm semigroup",
[IsPartialPermSemigroup], x-> DOMAIN_PPERM);

InstallMethod(RhoFunc, "for a bipartition semigroup",
[IsBipartitionSemigroup], x-> LeftBlocks);

# the function used to calculate the rank of lambda or rho value

InstallMethod(LambdaRank, "for a transformation semigroup", 
[IsTransformationSemigroup], x-> Length);

InstallMethod(LambdaRank, "for a partial perm semigroup", 
[IsPartialPermSemigroup], x-> Length);

InstallMethod(LambdaRank, "for a bipartition semigroup", 
[IsBipartitionSemigroup], x-> RankOfBlocks);

#

InstallMethod(RhoRank, "for a transformation semigroup", 
[IsTransformationSemigroup], x-> MaximumList);

InstallMethod(RhoRank, "for a partial perm semigroup", 
[IsPartialPermSemigroup], x-> Length);

InstallMethod(RhoRank, "for a bipartition semigroup", 
[IsBipartitionSemigroup], x-> RankOfBlocks);

# if g=LambdaInverse(X, f) and X^f=Y, then Y^g=X and g acts on the right 
# like the inverse of f on Y.

InstallMethod(LambdaInverse, "for a transformation semigroup",
[IsTransformationSemigroup], s-> INV_LIST_TRANS);

InstallMethod(LambdaInverse, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> function(x, f) return f^-1; end); 

InstallMethod(LambdaInverse, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> InverseRightBlocks); 

# if g=RhoInverse(X, f) and f^X=Y (this is a left action), then g^Y=X and g
# acts on the left like the inverse of g on Y. 

InstallMethod(RhoInverse, "for a transformation semigroup",
[IsTransformationSemigroup], s-> INV_KER_TRANS);

InstallMethod(RhoInverse, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> 
  function(dom, f)
    return f^-1;
  end);

#JDM better method for this!!

InstallMethod(RhoInverse, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> InverseLeftBlocks);
  #function(rho, f)
  #  return Inverse(InverseRightBlocks(rho, Inverse(f)));
  #end);

# LambdaPerm(s) returns a permutation from two acting semigroup elements with
# equal LambdaFunc and RhoFunc. This is required to check if one of the two
# elements belongs to the schutz gp of a lambda orb.

InstallMethod(LambdaPerm, "for a transformation semigroup",
[IsTransformationSemigroup], s-> PERM_LEFT_QUO_TRANS_NC);

InstallMethod(LambdaPerm, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> PERM_LEFT_QUO_PPERM_NC);

InstallMethod(LambdaPerm, "for a partial perm semigroup",
[IsBipartitionSemigroup], s-> PermLeftQuoBipartitionNC);

# returns a permutation mapping LambdaFunc(s)(f) to LambdaFunc(s)(g) so that 
# gf^-1(i)=p(i) when RhoFunc(s)(f)=RhoFunc(s)(g)!!

InstallMethod(LambdaConjugator, "for a transformation semigroup",
[IsTransformationSemigroup], s-> TRANS_IMG_CONJ);

# c method
InstallMethod(LambdaConjugator, "for a partial perm semigroup",
[IsPartialPermSemigroup], s-> 
function(f, g)
  return MappingPermListList(IMAGE_PPERM(f), IMAGE_PPERM(g));
end);

InstallMethod(LambdaConjugator, "for a bipartition semigroup",
[IsBipartitionSemigroup], s-> BipartRightBlocksConj);

# the function used to test if there is an idempotent with the specified 
# lambda and rho values.

InstallMethod(IdempotentTester, "for a transformation semigroup", 
[IsTransformationSemigroup], s-> 
function(img, ker)
  return IS_INJECTIVE_LIST_TRANS(img, ker) and Length(img)=MaximumList(ker);
end);

InstallMethod(IdempotentTester, "for a partial perm semigroup", 
[IsPartialPermSemigroup], s-> EQ);

InstallMethod(IdempotentTester, "for a bipartition semigroup", 
[IsBipartitionSemigroup], s-> BlocksIdempotentTester);

# the function used to create an idempotent with the specified lambda and rho
# values. 

InstallMethod(IdempotentCreator, "for a transformation semigroup",
[IsTransformationSemigroup], s-> IDEM_IMG_KER_NC);

InstallMethod(IdempotentCreator, "for a partial perm semigp",
[IsPartialPermSemigroup], s-> PartialPermNC);

InstallMethod(IdempotentCreator, "for a bipartition semigroup", 
[IsBipartitionSemigroup], s-> BlocksIdempotentCreator);

# the action of elements of the stabiliser of a lambda-value on any element of
# the semigroup with that lambda-value 

# StabiliserAction will be \* for transformation and partial perm semigroups 
# and something else for semigroups of bipartitions.

InstallMethod(StabiliserAction, 
"for a transformation semigroup with generators",
[IsTransformationSemigroup and HasGeneratorsOfSemigroup],
s-> PROD);

InstallMethod(StabiliserAction, 
"for a partial perm semigroup with generators",
[IsPartialPermSemigroup and HasGeneratorsOfSemigroup],
s-> PROD);

InstallMethod(StabiliserAction, 
"for a bipartition semigroup with generators",
[IsBipartitionSemigroup and HasGeneratorsOfSemigroup],
s-> OnRightBlocksBipartitionByPerm);

# IsActingSemigroupWithFixedDegreeMultiplication should be <true> if and only
# if it is only possible to multiply elements of the type in the semigroup with
# equal degrees.

InstallTrueMethod(IsActingSemigroupWithFixedDegreeMultiplication, 
IsTransformationSemigroup);

InstallTrueMethod(IsActingSemigroupWithFixedDegreeMultiplication, 
IsBipartitionSemigroup);

InstallMethod(IsActingSemigroupWithFixedDegreeMultiplication, 
"for a partial perm semigroup", [IsPartialPermSemigroup], ReturnFalse);

#EOF
