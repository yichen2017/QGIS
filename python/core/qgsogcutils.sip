/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsogcutils.h                                               *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/





class QgsOgcUtils
{
%Docstring
 The QgsOgcUtils class provides various utility functions for conversion between
   OGC (Open Geospatial Consortium) standards and QGIS internal representations.

 Currently supported standards:
 - GML2 - Geography Markup Language (import, export)
%End

%TypeHeaderCode
#include "qgsogcutils.h"
%End
  public:

    enum GMLVersion
    {
      GML_2_1_2,
      GML_3_1_0,
      GML_3_2_1,
    };

    static QgsGeometry geometryFromGML( const QString &xmlString );
%Docstring
 Static method that creates geometry from GML
\param xmlString xml representation of the geometry. GML elements are expected to be
in default namespace (\verbatim {<Point>...</Point> \endverbatim) or in
"gml" namespace (\verbatim <gml:Point>...</gml:Point> \endverbatim)
 :rtype: QgsGeometry
%End

    static QgsGeometry geometryFromGML( const QDomNode &geometryNode );
%Docstring
 Static method that creates geometry from GML
 :rtype: QgsGeometry
%End

    static QgsRectangle rectangleFromGMLBox( const QDomNode &boxNode );
%Docstring
Read rectangle from GML2 Box
 :rtype: QgsRectangle
%End

    static QgsRectangle rectangleFromGMLEnvelope( const QDomNode &envelopeNode );
%Docstring
Read rectangle from GML3 Envelope
 :rtype: QgsRectangle
%End

    static QDomElement geometryToGML( const QgsGeometry &geometry, QDomDocument &doc,
                                      QgsOgcUtils::GMLVersion gmlVersion,
                                      const QString &srsName,
                                      bool invertAxisOrientation,
                                      const QString &gmlIdBase,
                                      int precision = 17 );
%Docstring
 Exports the geometry to GML
:return: QDomElement
.. versionadded:: 2.16
 :rtype: QDomElement
%End

    static QDomElement geometryToGML( const QgsGeometry &geometry, QDomDocument &doc, const QString &format, int precision = 17 );
%Docstring
 Exports the geometry to GML2 or GML3
:return: QDomElement
 :rtype: QDomElement
%End

    static QDomElement geometryToGML( const QgsGeometry &geometry, QDomDocument &doc, int precision = 17 );
%Docstring
 Exports the geometry to GML2
:return: QDomElement
 :rtype: QDomElement
%End

    static QDomElement rectangleToGMLBox( QgsRectangle *box, QDomDocument &doc, int precision = 17 );
%Docstring
 Exports the rectangle to GML2 Box
:return: QDomElement
 :rtype: QDomElement
%End

    static QDomElement rectangleToGMLBox( QgsRectangle *box, QDomDocument &doc,
                                          const QString &srsName,
                                          bool invertAxisOrientation,
                                          int precision = 17 );
%Docstring
 Exports the rectangle to GML2 Box
:return: QDomElement
.. versionadded:: 2.16
 :rtype: QDomElement
%End

    static QDomElement rectangleToGMLEnvelope( QgsRectangle *env, QDomDocument &doc, int precision = 17 );
%Docstring
 Exports the rectangle to GML3 Envelope
:return: QDomElement
 :rtype: QDomElement
%End

    static QDomElement rectangleToGMLEnvelope( QgsRectangle *env, QDomDocument &doc,
        const QString &srsName,
        bool invertAxisOrientation,
        int precision = 17 );
%Docstring
 Exports the rectangle to GML3 Envelope
:return: QDomElement
.. versionadded:: 2.16
 :rtype: QDomElement
%End


    static QColor colorFromOgcFill( const QDomElement &fillElement );
%Docstring
Parse XML with OGC fill into QColor
 :rtype: QColor
%End

    static QgsExpression *expressionFromOgcFilter( const QDomElement &element ) /Factory/;
%Docstring
Parse XML with OGC filter into QGIS expression
 :rtype: QgsExpression
%End

    static QDomElement expressionToOgcFilter( const QgsExpression &exp, QDomDocument &doc, QString *errorMessage = 0 );
%Docstring
 Creates OGC filter XML element. Supports minimum standard filter
 according to the OGC filter specs (=,!=,<,>,<=,>=,AND,OR,NOT)
 :return: valid \verbatim <Filter> \endverbatim QDomElement on success,
 otherwise null QDomElement
 :rtype: QDomElement
%End

    enum FilterVersion
    {
      FILTER_OGC_1_0,
      FILTER_OGC_1_1,
      FILTER_FES_2_0
    };


    static QDomElement expressionToOgcExpression( const QgsExpression &exp, QDomDocument &doc, QString *errorMessage = 0 );
%Docstring
 Creates an OGC expression XML element.
 :return: valid OGC expression QDomElement on success,
 otherwise null QDomElement
 :rtype: QDomElement
%End

    static QDomElement expressionToOgcExpression( const QgsExpression &exp,
        QDomDocument &doc,
        QgsOgcUtils::GMLVersion gmlVersion,
        FilterVersion filterVersion,
        const QString &geometryName,
        const QString &srsName,
        bool honourAxisOrientation,
        bool invertAxisOrientation,
        QString *errorMessage = 0 );
%Docstring
 Creates an OGC expression XML element.
 :return: valid OGC expression QDomElement on success,
 otherwise null QDomElement
 :rtype: QDomElement
%End



};


/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsogcutils.h                                               *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
