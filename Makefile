all: doc

doc: doc/manual.six

doc/manual.six: makedoc.g \
    		PackageInfo.g \
		gap/*.gd gap/*.gi \
		gap/PolygonalComplexes/*.gd \
		gap/PolygonalComplexes/*.gi \
		doc/Introduction.xml \
		doc/PolygonalStructures.xml \
		doc/PolygonalStructuresDefinitions.xml \
		doc/Image_* \
		doc/TableOfContents.autodoc
	gap makedoc.g

