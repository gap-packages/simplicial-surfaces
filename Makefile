all: doc

doc: doc/manual.six

doc/manual.six: makedoc.g \
    		PackageInfo.g \
		gap/*.gd gap/*.gi \
		doc/Introduction.xml \
		doc/PolygonalStructures.xml \
		doc/Image_* \
		doc/TableOfContents.autodoc
	gap makedoc.g

