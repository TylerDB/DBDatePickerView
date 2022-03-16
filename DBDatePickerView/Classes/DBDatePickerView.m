//
//  DBDatePickerView.m
//  TYDatePickerView
//
//  Created by DB on 2021/4/15.
//

#import "DBDatePickerView.h"

#import <DBCategoryKit/DBCategoryKit.h>

@interface DBDatePickerView ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) DBDatePickerType type;
@property (nonatomic, strong) UIPickerView *datePicker;
@property (nonatomic, assign) NSInteger componentNumber;

@property (nonatomic, strong) NSMutableArray *years;
@property (nonatomic, strong) NSMutableArray *months;
@property (nonatomic, strong) NSMutableArray *days;
@property (nonatomic, strong) NSMutableArray *hours;
@property (nonatomic, strong) NSMutableArray *minutes;
@property (nonatomic, strong) NSMutableArray *seconds;

@property (nonatomic, assign) NSInteger selectedRowOfYear;
@property (nonatomic, assign) NSInteger selectedRowOfMonth;
@property (nonatomic, assign) NSInteger selectedRowOfDay;
@property (nonatomic, assign) NSInteger selectedRowOfHour;
@property (nonatomic, assign) NSInteger selectedRowOfMinute;
@property (nonatomic, assign) NSInteger selectedRowOfSeconds;

@property (nonatomic, assign) DBDatePickerComponent yearComponent;
@property (nonatomic, assign) DBDatePickerComponent monthComponent;
@property (nonatomic, assign) DBDatePickerComponent dayComponent;
@property (nonatomic, assign) DBDatePickerComponent hourComponent;
@property (nonatomic, assign) DBDatePickerComponent minuteComponent;
@property (nonatomic, assign) DBDatePickerComponent secondsComponent;

@property (nonatomic, assign) BOOL pickerSelectRowStyleDone;

@end

@implementation DBDatePickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithType:DBDatePickerTypeYear | DBDatePickerTypeMonth | DBDatePickerTypeDay | DBDatePickerTypeHour | DBDatePickerTypeMinute | DBDatePickerTypeSeconds yearComponent:DBDatePickerFirstComponent monthComponent:DBDatePickerSecondryComponent dayComponent:DBDatePickerThirdComponent hourComponent:DBDatePickerFourthComponent minuteComponent:DBDatePickerFifthComponent secondsComponent:DBDatePickerSixthComponent];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    return [self initWithType:DBDatePickerTypeYear | DBDatePickerTypeMonth | DBDatePickerTypeDay | DBDatePickerTypeHour | DBDatePickerTypeMinute | DBDatePickerTypeSeconds yearComponent:DBDatePickerFirstComponent monthComponent:DBDatePickerSecondryComponent dayComponent:DBDatePickerThirdComponent hourComponent:DBDatePickerFourthComponent minuteComponent:DBDatePickerFifthComponent secondsComponent:DBDatePickerSixthComponent];
}

- (instancetype)initWithType:(DBDatePickerType)type
               yearComponent:(DBDatePickerComponent)yearComponent
              monthComponent:(DBDatePickerComponent)monthComponent
                dayComponent:(DBDatePickerComponent)dayComponent
               hourComponent:(DBDatePickerComponent)hourComponent
             minuteComponent:(DBDatePickerComponent)minuteComponent
            secondsComponent:(DBDatePickerComponent)secondsComponent {
    if (self = [super initWithFrame:CGRectZero]) {
        self.type = type;
        self.yearComponent = self.type & DBDatePickerTypeYear ? yearComponent : DBDatePickerUnkownComponet;
        self.monthComponent = self.type & DBDatePickerTypeMonth ? monthComponent : DBDatePickerUnkownComponet;
        self.dayComponent = self.type & DBDatePickerTypeDay ? dayComponent : DBDatePickerUnkownComponet;
        self.hourComponent = self.type & DBDatePickerTypeHour ? hourComponent :DBDatePickerUnkownComponet;
        self.minuteComponent = self.type & DBDatePickerTypeMinute ? minuteComponent : DBDatePickerUnkownComponet;
        self.secondsComponent = self.type & DBDatePickerTypeSeconds ? secondsComponent : DBDatePickerUnkownComponet;
        self.years = [NSMutableArray array];
        self.months = [NSMutableArray array];
        self.days = [NSMutableArray array];
        self.hours = [NSMutableArray array];
        self.minutes = [NSMutableArray array];
        self.seconds = [NSMutableArray array];
        self.selectedRowOfYear = NSNotFound;
        self.selectedRowOfMonth = NSNotFound;
        self.selectedRowOfDay = NSNotFound;
        self.selectedRowOfHour = NSNotFound;
        self.selectedRowOfMinute = NSNotFound;
        self.selectedRowOfSeconds = NSNotFound;
        self.currentDate = [NSDate date];
        self.minimumDate = [NSDate dateWithTimeIntervalSince1970:0];
        self.maximumDate = self.currentDate;
        
        [self handleValidType];
        [self handleSameComponents];
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    UIPickerView *dataPicker = [UIPickerView new];
    dataPicker.dataSource = self;
    dataPicker.delegate = self;
    [self addSubview:dataPicker];
    self.datePicker = dataPicker;
}

- (void)reloadAllComponents {
    for (NSInteger i = 0; i < self.componentNumber; i++) {
        [self reloadComponent:i];
    }
}

- (void)reloadComponent:(DBDatePickerComponent)component {
    if (component >= 0 && component < self.componentNumber) {
        NSInteger selectedRowOfDate = NSNotFound;
        if (component == self.yearComponent) {
            [self handleYearSource];
            selectedRowOfDate = self.selectedRowOfYear;
        }
        if (component == self.monthComponent) {
            [self handleMonthSource];
            selectedRowOfDate = self.selectedRowOfMonth;
        }
        if (component == self.dayComponent) {
            [self handleDaySource];
            selectedRowOfDate = self.selectedRowOfDay;
        }
        if (component == self.hourComponent) {
            [self handleHourSource];
            selectedRowOfDate = self.selectedRowOfHour;
        }
        if (component == self.minuteComponent) {
            [self handleMinuteSource];
            selectedRowOfDate = self.selectedRowOfMinute;
        }
        if (component == self.secondsComponent) {
            [self handleSecondsSource];
            selectedRowOfDate = self.selectedRowOfSeconds;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.datePicker reloadComponent:component];
            if (selectedRowOfDate != NSNotFound) {
                [self.datePicker selectRow:selectedRowOfDate inComponent:component animated:NO];
            }
        });
        if (self.selectAfterReloadIfNeeded) {
            [self didSelectDate];
        }
    }
}

