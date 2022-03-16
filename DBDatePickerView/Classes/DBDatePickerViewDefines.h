//
//  DBDatePickerViewDefines.h
//  TYDatePickerView
//
//  Created by DB on 2021/4/20.
//

#ifndef DBDatePickerViewDefines_h
#define DBDatePickerViewDefines_h

typedef NS_OPTIONS(NSUInteger, DBDatePickerType) {
    DBDatePickerTypeYear = 1 << 0,
    DBDatePickerTypeMonth = 1 << 1,
    DBDatePickerTypeDay = 1 << 2,
    DBDatePickerTypeHour = 1 << 3,
    DBDatePickerTypeMinute = 1 << 4,
    DBDatePickerTypeSeconds = 1 << 5
};

typedef NS_ENUM(NSUInteger, DBDatePickerComponent) {
    DBDatePickerFirstComponent = 0,
    DBDatePickerSecondryComponent = 1,
    DBDatePickerThirdComponent = 2,
    DBDatePickerFourthComponent = 3,
    DBDatePickerFifthComponent = 4,
    DBDatePickerSixthComponent = 5,
    DBDatePickerUnkownComponet = NSNotFound
};

typedef NS_ENUM(NSUInteger, DBDatePickerTopConfigType) {
    DBDatePickerTopConfigCancel,
    DBDatePickerTopConfigConfirm,
    DBDatePickerTopConfigCustom,
};

typedef NS_ENUM(NSUInteger, DBDatePickerTimeType) {
    DBDatePickerBaseOnCurrentTime,
    DBDatePickerBaseOnStartOfTime,
    DBDatePickerBaseOnEndOfTime,
};

#endif /* DBDatePickerViewDefines_h */
