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


# We define a generic representation for polygonal complexes
DeclareRepresentation("IsGenericPolygonalComplexRep", IsPolygonalComplex, []);

# Define a generic type
PolygonalComplexType := 
    NewType( PolygonalComplexFamily, IsGenericPolygonalComplexRep );



##
## Check whether a polygonal complex is a triangular complex.
##
InstallMethod( "IsTriangularComplex", "for a polygonal complex",
    [ IsPolygonalComplex ],
    function( complex )
        local edgeSize;

        edgeSize := List(Faces(complex), f -> Size(EdgesOfFaces(complex)[f]));
        return Size( Filtered( edgeSize, s -> s<>3 ) ) = 0;
    end
);


##
## Check whether a polygonal complex is a ramified polygonal surface.
##
InstallMethod( "IsRamifiedPolygonalSurface", "for a polygonal complex",
    [ IsPolygonalComplex ],
    function( complex )
        local faceSize;
        
        faceSize := List(Edges(complex), e -> Size(FacesOfEdges(complex)[e])));
        return Size( Filtered( faceSize, s -> s > 2 ) ) = 0;
    end
);



##
## Check whether a ramified polygonal surface is a polygonal surface
##
InstallMethod( "IsPolygonalSurface", "for a ramified polygonal surface",
    [ IsRamifiedPolygonalSurface ],
    function( ramSurf )
        local paths, pathSize;

        paths := EdgeFacePathPartitionOfVertices(ramSurf);
        pathSize := List( Vertices(ramSurf), v -> Size(paths[v]) );
        return Filtered(pathSize, s -> s > 1) = 0;
    end
);
    RedispatchOnCondition( IsPolygonalSurface, true, [IsPolygonalComplex],
        [IsRamifiedPolygonalSurface], 0);
#TODO maybe redefine this property to be computable on polygonal complexes?
# Right now the result of a computation is not meaningful.