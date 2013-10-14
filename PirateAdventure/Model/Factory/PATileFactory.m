//
//  PATileFactory.m
//  PirateAdventure
//
//  Created by Hector Rios on 10/13/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import "PATileFactory.h"
#import "PATile.h"

@implementation PATileFactory

-(NSArray *) tiles {
//    NSArray *colOne = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
//    [[PATile alloc] init], [[PATile alloc] init], nil];

    NSArray *colOne = @[[[PATile alloc] init], [[PATile alloc] init], [[PATile alloc] init]];
    
    NSString *message = @"At the beginning of the game";
    
    [self configureTile:[colOne objectAtIndex:0] WithStory:message
         AndImageString:@"PirateStart.jpg" AndActionName:@"Grab an Apron"];
    [self configureTile:[colOne objectAtIndex:1] WithStory:message
         AndImageString:@"PirateBlacksmith.jpeg" AndActionName:@"Buy a sword"];
    [self configureTile:[colOne objectAtIndex:2] WithStory:message
         AndImageString:@"PiratePlank.jpg" AndActionName:@"Grab a lifevest"];
    
    
    NSArray *colTwo = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
    [[PATile alloc] init], [[PATile alloc] init], nil];
    
    [self configureTile:[colTwo objectAtIndex:0] WithStory:message
         AndImageString:@"PirateAttack.jpg" AndActionName:@"Do something"];
    [self configureTile:[colTwo objectAtIndex:1] WithStory:message
         AndImageString:@"PirateFriendlyDock.jpg" AndActionName:@"Do something"];
    [self configureTile:[colTwo objectAtIndex:2] WithStory:message
         AndImageString:@"PirateParrot.jpg" AndActionName:@"Do something"];
    
    
    NSArray *colThree = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
                         [[PATile alloc] init], [[PATile alloc] init], nil];
    
    [self configureTile:[colThree objectAtIndex:0] WithStory:message
         AndImageString:@"PirateWeapons.jpeg" AndActionName:@"Do something"];
    [self configureTile:[colThree objectAtIndex:1] WithStory:message
         AndImageString:@"PirateTreasure.jpeg" AndActionName:@"Do something"];
    [self configureTile:[colThree objectAtIndex:2] WithStory:message
         AndImageString:@"PirateBoss.jpeg" AndActionName:@"Do something"];
    
    
    NSArray *colFour = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
                        [[PATile alloc] init], [[PATile alloc] init], nil];
    
    [self configureTile:[colFour objectAtIndex:0] WithStory:message
         AndImageString:@"PirateOctopusAttack.jpg" AndActionName:@"Do something"];
    [self configureTile:[colFour objectAtIndex:1] WithStory:message
         AndImageString:@"PirateShipBattle.jpeg" AndActionName:@"Do something"];
    [self configureTile:[colFour objectAtIndex:2] WithStory:message
         AndImageString:@"PirateTreasure2.jpeg" AndActionName:@"Do something"];
    
    NSArray *allTiles = [[NSArray alloc] initWithObjects:colOne, colTwo, colThree, colFour, nil];
    
    return allTiles;
}

-(void) configureTile:(PATile *)tile WithStory:(NSString *)story
       AndImageString:(NSString *)imageString AndActionName:(NSString *)actionName {
    tile.story = story;
    
    if (imageString != nil) {
        tile.backgroundImage = [UIImage imageNamed:imageString];
    }
    
    tile.actionButtonName = actionName;
}

@end
