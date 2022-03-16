//
//  DBViewController.m
//  DBDatePickerView
//
//  Created by db on 03/16/2022.
//  Copyright (c) 2022 db. All rights reserved.
//

#import "DBViewController.h"

#import <Masonry/Masonry.h>
#import <DBDatePickerView/DBDatePickerViewController.h>

@interface DBViewController ()<DBDatePickerViewControllerDateSource, DBDatePickerViewControllerDelegate>

@property (nonatomic, strong) DBDatePickerViewController *pickerVC;
@property (nonatomic, assign) DBDatePickerTimeType pickerTimeType;
@property (nonatomic, copy) NSArray *pickerTimeTitles;

@end

@implementation DBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"TYDatePickerTestVC";
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    
    self.pickerTimeType = DBDatePickerBaseOnCurrentTime;
    self.pickerTimeTitles = @[@"currentTime", @"startOfTime", @"endOfTime"];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:UIColor.lightGrayColor];
    [btn setAttributedTitle:[[NSAttributedString alloc] initWithString:@"popup" attributes:@{
        NSForegroundColorAttributeName: UIColor.blackColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    }] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(100);
        make.centerX.offset(0);
        make.width.height.mas_equalTo(100);
    }];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundColor:UIColor.lightGrayColor];
    [btn1 setAttributedTitle:[[NSAttributedString alloc] initWithString:self.pickerTimeTitles.firstObject attributes:@{
        NSForegroundColorAttributeName: UIColor.blackColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    }] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_bottom).offset(8);
        make.centerX.offset(0);
        make.width.height.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.pickerVC.view];
    [self.pickerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottomLayoutGuideBottom).offset(0);
        make.leading.trailing.offset(0);
        make.height.mas_equalTo(373);
    }];
}

- (void)btnAction:(UIButton *)sender {
    [UIView animateWithDuration:1.f animations:^{
        [self.pickerVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_bottomLayoutGuideBottom).offset(-373);
        }];
        [self.view layoutIfNeeded];
    }];
}

- (void)btn1Action:(UIButton *)sender {
    self.pickerTimeType = (self.pickerTimeType + 1) % 3;
    [sender setAttributedTitle:[[NSAttributedString alloc] initWithString:self.pickerTimeTitles[self.pickerTimeType] attributes:@{
        NSForegroundColorAttributeName: UIColor.blackColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    }] forState:UIControlStateNormal];
}

- (DBDatePickerViewController *)pickerVC {
    if (!_pickerVC) {
        _pickerVC = [DBDatePickerViewController new];
        _pickerVC.dataSource = self;
        _pickerVC.delegate = self;
    }
    return _pickerVC;
}

#pragma mark - TYDatePickerViewControllerDateSource

- (DBDatePickerType)type {
    return DBDatePickerTypeYear | DBDatePickerTypeMonth | DBDatePickerTypeDay | DBDatePickerTypeHour | DBDatePickerTypeMinute | DBDatePickerTypeSeconds;
}

- (DBDatePickerComponent)yearComponent {
    return DBDatePickerFirstComponent;
}

- (DBDatePickerComponent)monthComponent {
    return DBDatePickerSecondryComponent;
}

- (DBDatePickerComponent)dayComponent {
    return DBDatePickerThirdComponent;
}

- (DBDatePickerComponent)hourComponent {
    return DBDatePickerFourthComponent;
}

- (DBDatePickerComponent)minuteComponent {
    return DBDatePickerFifthComponent;
}

- (DBDatePickerComponent)secondsComponent {
    return DBDatePickerSixthComponent;
}

- (NSArray<DBDatePickerViewTopConfig *> *)configs {
    DBDatePickerViewTopConfig *cancelConfig = [DBDatePickerViewTopConfig new];
    cancelConfig.type = DBDatePickerTopConfigCancel;
    cancelConfig.itemTitle = [[NSAttributedString alloc] initWithString:@"cancel" attributes:@{
        NSForegroundColorAttributeName: UIColor.redColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    }];
    __weak typeof(self) weakSelf = self;
    cancelConfig.itemCallback = ^(NSDate * _Nullable date) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [UIView animateWithDuration:1.f animations:^{
            [strongSelf.pickerVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(strongSelf.mas_bottomLayoutGuideBottom).offset(0);
            }];
            [strongSelf.view layoutIfNeeded];
        }];
    };
    cancelConfig.itemWidth = 60.f;
    cancelConfig.itemIdentifier = @"cancel";
    
    DBDatePickerViewTopConfig *titleConfig = [DBDatePickerViewTopConfig new];
    titleConfig.type = DBDatePickerTopConfigCustom;
    titleConfig.itemTitle = [[NSAttributedString alloc] initWithString:@"datePicker" attributes:@{
        NSForegroundColorAttributeName: UIColor.blueColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    }];
    titleConfig.itemCallback = ^(NSDate * _Nullable date) {
        
    };
    titleConfig.itemWidth = CGRectGetWidth(self.view.bounds) - 120.f;
    titleConfig.itemIdentifier = @"title";
    
    DBDatePickerViewTopConfig *doneConfig = [DBDatePickerViewTopConfig new];
    doneConfig.type = DBDatePickerTopConfigConfirm;
    doneConfig.itemTitle = [[NSAttributedString alloc] initWithString:@"done" attributes:@{
        NSForegroundColorAttributeName: UIColor.greenColor,
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    }];
    doneConfig.itemCallback = ^(NSDate * _Nullable date) {
        
    };
    doneConfig.itemWidth = 60.f;
    doneConfig.itemIdentifier = @"done";
    
    return @[cancelConfig, titleConfig, doneConfig];
}

- (DBDatePickerTimeType)timeType {
    return self.pickerTimeType;
}

#pragma mark - TYDatePickerViewControllerDelegate

- (void)db_datePickerVC:(DBDatePickerViewController *)vc didSelectAtDate:(NSDate *)date {
    NSLog(@"====== selected date is: %@ ======", date);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
