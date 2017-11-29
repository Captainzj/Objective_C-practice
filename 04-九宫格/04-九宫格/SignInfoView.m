//
//  SignInfoView.m
//  04-九宫格
//
//  Created by Captain on 2016/12/10.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "SignInfoView.h"
#import "SignInfo.h"

@interface SignInfoView()

@property (weak, nonatomic) IBOutlet UIImageView *imageImage;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property(nonatomic,strong) SignInfo *signInfo;

@end

@implementation SignInfoView

+(instancetype)signInfoView
{
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"SignInfoView" owner:nil options:nil];
            return [array firstObject];

}

+(instancetype)signInfoViewWithsignInfo:(SignInfo *)signInfo
{
    SignInfoView *view = [self signInfoView];
    view.signInfo = signInfo;
    
    return view;

}

-(void)setSignInfo:(SignInfo *)signInfo
{
    //在setter方法中千万不要忘记用成员变量记录参数
    _signInfo = signInfo;
    self.imageImage.image = signInfo.image;
    self.wordLabel.text = signInfo.name;
}

@end
