//
//  DBDatePickerScaleView.h
//  TYDatePickerView
//
//  Created by DB on 2021/7/28.
//

#import <UIKit/UIKit.h>
#import "DBDatePickerViewDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBDatePickerScaleView : UIView

- (instancetype)initWithType:(DBDatePickerType)type
                   yearIndex:(DBDatePickerComponent)yearIndex
                  monthIndex:(DBDatePickerComponent)monthIndex
                    dayIndex:(DBDatePickerComponent)dayIndex
                   hourIndex:(DBDatePickerComponent)hourIndex
                 minuteIndex:(DBDatePickerComponent)minuteIndex
                secondsIndex:(DBDatePickerComponent)secondsIndex NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
