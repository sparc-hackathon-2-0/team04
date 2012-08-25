//
//  DIYLessonViewController.h
//  Lendable
//
//  Created by Jonathan Mayhak on 8/25/12.
//
//

#import <Parse/Parse.h>

@interface DIYLessonViewController : UIViewController <UIWebViewDelegate>

- (id)initWithLesson:(PFObject*)lesson;
@property (retain, nonatomic) IBOutlet UIWebView *WebView;

@end
