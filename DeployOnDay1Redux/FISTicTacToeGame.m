//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        
        [self resetBoard ];
        
    }
    NSLog(@"Reset");
    return self;
}

-(void)resetBoard
{
    self.board  = [@[
                     [ @[ @"", @"", @"" ] mutableCopy],
                     [ @[ @"", @"", @"" ] mutableCopy],
                     [ @[ @"", @"", @"" ] mutableCopy] ]
                   mutableCopy ];
    NSLog(@"%@", self.board);
    
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ( [self.board[row][column] isEqualToString:@"X"] ) {
        return @"X" ;
    } else if ( [self.board[row][column] isEqualToString:@"O" ]) {
        return @"O" ;
    } else {
        return @"" ;
    }
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ( [self.board[row][column] isEqualToString:@""] ) {
        return YES ;
    } else {
        return NO ;
    }
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ( [self canPlayAtColumn:column row:row ]) {
        self.board[row][column] = @"X" ;
        NSLog(@"Your move: %@", self.board[row][column]) ;
        // How is it moving to the next move? Keeps saying "Win" after one move."
        
    }
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ( [self canPlayAtColumn:column row:row ]) {
        self.board[row][column] = @"O" ;
        NSLog(@"Your move: %@", self.board[row][column]) ;
    }
}

-(NSString *)winningPlayer
{ // Not happening.
    NSLog(@"%@", self.board) ;
    if ( [self.board[0] isEqualToArray: @[@"X", @"X", @"X" ]] ||
        [self.board[1] isEqualToArray: @[@"X", @"X", @"X"] ]||
        [self.board[2] isEqualToArray: @[@"X", @"X", @"X"] ]||
        ([self.board[2][2] isEqualToString: @"X"] && [self.board[1][1] isEqualToString: @"X"] && [self.board[0][0] isEqualToString: @"X"] ) ||
        ([self.board[0][2] isEqualToString:@"X"] && [self.board[1][1] isEqualToString:@"X"] && [self.board[0][2] isEqualToString:@"X"] ) ||
        ([self.board[0][2] isEqualToString: @"X"] && [self.board[0][2] isEqualToString:@"X"] && [self.board[0][2]  isEqualToString:@"X"] ) ||
        ([self.board[1][2]  isEqualToString:@"X"] && [self.board[1][1]  isEqualToString:@"X"] && [self.board[0][1]  isEqualToString:@"X"] ) ||
        ([self.board[2][2] isEqualToString:@"X"] && [self.board[1][2]  isEqualToString:@"X" ] && [self.board[0][2]  isEqualToString:@"X" ] ) )
        
    {
        NSLog(@"X wins" );
        return @"X" ;
    } else if ( [self.board[0] isEqualToArray:@[@"O", @"O", @"O" ]] ||
               [self.board[1] isEqualToArray: @[@"O", @"O", @"O"]] ||
               [self.board[2] isEqualToArray:@[@"O", @"O", @"O"]] ||
               ([self.board[2][2] isEqualToString: @"O"] && [self.board[1][1] isEqualToString: @"O"] && [self.board[0][0] isEqualToString: @"O"] ) ||
               ([self.board[0][2] isEqualToString:@"O"] && [self.board[1][1] isEqualToString:@"O"] && [self.board[0][2] isEqualToString:@"O"] ) ||
               ([self.board[0][2] isEqualToString: @"O"] && [self.board[0][2] isEqualToString:@"O"] && [self.board[0][2]  isEqualToString:@"O"] ) ||
               ([self.board[1][2]  isEqualToString:@"O"] && [self.board[1][1]  isEqualToString:@"O"] && [self.board[0][1]  isEqualToString:@"O"] ) ||
               ([self.board[2][2] isEqualToString:@"O"] && [self.board[1][2]  isEqualToString:@"O" ] && [self.board[0][2]  isEqualToString:@"O" ] ))
    {
        NSLog(@"O wins" );
        return @"O" ;
    }
    return @"" ;
}

-(BOOL)isADraw
{
    if ( [self.board[0] containsObject:@""] || [ self.board[1] containsObject:@"" ] || [ self.board[2] containsObject:@"" ] ) {
        return NO ;
    } else {
        
        return YES;
    }
}

@end
