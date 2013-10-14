//
//  PAViewController.m
//  PirateAdventure
//
//  Created by Hector Rios on 10/13/13.
//  Copyright (c) 2013 Hector Rios. All rights reserved.
//

#import "PAViewController.h"

@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set the background image
    [self.gameBackGroundImageView setImage:[UIImage imageNamed:@"PirateStart.jpg"]];
    self.healthLabel.text = @"The Health Label";
    self.damageLabel.text = @"The Damage Label";
    self.weaponLabel.text = @"The Weapon Label";
    self.armorLabel.text = @"The Armor Label";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
