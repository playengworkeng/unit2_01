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
    
    //Usually you would instantiate the property directly, but VFL requires local properties
    self.redSlider = redSlider;
    self.greenSlider = greenSlider;
    self.blueSlider = blueSlider;
    
    redSlider.tintColor = [UIColor redColor];
    greenSlider.tintColor = [UIColor greenColor];
    blueSlider.tintColor = [UIColor blueColor];
    [self.view addSubview:redSlider];
    [self.view addSubview:greenSlider];
    [self.view addSubview:blueSlider];
    
    [self updateBackgroundColor];
    
    [self.redSlider addTarget:self action:@selector(updateBackgroundColor) forControlEvents:UIControlEventValueChanged];
    [self.greenSlider addTarget:self action:@selector(updateBackgroundColor) forControlEvents:UIControlEventValueChanged];
    [self.blueSlider addTarget:self action:@selector(updateBackgroundColor) forControlEvents:UIControlEventValueChanged];
    
    self.redSlider.translatesAutoresizingMaskIntoConstraints = NO;
    self.greenSlider.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueSlider.translatesAutoresizingMaskIntoConstraints = NO;
    
    //VFL requires local properties, so get a local property of view:
    UIView *mainView = self.view;
    
    //center greenSlider vertically
    NSDictionary *viewsDictionary1 = NSDictionaryOfVariableBindings(mainView, greenSlider);
    NSArray *constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[mainView]-(<=1)-[greenSlider]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary1];
    [self.view addConstraints:constraintsArray];
    
    //redSlider will have 10 points of space on each side
    NSDictionary *viewsDictionary2 = NSDictionaryOfVariableBindings(redSlider);
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[redSlider]-10-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary2];
    [self.view addConstraints:constraintsArray];
    
    //redSlider will have 10 points of space vetically (on the bottom) in relation to the green slider
    NSDictionary *viewsDictionary3 = NSDictionaryOfVariableBindings(redSlider,greenSlider);
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redSlider]-10-[greenSlider]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary3];
    [self.view addConstraints:constraintsArray];
    
    //greenSlider will have 10 points of space on each side
    NSDictionary *viewsDictionary4 = NSDictionaryOfVariableBindings(greenSlider);
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[greenSlider]-10-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary4];
    [self.view addConstraints:constraintsArray];
    
    //blueSlider will have 10 points of space on each side
    NSDictionary *viewsDictionary5 = NSDictionaryOfVariableBindings(blueSlider);
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[blueSlider]-10-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary5];
    [self.view addConstraints:constraintsArray];
    
    //blueSlider will have 10 points of space vetically (on the top) in relation to the green slider
    NSDictionary *viewsDictionary6 = NSDictionaryOfVariableBindings(greenSlider,blueSlider);
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[greenSlider]-10-[blueSlider]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary6];
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