- (void)setType:(DBDatePickerType)type {
    _type = type;
    [self handleTypeTranslateComponentNumber];
}

- (void)handleTypeTranslateComponentNumber {
    NSInteger componentNumber = 0;
    if (self.type & DBDatePickerTypeYear) {
        componentNumber += 1;
    }
    if (self.type & DBDatePickerTypeMonth) {
        componentNumber += 1;
    }
    if (self.type & DBDatePickerTypeDay) {
        componentNumber += 1;
    }
    if (self.type & DBDatePickerTypeHour) {
        componentNumber += 1;
    }
    if (self.type & DBDatePickerTypeMinute) {
        componentNumber += 1;
    }
    if (self.type & DBDatePickerTypeSeconds) {
        componentNumber += 1;
    }
    self.componentNumber = componentNumber;
}

- (void)handleValidType {
    NSUInteger bit = self.type;
    NSInteger lastOneIndex = NSNotFound;
    NSInteger index = 0;
    while (bit > 0) {
        if (bit & 1) {
            if (lastOneIndex != NSNotFound && index - lastOneIndex > 1) {
                NSAssert(NO, @"please make type valid");
                break;
            }else {
                lastOneIndex = index;
            }
        }
        index += 1;
        bit = bit >> 1;
    }
}

- (void)handleSameComponents {
    NSMutableDictionary *validComponentMap = [NSMutableDictionary dictionary];
    if ([[validComponentMap objectForKey:@(self.yearComponent)] boolValue]) {
        self.yearComponent = DBDatePickerUnkownComponet;
    }else {
        [validComponentMap setObject:@(YES) forKey:@(self.yearComponent)];
    }
    if ([[validComponentMap objectForKey:@(self.monthComponent)] boolValue]) {
        self.monthComponent = DBDatePickerUnkownComponet;
    }else {
        [validComponentMap setObject:@(YES) forKey:@(self.monthComponent)];
    }
    if ([[validComponentMap objectForKey:@(self.dayComponent)] boolValue]) {
        self.dayComponent = DBDatePickerUnkownComponet;
    }else {
        [validComponentMap setObject:@(YES) forKey:@(self.dayComponent)];
    }
    if ([[validComponentMap objectForKey:@(self.hourComponent)] boolValue]) {
        self.hourComponent = DBDatePickerUnkownComponet;
    }else {
        [validComponentMap setObject:@(YES) forKey:@(self.hourComponent)];
    }
    if ([[validComponentMap objectForKey:@(self.minuteComponent)] boolValue]) {
        self.minuteComponent = DBDatePickerUnkownComponet;
    }else {
        [validComponentMap setObject:@(YES) forKey:@(self.minuteComponent)];
    }
    if ([[validComponentMap objectForKey:@(self.secondsComponent)] boolValue]) {
        self.secondsComponent = DBDatePickerUnkownComponet;
    }else {
        [validComponentMap setObject:@(YES) forKey:@(self.secondsComponent)];
    }
}

- (void)setCurrentDate:(NSDate *)currentDate {
    _currentDate = currentDate;
    [self handleYearSource];
    [self handleMonthSource];
    [self handleDaySource];
    [self handleHourSource];
    [self handleMinuteSource];
    [self handleSecondsSource];
}

