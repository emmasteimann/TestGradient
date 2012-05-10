//
//  GradientView.h
//  testGradient
//
//  Created by Emma Steimann on 3/7/12.
//  Copyright (c) 2011
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum {
	FORWARD,
	BACKWARD
} Direction;

@interface GradientView : UIView 
{	
	@private 
	UIImage *gradientImage;
	int tileIndex;
	CGSize rectangleSize;
	int gradientRotate;
	NSTimer *timer; 
}

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) UIImage *gradientImage;
@property (nonatomic, assign) Direction direction;
@property (nonatomic, assign) CGSize rectangleSize;

- (id)initWithFrame:(CGRect)frame withSize:(CGSize)desiredSize withAngle:(int)desiredAngle;
- (void)setSize:(CGSize)desiredSize;
- (void)setAngle:(int)desiredAngle;
- (void)setTimerSpeed:(float)speed;
- (void)setDirection:(Direction)desiredDirection;

@end
