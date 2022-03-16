//
//  DBDatePickerViewController.m
//  TYDatePickerView
//
//  Created by DB on 2021/4/15.
//

#import "DBDatePickerViewController.h"
#import "DBDatePickerView.h"
#import "DBDatePickerScaleView.h"

#import <DBCategoryKit/DBCategoryKit.h>

@implementation DBDatePickerViewTopConfig

@end

@interface DBDatePickerViewController ()<DBDatePickerViewDelegate>

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) DBDatePickerScaleView *scaleView;

@property (nonatomic, strong) DBDatePickerView *pickerView;

@property (nonatomic, strong) NSDate *currentDate;

@end

@implementation DBDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(configs)]) {
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.f)];
        topView.backgroundColor = [UIColor db_colorWithHex:0xF9FAFB];
        [self.view addSubview:topView];
        self.topView = topView;
        
        [self updateTopViewContent];
        
    }
    
    DBDatePickerType pickerType = DBDatePickerTypeYear | DBDatePickerTypeMonth | DBDatePickerTypeDay | DBDatePickerTypeHour | DBDatePickerTypeMinute | DBDatePickerTypeSeconds;
    if ([self.dataSource respondsToSelector:@selector(type)]) {
        pickerType = pickerType & self.dataSource.type;
    }
    
    DBDatePickerComponent yearComponent = DBDatePickerUnkownComponet;
    if ([self.dataSource respondsToSelector:@selector(yearComponent)]) {
        yearComponent = self.dataSource.yearComponent;
    }
    
    DBDatePickerComponent monthComponent = DBDatePickerUnkownComponet;
    if ([self.dataSource respondsToSelector:@selector(monthComponent)]) {
        monthComponent = self.dataSource.monthComponent;
    }
    
    DBDatePickerComponent dayComponent = DBDatePickerUnkownComponet;
    if ([self.dataSource respondsToSelector:@selector(dayComponent)]) {
        dayComponent = self.dataSource.dayComponent;
    }
    
    DBDatePickerComponent hourComponent = DBDatePickerUnkownComponet;
    if ([self.dataSource respondsToSelector:@selector(hourComponent)]) {
        hourComponent = self.dataSource.hourComponent;
    }
    
    DBDatePickerComponent minuteComponent = DBDatePickerUnkownComponet;
    if ([self.dataSource respondsToSelector:@selector(minuteComponent)]) {
        minuteComponent = self.dataSource.minuteComponent;
    }
    
    DBDatePickerComponent secondsComponent = DBDatePickerUnkownComponet;
    if ([self.dataSource respondsToSelector:@selector(secondsComponent)]) {
        secondsComponent = self.dataSource.secondsComponent;
    }
    
    DBDatePickerScaleView *scaleView = [[DBDatePickerScaleView alloc] initWithType:pickerType
                                                                             yearIndex:yearComponent
                                                                            monthIndex:monthComponent
                                                                              dayIndex:dayComponent
                                                                             hourIndex:hourComponent
                                                                           minuteIndex:minuteComponent
                                                                          secondsIndex:secondsComponent];
    [scaleView setBackgroundColor:UIColor.whiteColor];
    [scaleView setFrame:CGRectMake(0, self.topView.db_bottom, self.view.bounds.size.width, 38.f)];
    [self.view addSubview:scaleView];
    self.scaleView = scaleView;
    
    DBDatePickerView *pickerView = [[DBDatePickerView alloc] initWithType:pickerType
                                                                yearComponent:yearComponent
                                                               monthComponent:monthComponent
                                                                 dayComponent:dayComponent
                                                                hourComponent:hourComponent
                                                              minuteComponent:minuteComponent
                                                             secondsComponent:secondsComponent];
    [pickerView setBackgroundColor:UIColor.whiteColor];
    [pickerView setFrame:CGRectMake(0, scaleView.db_bottom, self.view.bounds.size.width, 275.f)];
    pickerView.delegate = self;
    [self updatePickerViewDataSource];
    [self.view addSubview:pickerView];
    self.pickerView = pickerView;
    
}

- (void)updatePickerViewDataSource {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(currentDate)]) {
        self.currentDate = [self.dataSource currentDate];
        self.pickerView.currentDate = [self.dataSource currentDate];
    }
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(minimumDate)]) {
        self.pickerView.minimumDate = [self.dataSource minimumDate];
    }
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(maximumDate)]) {
        self.pickerView.maximumDate = [self.dataSource maximumDate];
    }
}

