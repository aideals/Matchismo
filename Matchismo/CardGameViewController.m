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

- (NSMutableArray *)cardButtons
{
    if (!_cardButtons) _cardButtons = [[NSMutableArray alloc] init];
    return _cardButtons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 600, 85, 75)];
    self.scoreLabel.textColor = [UIColor blackColor];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    [self.view addSubview:self.scoreLabel];
   
    self.flipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(295, 600, 85, 75)];
    self.flipsLabel.textColor = [UIColor blackColor];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    [self.view addSubview:self.flipsLabel];

}


#define x_space 25
#define y_space 45


- (void)updateUI
{
   Card *card;
    
    //if (!button) button为局部变量，每次调用updateUI,button都会被重置为nil
    //if (!self.cardButtons)
    if (self.cardButtons.count == 0) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [self.cardButtons addObject:button];
                card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
                button.layer.cornerRadius = 5.0;
                button.frame = CGRectMake(x_space + (x_space + 60) * j, y_space + (y_space + 95) * i, 70, 95);
                button.backgroundColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.4 alpha:1.0];
                [button addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchDown];
                [button setTitle:@"★" forState:UIControlStateNormal];
                [self.view addSubview:button];
            }
        }
    }
    else
    {
        /*
         [button setTitle:card.contents forState:UIControlStateSelected];
         [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
         button.selected = card.isFaceUp;
         button.enabled = !card.isUnPlayable;
         button.alpha = card.isUnPlayable ? 0.3 : 1.0;
        */
        
        for (UIButton *button in self.cardButtons)
        {
           [button setTitle:card.contents forState:UIControlStateSelected];
           [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
           button.selected = card.isFaceUp;
           button.enabled = !card.isUnPlayable;
           button.alpha = card.isUnPlayable ? 0.3 : 1.0;
        }
        
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
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
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"%d",flipCount);
}

@end
