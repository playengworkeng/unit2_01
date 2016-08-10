//
//  TemperatureConverter.m
//  Uber Unit 2-01
//
//  Created by J on 8/9/16.
//  Copyright © 2016 Thinkful. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemperatureConverter.h"

@implementation TemperatureConverter

+(float)celsiusToFarenheight:(float)celsius
{
    
    float farenheight = (1.8 * celsius) +32.0;
    
    return farenheight;
}





@end