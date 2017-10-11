//
//  ViewController.m
//  动画
//
//  Created by 雨停 on 2017/10/9.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "ViewController.h"

#import "secondViewController.h"
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)
@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic,strong)UIImageView * img;
@end

@implementation ViewController
//如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
//anima.fillMode = kCAFillModeForwards;
//anima.removedOnCompletion = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.img.center =self.view.center;
   // self.img.layer.masksToBounds =YES;
    self.img.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.img.layer.shadowOffset = CGSizeMake(7, 7);
    self.img.layer.shadowOpacity = 0.70;
    [self.view addSubview:self.img ];
    self.img.image = [UIImage imageNamed:@"img1.jpg"];
    
}


//position动画
- (void)positionup{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2)];
    anima.toValue   = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2-300)];
    anima.duration =1.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.img.layer addAnimation:anima forKey:@"positionAnimation"];
}
-(void)positiondown{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2)];
    anima.toValue   = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2+300)];
    anima.duration = 2.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.img.layer addAnimation:anima forKey:@"positionAnimation"];
    
}
- (void)positionleft{
    
    CABasicAnimation  * anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2)];
    anima.toValue   = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-200, kScreenHeight/2)];
    anima.duration =3.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.img.layer addAnimation:anima forKey:@"position"];
    
}
- (void)positionright{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue  = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2)];
    anima.toValue    = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2+200, kScreenHeight/2)];
    anima.duration   = 3.0f;
    [self.img.layer addAnimation:anima forKey:@"position"];
    
}
-(void)positionzheng{
    CAKeyframeAnimation * anima =  [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue  * value1 = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSValue  * value2 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue  * value3 = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
    NSValue  * value4 = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    anima.values = @[value1,value2,value3,value4];
    anima.duration = 2.0f;
  
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.img.layer addAnimation:anima forKey:@"positionAnimation"];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.img.hidden = YES;
}
- (void)positionbezierpath{
    CAKeyframeAnimation * anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath    * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 500)];
    anima.path = path.CGPath;
    anima.duration = 4.0f;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    anima.delegate = self;
    [self.img.layer addAnimation:anima forKey:@"position"];
}
//opacity动画
- (void)opacity{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue   = [NSNumber numberWithFloat:0.2f];
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    anima.duration =1.0f;
    [self.img.layer addAnimation:anima forKey:@"opacity"];
    }

//transfrom.scale动画
- (void)transformscale{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima.toValue  = [NSNumber numberWithFloat:2.0f];
    anima.duration = 3.0f;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima forKey:@"transform.scale"];
}
- (void)transformscalex{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    anima.toValue = [NSNumber numberWithFloat:1.0f];
    anima.duration = 2.0f;
    [self.img.layer addAnimation:anima forKey:@"transform.scale.x"];
}
- (void)transformscaley{
    CABasicAnimation * anima = [CABasicAnimation   animationWithKeyPath:@"transform.scale.y"];
    anima.toValue = [NSNumber numberWithFloat:1.0f];
    anima.duration = 2.0f;
    [self.img.layer addAnimation:anima forKey:@"transform.scale.y"];
    
}
//transform.rotation动画
- (void)rotationz{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.toValue = [NSNumber numberWithFloat:M_PI*2];
    anima.duration =2.0f;
    [self.img.layer addAnimation:anima forKey:@"transform.rotation.z"];
    
}

- (void)rotationx{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    anima.toValue = [NSNumber numberWithFloat:M_PI*2];
    anima.duration = 2.0f;
    [self.img.layer addAnimation:anima forKey:@"transform.rotation.x"];
}
- (void)rotationy{
    CABasicAnimation  * anima  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    anima.toValue = [NSNumber numberWithFloat:M_PI*2];
    anima.duration = 2.0f;
    [self.img.layer addAnimation:anima forKey:@"transform.scale.y"];
}

- (void)shake{
    CAKeyframeAnimation   * anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue * value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue * value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue * value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    anima.values = @[value1,value2,value3];
    anima.repeatCount = MAXFLOAT;
    [self.img.layer addAnimation:anima forKey:@"transform.rotation"];
}
//backgroundColor动画
- (void)backgroundColor{
    CABasicAnimation * anima = [CABasicAnimation   animationWithKeyPath:@"backgroundColor"];
    anima.toValue = (id)[UIColor grayColor].CGColor;
    anima.duration =2.0f;
    [self.img.layer addAnimation:anima forKey:@"backgroundColor"];
}


//cornerRadius动画
- (void)cornerRadius{
    CABasicAnimation  * anima =  [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anima.toValue  = [NSNumber numberWithFloat:50.0f];
    anima.duration = 1.0f;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima forKey:@"cornerRadius"];
}
- (void)cornerRadiusl{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anima.toValue = [NSNumber   numberWithFloat:0];
    anima.duration =2.0;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima forKey:@"cornerRadius"];
}

//图品切换动画
- (void)changeImageAnimatedWithView :(UIImageView *)imageV AndImage:(UIImage*)image{
    CATransition * transition  = [CATransition  animation];
    transition.duration = 2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = @"cameraIrisHollowClose";//kCATransitionReveal;
    [imageV.layer addAnimation:transition forKey:@"transition"];
    [imageV setImage:image];
}

