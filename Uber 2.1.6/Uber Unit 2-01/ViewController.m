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

@interface ViewController ()

@property(weak, nonatomic)UISlider* degreesSlider;
@property(weak, nonatomic)UISlider* farenhtSlider;
@property(weak, nonatomic)UILabel* degreesC;
@property(weak, nonatomic)UILabel* degreesF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat height = 50;
    CGFloat width = self.view.frame.size.width;
    self.view.backgroundColor = [UIColor colorWithRed:.2 green:.1 blue:.5 alpha:1];

    
    //Create the labels and sliders

    UILabel* degreesC = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 25, 25)];
    UILabel* degreesF = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 25, 25)];
    
    UISlider *degreesSlider = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    UISlider *farenhtSlider = [[UISlider alloc]initWithFrame:CGRectMake(0, 40, width, height)];
    
    [degreesSlider setMinimumValue:-105.0];
    [degreesSlider setMaximumValue:105.0];
    
    [degreesSlider addTarget:self action:@selector(updateTemperature) forControlEvents:UIControlEventTouchDown];
    
    
    [degreesC setFont:[UIFont boldSystemFontOfSize:45]];
    degreesC.textColor = [UIColor colorWithRed:.2 green:1 blue:.1 alpha:1];
    
    [degreesF setFont:[UIFont boldSystemFontOfSize:45]];
    degreesF.textColor = [UIColor colorWithRed:.2 green:1 blue:.1 alpha:1];
    
    
    //add UI Components to the view
    
    [self.view addSubview:degreesC];
    [self.view addSubview:degreesF];
    [self.view addSubview:degreesSlider];
    
    
    
    //set properties to newly allocated ui elements
    
    self.degreesSlider = degreesSlider;
    self.farenhtSlider = farenhtSlider;
    self.degreesC = degreesC;
    self.degreesF = degreesF;
    
    
    
    
    //Create the constraints using masonry
    
    [self.degreesC mas_makeConstraints:^(MASConstraintMaker* make){
        
        make.leading.equalTo(self.degreesC.mas_leading).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(40);
        
    }];
    
    
    [self.degreesF mas_makeConstraints:^(MASConstraintMaker* make){
        
        make.leading.equalTo(self.degreesF.mas_leading).with.offset(0);
        make.top.equalTo(self.degreesC.mas_bottom).with.offset(20);
    }];
    
    
    [self.degreesSlider mas_makeConstraints:^(MASConstraintMaker* make){
        
        make.leading.equalTo(self.view.mas_leading).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        //make.centerY.equalTo(self.view.mas_centerY);
        make.top.equalTo(self.view.mas_top).with.offset(self.view.frame.size.height*.9);

        
    }];
    

    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Update temperature function called by slider

-(void)updateTemperature
{
   CGFloat tempScaleC =  [self.degreesSlider value];
   //CGFloat conversion = ((1.8 * tempScaleC )+ 32.0);
    
    float conversion = [TemperatureConverter celsiusToFarenheight:tempScaleC];
    
    NSLog(@"%g",tempScaleC);
    
    
   self.degreesC.text = [NSString stringWithFormat:@"%.02f°C",tempScaleC];
   self.degreesF.text = [NSString stringWithFormat:@"%.02f°F",conversion];
   

    
}

@end
