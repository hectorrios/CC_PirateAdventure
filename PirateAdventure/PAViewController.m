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
@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.healthLabel.text = @"The Health Label";
    self.damageLabel.text = @"The Damage Label";
    self.weaponLabel.text = @"The Weapon Label";
    self.armorLabel.text = @"The Armor Label";
    
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
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
    
    [self doMove];
}

- (IBAction)moveSouth:(UIButton *)sender {
    //update the current position
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
    
    [self doMove];
}

- (IBAction)moveEast:(UIButton *)sender {
    //update the current position
    self.currentPosition = CGPointMake(self.currentPosition.x + 1, self.currentPosition.y);
    
    [self doMove];
}

- (IBAction)moveWest:(UIButton *)sender {
    //update the current position
    self.currentPosition = CGPointMake(self.currentPosition.x - 1, self.currentPosition.y);
    
    [self doMove];
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
    //Grab current Tile
    PATile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    
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
        Flip a coin. If even then we apply damage to the Boss. If tails then we get the smack down
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
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died. Reset to play again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
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

-(void) doMove {
    //check to see if we need to disable/enable any of the buttons
    [self calculateButtonVisibility];
    
    //Grab tile
    PATile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    [self updateUIForTile:currentTile];
}

-(void)resetGame {
    
    //Define the initial position
    self.currentPosition = CGPointMake(0, 0);
    
    PATileFactory *tileFactory = [[PATileFactory alloc] init];
    
    //grab the tiles
    self.tiles = [tileFactory tiles];
    
    //set up the starting tile and
    [self doMove];
    
    //init the character
    self.character = [tileFactory character];
    
    //update the UI with the character info
    [self updateCharacterUI];
    
    self.boss = [tileFactory boss];
}

@end
