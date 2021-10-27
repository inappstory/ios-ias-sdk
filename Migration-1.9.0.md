# Migration to InAppStoryDelegate (SDK v1.9.0)

In *InAppStorySDK* v1.9.0, delegate protocols are merged into a common protocol *InAppStoryDelegate*. The old implementation of the protocols will be available until v1.11.0, after this update, you will need to switch to using the *InAppStoryDelegate* protocol.

### InAppStoryDelegate

The protocol combines the methods of all three old implementations. The *<[StoriesType](https://github.com/inappstory/ios-sdk#StoriesType)>* parameter has been added to distinguish the source of a method call.  
Some of the methods have become optional and do not need to be implemented.

* `storiesDidUpdated(isContent: Bool, from storyType: StoriesType)` - called after the contents are updated for sories type *<[StoriesType](https://github.com/inappstory/ios-sdk#StoriesType)>*;
* `storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType)` - called after a link is received from stories with the interaction type *<[ActionType](https://github.com/inappstory/ios-sdk#ActionType)>* and *<[StoriesType](https://github.com/inappstory/ios-sdk#StoriesType)>*;
* `storyReaderWillShow(with storyType: StoriesType)` - called before the reader will show *(optional)*;
* `storyReaderDidClose(with storyType: StoriesType)` - called after closing the story reader *(optional)*;
* `favoriteCellDidSelect()` - called when the favorite cell has been selected *(optional)*;

## Migration

To replace the old delegates methods, you need to do the following:

1. Add *InAppStoryDelegate* implementation;
2. Transfer implementation of old methods to new ones;
3. If you have used several implementations in the same class and they performed different actions, you must separate them using the `storyType` parameter.
4. Change method and parameter calls to set the delegate:
	* for *StoryView*, parametr `delegate` renamed to `storiesDelegate`;
	* for showng single story, method `showSingleStory(...)` renamed to `showSingle(...)`;
	* for showing onboarding, method `showOnboarding(...)` renamed to `showOnboardings(...)`;
5. If you got the data for the iOS widget from the *StoryViewDelegate* method `storyViewUpdated(...)`, you can get it from `InAppStory.shared.widgetStories` after calling `storiesDidUpdated(...)` with *storyType == .list* or via `InAppStory.shared.getWidgetStories(complete: (Array<WidgetStory>?) -> Void)`;
6. Remove implementation of old methods and calls;

## Pay Attention

In version 1.9.0, the ability to open a story by a link has been added. If a story is opened from the list and a new story is in the same list too, it (a new story) will be open in the same reader. Otherwise, a new reader with a single story will be opened. Also, when opening stories using a link from *SingleReader* or *Onboarding*, a new reader will be opened.

If you use the new *InAppStoryDelegate* protocol, the delegate methods with the appropriate *StoriesType* will be called.
If you are using old protocols, you need to make sure that the classes that implement *StoryViewDelegate* and *OnboardingDelegate* also implement the *SingleStoryDelegate* functionality. Otherwise, when opening a new *SingleReader*, you will not be able to call the corresponding methods.