#############################################################################
##
##  SimplicialSurface package
##
##  Copyright 2012-2016
##    Markus Baumeister, RWTH Aachen University
##    Alice Niemeyer, RWTH Aachen University 
##
## Licensed under the GPL 3 or later.
##
#############################################################################


##
## All documentation is done in doc/PolygonalStructures.xml

# Define the main category
# [Categories are used to determine which operations can be used]
DeclareCategory( "IsPolygonalComplex", IsObject );

# Define the family
# [For two object to be equal, they have to lie in the same family]
BindGlobal( "PolygonalComplexFamily", 
    NewFamily("PolygonalComplexFamily", IsObject, IsPolygonalComplex));


# Define all secondary categories
DeclareProperty( "IsTriangularComplex", IsPolygonalComplex);
InstallTrueMethod( IsPolygonalComplex, IsTriangularComplex );

DeclareProperty( "IsRamifiedPolygonalSurface", IsPolygonalComplex);
InstallTrueMethod( IsPolygonalComplex, IsRamifiedPolygonalSurface );
DeclareSynonym( "IsRamifiedSimplicialSurface", 
    IsRamifiedPolygonalSurface and IsTriangularComplex);

DeclareProperty( "IsPolygonalSurface", IsPolygonalComplex );
InstallTrueMethod( IsRamifiedPolygonalSurface, IsPolygonalSurface );
DeclareSynonym( "IsSimplicialSurface", 
    IsPolygonalSurface and IsTriangularComplex );
