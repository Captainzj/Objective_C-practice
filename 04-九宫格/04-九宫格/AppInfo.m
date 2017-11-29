//
//  AppInfo.m
//  04-九宫格
//
//  Created by Captain on 2016/12/9.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "AppInfo.h"

@interface AppInfo ()
{
    UIImage *_image;
}

@end

@implementation AppInfo

//id 万能指针
//instancetype 会让编译器检查实例化对象的准确类型
//instancetype 只能用于返回类型，不能当做参数使用
-(instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+(instancetype)appInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(UIImage *)image{
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}
@end
