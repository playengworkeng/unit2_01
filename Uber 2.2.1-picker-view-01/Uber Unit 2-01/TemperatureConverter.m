//
//  TemperatureConverter.m
//  Uber Unit 2-01
//
//  Created by 262Hz on 7/3/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "TemperatureConverter.h"

@implementation TemperatureConverter

+ (float)celciusToFahrenheight:(float)celcius {
    float fahrenheit = celcius * 1.8 + 32;
    return fahrenheit;
}

@end
