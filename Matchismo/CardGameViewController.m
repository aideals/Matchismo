//
//  ViewController.m
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *flipsLabel;
@property (nonatomic, strong) NSMutableArray *cardButtons;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation CardGameViewController
@synthesize flipCount = _flipCount;

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void)setCardButtons:(NSMutableArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 430, 85, 75)];
    
    self.flipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 430, 85, 75)];
    
    [self.view addSubview:self.scoreLabel];
    [self.view addSubview:self.flipsLabel];

}

- (void)updateUI
{
   for (int i = 0; i <= 3; i++) {
        for (int j = 0; j <= 3; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [self.cardButtons addObject:button];
            Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
            button.layer.cornerRadius = 0.5;
            button.frame = CGRectMake(35 * i + 35, 30 * j + 30, 35, 45);
            [button setTitle:@"★" forState:UIControlStateNormal];
            [button setTitle:card.content forState:UIControlStateSelected];
            [button setTitle:card.content forState:UIControlStateSelected|UIControlStateDisabled];
            button.selected = card.isFaceUp;
            button.enabled = !card.isUnPlayable;
            button.alpha = card.isUnPlayable ? 0.3 : 1.0;
            [self.view addSubview:button];
        }
    }

    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",self.game.score];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"flips: %d",self.flipCount];
    NSLog(@"flips update to %d",self.flipCount);
    
}

@end
