//
//  PAViewController.h
//  PirateAdventure
//
//  Created by Hector Rios on 10/13/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PACharacter.h"
#import "PABoss.h"

@interface PAViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *gameBackGroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *moveNorthButton;
@property (strong, nonatomic) IBOutlet UIButton *moveSouthButton;
@property (strong, nonatomic) IBOutlet UIButton *moveEastButton;
@property (strong, nonatomic) IBOutlet UIButton *moveWestButton;

@property (nonatomic) CGPoint currentPosition;
@property (nonatomic, strong) PACharacter *character;
@property (nonatomic, strong) PABoss *boss;

- (IBAction)moveNorth:(UIButton *)sender;
- (IBAction)moveSouth:(UIButton *)sender;
- (IBAction)moveEast:(UIButton *)sender;
- (IBAction)moveWest:(UIButton *)sender;
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)resetGameButtonPressed:(id)sender;

@end