- (void)updateTopViewContent {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(configs)]) {
        while (self.topView.subviews.count) {
            UIView *child = self.topView.subviews.lastObject;
            [child removeFromSuperview];
        }
        NSArray<DBDatePickerViewTopConfig *> *configs = [self.dataSource configs];
        UIButton *lastBtn = nil;
        for (int i = 0; i < configs.count; i++) {
            DBDatePickerViewTopConfig *config = configs[i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            [btn setAttributedTitle:config.itemTitle forState:UIControlStateNormal];
            [btn setFrame:CGRectMake(lastBtn.db_right, 0, config.itemWidth, 60.f)];
            [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.topView addSubview:btn];
            lastBtn = btn;
        }
    }
}

- (void)reloadData {
    [self updateTopViewContent];
    [self reloadAllComponents];
}

- (void)reloadAllComponents {
    [self updatePickerViewDataSource];
    [self.pickerView reloadAllComponents];
}

- (void)reloadComponent:(DBDatePickerComponent)component {
    [self.pickerView reloadComponent:component];
}

- (void)clickAction:(UIButton *)sender {
    NSArray<DBDatePickerViewTopConfig *> *configs = [self.dataSource configs];
    DBDatePickerViewTopConfig *config = configs[sender.tag];
    if (config.itemCallback) {
        if (config.type != DBDatePickerTopConfigConfirm) {
            config.itemCallback(nil);
        }else {
            config.itemCallback(self.currentDate);
        }
    }
}

- (void)ty_datePickerView:(nonnull DBDatePickerView *)pickerView didSelectAtDate:(nonnull NSDate *)date {
    NSDate *selectedDate = [NSDate date];
    DBDatePickerTimeType timeType = DBDatePickerBaseOnCurrentTime;
    if ([self.dataSource respondsToSelector:@selector(timeType)]) {
        timeType = [self.dataSource timeType];
    }
    if (self.dataSource.type & DBDatePickerTypeYear) {
        switch (timeType) {
            case DBDatePickerBaseOnStartOfTime:
                selectedDate = date.db_startOfCurrentYear;
                break;
            case DBDatePickerBaseOnEndOfTime:
                selectedDate = date.db_endOfCurrentYear;
                break;
            default:
                selectedDate = date;
                break;
        }
    }
    if (self.dataSource.type & DBDatePickerTypeMonth) {
        switch (timeType) {
            case DBDatePickerBaseOnStartOfTime:
                selectedDate = date.db_startOfCurrentMonth;
                break;
            case DBDatePickerBaseOnEndOfTime:
                selectedDate = date.db_endOfCurrentMonth;
                break;
            default:
                selectedDate = date;
                break;
        }
    }
    if (self.dataSource.type & DBDatePickerTypeDay) {
        switch (timeType) {
            case DBDatePickerBaseOnStartOfTime:
                selectedDate = date.db_startOfCurrentDay;
                break;
            case DBDatePickerBaseOnEndOfTime:
                selectedDate = date.db_endOfCurrentDay;
                break;
            default:
                selectedDate = date;
                break;
        }
    }
    if (self.dataSource.type & DBDatePickerTypeHour) {
        switch (timeType) {
            case DBDatePickerBaseOnStartOfTime:
                selectedDate = date.db_startOfCurrentHour;
                break;
            case DBDatePickerBaseOnEndOfTime:
                selectedDate = date.db_endOfCurrentHour;
                break;
            default:
                selectedDate = date;
                break;
        }
    }
    if (self.dataSource.type & DBDatePickerTypeMinute) {
        switch (timeType) {
            case DBDatePickerBaseOnStartOfTime:
                selectedDate = date.db_startOfCurrentMinute;
                break;
            case DBDatePickerBaseOnEndOfTime:
                selectedDate = date.db_endOfCurrentMinute;
                break;
            default:
                selectedDate = date;
                break;
        }
    }
    if (self.dataSource.type & DBDatePickerTypeSeconds) {
        selectedDate = date;
    }
    if ([self.dataSource respondsToSelector:@selector(minimumDate)] && self.dataSource.minimumDate && [date compare:self.dataSource.minimumDate] == NSOrderedAscending) {
        selectedDate = self.dataSource.minimumDate;
    }
    if ([self.dataSource respondsToSelector:@selector(maximumDate)] && self.dataSource.maximumDate && [date compare:self.dataSource.maximumDate] == NSOrderedDescending) {
        selectedDate = self.dataSource.maximumDate;
    }
    self.currentDate = selectedDate;
    if (self.delegate && [self.delegate respondsToSelector:@selector(db_datePickerVC:didSelectAtDate:)]) {
        [self.delegate db_datePickerVC:self didSelectAtDate:selectedDate];
    }
}

@end
