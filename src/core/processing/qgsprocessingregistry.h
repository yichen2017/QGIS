/***************************************************************************
                         qgsprocessingregistry.h
                         ------------------------
    begin                : December 2016
    copyright            : (C) 2016 by Nyall Dawson
    email                : nyall dot dawson at gmail dot com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef QGSPROCESSINGREGISTRY_H
#define QGSPROCESSINGREGISTRY_H

#include "qgis_core.h"
#include "qgis.h"
#include "qgsprocessingprovider.h"
#include <QMap>

/**
 * \class QgsProcessingRegistry
 * \ingroup core
 * Registry for various processing components, including providers, algorithms
 * and various parameters and outputs.
 *
 * QgsProcessingRegistry is not usually directly created, but rather accessed through
 * QgsApplication::processingRegistry().
 * \since QGIS 3.0
 */
class CORE_EXPORT QgsProcessingRegistry : public QObject
{
    Q_OBJECT

  public:

    /**
     * Constructor for QgsProcessingRegistry.
     */
    QgsProcessingRegistry( QObject *parent SIP_TRANSFERTHIS = nullptr );

    ~QgsProcessingRegistry();

    //! Registry cannot be copied
    QgsProcessingRegistry( const QgsProcessingRegistry &other ) = delete;
    //! Registry cannot be copied
    QgsProcessingRegistry &operator=( const QgsProcessingRegistry &other ) = delete;

    /**
     * Get list of available providers.
     */
    QList<QgsProcessingProvider *> providers() const { return mProviders.values(); }

    /**
     * Add a processing provider to the registry. Ownership of the provider is transferred to the registry,
     * and the provider's parent will be set to the registry.
     * Returns false if the provider could not be added (eg if a provider with a duplicate ID already exists
     * in the registry).
     * Adding a provider to the registry automatically triggers the providers QgsProcessingProvider::load()
     * method to populate the provider with algorithms.
     * \see removeProvider()
     */
    bool addProvider( QgsProcessingProvider *provider SIP_TRANSFER );

    /**
     * Removes a provider implementation from the registry (the provider object is deleted).
     * Returns false if the provider could not be removed (eg provider does not exist in the registry).
     * \see addProvider()
     */
    bool removeProvider( QgsProcessingProvider *provider );

    /**
     * Removes a provider implementation from the registry (the provider object is deleted).
     * Returns false if the provider could not be removed (eg provider does not exist in the registry).
     * \see addProvider()
     */
    bool removeProvider( const QString &providerId );

    /**
     * Returns a matching provider by provider ID.
     */
    QgsProcessingProvider *providerById( const QString &id );

    /**
     * Returns a list of all available algorithms from registered providers.
     * \see algorithmById()
     */
    QList< const QgsProcessingAlgorithm *> algorithms() const;

    /**
     * Finds an algorithm by its ID. If no matching algorithm is found, a nullptr
     * is returned.
     * \see algorithms()
     * \see createAlgorithmById()
     */
    const QgsProcessingAlgorithm *algorithmById( const QString &id ) const;

    /**
     * Creates a new instance of an algorithm by its ID. If no matching algorithm is found, a nullptr
     * is returned. Callers take responsibility for deleting the returned object.
     *
     * The \a configuration argument allows passing of a map of configuration settings
     * to the algorithm, allowing it to dynamically adjust its initialized parameters
     * and outputs according to this configuration. This is generally used only for
     * algorithms in a model, allowing them to adjust their behavior at run time
     * according to some user configuration.
     *
     * \see algorithms()
     * \see algorithmById()
     */
    QgsProcessingAlgorithm *createAlgorithmById( const QString &id, const QVariantMap &configuration = QVariantMap() ) const SIP_FACTORY;

  signals:

    //! Emitted when a provider has been added to the registry.
    void providerAdded( const QString &id );

    //! Emitted when a provider is removed from the registry
    void providerRemoved( const QString &id );

  private:

    //! Map of available providers by id. This class owns the pointers
    QMap<QString, QgsProcessingProvider *> mProviders;

#ifdef SIP_RUN
    QgsProcessingRegistry( const QgsProcessingRegistry &other );
#endif
};

#endif // QGSPROCESSINGREGISTRY_H