- (void)handleYearSource {
    if (self.type & DBDatePickerTypeYear) {
        self.selectedRowOfYear = NSNotFound;
        [self updateYearSource];
    }
}

- (void)handleMonthSource {
    if (self.type & DBDatePickerTypeMonth) {
        self.selectedRowOfMonth = NSNotFound;
        [self updateMonthSource];
    }
}

- (void)handleDaySource {
    if (self.type & DBDatePickerTypeDay) {
        self.selectedRowOfDay = NSNotFound;
        [self updateDaySource];
    }
}

- (void)handleHourSource {
    if (self.type & DBDatePickerTypeHour) {
        self.selectedRowOfHour = NSNotFound;
        [self updateHourSource];
    }
}

- (void)handleMinuteSource {
    if (self.type & DBDatePickerTypeMinute) {
        self.selectedRowOfMinute = NSNotFound;
        [self updateMinuteSource];
    }
}

- (void)handleSecondsSource {
    if (self.type & DBDatePickerTypeSeconds) {
        self.selectedRowOfSeconds = NSNotFound;
        [self updateSecondsSource];
    }
}

- (void)updateYearSource {
    
    NSInteger currentYear = self.currentDate.db_year;
    
    NSInteger minimumYear = 1970;
    if (self.minimumDate && self.minimumDate.db_year <= currentYear) {
        // 确保最小年份有效（minYear <= currentYear）
        minimumYear = self.minimumDate.db_year;
    }
    
    NSInteger maximumYear = currentYear;
    if (self.maximumDate && self.maximumDate.db_year >= currentYear) {
        // 确保最大年份有效（maxYear >= currentYear）
        maximumYear = self.maximumDate.db_year;
    }
    
    [self.years removeAllObjects];
    
    for (NSInteger year = minimumYear; year <= maximumYear; year++) {
        [self.years addObject:@(year)];
        if (year == currentYear) {
            // 默认选中年份（currentYear）
            self.selectedRowOfYear = self.years.count - 1;
        }
    }
    
}

- (void)updateMonthSource {
    
    // 确保最小月份有效
    NSInteger minimumMonth = self.minimumDate.db_month ? : 1;
    
    if (self.years.count && self.selectedRowOfYear > 0) {
        // 在当前选中年份大于最小年份前提下，最小月份为1
        minimumMonth = 1;
    }
    
    // 当前月份
    NSInteger currentMonth = self.currentDate.db_month;
    
    // 确保最大月份有效
    NSInteger maximumMonth = MAX(self.maximumDate.db_month ? : currentMonth, minimumMonth) ;
    
    if (self.years.count && self.selectedRowOfYear < self.years.count - 1) {
        // 在当前选中年份小于最大年份前提下，最大月份为12
        maximumMonth = 12;
    }
    
    // 确保上次选中月份有效
    if (self.months.count && self.selectedRowOfMonth != NSNotFound) {
        currentMonth = [self.months[self.selectedRowOfMonth] integerValue];
        if (self.years.count && self.selectedRowOfYear != NSNotFound) {
            if (self.selectedRowOfYear == 0) {
                // 在当前选中年份为最小年份前提下，确保上次选中月份不能小于最小月份
                currentMonth = MAX(currentMonth, minimumMonth);
            }
            if (self.selectedRowOfYear == self.years.count - 1) {
                // 在当前选中年份为最大年份前提下，确保上次选中月份不能大于最大月份
                currentMonth = MIN(currentMonth, maximumMonth);
            }
        }
    }
    
    [self.months removeAllObjects];

    for (NSInteger month = minimumMonth; month <= maximumMonth; month++) {
        [self.months addObject:@(month)];
        if (month == currentMonth) {
            // 默认选中月份（currentMonth）
            self.selectedRowOfMonth = self.months.count - 1;
        }
    }
}

