//
//  TSViewController.m
//  Pirate Game
//
//  Created by timo on 27.08.14.
//
//

#import "TSViewController.h"
#import "TSFactory.h"
#import "TSMapTile.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tileCoordinates = CGPointMake(0, 0);
    
    TSFactory *factory = [[TSFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory currentPlayer];
    [self updateCharacterPropertiesForArmor:nil withWeapons:nil withHealthEffect:0 withEnemy:nil];
    [self updateTile];
    
}
-(void)updateTile
{
    TSMapTile *tileModel = [[self.tiles objectAtIndex:self.tileCoordinates.x] objectAtIndex:self.tileCoordinates.y];
    self.background.image = tileModel.background;
    self.tileStory.text = tileModel.story;
    self.healthScore.text = [NSString stringWithFormat:@"%i",self.character.health];
    self.damageScore.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.currentArmor.text = self.character.armor.armorName;
    self.currentWeapon.text = self.character.weapon.weaponName;
    self.enemy = tileModel.tileEnemy;
    [self.actionButton setTitle:tileModel.actionText forState:UIControlStateNormal];
    
    int lastColumn = [self.tiles count]-1;
    int lastRow = [[self.tiles objectAtIndex:self.tileCoordinates.x] count]-1;
    if (self.tileCoordinates.x == 0) {
        self.leftButton.hidden = YES;
    }
    else {
        self.leftButton.hidden = NO;
    }
    if (self.tileCoordinates.x == lastColumn) {
        self.rightButton.hidden = YES;
    }
    else {
        self.rightButton.hidden = NO;
    }
    if (self.tileCoordinates.y == 0) {
        self.downButton.hidden = YES;
    }
    else {
        self.downButton.hidden = NO;
    }
    if (self.tileCoordinates.y == lastRow) {
        self.upButton.hidden = YES;
    }
    else {
        self.upButton.hidden = NO;
    }
}
-(void)updateCharacterPropertiesForArmor:(TSArmor *) armor withWeapons:(TSWeapon *) weapon withHealthEffect:(int) healthEffect withEnemy: (TSEnemy *) enemy
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.protection + armor.protection;
        self.character.armor = armor;
    }
    else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0) {
        self.character.health = self.character.health + healthEffect;
    }
    else if (enemy == nil){
        self.character.health = self.character.health + self.character.armor.protection;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
    if (enemy == nil) {
        [self updateTile];
    }

}

-(void)fightSystemWithEnemy: (TSEnemy *) enemy withEnemyHealth: (int) enemyHealth withEnemyDamage: (int) enemyDamage withEnemySkill: (int) enemySkill
{
    if (enemy != nil) {
        int fightRoundAccuracy = arc4random() % 100;
        if (fightRoundAccuracy < enemySkill) {
            self.character.health = self.character.health - enemyDamage;
        }
        else {
            self.enemy.health = enemyHealth - self.character.damage;
        }
        if (self.character.health <= 0) {
            UIAlertView *deadAlert = [[UIAlertView alloc] initWithTitle:@"Achtung" message:@"Oops, you're dead" delegate:nil cancelButtonTitle:@"Resurrect" otherButtonTitles: nil];
            [deadAlert show];
            self.character = nil;
            [self viewDidLoad];
        }
        else if (self.enemy.health <= 0) {
            UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:@"You win" message:@"ARRR, you killed that bastard" delegate:nil cancelButtonTitle:@"Awesome!" otherButtonTitles: nil];
            [winAlert show];
        }
        NSLog(@"Enemy is %@. Your accuracy in this round was %i. Enemy health now at %i", self.enemy.name, fightRoundAccuracy, self.enemy.health);
}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tileAction:(UIButton *)sender {
    TSMapTile *currentTile = [[self.tiles objectAtIndex:self.tileCoordinates.x] objectAtIndex:self.tileCoordinates.y];
    [self fightSystemWithEnemy:currentTile.tileEnemy withEnemyHealth:currentTile.tileEnemy.health withEnemyDamage:currentTile.tileEnemy.damage withEnemySkill:currentTile.tileEnemy.skill];
    [self updateCharacterPropertiesForArmor: currentTile.tileArmor  withWeapons:currentTile.tileWeapon withHealthEffect:currentTile.healthEffect withEnemy:currentTile.tileEnemy];
    [self updateTile];
}

- (IBAction)moveUp:(UIButton *)sender {
    self.tileCoordinates = CGPointMake(self.tileCoordinates.x, self.tileCoordinates.y+1);
    [self updateTile];
}

- (IBAction)moveRight:(UIButton *)sender {
    self.tileCoordinates = CGPointMake(self.tileCoordinates.x+1, self.tileCoordinates.y);
    [self updateTile];
}

- (IBAction)moveDown:(UIButton *)sender {
    self.tileCoordinates = CGPointMake(self.tileCoordinates.x, self.tileCoordinates.y-1);
    [self updateTile];
}

- (IBAction)moveLeft:(UIButton *)sender {
    self.tileCoordinates = CGPointMake(self.tileCoordinates.x-1, self.tileCoordinates.y);
    [self updateTile];
}

- (IBAction)resetGameButton:(UIButton *)sender {
    self.character = nil;
    [self viewDidLoad];
}
@end
