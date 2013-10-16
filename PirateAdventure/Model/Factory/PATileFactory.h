//
//  PATileFactory.h
//  PirateAdventure
//
//  Created by Hector Rios on 10/13/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACharacter.h"
#import "PABoss.h"

@interface PATileFactory : NSObject

-(NSArray *) tiles;

-(PACharacter *)character;

-(PABoss *) boss;

@end
