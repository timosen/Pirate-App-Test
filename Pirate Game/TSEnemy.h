//
//  TSEnemy.h
//  Pirate Game
//
//  Created by timo on 28.08.14.
//
//

#import <Foundation/Foundation.h>

@interface TSEnemy : NSObject

@property (nonatomic) int damage;
@property (nonatomic) int health;
@property (nonatomic) int skill;
@property (nonatomic, strong) NSString *name;

@end
