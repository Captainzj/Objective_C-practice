//
//  ViewController.m
//  03-图片浏览器
//
//  Created by Captain on 2016/11/23.
//  Copyright © 2016年 captain. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property(nonatomic,strong)UILabel *noLabel;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)UIButton *leftButton;
@property(nonatomic,strong)UIButton *rightButton;

@property(nonatomic,assign) int index;
@property(nonatomic,assign)NSArray* imageList;

@end

@implementation ViewController

-(NSArray*) imageList{
    if (_imageList == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageData" ofType:@"plist"];
        NSLog(@"%@",path);
        
        _imageList = [NSArray arrayWithContentsOfFile:path];
    }
    return _imageList;
}

-(UILabel*)noLabel{
    if (!_noLabel) {
        _noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100,  self.view.frame.size.width, 40)];
        _noLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:_noLabel];
    }
    return _noLabel;
}

-(UIImageView*)icon{
    if (!_icon) {
        CGFloat imageW = 233;
        CGFloat imageH = 180;
        CGFloat imageX = ( self.view.frame.size.width - imageW)/2;
        CGFloat imageY = ( self.view.frame.size.height - imageH)*2/5;
        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        [self.view addSubview: _icon];

    }
    return _icon;
}

-(UILabel*)descLabel{
    
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 550, self.view.frame.size.width, 40)];
        _descLabel.numberOfLines= 0 ;
        _descLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_descLabel];
    }
    
    return _descLabel;
    
}

-(UIButton *)leftButton{

    if (!_leftButton) {
        _leftButton = [[UIButton alloc]init];
        _leftButton.frame = CGRectMake(0, 0, 40, 40);
        _leftButton.center= CGPointMake(self.icon.frame.origin.x/2, self.icon.center.y);
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_disable"] forState:UIControlStateDisabled];
        [_leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftButton];
        self.leftButton=_leftButton;
    }
    
    return _leftButton;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc]init];
        _rightButton.frame = CGRectMake(0, 0, 40, 40);
        _rightButton.center= CGPointMake( self.view.frame.size.width - self.icon.frame.origin.x/2, self.icon.center.y);
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_disable"] forState:UIControlStateDisabled];
        [_rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        self.rightButton=_rightButton;
        [self.view addSubview:_rightButton];
    }
    return _rightButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     
    
    [self changeImage];
    
}


#pragma mark -ACTIONS

/*修改图像数据*/
-(void)changeImage{
    
    self.noLabel.text=[NSString stringWithFormat:@"%d/%d",self.index+1,5];
    
    self.icon.image = [UIImage imageNamed:self.imageList[self.index][@"name"]];
    self.descLabel.text= self.imageList[self.index][@"desc"];
    
    
    self.rightButton.enabled = (self.index!=4);
    self.leftButton.enabled = (self.index!=0);
    
}
-(void)leftClick{
    //NSLog(@"左");
    self.index--;
    [self changeImage];
}

-(void)rightClick{
    //NSLog(@"右");
    self.index ++;
    NSLog(@"%d",self.index);
    [self changeImage];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

