//
//  ViewController.m
//  Uber Unit 2-01
//
//  Created by 262Hz on 7/2/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TemperatureConverter.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) UIPickerView *celciusPickerView;
@property (weak, nonatomic) UILabel *celciusLabel;
@property (weak, nonatomic) UILabel *fahrenheitLabel;

@property (strong, nonatomic) NSArray *celciusNumbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mutableCelciusNumbers = [NSMutableArray new];
    for (int i=-100; i<=100; i++) {
        [mutableCelciusNumbers addObject:@(i)];
    }
    self.celciusNumbers = [mutableCelciusNumbers copy];
    
    self.view.backgroundColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:0.18 alpha:1.0];
    
    UIPickerView *celciusPickerView = [UIPickerView new];
    celciusPickerView.dataSource = self;
    celciusPickerView.delegate = self;
    UILabel *celciusLabel = [UILabel new];
    UILabel *fahrenheitLabel = [UILabel new];
    [self.view addSubview:celciusPickerView];
    [self.view addSubview:celciusLabel];
    [self.view addSubview:fahrenheitLabel];
    self.celciusPickerView = celciusPickerView;
    self.celciusLabel = celciusLabel;
    self.fahrenheitLabel = fahrenheitLabel;
    
    UIColor *color = [UIColor colorWithHue:0.22 saturation:1.0 brightness:0.9 alpha:1.0];
    
    celciusPickerView.backgroundColor = [UIColor whiteColor];
    
    self.celciusLabel.text = @"0°C";
    self.fahrenheitLabel.text = @"32°F";
    [self.celciusLabel setFont:[UIFont boldSystemFontOfSize:60]];
    self.celciusLabel.textColor = color;
    self.celciusLabel.textAlignment = NSTextAlignmentRight;
    [self.fahrenheitLabel setFont:[UIFont boldSystemFontOfSize:60]];
    self.fahrenheitLabel.textColor = color;
    self.fahrenheitLabel.textAlignment = NSTextAlignmentRight;
    
    CGFloat leadingOffset = 20;
    CGFloat trailingOffset = -20;
    CGFloat verticalSpace = 20;
    
    [self.celciusPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
    }];
    
    [self.celciusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *topLayoutGuide = (id)self.topLayoutGuide;
        make.top.equalTo(topLayoutGuide.mas_bottom).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.fahrenheitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.celciusLabel.mas_bottom).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.celciusPickerView selectRow:100 inComponent:0 animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)updateTemperatureLabelWithCelciusValue:(float)celcius {
    float fahrenheit = [TemperatureConverter celciusToFahrenheight:celcius];
    
    self.celciusLabel.text = [NSString stringWithFormat:@"%.02f°C", celcius];
    self.fahrenheitLabel.text = [NSString stringWithFormat:@"%.02f°F", fahrenheit];
}

#pragma mark- UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.celciusNumbers.count;
}

#pragma mark- UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSNumber *celciusNumber = [self.celciusNumbers objectAtIndex:row];
    int celciusInt = [celciusNumber intValue];
    return [NSString stringWithFormat:@"%d°C", celciusInt];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSNumber *celciusNumber = [self.celciusNumbers objectAtIndex:row];
    float celciusFloat = [celciusNumber floatValue];
    [self updateTemperatureLabelWithCelciusValue:celciusFloat];
}

@end