- (void)updateDaySource {
    
    // 确保最小日份有效
    NSInteger minimumDay = self.minimumDate.db_day ? : 1;
    
    if ((self.years.count && self.selectedRowOfYear > 0) || (self.months.count && self.selectedRowOfMonth > 0)) {
        /*  在当前选中年份大于最小年份或者
            当前选中月份大于最小月份前提下，最小日份为1 */
        minimumDay = 1;
    }
    
    // 当前日份
    NSInteger currentDay = self.currentDate.db_day;
    
    // 获取最新选中日期
    NSDate *lastSelectedYearMonthDay = [self fetchLastSelectedDate];
        
    // 确保最大日份有效
    NSInteger maximumDay = MAX(self.maximumDate.db_day ? : currentDay, minimumDay);
    
    if ((self.years.count && self.selectedRowOfYear < self.years.count - 1) || (self.months.count && self.selectedRowOfMonth < self.months.count - 1)) {
        /*  在当前选中年份小于最大年份或者
            当前选中月份小于最大月份前提下，最大日份为最新选中日期的月末 */
//        maximumDay = [TYDatePickerUtil ty_dp_endMonthWithDate:lastSelectedYearMonthDay].ty_day;
        maximumDay = lastSelectedYearMonthDay.db_endOfCurrentMonth.db_day;
    }
    
    // 确保上次选中日份有效
    if (self.days.count && self.selectedRowOfDay != NSNotFound) {
        currentDay = [self.days[self.selectedRowOfDay] integerValue];
        if ((self.years.count && self.selectedRowOfYear != NSNotFound) && (self.months.count && self.selectedRowOfMonth != NSNotFound)) {
            /*  在当前选中年份为最小年份且
                当前选中月份为最小月份前提下，确保上次选中日份不能小于最小日份 */
            if (self.selectedRowOfYear == 0 && self.selectedRowOfMonth == 0) {
                currentDay = MAX(currentDay, minimumDay);
            }
            /*  在当前选中年份为最大年份且
                当前选中月份为最大月份前提下，确保上次选中日份不能大于最大日份 */
            if (self.selectedRowOfYear == self.years.count - 1 && self.selectedRowOfMonth == self.months.count - 1) {
                currentDay = MIN(currentDay, maximumDay);
            }
        }
    }

    [self.days removeAllObjects];

    for (NSInteger day = minimumDay; day <= maximumDay; day++) {
        [self.days addObject:@(day)];
        if (day == currentDay) {
            // 默认选中日份（currentDay）
            self.selectedRowOfDay = self.days.count - 1;
        }
    }
}

- (void)updateHourSource {
    // 确保最小小时数有效
    NSInteger minimumHour = self.minimumDate.db_hour ? : 0;
    
    if ((self.years.count && self.selectedRowOfYear > 0) ||
        (self.months.count && self.selectedRowOfMonth > 0) ||
        (self.days.count && self.selectedRowOfDay > 0)) {
        /*  在当前选中年份大于最小年份或者
            当前选中月份大于最小月份或者
            当前选中日份大于最小日份前提下，最小小时数为0 */
        minimumHour = 0;
    }
    
    // 当前小时数
    NSInteger currentHour = self.currentDate.db_hour;
    
    // 确保最大小时数有效
    NSInteger maximumHour = MAX(self.maximumDate.db_hour ? : currentHour, minimumHour);
    
    if ((self.years.count && self.selectedRowOfYear < self.years.count - 1) ||
        (self.months.count && self.selectedRowOfMonth < self.months.count - 1) ||
        (self.days.count && self.selectedRowOfDay < self.days.count - 1)) {
        /*  在当前选中年份小于最大年份或者
            当前选中月份小于最大月份或者
            当前选中日份小于最大日份前提下，最大小时数为23 */
        maximumHour = 23;
    }
    
    // 确保上次选中小时有效
    if (self.hours.count && self.selectedRowOfHour != NSNotFound) {
        currentHour = [self.hours[self.selectedRowOfHour] integerValue];
        if ((self.years.count && self.selectedRowOfYear != NSNotFound) &&
            (self.months.count && self.selectedRowOfMonth != NSNotFound) &&
            (self.days.count && self.selectedRowOfDay != NSNotFound)) {
            /*  在当前选中年份为最小年份且
                当前选中月份为最小月份且
                当前选中日份为最小日份前提下，确保上次选中小时数不能小于最小小时数 */
            if (self.selectedRowOfYear == 0 &&
                self.selectedRowOfMonth == 0 &&
                self.selectedRowOfDay == 0) {
                currentHour = MAX(currentHour, minimumHour);
            }
            /*  在当前选中年份为最大年份且
                当前选中月份为最大月份且
                当前选中日份为最大日份前提下，确保上次选中小时数不能大于最大小时数 */
            if (self.selectedRowOfYear == self.years.count - 1 &&
                self.selectedRowOfMonth == self.months.count - 1 &&
                self.selectedRowOfDay == self.days.count - 1) {
                currentHour = MIN(currentHour, maximumHour);
            }
        }
    }
    
    [self.hours removeAllObjects];

    for (NSInteger hour = minimumHour; hour <= maximumHour; hour++) {
        [self.hours addObject:@(hour)];
        if (hour == currentHour) {
            // 默认选中小时数（currentHour）
            self.selectedRowOfHour = self.hours.count - 1;
        }
    }
}

