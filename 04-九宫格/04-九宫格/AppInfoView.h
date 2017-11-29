//
//  AppInfoView.h
//  04-九宫格
//
//  Created by Captain on 2016/12/10.
//  Copyright © 2016年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppInfo;

@interface AppInfoView : UIView

+(instancetype)appInfoView;
+(instancetype)appInfoViewWithAppInfo:(AppInfo *)appInfo;

@end
