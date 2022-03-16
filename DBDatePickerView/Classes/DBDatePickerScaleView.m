//
//  DBDatePickerScaleView.m
//  TYDatePickerView
//
//  Created by DB on 2021/7/28.
//

#import "DBDatePickerScaleView.h"
#import <Masonry/Masonry.h>

@interface DBDatePickerScaleView()

@property (nonatomic, assign) DBDatePickerType type;
@property (nonatomic, assign) DBDatePickerComponent yearIndex;
@property (nonatomic, assign) DBDatePickerComponent monthIndex;
@property (nonatomic, assign) DBDatePickerComponent dayIndex;
@property (nonatomic, assign) DBDatePickerComponent hourIndex;
@property (nonatomic, assign) DBDatePickerComponent minuteIndex;
@property (nonatomic, assign) DBDatePickerComponent secondsIndex;
@property (nonatomic, strong) UIStackView *containerView;

@end

@implementation DBDatePickerScaleView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithType:DBDatePickerTypeYear | DBDatePickerTypeMonth | DBDatePickerTypeDay | DBDatePickerTypeHour | DBDatePickerTypeMinute | DBDatePickerTypeSeconds
                    yearIndex:DBDatePickerFirstComponent
                   monthIndex:DBDatePickerSecondryComponent
                     dayIndex:DBDatePickerThirdComponent
                    hourIndex:DBDatePickerFourthComponent
                  minuteIndex:DBDatePickerFifthComponent
                 secondsIndex:DBDatePickerSixthComponent];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    return [self initWithType:DBDatePickerTypeYear | DBDatePickerTypeMonth | DBDatePickerTypeDay | DBDatePickerTypeHour | DBDatePickerTypeMinute | DBDatePickerTypeSeconds
                    yearIndex:DBDatePickerFirstComponent
                   monthIndex:DBDatePickerSecondryComponent
                     dayIndex:DBDatePickerThirdComponent
                    hourIndex:DBDatePickerFourthComponent
                  minuteIndex:DBDatePickerFifthComponent
                 secondsIndex:DBDatePickerSixthComponent];
}

- (instancetype)initWithType:(DBDatePickerType)type
                   yearIndex:(DBDatePickerComponent)yearIndex
                  monthIndex:(DBDatePickerComponent)monthIndex
                    dayIndex:(DBDatePickerComponent)dayIndex
                   hourIndex:(DBDatePickerComponent)hourIndex
                 minuteIndex:(DBDatePickerComponent)minuteIndex
                secondsIndex:(DBDatePickerComponent)secondsIndex {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.type = type;
        self.yearIndex = yearIndex;
        self.monthIndex = monthIndex;
        self.dayIndex = dayIndex;
        self.hourIndex = hourIndex;
        self.minuteIndex = minuteIndex;
        self.secondsIndex = secondsIndex;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    UIStackView *containerView = [UIStackView new];
    containerView.axis = UILayoutConstraintAxisHorizontal;
    containerView.distribution = UIStackViewDistributionFillEqually;
    [self addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.containerView = containerView;
    
    NSArray *enumerates = @[@(DBDatePickerTypeYear),
                            @(DBDatePickerTypeMonth),
                            @(DBDatePickerTypeDay),
                            @(DBDatePickerTypeHour),
                            @(DBDatePickerTypeMinute),
                            @(DBDatePickerTypeSeconds)];
    
    NSArray *timeUnits = @[@"year",
                           @"month",
                           @"day",
                           @"hour",
                           @"minute",
                           @"second"];
    
    NSArray *indexs = @[@(self.yearIndex),
                        @(self.monthIndex),
                        @(self.dayIndex),
                        @(self.hourIndex),
                        @(self.minuteIndex),
                        @(self.secondsIndex)];
    
    for (int i = 0; i < enumerates.count; i++) {
        if (self.type & [enumerates[i] integerValue]) {
            UILabel *label = [UILabel new];
            label.textAlignment = NSTextAlignmentCenter;
            [containerView addArrangedSubview:label];
        }
    }
    
    for (int i = 0; i < indexs.count; i++) {
        NSInteger index = [indexs[i] integerValue];
        if (index >= 0 && index < containerView.arrangedSubviews.count) {
            UILabel *label = containerView.arrangedSubviews[index];
            if (label.attributedText == nil) {
                [label setAttributedText:[[NSAttributedString alloc] initWithString:timeUnits[i] attributes:@{
                    NSFontAttributeName: [UIFont systemFontOfSize:16.f weight:UIFontWeightRegular],
                    NSForegroundColorAttributeName: [UIColor colorWithWhite:0 alpha:0.7]
                }]];
            }
        }
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
