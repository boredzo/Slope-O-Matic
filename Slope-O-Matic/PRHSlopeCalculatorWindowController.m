#import "PRHSlopeCalculatorWindowController.h"

@interface PRHSlopeCalculatorWindowController ()

@property(nonatomic) CGFloat angleInDegreesForKnob;

- (CGFloat) slopeForAngleInDegrees:(CGFloat)angleInDegrees;

@end

@implementation PRHSlopeCalculatorWindowController

- (instancetype) initWithWindow:(NSWindow *)window {
	if ((self = [super initWithWindow:window])) {
	}
	return self;
}

- (instancetype) init {
	return [self initWithWindowNibName:NSStringFromClass([self class])];
}

- (void) windowDidLoad {
	[super windowDidLoad];

	// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

+ (NSSet *) keyPathsForValuesAffectingSlope {
	return [NSSet setWithArray:@[ @"angleInDegrees" ]];
}
- (CGFloat) slope {
	CGFloat angleInDegrees = self.angleInDegrees;
	return [self slopeForAngleInDegrees:angleInDegrees];
}

+ (NSSet *) keyPathsForValuesAffectingAngleInDegreesForKnob {
	return [NSSet setWithArray:@[ @"angleInDegrees" ]];
}
- (CGFloat) angleInDegreesForKnob {
	CGFloat angleInDegreesForKnob = 180.0 - (self.angleInDegrees + 90.0);
	if (angleInDegreesForKnob < 0.0)
		angleInDegreesForKnob += 360.0;
	return angleInDegreesForKnob;
}
- (void) setAngleInDegreesForKnob:(CGFloat)angleInDegreesForKnob {
	CGFloat degrees = angleInDegreesForKnob - 90.0;
	if (degrees < 0.0)
		degrees += 360.0;
	self.angleInDegrees = (360.0 - degrees);
}

- (CGFloat) slopeForAngleInDegrees:(CGFloat)angleInDegrees {
	CGFloat angleAsFraction = angleInDegrees / 360.0;
	CGFloat angleInRadians = angleAsFraction * (M_PI * 2.0);

	//Ensure that we return infinity (a useful value in this context), not some random nonsense, for vertical slopes.
	if (fabs(cos(angleInRadians)) <= DBL_EPSILON)
		return INFINITY;

	return tan(angleInRadians);
}

@end
