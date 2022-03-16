//
//  DBDatePickerViewController.h
//  TYDatePickerView
//
//  Created by DB on 2021/4/15.
//

#import "DBDatePickerViewDefines.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DBDatePickerConfigCallback)(NSDate * _Nullable);

@interface DBDatePickerViewTopConfig : NSObject

@property (nonatomic, assign) DBDatePickerTopConfigType type;
@property (nonatomic, strong) NSAttributedString *itemTitle;
@property (nonatomic, strong) DBDatePickerConfigCallback itemCallback;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, strong) NSString *itemIdentifier;

@end

@protocol DBDatePickerViewControllerDateSource <NSObject>

@required

@property (nonatomic, assign) DBDatePickerType type;

@optional

@property (nonatomic, assign) DBDatePickerComponent yearComponent;

@property (nonatomic, assign) DBDatePickerComponent monthComponent;

@property (nonatomic, assign) DBDatePickerComponent dayComponent;

@property (nonatomic, assign) DBDatePickerComponent hourComponent;

@property (nonatomic, assign) DBDatePickerComponent minuteComponent;

@property (nonatomic, assign) DBDatePickerComponent secondsComponent;

@property (nonatomic, strong) NSArray<DBDatePickerViewTopConfig *> *configs;

@property (nonatomic, strong) NSDate *currentDate;

@property (nonatomic, strong) NSDate *minimumDate;

@property (nonatomic, strong) NSDate *maximumDate;

@property (nonatomic, assign) DBDatePickerTimeType timeType;

@end

@class DBDatePickerViewController;

@protocol DBDatePickerViewControllerDelegate <NSObject>

@optional

- (void)db_datePickerVC:(DBDatePickerViewController *)vc didSelectAtDate:(NSDate *)date;

@end

@interface DBDatePickerViewController : UIViewController

@property (nonatomic, weak) id<DBDatePickerViewControllerDateSource> dataSource;
@property (nonatomic, weak) id<DBDatePickerViewControllerDelegate> delegate;

- (void)reloadData;

- (void)reloadAllComponents;

- (void)reloadComponent:(DBDatePickerComponent)component;

@end

NS_ASSUME_NONNULL_END
