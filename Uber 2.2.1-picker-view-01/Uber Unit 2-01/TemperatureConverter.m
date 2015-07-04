//
//  TemperatureConverter.m
//  Uber Unit 2-01
//
//  Created by 262Hz on 7/3/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "TemperatureConverter.h"

@implementation TemperatureConverter

+ (float)celsiusToFahrenheight:(float)celsius {
    float fahrenheit = celsius * 1.8 + 32;
    return fahrenheit;
}

@end
