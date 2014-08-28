//
//  TSFactory.m
//  Pirate Game
//
//  Created by timo on 27.08.14.
//
//

#import "TSFactory.h"
#import "TSMapTile.h"

@implementation TSFactory


-(NSArray *)tiles
{
    TSMapTile *tile1 = [[TSMapTile alloc] init];
    tile1.background = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.actionText = @"Take the sword";
    TSWeapon *bluntedSword = [[TSWeapon alloc] init];
    bluntedSword.weaponName = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.tileWeapon = bluntedSword;
    
    TSMapTile *tile2 = [[TSMapTile alloc] init];
    tile2.background = [UIImage imageNamed:@"PirateBlacksmith.jpg"];
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.actionText = @"Take steel armor";
    TSArmor *steelArmor = [[TSArmor alloc] init];
    steelArmor.armorName = @"Steel Armor";
    steelArmor.protection = 10;
    tile2.tileArmor = steelArmor;
    
    TSMapTile *tile3 = [[TSMapTile alloc] init];
    tile3.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.actionText = @"Stop at the Dock";
    tile3.healthEffect = 17;
    
    NSArray *column1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    TSMapTile *tile4 = [[TSMapTile alloc] init];
    tile4.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.actionText = @"Adopt Parrot";
    TSArmor *parrotArmor = [[TSArmor alloc] init];
    parrotArmor.protection = 20;
    parrotArmor.armorName = @"Parrot Armor";
    tile4.tileArmor = parrotArmor;
    
    TSMapTile *tile5 = [[TSMapTile alloc] init];
    tile5.background = [UIImage imageNamed:@"PirateWeapons.jpg"];
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.actionText = @"Take pistol";
    TSWeapon *pistolWeapon = [[TSWeapon alloc] init];
    pistolWeapon.weaponName = @"Pistol";
    pistolWeapon.damage = 30;
    tile5.tileWeapon = pistolWeapon;
    
    TSMapTile *tile6 = [[TSMapTile alloc] init];
    tile6.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.actionText = @"Show no fear!";
    tile6.healthEffect = -22;
    
    NSArray *column2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    TSMapTile *tile7 = [[TSMapTile alloc] init];
    tile7.background = [UIImage imageNamed:@"PirateShipBattle.jpg"];
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.actionText = @"Fight those scum!";
    tile7.healthEffect = -15;
    
    TSMapTile *tile8 = [[TSMapTile alloc] init];
    tile8.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.actionText = @"Abandon Ship";
    tile8.healthEffect = -46;
    
    TSMapTile *tile9 = [[TSMapTile alloc] init];
    tile9.background = [UIImage imageNamed:@"PirateTreasure.jpg"];
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.actionText = @"Take Treasurer";
    tile9.healthEffect = 20;
    
    NSArray *column3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    TSMapTile *tile10 = [[TSMapTile alloc] init];
    tile10.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.actionText = @"Repel the invaders";
    TSEnemy *shipInvaders = [[TSEnemy alloc] init];
    shipInvaders.health = 40;
    shipInvaders.damage = 10;
    shipInvaders.skill = 20;
    shipInvaders.name = @"Lame Invaders";
    tile10.tileEnemy = shipInvaders;
    
    TSMapTile *tile11 = [[TSMapTile alloc] init];
    tile11.background = [UIImage imageNamed:@"PirateTreasure2.jpg"];
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.actionText = @"Swim deeper";
    tile11.healthEffect = -7;
    
    TSMapTile *tile12 = [[TSMapTile alloc] init];
    tile12.background = [UIImage imageNamed:@"PirateBoss.jpg"];
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.actionText = @"Fight!";
    TSEnemy *pirateBoss = [[TSEnemy alloc] init];
    pirateBoss.health = 80;
    pirateBoss.damage = 30;
    pirateBoss.skill = 60;
    pirateBoss.name = @"Mean Pirate Boss";
    tile12.tileEnemy = pirateBoss;
    
    NSArray *column4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
    
    return tiles;
}

-(TSCharacter *)currentPlayer
{
    TSCharacter *guybrush = [[TSCharacter alloc] init];
    guybrush.health = 100;
    TSArmor *puffyShirt = [[TSArmor alloc] init];
    puffyShirt.armorName = @"Puffy Shirt";
    puffyShirt.protection = 5;
    guybrush.armor = puffyShirt;
    TSWeapon *fists = [[TSWeapon alloc] init];
    fists.weaponName = @"Fighting Fists";
    fists.damage = 10;
    guybrush.weapon = fists;
    
    return guybrush;
}

@end