- (void)updateMinuteSource {
    // 确保最小分钟数有效
    NSInteger minimumMinute = self.minimumDate.db_minute ? : 0;
    
    if ((self.years.count && self.selectedRowOfYear > 0) ||
        (self.months.count && self.selectedRowOfMonth > 0) ||
        (self.days.count && self.selectedRowOfDay > 0) ||
        (self.hours.count && self.selectedRowOfHour > 0)) {
        /*  在当前选中年份大于最小年份或者
            当前选中月份大于最小月份或者
            当前选中日份大于最小日份或者
            当前选中小时数大于最小小时数前提下，最小分钟数为0
         */
        minimumMinute = 0;
    }
    
    // 当前分钟数
    NSInteger currentMinute = self.currentDate.db_minute;
    
    // 确保最大分钟数有效
    NSInteger maximumMinute = MAX(self.maximumDate.db_minute ? : currentMinute, minimumMinute);
    
    if ((self.years.count && self.selectedRowOfYear < self.years.count - 1) ||
        (self.months.count && self.selectedRowOfMonth < self.months.count - 1) ||
        (self.days.count && self.selectedRowOfDay < self.days.count - 1) ||
        (self.hours.count && self.selectedRowOfHour < self.hours.count - 1)) {
        /*  在当前选中年份小于最大年份或者
            当前选中月份小于最大月份或者
            当前选中日份小于最大日份或者
            当前选中小时数小于最大小时数前提下，最大分钟数为59 */
        maximumMinute = 59;
    }
    
    // 确保上次选中分钟有效
    if (self.minutes.count && self.selectedRowOfMinute != NSNotFound) {
        currentMinute = [self.minutes[self.selectedRowOfMinute] integerValue];
        if ((self.years.count && self.selectedRowOfYear != NSNotFound) &&
            (self.months.count && self.selectedRowOfMonth != NSNotFound) &&
            (self.days.count && self.selectedRowOfDay != NSNotFound) &&
            (self.hours.count && self.selectedRowOfHour != NSNotFound)) {
            /*  在当前选中年份为最小年份且
                当前选中月份为最小月份且
                当前选中日份为最小日份且
                当前选中小时数为最小小时数前提下，确保上次选中分钟数不能小于最小分钟数 */
            if (self.selectedRowOfYear == 0 &&
                self.selectedRowOfMonth == 0 &&
                self.selectedRowOfDay == 0 &&
                self.selectedRowOfHour == 0) {
                currentMinute = MAX(currentMinute, minimumMinute);
            }
            /*  在当前选中年份为最大年份且
                当前选中月份为最大月份且
                当前选中日份为最大日份且
                当前选中小时数为最大小时数前提下，确保上次选中分钟数不能大于最大分钟数 */
            if (self.selectedRowOfYear == self.years.count - 1 &&
                self.selectedRowOfMonth == self.months.count - 1 &&
                self.selectedRowOfDay == self.days.count - 1 &&
                self.selectedRowOfHour == self.hours.count - 1) {
                currentMinute = MIN(currentMinute, maximumMinute);
            }
        }
    }
    
    [self.minutes removeAllObjects];

    for (NSInteger minute = minimumMinute; minute <= maximumMinute; minute++) {
        [self.minutes addObject:@(minute)];
        if (minute == currentMinute) {
            // 默认选中分钟数（currentMinute）
            self.selectedRowOfMinute = self.minutes.count - 1;
        }
    }
}

- (void)updateSecondsSource {
    // 确保最小秒数有效
    NSInteger minimumSeconds = self.minimumDate.db_second ? : 0;
    
    if ((self.years.count && self.selectedRowOfYear > 0) ||
        (self.months.count && self.selectedRowOfMonth > 0) ||
        (self.days.count && self.selectedRowOfDay > 0) ||
        (self.hours.count && self.selectedRowOfHour > 0) ||
        (self.minutes.count && self.selectedRowOfMinute > 0)) {
        /*  在当前选中年份大于最小年份或者
            当前选中月份大于最小月份或者
            当前选中日份大于最小日份或者
            当前选中小时数大于最小小时数或者
            当前选中分钟数大于最小分钟数前提下，最小秒数为0
         */
        minimumSeconds = 0;
    }
    
    // 当前秒数
    NSInteger currentSeconds = self.currentDate.db_second;
    
    // 确保最大秒数有效
    NSInteger maximumSeconds = MAX(self.maximumDate.db_second ? : currentSeconds, minimumSeconds);
    
    if ((self.years.count && self.selectedRowOfYear < self.years.count - 1) ||
        (self.months.count && self.selectedRowOfMonth < self.months.count - 1) ||
        (self.days.count && self.selectedRowOfDay < self.days.count - 1) ||
        (self.hours.count && self.selectedRowOfHour < self.hours.count - 1) ||
        (self.minutes.count && self.selectedRowOfMinute < self.minutes.count - 1)) {
        /*  在当前选中年份小于最大年份或者
            当前选中月份小于最大月份或者
            当前选中日份小于最大日份或者
            当前选中小时数小于最大小时数或者
            当前选中分钟数小于最大分钟数前提下，最大秒数为59 */
        maximumSeconds = 59;
    }
    
    // 确保上次选中秒数有效
    if (self.seconds.count && self.selectedRowOfSeconds != NSNotFound) {
        currentSeconds = [self.seconds[self.selectedRowOfSeconds] integerValue];
        if ((self.years.count && self.selectedRowOfYear != NSNotFound) &&
            (self.months.count && self.selectedRowOfMonth != NSNotFound) &&
            (self.days.count && self.selectedRowOfDay != NSNotFound) &&
            (self.hours.count && self.selectedRowOfHour != NSNotFound) &&
            (self.minutes.count && self.selectedRowOfMinute != NSNotFound)) {
            /*  在当前选中年份为最小年份且
                当前选中月份为最小月份且
                当前选中日份为最小日份且
                当前选中小时数为最小小时数且
                当前选中分钟数为最小分钟数前提下，确保上次选中秒数不能小于最小秒数 */
            if (self.selectedRowOfYear == 0 &&
                self.selectedRowOfMonth == 0 &&
                self.selectedRowOfDay == 0 &&
                self.selectedRowOfHour == 0 &&
                self.selectedRowOfMinute == 0) {
                currentSeconds = MAX(currentSeconds, minimumSeconds);
            }
            /*  在当前选中年份为最大年份且
                当前选中月份为最大月份且
                当前选中日份为最大日份且
                当前选中小时数为最大小时数且
                当前选中分钟数为最大分钟数前提下，确保上次选中秒数不能大于最大秒数 */
            if (self.selectedRowOfYear == self.years.count - 1 &&
                self.selectedRowOfMonth == self.months.count - 1 &&
                self.selectedRowOfDay == self.days.count - 1 &&
                self.selectedRowOfHour == self.hours.count - 1 &&
                self.selectedRowOfMinute == self.minutes.count - 1) {
                currentSeconds = MIN(currentSeconds, maximumSeconds);
            }
        }
    }
    
    [self.seconds removeAllObjects];

    for (NSInteger seconds = minimumSeconds; seconds <= maximumSeconds; seconds++) {
        [self.seconds addObject:@(seconds)];
        if (seconds == currentSeconds) {
            // 默认选中秒数（currentSeconds）
            self.selectedRowOfSeconds = self.seconds.count - 1;
        }
    }
}

