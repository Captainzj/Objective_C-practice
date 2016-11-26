//
//  ViewController.m
//  纯代码btn
//
//  Created by 朱恒坦 on 2016/11/22.
//  Copyright © 2016年 zht. All rights reserved.
//

#import "ViewController.h"

#define kBtnW 45
#define kMovingDelta 80
@interface ViewController ()
{
    UIButton *_button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _button = [[UIButton alloc]init];
    _button.frame = CGRectMake(112, 120, 150, 150);
    
    [_button setTitle:@"点我啊" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [_button setBackgroundImage:[UIImage imageNamed:@"小新01.jpg"] forState:UIControlStateNormal];
    
    [_button setTitle:@"摸到了" forState:UIControlStateHighlighted];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [_button setBackgroundImage:[UIImage imageNamed:@"小新02.jpg"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:_button];
    _button.layer.cornerRadius = 10;
    _button.layer.masksToBounds = YES;
    
    
    NSArray *btnArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn.plist" ofType:nil]];
    for (int i = 0; i<8; i++) {
        UIButton *btn = [self createBtnWithDict:btnArray[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:btn];
    }
}

-(UIButton *)createBtnWithDict:(NSDictionary *)dict
{
    UIButton *btn = [[UIButton alloc] init];
    int x = [dict[@"x"] intValue];
    int y = [dict[@"y"] intValue];
    btn.frame = CGRectMake(x, y, kBtnW, kBtnW);
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal.png", dict[@"name"]]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted.png", dict[@"name"]]] forState:UIControlStateHighlighted];
//    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_disable.png", dict[@"name"]]] forState:UIControlStateDisabled];
    return btn;
}

- (IBAction)move:(UIButton *)button
{
    //CGRect rect = self.headImageView.frame;
    CGPoint p = _button.center;
    CGRect rect = _button.bounds;
    switch (button.tag) {
        case 0:
            p.y -=  kMovingDelta;
            break;
        case 1:
            p.x -=  kMovingDelta;
            break;
        case 2:
            p.x +=  kMovingDelta;
            break;
        case 3:
            p.y +=  kMovingDelta;
            break;
        case 4:
            rect.size.width +=30;
            rect.size.height +=30;
            break;
        case 5:
            rect.size.width -=30;
            rect.size.height -=30;
            break;
        case 6:
            _button.transform = CGAffineTransformRotate(_button.transform, -M_PI_4);
            break;
        case 7:
            _button.transform = CGAffineTransformRotate(_button.transform, M_PI_4);
            break;
        default:
            break;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    _button.center = p;
    _button.bounds= rect;
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
