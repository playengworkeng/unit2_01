//
//  ViewController.m
//  Uber Unit 2-01
//
//  Created by 262Hz on 7/2/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"

@interface ViewController ()

@property (weak, nonatomic) UISlider *redSlider;
@property (weak, nonatomic) UISlider *greenSlider;
@property (weak, nonatomic) UISlider *blueSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISlider *redSlider = [UISlider new];
    UISlider *greenSlider = [UISlider new];
    UISlider *blueSlider = [UISlider new];
    redSlider.tintColor = [UIColor redColor];
    greenSlider.tintColor = [UIColor greenColor];
    blueSlider.tintColor = [UIColor blueColor];
    [self.view addSubview:redSlider];
    [self.view addSubview:greenSlider];
    [self.view addSubview:blueSlider];
    self.redSlider = redSlider;
    self.greenSlider = greenSlider;
    self.blueSlider = blueSlider;
    
    [self updateBackgroundColor];
    
    [self.redSlider addTarget:self action:@selector(updateBackgroundColor) forControlEvents:UIControlEventValueChanged];
    [self.greenSlider addTarget:self action:@selector(updateBackgroundColor) forControlEvents:UIControlEventValueChanged];
    [self.blueSlider addTarget:self action:@selector(updateBackgroundColor) forControlEvents:UIControlEventValueChanged];
    
    CGFloat leadingOffset = 10;
    CGFloat trailingOffset = -10;
    CGFloat verticalSpace = 10;
    
    [self.redSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.greenSlider.mas_top).offset(-verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.greenSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.blueSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.greenSlider.mas_baseline).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateBackgroundColor {
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
}

@end
