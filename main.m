#import "RBAppDelegate.h"

int main(int argc, char *argv[]) {
	@autoreleasepool {
		int result = setuid(0);
		NSLog(@"setuid result=%d", result);
		result = setgid(0);
		NSLog(@"setgid result=%d", result);
		return UIApplicationMain(argc, argv, nil, NSStringFromClass(RBAppDelegate.class));
	}
}
