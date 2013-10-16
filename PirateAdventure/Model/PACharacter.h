//
//  PACharacter.h
//  PirateAdventure
//
//  Created by Hector Rios on 10/16/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAArmor.h"
#import "PAWeapon.h"

@interface PACharacter : NSObject

@property (nonatomic, strong) PAWeapon *weapon;
@property (nonatomic, strong) PAArmor *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
