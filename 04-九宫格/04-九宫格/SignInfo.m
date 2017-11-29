//
//  SignInfo.m
//  04-九宫格
//
//  Created by Captain on 2016/12/10.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "SignInfo.h"

@interface SignInfo ()
{
    UIImage *_image;
}

@end

@implementation SignInfo

-(instancetype)initWithDict:dict1
{
    self = [super init];
    if (self) {
        self.name = dict1[@"word"];
        self.icon = dict1[@"image"];
    }
    return self;
}

+(instancetype)signInfoWithDict:dict1{
    return [[self alloc]initWithDict:dict1];
}

-(UIImage *)image{
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}
@end
