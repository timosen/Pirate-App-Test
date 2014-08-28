//
//  TSCharacter.h
//  Pirate Game
//
//  Created by timo on 27.08.14.
//
//

#import <Foundation/Foundation.h>
#import "TSWeapon.h"
#import "TSArmor.h"

@interface TSCharacter : NSObject

@property (nonatomic) int damage;
@property (nonatomic) int health;
@property (strong, nonatomic) TSArmor *armor;
@property (strong, nonatomic) TSWeapon *weapon;

@end
