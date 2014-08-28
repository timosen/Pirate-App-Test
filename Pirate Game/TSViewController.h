//
//  TSViewController.h
//  Pirate Game
//
//  Created by timo on 27.08.14.
//
//

#import <UIKit/UIKit.h>
#import "TSCharacter.h"
#import "TSEnemy.h"

@interface TSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UILabel *healthScore;
@property (strong, nonatomic) IBOutlet UILabel *damageScore;
@property (strong, nonatomic) IBOutlet UILabel *currentWeapon;
@property (strong, nonatomic) IBOutlet UILabel *currentArmor;
@property (strong, nonatomic) IBOutlet UILabel *tileStory;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *upButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *downButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (nonatomic) CGPoint tileCoordinates;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) TSCharacter *character;
@property (strong, nonatomic) TSEnemy *enemy;


- (IBAction)tileAction:(UIButton *)sender;
- (IBAction)moveUp:(UIButton *)sender;
- (IBAction)moveRight:(UIButton *)sender;
- (IBAction)moveDown:(UIButton *)sender;
- (IBAction)moveLeft:(UIButton *)sender;
- (IBAction)resetGameButton:(UIButton *)sender;



@end
