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
    
    //Define the initial position
    self.currentPosition = CGPointMake(0, 0);
    
    PATileFactory *tileFactory = [[PATileFactory alloc] init];
    
    //grab the tiles
    self.tiles = [tileFactory tiles];
    
    //set up the starting tile and 
    [self doMove];
    
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

#pragma mark -- Private methods
-(void) updateUIForTile:(PATile *)tile {
    self.storyLabel.text = tile.story;
    [self.actionButton setTitle:tile.actionButtonName forState:UIControlStateNormal];
    self.gameBackGroundImageView.image = tile.backgroundImage;
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
@end
