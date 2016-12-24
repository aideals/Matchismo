//
//  ViewController.h
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameViewController : UIViewController
@property (nonatomic,assign) int flipCount;

- (IBAction)flipCard:(UIButton *)sender;

@end

