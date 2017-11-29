//
//  AppInfoView.m
//  04-九宫格
//
//  Created by Captain on 2016/12/10.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "AppInfoView.h"
#import "AppInfo.h"  //勿忘

@interface AppInfoView()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property(nonatomic,strong) AppInfo *appInfo;    

@end



@implementation AppInfoView


+(instancetype)appInfoView{
    //loadNibNamed 会将名为AppInfoView中所有视图全部加载出来，并且按照XIB中定义的顺序，返回一个视图的数组
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"AppInfoView" owner:nil options:nil];
    return [array firstObject];

}


+(instancetype)appInfoViewWithAppInfo:(AppInfo *)appInfo
{
    AppInfoView *view = [self appInfoView];
    view.appInfo = appInfo;
    return  view;
}

-(void)setAppInfo:(AppInfo *)appInfo
{
    _appInfo = appInfo;
    self.iconImage.image = appInfo.image;
    self.nameLabel.text = appInfo.name;
}

- (IBAction)downloadClick:(id)sender {
    
    
    //UILabel: warning user that download is completed
    int x = 25 ; int  y = 615 ;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y,375-2*x, 30)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    AppInfo *appInfo = self.appInfo;
    label.text = [NSString stringWithFormat:@"%@ download completed",appInfo.name];
    label.font = [UIFont systemFontOfSize:14.0];
    label.alpha = 1.0;
    [self.superview addSubview:label];
    
    //block动画
    [UIView animateWithDuration:2.0 animations:^{
        label.alpha = 0.0;
    }completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}
@end
