//
//  Card.h
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,getter=isFaceUp) BOOL faceUp;
@property (nonatomic,getter=isUnPlayable) BOOL unPlayable;
@property (nonatomic) NSString *contents;

- (int)match:(NSArray *)otherCards;


@end
