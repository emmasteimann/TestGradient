//
//  GradientView.m
//  testGradient
//
//  Created by Emma Steimann on 3/7/12.
//  Copyright (c) 2011 Boston Scientific.
//

#import "GradientView.h"

#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation GradientView

@synthesize gradientImage, rectangleSize, timer, direction;

- (id)initWithFrame:(CGRect)frame withSize:(CGSize)desiredSize withAngle:(int)desiredAngle{
	if (self = [super initWithFrame:frame]) {
		tileIndex = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView commitAnimations];
        
		rectangleSize = desiredSize;
		
		gradientRotate = desiredAngle;
		
        gradientImage = [UIImage imageNamed:@"gradient.png"];
		
		direction = FORWARD;
        		
        timer = [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
	}
	return self;
}
- (void)setSize:(CGSize)desiredSize{
	rectangleSize = desiredSize;
	[self setNeedsDisplay];
}
- (void)setAngle:(int)desiredAngle{
	gradientRotate = desiredAngle;
	[self setNeedsDisplay];
}
- (void)setTimerSpeed:(float)speed{
	if (timer != nil) {
        [timer invalidate];
        timer = nil;
		
		timer = [NSTimer scheduledTimerWithTimeInterval:(speed) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
		[self setNeedsDisplay];
	}
}
- (void)setDirection:(Direction)desiredDirection{
	direction = desiredDirection;
}
- (void)onTimer
{
	
	switch (direction) {
		case FORWARD:
			tileIndex -= 3;
			break;
		case BACKWARD:
			tileIndex += 3;
			break;
		default:
			tileIndex -= 3;
			break;
	}
	
	
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
	
	CGImageRef image = CGImageRetain(gradientImage.CGImage);
	
	CGRect imageRect;
	imageRect.origin = CGPointMake(tileIndex, tileIndex);
	imageRect.size = rectangleSize;
	
	
	
	CGContextRef uiContext = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM( uiContext, 0.5f * rect.size.width, 0.5f * rect.size.height ) ;
	CGContextRotateCTM( uiContext, degreesToRadians(gradientRotate)) ;
	
	CGContextDrawTiledImage(uiContext, imageRect, image);
	
}


@end
