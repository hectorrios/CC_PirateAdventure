//
//  PATile.h
//  PirateAdventure
//
//  Created by Hector Rios on 10/13/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmor.h"

@interface PATile : NSObject

@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) NSString *actionButtonName;
@property (nonatomic, strong) PAWeapon *weapon;
@property (nonatomic, strong) PAArmor *armor;
@property (nonatomic) int healthEffect;

@end