//borderWidth动画
- (void)borderWidth{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    anima.toValue = [NSNumber numberWithFloat:20.0f];
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    anima.duration = 1.0f;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima forKey:@"borderWidth"];
}
// shadowColor动画
- (void)shadowColor{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    anima.toValue = (id)[UIColor redColor].CGColor;
    anima.fillMode= kCAFillModeForwards;
    anima.removedOnCompletion =NO;
    anima.duration = 2.0f;
    [self.img.layer addAnimation:anima forKey:@"shadowColor"];
}
- (void)groupAnimation{
    CAKeyframeAnimation * anima = [CAKeyframeAnimation  animationWithKeyPath:@"position"];
    NSValue * value = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(20, 20)];

    anima.values = @[value,value1];
    
    CABasicAnimation * anima1 = [CABasicAnimation animationWithKeyPath:@"opacity"];

    anima1.fromValue = [NSNumber numberWithFloat:1.0f];
    anima1.toValue = [NSNumber numberWithFloat:0.2f];
    
    CABasicAnimation  * anima2 = [CABasicAnimation  animationWithKeyPath:@"transform.rotation"];
    anima2.toValue = [NSNumber numberWithFloat:M_PI*4];

    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[anima,anima1,anima2];
    group.duration = 6.0f;
    [self.img.layer addAnimation:group forKey:@"animation"];
    //-如下，使用三个animation不分装成group，只是把他们添加到layer，也有组动画的效果。----------
    /**
     CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     NSValue * value = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
     NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(20, 20)];
     
     anima1.values = @[value,value1];
     anima1.duration = 4.0f;
     [_wsView.layer addAnimation:anima1 forKey:@"aa"];
     
     //缩放动画
     CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
     anima2.fromValue = [NSNumber numberWithFloat:0.8f];
     anima2.toValue = [NSNumber numberWithFloat:2.0f];
     anima2.duration = 4.0f;
     [_wsView.layer addAnimation:anima2 forKey:@"bb"];
     
     //旋转动画
     CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
     anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
     anima3.duration = 4.0f;
     [_wsView.layer addAnimation:anima3 forKey:@"cc"];
     
     */

    
}
-  (void)timeGroupAnimation{
    CFTimeInterval currentTime = CACurrentMediaTime();
    CFTimeInterval time = CACurrentMediaTime();
    NSLog(@"%f",time);
    //位移动画
    //位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/4, kScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/4, kScreenHeight/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4, nil];
    anima1.beginTime = currentTime;
    anima1.duration = 2.0f;
    anima1.fillMode = kCAFillModeForwards;
    anima1.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima1 forKey:@"aa"];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    anima2.beginTime = currentTime+2.0f;
    anima2.duration = 1.0f;
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima2 forKey:@"bb"];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    anima3.beginTime = currentTime+3.0f;
    anima3.duration = 1.0f;
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [self.img.layer addAnimation:anima3 forKey:@"cc"];
}

-(void)CATransition{
    CATransition  * anima = [CATransition   animation];
    anima.type = kCAAnimationCubic;
    anima.duration  = 2.0f;
    //    anima.subtype = kCATransitionFromRight; //设置动画的方向
    [self.img setImage:[UIImage imageNamed:@"img2.jpg"]];
    [self.img.layer addAnimation:anima forKey:@"catransition"];
}

-(void)privateCATransition{
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.img.layer addAnimation:anima forKey:@"revealAnimation"];

}
//私有api
/*fade

交叉淡化 过度的效果

push

新视图把旧视图推出去

moveIn

新视图移到旧视图上面

reveal

将旧视图移开，显示新视图

cube

立方体翻滚的效果

oglFlip

上下左右翻转的效果

suckEffect


收缩效果，如一块布被抽走

rippleEffect

水滴效果（像是在屏幕上滴了一滴水，然后泛起一下涟漪）

pageCurl

向上翻页效果

pageUnCurl

向下翻页效果

cameraIrisHollowOpen

相机镜头打开效果

cameraIrisHollowClose

相机镜头关闭效果*/





- (void)viewanimation{
    self.img.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0f animations:^{
        //移动
        self.img.transform = CGAffineTransformMakeTranslation(100, 0);
        //旋转
        self.img.transform = CGAffineTransformMakeRotation(M_PI);
        //缩放
        self.img.transform = CGAffineTransformMakeScale(1, 2);
        
    }];
    
//    [UIView animateWithDuration:2.0f animations:^{
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//    [UIView animateWithDuration:2.0f
//                          delay:2.0f
//                        options:UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//    [UIView animateKeyframesWithDuration:2.0f
//                                   delay:2.0f
//                                 options:UIViewKeyframeAnimationOptionAutoreverse
//                              animations:^{
//        
//    } completion:^(BOOL finished) {
//        
//    }];
}
//动画组
- (void)viewGroup{
    self.img.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0 animations:^{
        CGAffineTransform form = CGAffineTransformMakeScale(2, 2);
        CGAffineTransform form1 = CGAffineTransformRotate(form,M_PI);
        
        self.img.transform = CGAffineTransformInvert(form1);
    }];
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self changeImageAnimatedWithView:self.img AndImage:[UIImage imageNamed:@"img2.jpg"]];
    //[self timeGroupAnimation];
    //[self shadowColor];
    //[self CATransition];
    //[self viewanimation];
   // [self viewGroup];
    
    
}

//转场动画

- (void)viewCheak{
    secondViewController * vic = [[secondViewController alloc]init];
    
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    CATransition *transition = [[CATransition alloc]init];
    
    transition.duration = .5;
    
    transition.type =  @"rippleEffect";
    
    transition.subtype = kCATransitionFromRight;
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    dispatch_group_leave(group);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:vic animated:NO];
    });

}























@end