- (NSDate *)fetchLastSelectedDate {
    NSString *lastSelectedDateString = @"";
    
    if (self.years.count && self.selectedRowOfYear != NSNotFound) {
        lastSelectedDateString = [NSString stringWithFormat:@"%@", self.years[self.selectedRowOfYear]];
    }else {
        lastSelectedDateString = [NSString stringWithFormat:@"%zd", self.currentDate.db_year];
    }
    
    if (self.months.count && self.selectedRowOfMonth != NSNotFound) {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@"-%@", self.months[self.selectedRowOfMonth]];
    }else {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@"-%zd", self.currentDate.db_month];
    }
        
    // 通过 selectedYear - selectedMonth - 01 00 : 00 : 00 反推月末时间
    NSDate *endMonthDate = [NSDate db_dateWithString:[lastSelectedDateString stringByAppendingString:@"-01 00:00:00"] format:@"yyyy-MM-dd HH:mm:ss"].db_endOfCurrentMonth;

    if (self.days.count && self.selectedRowOfDay != NSNotFound) {
        //确保selectedRowOfDay合理有效
        self.selectedRowOfDay = MAX(0, MIN(self.selectedRowOfDay, endMonthDate.db_day - 1));
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@"-%@", self.days[self.selectedRowOfDay]];
    }else {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@"-%zd", MIN(self.currentDate.db_day, endMonthDate.db_day)];
    }
    
    lastSelectedDateString = [lastSelectedDateString stringByAppendingString:@" "];
    
    if (self.hours.count && self.selectedRowOfHour != NSNotFound) {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@"%@", self.hours[self.selectedRowOfHour]];
    }else {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@"%zd", self.currentDate.db_hour];
    }
    
    if (self.minutes.count && self.selectedRowOfMinute != NSNotFound) {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@":%@", self.minutes[self.selectedRowOfMinute]];
    }else {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@":%zd", self.currentDate.db_minute];
    }
    
    if (self.seconds.count && self.selectedRowOfSeconds != NSNotFound) {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@":%@", self.seconds[self.selectedRowOfSeconds]];
    }else {
        lastSelectedDateString = [lastSelectedDateString stringByAppendingFormat:@":%zd", self.currentDate.db_second];
    }
        
    NSDate *date = [NSDate db_dateWithString:lastSelectedDateString format:@"yyyy-MM-dd HH:mm:ss"];
         
    return date;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.componentNumber;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == self.yearComponent) {
        return self.years.count;
    }
    if (component == self.monthComponent) {
        return self.months.count;
    }
    if (component == self.dayComponent) {
        return self.days.count;
    }
    if (component == self.hourComponent) {
        return self.hours.count;
    }
    if (component == self.minuteComponent) {
        return self.minutes.count;
    }
    if (component == self.secondsComponent) {
        return self.seconds.count;
    }
    return 0;
}

