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

    //Configure Column One Tiles ([0,0] [0,1] and [0,2]
    NSArray *colOne = @[[[PATile alloc] init], [[PATile alloc] init], [[PATile alloc] init]];
    NSArray *colTwo = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
                       [[PATile alloc] init], [[PATile alloc] init], nil];
    NSArray *colThree = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
                         [[PATile alloc] init], [[PATile alloc] init], nil];
    NSArray *colFour = [[NSArray alloc] initWithObjects:[[PATile alloc] init],
                        [[PATile alloc] init], [[PATile alloc] init], nil];
    
    PAWeapon *greySkullSword = [[PAWeapon alloc] init];
    greySkullSword.name = @"He-Man Sword";
    greySkullSword.damage = 30;
    
    [self configureTile:[colOne objectAtIndex:0]
              WithStory:@"Capn we need a brave and stupid soul like yourself to hunt down treasure, sail the high seas and maybe meet a damsel or two in distress in need of saving. Want a sword?"
         AndImageString:@"PirateStart.jpg" AndActionName:@"Take a Sword"
              AndWeapon:greySkullSword AndArmor:nil OrHealthEffect:0];
    
    
    PAArmor *suckerProofArmor = [[PAArmor alloc] init];
    suckerProofArmor.name = @"Octopus Sucker Armor";
    suckerProofArmor.health = 40;
    
    [self configureTile:[colOne objectAtIndex:1]
              WithStory:@"That stupid parrot! Polly said sail towards the horizon and you listened to him. Look at size of this sucker. Speaking of suckers grab the our new fangled sucker-proof armor."
         AndImageString:@"PirateOctopusAttack.jpg" AndActionName:@"Grab sucker armor"
              AndWeapon:nil AndArmor:suckerProofArmor OrHealthEffect:0];
    
    
    PAArmor *noFear = [[PAArmor alloc] init];
    noFear.name = @"Jedi Courage";
    noFear.health = 60;
    
    [self configureTile:[colOne objectAtIndex:2]
              WithStory:@"What a bunch of ingrates! After all you've been through, it's the plank! Are you thinking what I'm thinking? Time for some Skywalker moves to show this crew who's boss!"
         AndImageString:@"PiratePlank.jpg" AndActionName:@"Be a badass Jedi Knight"
              AndWeapon:nil AndArmor:noFear OrHealthEffect:0];
    
    
   

    /* 
     Configure PirateAttack Tile
     */
    PAWeapon *uzi = [[PAWeapon alloc] init];
    uzi.name = @"Uzi";
    uzi.damage = 70;
    
    [self configureTile:[colTwo objectAtIndex:0]
              WithStory:@"Hope you still have that sword Cap'n because you're gonna need it to take care of all these lily-livered wanna be pirates. You could try and take out these marauders with just your sword but why break a sweat when you can mow them down with this semi-automatic Uzi"
         AndImageString:@"PirateAttack.jpg"
          AndActionName:@"Take the Uzi?" AndWeapon:uzi AndArmor:nil OrHealthEffect:0];

    /*
     Configure Freindly Dock Tile
     */
    [self configureTile:[colTwo objectAtIndex:1]
              WithStory:@"Boy, you've lived through some crazy shit Cap'n. The crew thinks you need a few pints and maybe a stretch of those land legs."
         AndImageString:@"PirateFriendlyDock.jpg" AndActionName:@"Grab a few pints?"
              AndWeapon:nil AndArmor:nil OrHealthEffect:-5];
    
    
    /*
     Configure Blacksmith Tile.
     */
    PAArmor *steelLiver = [[PAArmor alloc] init];
    steelLiver.name = @"Steel Liver";
    steelLiver.health = 50;
    
    [self configureTile:[colTwo objectAtIndex:2]
              WithStory:@"Well Well, lookie here. While trying to find that Brothel you heard about in the pub you've stumbled across a blacksmith. This blacksmith specializes in steel livers which you're going to need after all those pints."
         AndImageString:@"PirateBlacksmith.jpeg" AndActionName:@"Add Steel Liver"
              AndWeapon:nil AndArmor:steelLiver OrHealthEffect:0];
     
    /*
     Configure the Pirate Weapons Tile
     */
    
    PAWeapon *pistols = [[PAWeapon alloc] init];
    pistols.name = @"Classic Pistols";
    pistols.damage = 80;
    
    [self configureTile:[colThree objectAtIndex:0]
              WithStory:@"Whoa those are some pretty pistols. You'd be a fool not to take these! A fool I tell you!"
         AndImageString:@"PirateWeapons.jpeg" AndActionName:@"Take the pistols"
              AndWeapon:pistols AndArmor:nil OrHealthEffect:0];
    
    /*
     Configure the Pirate Treasure tile
     */
    
    [self configureTile:[colThree objectAtIndex:1]
              WithStory:@"Jackpot! After weeks at sea we finally hit the mother-load. We're thinking Cap'n could get himself a new hat with some of that treasure money."
         AndImageString:@"PirateTreasure.jpeg" AndActionName:@"Buy a new hat."
              AndWeapon:nil AndArmor:nil OrHealthEffect:3];
    
    /*
     Configure the Pirate Boss Tile
     */
    
    [self configureTile:[colThree objectAtIndex:2]
              WithStory:@"You've finally tracked him down. The Pirate Boss! He's doesn't look so tough. It's time to go mano a mano with this turkey!"
         AndImageString:@"PirateBoss.jpeg" AndActionName:@"Fight"
              AndWeapon:nil AndArmor:nil OrHealthEffect:0];
    
    
    /*
     Configure the Pirate Parrot tile
     */
    
    [self configureTile:[colFour objectAtIndex:0]
              WithStory:@"Polly has been a huge pain in your ass. He's been nothing but bad luck for you and the crew. Plus, he's looking pretty tasty!"
         AndImageString:@"PirateParrot.jpg" AndActionName:@"Cook his goose and be done with him"
              AndWeapon:nil AndArmor:nil OrHealthEffect:2];

    /*
     Configure the PirateShipBattle tile
     */
    PAWeapon *rayGuns = [[PAWeapon alloc] init];
    rayGuns.name = @"Laser Cannon";
    rayGuns.damage = 200;
    
    [self configureTile:[colFour objectAtIndex:1]
              WithStory:@"Baton down hatches and line up the canons. It's GO time! You have a 50/50 shot of making it out alive. Or ... you could take these spiffy laser cannons and increase your chances of making it out alive to 100%. Please don't tell me that your seriously thinking it over!"
         AndImageString:@"PirateShipBattle.jpeg" AndActionName:@"Fire canons"
              AndWeapon:rayGuns AndArmor:nil OrHealthEffect:0];
    
    /*
     Configure the Pirate Treasure 2 Tile
     */
    [self configureTile:[colFour objectAtIndex:2]
              WithStory:@"Cap'n loves treasure. Time to mobilize the crew and bring that haul on board. Time to pay it forward and share the loot with the crew."
         AndImageString:@"PirateTreasurer2.jpeg" AndActionName:@"Share the treasure."
              AndWeapon:nil AndArmor:nil OrHealthEffect:30];
    
    NSArray *allTiles = [[NSArray alloc] initWithObjects:colOne, colTwo, colThree, colFour, nil];
    
    return allTiles;
}

