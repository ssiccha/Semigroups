############################################################################
##
#W  blocks.gd
#Y  Copyright (C) 2013-15                                James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

DeclareCategoryKernel("IsBlocks", IsList, IS_BLOCKS);

DeclareCategoryCollections("IsBlocks");

BindGlobal("TheTypeTBlocksObj",
           NewType(NewFamily("BlocksFamily",
                             IsBlocks,
                             CanEasilySortElements,
                             CanEasilySortElements),
                   IsBlocks and IsComponentObjectRep
                   and IsAttributeStoringRep));

DeclareGlobalFunction("BlocksNC");

DeclareAttribute("ProjectionFromBlocks", IsBlocks);
DeclareAttribute("NrBlocks", IsBlocks);
DeclareAttribute("RankOfBlocks", IsBlocks);
DeclareAttribute("NrTransverseBlocks", IsBlocks);
DeclareAttribute("DegreeOfBlocks", IsBlocks);
DeclareOperation("OnRightBlocks", [IsBlocks, IsBipartition]);
DeclareOperation("OnLeftBlocks", [IsBlocks, IsBipartition]);
DeclareOperation("AsDigraph", [IsBlocks]);
DeclareAttribute("CanonicalBlocks", IsBlocks);

