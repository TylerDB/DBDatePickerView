//
//  DBDatePickerView.h
//  TYDatePickerView
//
//  Created by DB on 2021/4/15.
//

#import <UIKit/UIKit.h>
#import "DBDatePickerViewDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class DBDatePickerView;

@protocol DBDatePickerViewDelegate <NSObject>

- (void)ty_datePickerView:(DBDatePickerView *)pickerView didSelectAtDate:(NSDate *)date;

@end

@interface DBDatePickerView : UIView

@property (nonatomic, weak) id<DBDatePickerViewDelegate> delegate;

@property (nullable, nonatomic, strong) NSDate *currentDate;
@property (nullable, nonatomic, strong) NSDate *minimumDate;
@property (nullable, nonatomic, strong) NSDate *maximumDate;

@property (nonatomic, assign) BOOL selectAfterReloadIfNeeded;

@property (nullable, nonatomic, strong) UIFont *textFont;
@property (nullable, nonatomic, strong) UIColor *normalTextColor;
@property (nullable, nonatomic, strong) UIColor *currentSelectedTextColor;

- (instancetype)initWithType:(DBDatePickerType)type
               yearComponent:(DBDatePickerComponent)yearComponent
              monthComponent:(DBDatePickerComponent)monthComponent
                dayComponent:(DBDatePickerComponent)dayComponent
               hourComponent:(DBDatePickerComponent)hourComponent
             minuteComponent:(DBDatePickerComponent)minuteComponent
            secondsComponent:(DBDatePickerComponent)secondsComponent NS_DESIGNATED_INITIALIZER;

- (void)reloadAllComponents;

- (void)reloadComponent:(DBDatePickerComponent)component;

@end

NS_ASSUME_NONNULL_END
