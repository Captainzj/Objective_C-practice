//
//  SignInfo.h
//  04-九宫格
//
//  Created by Captain on 2016/12/10.
//  Copyright © 2016年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInfo  : UIViewController

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,strong,readonly)UIImage *image;

-(instancetype)initWithDict:dict1;
/**工厂方法*/
+(instancetype)signInfoWithDict:dict1;

@end
