/*
 * Copyright (C) 2014 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef VARIANTCONVERTER_H
#define VARIANTCONVERTER_H

#include <QDebug>
#include <QJsonObject>
#include <QPointF>
#include <QString>
#include <QVariant>

/**
 * @brief Base template class for VariantConverter.
 *
 * This class defines a base implementation for the toVariant() method which is valid for any
 * template type @c T for which there exists a corresponding QVariant constructor.
 * @tparam Template type to convert to and from QVariant
 * @see VariantConverter
 */
template <typename T>
class VariantConverterBase {
public:
    /**
     * @brief Returns @p value converted as a QVariant.
     * @note This default implementation can only convert @c T types which are valid types for the
     * QVariant constructor. All other types wished to be converted need to use template
     * specialization.
     * @param value Value to convert
     */
    QVariant toVariant(const T& value) {
        return QVariant(value);
    }
};

/**
 * @brief Helper template class to convert QVariant%s to and from a specific type, for example,
 * QPointF%s.
 * @note Template specializations perform the conversions of QVariant%s to specific types, while the
 * unspecialized class only performs conversion from specific types to QVariant%s.
 * @tparam Template type to convert to and from QVariant
 */
template <typename T>
class VariantConverter : public VariantConverterBase<T> {
};

/**
 * @brief Helper template class to convert QVariant%s to and from @c int%s.
 * @see VariantConverter for more information.
 */
template <>
class VariantConverter<int> : public VariantConverterBase<int> {
public:
    /**
     * @brief Returns @p value converted to an @c int.
     * @param value QVariant to convert
     */
    int fromVariant(const QVariant& value) {
        return value.toInt();
    }
};

/**
 * @brief Helper template class to convert QVariant%s to and from QString%s.
 * @see VariantConverter
 */
template <>
class VariantConverter<QString> : public VariantConverterBase<QString> {
public:
    /**
     * @brief Returns @p value converted to a QString.
     * @param value QVariant to convert
     */
    QString fromVariant(const QVariant& value) {
        return value.toString();
    }
};

/**
 * @brief Helper template class to convert QVariant%s to and from QJsonObject%s.
 * @see VariantConverter
 */
template <>
class VariantConverter<QJsonObject> : public VariantConverterBase<QJsonObject> {
public:
    /**
     * @brief Returns @p value converted to a QJsonObject.
     *
     * This method will convert QVariant's representing the @c QMetaType::QJsonObject type, as
     * expected, but it will also convert from a @c QMetaType::QVariantMap using
     * QJsonObject::fromVariantMap() as well.
     * @param value QVariant to convert
     */
    QJsonObject fromVariant(const QVariant& value) {
        if (value.canConvert(QMetaType::QVariantMap)) {
            return QJsonObject::fromVariantMap(value.toMap());
        } else {
            return value.toJsonObject();
        }
    }
};

/**
 * @brief Helper template class to convert QVariant%s to and from QPointF%s.
 * @see VariantConverter
 */
template <>
class VariantConverter<QPointF> : public VariantConverterBase<QPointF> {
public:
    /**
     * @brief Returns @p value converted to a QPointF.
     *
     * This method will convert QVariant's representing the @c QMetaType::QPointF type, as expected,
     * but it will also convert from a @c QMetaType::QVariantList as well.
     * @param value QVariant to convert
     */
    QPointF fromVariant(const QVariant& value) {
        if (value.canConvert(QMetaType::QVariantList)) {
            QVariantList floatList = value.toList();
            float x = floatList.size() >= 1 ? floatList[0].toFloat() : 0.0f;
            float y = floatList.size() >= 2 ? floatList[1].toFloat() : 0.0f;
            return QPointF(x, y);
        } else {
            return value.toPointF();
        }
    }
};

/**
 * @brief Helper template class to convert QVariantMap%s to and from QMap%s with a convertable
 * value type @c T.
 * @tparam Template type which can be converted by VariantConverter to and from a QVariant
 * @see VariantConverter
 */
template <typename T>
class VariantConverter<QMap<QString, T>> {
public:
    /**
     * @brief Returns @p value converted to a QMap<QString, T>.
     * @tparam Template type for which there needs to be a valid VariantConverter specialization.
     * @param value QVariant of type QVariantMap to convert
     */
    QMap<QString, T> fromVariant(const QVariant& value) {
        QMap<QString, T> convertedMap;
        VariantConverter<T> converter;
        QVariantMap map = value.toMap();
        for (auto it = map.cbegin(); it != map.cend(); ++it) {
            convertedMap.insert(it.key(), converter.fromVariant(it.value()));
        }
        return convertedMap;
    }

    /**
     * @brief Returns @p value converted to a QVariant of type QVariantMap.
     * @tparam Template type for which there needs to be a valid VariantConverter specialization.
     * @param value Templated QMap to convert
     */
    QVariant toVariant(const QMap<QString, T>& value) {
        QVariantMap map;
        VariantConverter<T> converter;
        for (auto it = value.cbegin(); it != value.cend(); ++it) {
            map.insert(it.key(), converter.toVariant(it.value()));
        }
        return QVariant(map);
    }
};

/**
 * @brief Helper template class to convert QVariantList%s to and from QSet%s with a convertable
 * value type @c T.
 * @tparam Template type which can be converted by VariantConverter to and from a QVariant
 * @see VariantConverter
 */
template <typename T>
class VariantConverter<QSet<T>> {
public:
    /**
     * @brief Returns @p value converted to a QSet<T>.
     * @tparam Template type for which there needs to be a valid VariantConverter specialization.
     * @param value QVariant of type QVariantList to convert
     */
    QSet<T> fromVariant(const QVariant& value) {
        QSet<T> convertedSet;
        VariantConverter<T> converter;
        for (const QVariant& var : value.toList()) {
            convertedSet.insert(converter.fromVariant(var));
        }
        return convertedSet;
    }

    /**
     * @brief Returns @p value converted to a QVariant of type QVariantList.
     * @tparam Template type for which there needs to be a valid VariantConverter specialization.
     * @param value Templated QSet to convert
     */
    QVariant toVariant(const QSet<T>& value) {
        QVariantList list;
        list.reserve(value.size());
        VariantConverter<T> converter;
        for (const T& val : value) {
            list.append(converter.toVariant(val));
        }
        return QVariant(list);
    }
};

#endif // VARIANTCONVERTER_H
