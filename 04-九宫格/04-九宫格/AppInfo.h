//
//  AppInfo.h
//  04-九宫格
//
//  Created by Captain on 2016/12/9.
//  Copyright © 2016年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppInfo : UIViewController

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,strong,readonly)UIImage *image;

-(instancetype)initWithDict:(NSDictionary *)dict;
/** 工厂方法*/
+(instancetype)appInfoWithDict:(NSDictionary *)dict;

@end
