//
//  TSFactory.h
//  Pirate Game
//
//  Created by timo on 27.08.14.
//
//

#import <Foundation/Foundation.h>
#import "TSCharacter.h"
#import "TSEnemy.h"

@interface TSFactory : NSObject

-(NSArray *)tiles;
-(TSCharacter *)currentPlayer;
-(TSEnemy *)pirateBoss;

@end
