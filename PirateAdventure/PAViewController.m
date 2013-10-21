//
//  PAViewController.m
//  PirateAdventure
//
//  Created by Hector Rios on 10/13/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import "PAViewController.h"
#import "PATile.h"
#import "PATileFactory.h"

@interface PAViewController ()

@property (nonatomic, strong) NSArray *tiles;
@property (nonatomic, strong) PATileFactory *factory;
@property (nonatomic) BOOL tileLocked;

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.factory = [[PATileFactory alloc] init];
    
    [self resetGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- IBAction methods

- (IBAction)moveNorth:(UIButton *)sender {
    
    //update the current position
//    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
    
    [self doMoveFromTile:[self retrieveTheCurrentTile]
            toCoordinate:CGPointMake(self.currentPosition.x, self.currentPosition.y + 1)];
}

- (IBAction)moveSouth:(UIButton *)sender {
    //update the current position
    //self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
    
    [self doMoveFromTile:[self retrieveTheCurrentTile]
            toCoordinate:CGPointMake(self.currentPosition.x, self.currentPosition.y - 1)];
}

- (IBAction)moveEast:(UIButton *)sender {
    //update the current position
//    self.currentPosition = CGPointMake(self.currentPosition.x + 1, self.currentPosition.y);
    
    [self doMoveFromTile:[self retrieveTheCurrentTile]
            toCoordinate:CGPointMake(self.currentPosition.x + 1, self.currentPosition.y)];
}

- (IBAction)moveWest:(UIButton *)sender {
    //update the current position
//    self.currentPosition = CGPointMake(self.currentPosition.x - 1, self.currentPosition.y);
    
    [self doMoveFromTile:[self retrieveTheCurrentTile]
            toCoordinate:CGPointMake(self.currentPosition.x - 1, self.currentPosition.y)];
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
    //Grab current Tile
    PATile *currentTile = [self retrieveTheCurrentTile];
    
    //unlock the current Tile
    self.tileLocked = NO;
    
    if (currentTile.armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + currentTile.armor.health;
        self.character.armor = currentTile.armor;
    } else if (currentTile.weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage +currentTile.weapon.damage;
        self.character.weapon = currentTile.weapon;
    } else if (currentTile.healthEffect != 0) {
        self.character.health = self.character.health + currentTile.healthEffect;
    } else if ([[sender titleForState:UIControlStateNormal]  isEqual: @"Fight"]) {
        /*
        Flip a coin. If even, then we apply damage to the Boss. If tails, then we get the smack down
         0: heads
         1: tails
        */
        int tossResult = arc4random() % 2;
        if (tossResult == 0) {
            //Work the Boss over
            self.boss.health = self.boss.health - self.character.damage;
        } else {
            //We have to take our lumps from the boss
            self.character.health = self.character.health - self.boss.damage;
        }
    }
    
    [self updateCharacterUI];
    
    if (self.character.health <= 0) {
        //lock out the UI. Only allow reset of game
        [self lockTheUIDown];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died. Damn you Pirate Boss! Reset to get your revenge." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    if (self.boss.health <= 0) {
        //lock out UI
        [self lockTheUIDown];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory" message:@"You won! Reset to play again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (IBAction)resetGameButtonPressed:(id)sender {
    
    //reset the Game classes
    [self resetGame];
    
    //enable Action button
    self.actionButton.enabled = YES;
    
    //enable the navigation buttons
    self.moveEastButton.enabled = YES;
    self.moveNorthButton.enabled = YES;
    self.moveSouthButton.enabled = YES;
    self.moveWestButton.enabled = YES;
}

#pragma mark -- Private methods
-(void) updateUIForTile:(PATile *)tile {
    self.storyLabel.text = tile.story;
    [self.actionButton setTitle:tile.actionButtonName forState:UIControlStateNormal];
    self.gameBackGroundImageView.image = tile.backgroundImage;
}

-(void)updateCharacterUI {
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.weaponLabel.text = self.character.weapon.name;
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
}

-(void)lockTheUIDown {
    
    //disable Action button
    self.actionButton.enabled = NO;
    
    //disable the navigation buttons
    self.moveEastButton.enabled = NO;
    self.moveNorthButton.enabled = NO;
    self.moveSouthButton.enabled = NO;
    self.moveWestButton.enabled = NO;
}


-(void) calculateButtonVisibility {
    //Check the vertical buttons (North and South)
    if (self.currentPosition.y == [[self.tiles objectAtIndex:self.currentPosition.x] count] - 1) {
        //Hide the North button
        self.moveNorthButton.hidden = YES;
    } else {
        self.moveNorthButton.hidden = NO;
    }
    
    if (self.currentPosition.y == 0 ) {
        self.moveSouthButton.hidden = YES;
    } else {
        self.moveSouthButton.hidden = NO;
    }
    
    //Check horizontal buttons (East and West)
    if (self.currentPosition.x == [self.tiles count] - 1) {
        self.moveEastButton.hidden = YES;
    } else {
        self.moveEastButton.hidden = NO;
    }
    
    if (self.currentPosition.x == 0) {
        self.moveWestButton.hidden = YES;
    } else {
        self.moveWestButton.hidden = NO;
    }
}

-(void) doMoveFromTile:(PATile *)currentTile toCoordinate:(CGPoint)coord {
    
    //check to see if the tileLocked property is YES
    if (self.tileLocked == YES) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Action Required" message:@"Woah there Cap'n! You need to do some clicking before you start moving." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    } else {
        
        //set the currentPosition to the new coordinate
        self.currentPosition = coord;
        
        //check to see if we need to disable/enable any of the buttons
        [self calculateButtonVisibility];
        
        [self updateUIForTile:[self retrieveTheCurrentTile]];
    }

}

-(void)resetGame {
    
    //grab the tiles
    self.tiles = [self.factory tiles];

    //Define the initial position
    self.currentPosition = CGPointMake(0, 0);
    
    //set up the starting tile.
    [self updateUIForTile:[self retrieveTheCurrentTile]];
    
    //Check if the tile requires action to be taken
    self.tileLocked = [self retrieveTheCurrentTile].actionRequired;
    
    //init the character
    self.character = nil;
    self.character = [self.factory character];
    
    //init the character
    self.boss = nil;
    self.boss = [self.factory boss];
    
    //update the UI with the character info
    [self updateCharacterUI];
    
    
}

/**
 Check to see if the current tile requires that the action be
 taken. If YES, then return YES and throw up an alert saying that an action is needed
 **/
//-(BOOL)isActionRequired {
//    PATile *currentTile  = [self retrieveTheCurrentTile];
//    
//    if (currentTile.actionRequired) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Action Required" message:@"Woah there Cap'n! You need to do some clicking before you start moving." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alertView show];
//    }
//    return currentTile.actionRequired;
//}

/**
 Covenience method to retrieve the current tile
 **/
-(PATile *)retrieveTheCurrentTile {
    PATile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    return currentTile;
}

@end
