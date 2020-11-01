//
//  osx_main.mm
//  
//
//  Created by andy on 18/10/2020.
//
// The main entry point ot Handmade Hero

# include <stdio.h>
# include <AppKit/AppKit.h>

static float GlobalRenderingWidth = 1024;
static float GlobalRenderingHeight = 768;

int main(int argc, const char * argv[]) {

	 NSRect screenRect = [[NSScreen mainScreen] frame];


    NSRect initialFrame = NSMakeRect((screenRect.size.width - GlobalRenderingWidth) * 0.5,
                                     (screenRect.size.height - GlobalRenderingHeight) * 0.5,
                                     GlobalRenderingWidth,
                                     GlobalRenderingHeight);
    
    NSWindow *window = [[NSWindow alloc] initWithContentRect: initialFrame
					 styleMask: NSWindowStyleMaskTitled |
						    NSWindowStyleMaskClosable |
						    NSWindowStyleMaskMiniaturizable |
						    NSWindowStyleMaskResizable 
					 backing:NSBackingStoreBuffered
					 defer:NO];    

    [window setBackgroundColor: NSColor.redColor];
    [window setTitle: @"Handmade Hero"];
    [window makeKeyAndOrderFront: nil];
  

    while(true) {
        NSEvent* event;
        do {

            event = [NSApp nextEventMatchingMask: (NSEventMaskSwipe | NSEventMaskGesture)
                                       untilDate: nil
                                          inMode: NSDefaultRunLoopMode
                                         dequeue: YES];
            switch ([event type]) {
               default:
                  [NSApp sendEvent: event];
            }
        }   while (event != nil);
    }

    printf("Handmade Finished Running");

}




