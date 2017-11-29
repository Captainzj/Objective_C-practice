//
//  ViewController.m
//  02-UIButton（纯代码）
//
//  Created by Captain on 2016/11/21.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "ViewController.h"

#define kMovingDelta 80

typedef enum{
    kMovingDirTop = 10,
    kMovingDirLeft,
    kMovingDirRight,
    kMovingDirBottom,
}kMovingDir;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *headImageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(112, 120, 150, 150);
    
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"小新01"] forState:UIControlStateNormal];

    [btn setTitle:@"摸到了" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"小新02"] forState:UIControlStateHighlighted];
    
    
    self.headImageView = btn;
    self.headImageView.layer.cornerRadius = 10;
    self.headImageView.layer.masksToBounds = YES;
    
    UIButton *Top = [[UIButton alloc]init];
    Top.frame = CGRectMake(60, 400, 45, 45);
    Top.tag =10;
    [Top setBackgroundImage:[UIImage imageNamed:@"top_normal"] forState:UIControlStateNormal];
    [Top setBackgroundImage:[UIImage imageNamed:@"top_highlighted"] forState:UIControlStateHighlighted];
    [Top setBackgroundImage:[UIImage imageNamed:@"top_disable"] forState:UIControlStateDisabled];
    
    UIButton *Left = [[UIButton alloc]init];
    Left.frame = CGRectMake(10, 455, 45, 45);
    Left.tag = 11;
    [Left setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [Left setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [Left setBackgroundImage:[UIImage imageNamed:@"left_disable"] forState:UIControlStateDisabled];
    
    UIButton *Right = [[UIButton alloc]init];
    Right.frame = CGRectMake(110, 455, 45, 45);
    Right.tag = 12;
    [Right setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [Right setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [Right setBackgroundImage:[UIImage imageNamed:@"right_disable"] forState:UIControlStateDisabled];
    
    UIButton *Bottom = [[UIButton alloc]init];
    Bottom.frame = CGRectMake(60, 505, 45, 45);
    Bottom.tag = 13;
    [Bottom setBackgroundImage:[UIImage imageNamed:@"bottom_normal"] forState:UIControlStateNormal];
    [Bottom setBackgroundImage:[UIImage imageNamed:@"bottom_highlighted"] forState:UIControlStateHighlighted];
    [Bottom setBackgroundImage:[UIImage imageNamed:@"bottom_disable"] forState:UIControlStateDisabled];
    
    UIButton *Plus = [[UIButton alloc]init];
    Plus.frame = CGRectMake(206, 400, 45, 45);
    Plus.tag =10;
    [Plus setBackgroundImage:[UIImage imageNamed:@"plus_normal"] forState:UIControlStateNormal];
    [Plus setBackgroundImage:[UIImage imageNamed:@"plus_highlighted"] forState:UIControlStateHighlighted];
    
    UIButton *Minus = [[UIButton alloc]init];
    Minus.frame = CGRectMake(287, 400, 45, 45);
    Minus.tag =0;
    [Minus setBackgroundImage:[UIImage imageNamed:@"minus_normal"] forState:UIControlStateNormal];
    [Minus setBackgroundImage:[UIImage imageNamed:@"minus_highlighted"] forState:UIControlStateHighlighted];
    
    UIButton *Left_rotate = [[UIButton alloc]init];
    Left_rotate.frame = CGRectMake(206, 505, 45, 45);
    Left_rotate.tag =10;
    [Left_rotate setBackgroundImage:[UIImage imageNamed:@"left_rotate_normal"] forState:UIControlStateNormal];
    [Left_rotate setBackgroundImage:[UIImage imageNamed:@"left_rotate_highlighted"] forState:UIControlStateHighlighted];
    
    UIButton *Right_rotate = [[UIButton alloc]init];
    Right_rotate.frame = CGRectMake(287, 505, 45, 45);
    Right_rotate.tag =0;
    [Right_rotate setBackgroundImage:[UIImage imageNamed:@"right_rotate_normal"] forState:UIControlStateNormal];
    [Right_rotate setBackgroundImage:[UIImage imageNamed:@"right_rotate_highlighted"] forState:UIControlStateHighlighted];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:btn];
    [self.view addSubview:Top];
    [self.view addSubview:Left];
    [self.view addSubview:Right];
    [self.view addSubview:Bottom];
    [self.view addSubview:Plus];
    [self.view addSubview:Minus];
    [self.view addSubview:Left_rotate];
    [self.view addSubview:Right_rotate];
    
    //按钮的监听方法(连线)
    //[btn addTarget:self action:@selector(click:) forControlEvents: UIControlEventTouchUpInside];
    [Top addTarget:self action:@selector(move:) forControlEvents: UIControlEventTouchUpInside];
    [Left addTarget:self action:@selector(move:) forControlEvents: UIControlEventTouchUpInside];
    [Right addTarget:self action:@selector(move:) forControlEvents: UIControlEventTouchUpInside];
    [Bottom addTarget:self action:@selector(move:) forControlEvents: UIControlEventTouchUpInside];
    [Plus addTarget:self action:@selector(zoom:) forControlEvents: UIControlEventTouchUpInside];
    [Minus addTarget:self action:@selector(zoom:) forControlEvents: UIControlEventTouchUpInside];
    [Left_rotate addTarget:self action:@selector(rotate:) forControlEvents: UIControlEventTouchUpInside];
    [Left_rotate addTarget:self action:@selector(zoom:) forControlEvents: UIControlEventTouchUpInside];
    [Right_rotate addTarget:self action:@selector(rotate:) forControlEvents: UIControlEventTouchUpInside];
    [Right_rotate addTarget:self action:@selector(zoom:) forControlEvents: UIControlEventTouchUpInside];
    
}

-(void)click:(id)sender{
    NSLog(@"就点你\n %@",sender);
}


- (IBAction)move:(UIButton *)button {
    //CGRect rect = self.headImageView.frame;
    CGPoint p = self.headImageView.center;
    
    switch (button.tag) {
        case kMovingDirTop:
            p.y -=  kMovingDelta;
            break;
        case kMovingDirLeft:
            p.x -=  kMovingDelta;
            break;
        case kMovingDirRight:
            p.x +=  kMovingDelta;
            break;
        case kMovingDirBottom:
            p.y +=  kMovingDelta;
            break;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.headImageView.center = p;
    
    [UIView commitAnimations];
    
}

- (IBAction)zoom:(UIButton *)button {
    CGRect rect = self.headImageView.bounds;
    
    if (button.tag) {
        rect.size.width +=30;
        rect.size.height +=30;
    }
    else{
        rect.size.width -=30;
        rect.size.height -=30;
    }
    
    //首尾动画
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:1.0];
    
    self.headImageView.bounds= rect;
    
    //    [UIView commitAnimations];
    
}
- (IBAction)rotate:(UIButton *)button {
    if(button.tag){
        self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, -M_PI_4);
    }
    else{
        self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, M_PI_4);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
