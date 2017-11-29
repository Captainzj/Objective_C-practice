//
//  ViewController.m
//  04-九宫格
//
//  Created by Captain on 2016/11/29.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "SignInfo.h"
#import "AppInfoView.h"
#import "SignInfoView.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *appList;
@property(nonatomic,strong)NSArray *signList;
@end

@implementation ViewController
//思路为帅，代码为兵

-(NSArray *)appList{
    if (!_appList) {
        
        //懒加载
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"app.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        //将数组转换成模型，即self.appList中存储的是AppInfo对象
        NSMutableArray *arrayM =[NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            [arrayM addObject:[AppInfo appInfoWithDict:dict]];
        }
        
        _appList = arrayM;
        
    }
    return  _appList;
}


-(NSArray *)signList{
    if (!_signList) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"sign.plist" ofType:nil];
        
        NSArray *array1 = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM1 = [NSMutableArray array];//[NSMutableArray array] 从何而来
        
        for (NSDictionary *dict1 in array1) {
            
            SignInfo *signInfo = [SignInfo signInfoWithDict:dict1];
            
            [arrayM1 addObject:signInfo];
        }
        _signList = arrayM1; //【0】

    }
    return _signList;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    int totalCol = 3;
    CGFloat viewW = 90;
    CGFloat viewH = 90;
    
    CGFloat marginX = (self.view.bounds.size.width - totalCol * viewW)/4;
    CGFloat marginY = 20;
    CGFloat startY = 150;
    
    //App
    for (int i=0; i<self.appList.count; i++) {
        int row = i/totalCol;
        int col = i%totalCol;   //row&&col start with 0
        
        CGFloat x = (marginX + viewW) * col + marginX ;
        CGFloat y = (marginY + viewH) * row + marginY + startY;
        
        AppInfoView *appView = [AppInfoView appInfoViewWithAppInfo:self.appList[i]];
        
        appView.frame = CGRectMake(x, y, viewW, viewH);
        
        [self.view addSubview:appView];
        
    }
    
    //Sign
    for (int i =0 ; i<3; i++) {
        
        int row = i/totalCol;
        int col = i%totalCol;
        
        CGFloat x = (marginX + viewW) * col + marginX ;
        CGFloat y = (marginY + viewH) * row + marginY + startY;
        
        SignInfoView *signView = [SignInfoView signInfoViewWithsignInfo:self.signList[i]];
        // signView.signInfo =self.signList[i];
        
        signView.frame = CGRectMake(x, y-110, viewW, viewH);
        
        [self.view addSubview:signView];
        
    }
    


}


    @end

