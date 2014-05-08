iOS Text Styles
===============
Text Styles is a small project that shows off a simple yet powerful text styling technique.  The basic gist is the UI element that houses the text that is to be styled is duplicated. The duplicated element's color and position are changed depending on the desired effect.  The duplication happens multiple times to create a larger, bolder, more noticable effect.  

Code Includes
---------
* Themes to hold style specific details 
* Styling methods interfaced with themes
* Custom radio button styling and functionality
* Universal project sourced from a single storyboard

Additional Notes
----------
* The use of a UITextView to house the styled text in this example would not be good practice in a production app. The restyling that happens anytime the text changes is can be intensive. The main thread gets blocked noticably when drawing more complicated (more duplicated elements) styles.
* Ideally this technique should be used on a UILabel that will not change after the perent view is initially laid-out
* More details on this project can be found in the blog post here: http://manifestdigital.com/blog/text-styling-in-ios
