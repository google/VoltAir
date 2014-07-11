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

#ifndef PARALLAXTRANSFORMITEM_H
#define PARALLAXTRANSFORMITEM_H

#include <QQuickItem>

class Actor;

/**
 * @ingroup Engine
 * @ingroup QQuickItem
 * @brief QQuickItem which applies a translation to children, giving the illusion of parallax
 * scrolling.
 *
 * The amount of translation is computed by looking at the Camera's position relative to the
 * current "parallax origin" (Camera::getParallaxOrigin()). The distance between the two is
 * multiplied by the strength of parallax, and this object's #zDepth. This gets us the offset
 * amount. If the Camera is pointing directly at the parallax origin, then all objects, regardless
 * of their depth, have zero offset. The strength of parallax is determined by
 * Level::parallaxStrength. Separate strengths can be provided for x and y axes. The #zDepth where
 * no parallax is apparent is given by the constant #REFERENCE_DEPTH.
 */
class ParallaxTransformItem : public QQuickItem {
    Q_OBJECT

    /**
     * @brief The distance into the background (or foreground) that this @c QQuickItem appears for
     * the purpose of computing parallax.
     *
     * A value of #REFERENCE_DEPTH effectively gives no parallax. Values greater than that appear to
     * be in the background, and scroll slower than foreground objects. Values less than the
     * reference appear to be in the foreground, and scroll more quickly.
     */
    Q_PROPERTY(float zDepth READ getZDepth WRITE setZDepth NOTIFY zDepthChanged)

public:
    /**
     * @brief The #zDepth which appears to be foreground, and no parallax is apparent.
     */
    constexpr static const float REFERENCE_DEPTH = 1.0f;

    /**
     * @brief Construct a ParallaxTransformItem.
     * @param parent Parent item
     */
    explicit ParallaxTransformItem(QQuickItem* parent = 0);
    virtual ~ParallaxTransformItem();

    /**
     * @brief Returns #zDepth.
     */
    float getZDepth() const { return mZDepth; }
    /**
     * @brief Sets #zDepth.
     * @param value Float to set #zDepth to
     */
    void setZDepth(float value);

signals:
    /**
     * @brief Emitted when #zDepth changes.
     */
    void zDepthChanged();

protected:
    /**
     * @brief Override of QQuickItem::componentComplete() to perform additional initialization.
     */
    virtual void componentComplete() override;

private:
    void updateItemOffset();
    void updateProjectionRatio();

    Actor* mActor = nullptr;
    float mZDepth = REFERENCE_DEPTH;
    float mZProjectionRatioX = 0.0f;
    float mZProjectionRatioY = 0.0f;
};
Q_DECLARE_METATYPE(ParallaxTransformItem*)

#endif // PARALLAXTRANSFORMITEM_H