#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return (self.bounds.size.width - 20.f) / MAX(self.componentNumber, 1);
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 55.f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *dateStr = @"";
    if (component == self.yearComponent) {
        dateStr = [NSString stringWithFormat:@"%@", self.years[row]];
    }
    if (component == self.monthComponent) {
        dateStr = [NSString stringWithFormat:@"%@", self.months[row]];
    }
    if (component == self.dayComponent) {
        dateStr = [NSString stringWithFormat:@"%@", self.days[row]];
    }
    if (component == self.hourComponent) {
        dateStr = [NSString stringWithFormat:@"%@", self.hours[row]];
    }
    if (component == self.minuteComponent) {
        dateStr = [NSString stringWithFormat:@"%@", self.minutes[row]];
    }
    if (component == self.secondsComponent) {
        dateStr = [NSString stringWithFormat:@"%@", self.seconds[row]];
    }
    return dateStr;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel *pickerLabel = (UILabel*)view;
        
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        [pickerLabel setTextColor:self.normalTextColor ? : [UIColor colorWithWhite:0 alpha:0.3]];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:self.textFont ? : [UIFont systemFontOfSize:16.f weight:UIFontWeightMedium]];
    }
    
    if ((component == self.yearComponent && row == self.selectedRowOfYear) ||
        (component == self.monthComponent && row == self.selectedRowOfMonth) ||
        (component == self.dayComponent && row == self.selectedRowOfDay) ||
        (component == self.hourComponent && row == self.selectedRowOfHour) ||
        (component == self.minuteComponent && row == self.selectedRowOfMinute) ||
        (component == self.secondsComponent && row == self.selectedRowOfSeconds)) {
        [pickerLabel setTextColor:self.currentSelectedTextColor ? : [UIColor colorWithWhite:0 alpha:0.3]];
    }
    
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == self.yearComponent) {
        self.selectedRowOfYear = row;
        [self updateMonthSourceAndSelectDefaultMonth];
        [self updateDaySourceAndSelectDefaultDay];
        [self updateHourSourceAndSelectDefaultHour];
        [self updateMinuteSourceAndSelectDefaultMinute];
        [self updateSecondsSourceAndSelectDefaultSeconds];
    }
    if (component == self.monthComponent) {
        self.selectedRowOfMonth = row;
        [self updateDaySourceAndSelectDefaultDay];
        [self updateHourSourceAndSelectDefaultHour];
        [self updateMinuteSourceAndSelectDefaultMinute];
        [self updateSecondsSourceAndSelectDefaultSeconds];
    }
    if (component == self.dayComponent) {
        self.selectedRowOfDay = row;
        [self updateHourSourceAndSelectDefaultHour];
        [self updateMinuteSourceAndSelectDefaultMinute];
        [self updateSecondsSourceAndSelectDefaultSeconds];
    }
    if (component == self.hourComponent) {
        self.selectedRowOfHour = row;
        [self updateMinuteSourceAndSelectDefaultMinute];
        [self updateSecondsSourceAndSelectDefaultSeconds];
    }
    if (component == self.minuteComponent) {
        self.selectedRowOfMinute = row;
        [self updateSecondsSourceAndSelectDefaultSeconds];
    }
    if (component == self.secondsComponent) {
        self.selectedRowOfSeconds = row;
    }
    [pickerView reloadComponent:component];
    
    [self didSelectDate];
}

- (void)didSelectDate {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ty_datePickerView:didSelectAtDate:)]) {
        NSDate *lastSelectedDate = [self fetchLastSelectedDate];
        [self.delegate ty_datePickerView:self didSelectAtDate:lastSelectedDate];
    }
}

#pragma mark - update source and select

- (void)updateMonthSourceAndSelectDefaultMonth {
    if (self.type & DBDatePickerTypeMonth) {
        [self updateMonthSource];
    }
    if (self.monthComponent != NSNotFound && self.monthComponent >= 0 && self.monthComponent < self.componentNumber) {
        [self.datePicker reloadComponent:self.monthComponent];
        if (self.selectedRowOfMonth != NSNotFound) {
            [self.datePicker selectRow:self.selectedRowOfMonth inComponent:self.monthComponent animated:NO];
        }
    }
}

- (void)updateDaySourceAndSelectDefaultDay {
    if (self.type & DBDatePickerTypeDay) {
        [self updateDaySource];
    }
    if (self.dayComponent != NSNotFound && self.dayComponent >= 0 && self.dayComponent < self.componentNumber) {
        [self.datePicker reloadComponent:self.dayComponent];
        if (self.selectedRowOfDay != NSNotFound) {
            [self.datePicker selectRow:self.selectedRowOfDay inComponent:self.dayComponent animated:NO];
        }
    }
}

- (void)updateHourSourceAndSelectDefaultHour {
    if (self.type & DBDatePickerTypeHour) {
        [self updateHourSource];
    }
    if (self.hourComponent != NSNotFound && self.hourComponent >= 0 && self.hourComponent < self.componentNumber) {
        [self.datePicker reloadComponent:self.hourComponent];
        if (self.selectedRowOfHour != NSNotFound) {
            [self.datePicker selectRow:self.selectedRowOfHour inComponent:self.hourComponent animated:NO];
        }
    }
}

