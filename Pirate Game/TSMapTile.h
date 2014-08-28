//
//  TSMapTile.h
//  Pirate Game
//
//  Created by timo on 27.08.14.
//
//

#import <Foundation/Foundation.h>
#import "TSArmor.h"
#import "TSWeapon.h"
#import "TSEnemy.h"

@interface TSMapTile : NSObject

@property (strong, nonatomic) UIImage *background;
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *actionText;
@property (nonatomic, strong) TSArmor *tileArmor;
@property (nonatomic, strong) TSWeapon *tileWeapon;
@property (nonatomic) int healthEffect;
@property (nonatomic, strong) TSEnemy *tileEnemy;

@end