-(PACharacter *)character {
    PACharacter *newCharacter = [[PACharacter alloc] init];
    
    newCharacter.weapon = [[PAWeapon alloc] init];
    newCharacter.weapon.name = @"Pythons";
    newCharacter.weapon.damage = 20;
    
    newCharacter.damage = newCharacter.weapon.damage;
    newCharacter.health = 100;
    
    return newCharacter;
}

-(PABoss *)boss {
    PABoss *newBoss = [[PABoss alloc] init];
    newBoss.health = 230;
    newBoss.damage = 55;
    
    return newBoss;
}

#pragma mark -- Private methods

-(void) configureTile:(PATile *)tile WithStory:(NSString *)story
       AndImageString:(NSString *)imageString AndActionName:(NSString *)actionName
            AndWeapon:(PAWeapon *)weapon AndArmor:(PAArmor *)armor OrHealthEffect:(int)healthEffect {
    
    tile.story = story;
    
    if (imageString != nil) {
        tile.backgroundImage = [UIImage imageNamed:imageString];
    }
    
    tile.actionButtonName = actionName;
    
    if (weapon != nil) {
        tile.weapon = weapon;
    } else if (armor != nil) {
        tile.armor = armor;
    }
    
    if (healthEffect != 0) {
        tile.healthEffect = healthEffect;
    }
    
}

@end