- (void)updateMinuteSourceAndSelectDefaultMinute {
    if (self.type & DBDatePickerTypeMinute) {
        [self updateMinuteSource];
    }
    if (self.minuteComponent != NSNotFound && self.minuteComponent >= 0 && self.minuteComponent < self.componentNumber) {
        [self.datePicker reloadComponent:self.minuteComponent];
        if (self.selectedRowOfMinute != NSNotFound) {
            [self.datePicker selectRow:self.selectedRowOfMinute inComponent:self.minuteComponent animated:NO];
        }
    }
}

- (void)updateSecondsSourceAndSelectDefaultSeconds {
    if (self.type & DBDatePickerTypeSeconds) {
        [self updateSecondsSource];
    }
    if (self.secondsComponent != NSNotFound && self.secondsComponent >= 0 && self.secondsComponent < self.componentNumber) {
        [self.datePicker reloadComponent:self.secondsComponent];
        if (self.selectedRowOfSeconds != NSNotFound) {
            [self.datePicker selectRow:self.selectedRowOfSeconds inComponent:self.secondsComponent animated:NO];
        }
    }
}

#pragma mark - 设置选择器中间选中行的样式
- (void)setupPickerSelectRowStyle {
    // 1.设置分割线的颜色
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if (systemVersion.doubleValue < 14.0) {
        for (UIView *subView in self.datePicker.subviews) {
            if (subView && [subView isKindOfClass:[UIView class]] && subView.frame.size.height <= 1) {
                subView.backgroundColor = [UIColor db_colorWithHex:0xE2E4EA];
            }
        }
    }
    
    UIView *contentView = nil;
    NSArray *subviews = self.datePicker.subviews;
    if (subviews.count > 0) {
        id firstView = subviews.firstObject;
        if (firstView && [firstView isKindOfClass:[UIView class]]) {
            contentView = (UIView *)firstView;
        }
    }
    
    if (contentView) {
        if (systemVersion.doubleValue >= 14.0) {
            // 2.隐藏中间选择行的背景样式
            id lastView = subviews.lastObject;
            if (lastView && [lastView isKindOfClass:[UIView class]]) {
                UIView *rectBgView = (UIView *)lastView;
                rectBgView.backgroundColor = [UIColor clearColor];
            }
            
            // 3.清除iOS14上选择器默认的内边距
            [self setPickerAllSubViewsStyle:contentView];
        }
    }
}

// 遍历子视图，重新设置 frame（清空在 iOS14 上 UIPickerView 出现的内边距）
- (void)setPickerAllSubViewsStyle:(UIView *)view {
    NSArray *subViews = view.subviews;
    if (subViews.count == 0 || [view isKindOfClass:[UILabel class]]) return;
    for (UIView *subView in subViews) {
        NSString *className = NSStringFromClass([subView class]);
        if ([className isEqualToString:@"UIPickerColumnView"]) {
            CGRect rect = subView.frame;
            rect.origin.x = 0;
            rect.size.width = view.bounds.size.width;
            subView.frame = rect;
        }
        NSString *superClassName = NSStringFromClass([view class]);
        if ([superClassName isEqualToString:@"UIPickerColumnView"]) {
            CGRect rect = subView.frame;
            rect.size.width = view.bounds.size.width;
            subView.frame = rect;
        }
        if ([subView isKindOfClass:[UILabel class]]) {
            CGRect rect = subView.frame;
            rect.origin.x = 10;
            subView.frame = rect;
        }
        
        [self setPickerAllSubViewsStyle:subView];
    }
}

#pragma mark - 添加选择器中间行上下两条分割线（iOS14之后系统默认去掉，需要手动添加）
- (void)addSeparatorLineView {
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 14.0) {
        UIView *topLineView = [[UIView alloc]initWithFrame:CGRectMake(0, (self.datePicker.bounds.size.height - 55.f) / 2, self.datePicker.bounds.size.width, 0.5f)];
        topLineView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        topLineView.backgroundColor = [UIColor db_colorWithHex:0xE2E4EA];
        [self.datePicker addSubview:topLineView];
        
        UIView *bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, (self.datePicker.bounds.size.height + 55.f) / 2, self.datePicker.bounds.size.width, 0.5f)];
        bottomLineView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        bottomLineView.backgroundColor = [UIColor db_colorWithHex:0xE2E4EA];
        [self.datePicker addSubview:bottomLineView];
    }
}

#pragma mark - layout

- (void)layoutSubviews {
    [super layoutSubviews];
    self.datePicker.frame = self.bounds;
    if (!self.pickerSelectRowStyleDone) {
        self.pickerSelectRowStyleDone = YES;
        [self setupPickerSelectRowStyle];
        [self addSeparatorLineView];
    }
}

@end
