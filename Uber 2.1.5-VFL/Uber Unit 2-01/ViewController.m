//
//  ViewController.m
//  Uber Unit 2-01
//
//  Created by 262Hz on 7/2/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "ViewController.h"

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
    
    self.redSlider.translatesAutoresizingMaskIntoConstraints = NO;
    self.greenSlider.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueSlider.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *constraintsArray = @[
    
    [NSLayoutConstraint constraintWithItem:self.redSlider attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual toItem:self.view
                                 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10],
    [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual toItem:self.redSlider
                                 attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10],
    [NSLayoutConstraint constraintWithItem:self.greenSlider attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual toItem:self.redSlider
                                 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10],
    
    [NSLayoutConstraint constraintWithItem:self.greenSlider attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual toItem:self.view
                                 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10],
    [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual toItem:self.greenSlider
                                 attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10],
    [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual toItem:self.greenSlider
                                 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0],
    
    [NSLayoutConstraint constraintWithItem:self.blueSlider attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual toItem:self.view
                                 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10],
    [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual toItem:self.blueSlider
                                 attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10],
    [NSLayoutConstraint constraintWithItem:self.blueSlider attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual toItem:self.greenSlider
                                 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10]
    
    ];
    
    [self.view addConstraints:constraintsArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateBackgroundColor {
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
}

@end
