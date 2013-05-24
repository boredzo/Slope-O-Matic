#import "PRHAppDelegate.h"
#import "PRHSlopeCalculatorWindowController.h"

@implementation PRHAppDelegate
{
	PRHSlopeCalculatorWindowController *_windowController;
}

- (void) applicationWillFinishLaunching:(NSNotification *)notification {
	_windowController = [[PRHSlopeCalculatorWindowController alloc] init];
	[_windowController showWindow:nil];
}

- (void) applicationWillTerminate:(NSNotification *)notification {
	[_windowController close];
	_windowController = nil;
}

@end
