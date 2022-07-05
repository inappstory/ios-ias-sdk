# Migration to PanelSettings (SDK v1.16.0)

In SDK version 1.16.0, properies of InAppStory `likePanel`, `favoritePanel` and `sharePanel` did union in one property `panelSettings<PanelSettings>`, that enabled displaying the bottom bar (*should be enabled in the console*)

#### New
* `panelSettings` - displaying the bottom bar (should be enabled in the console) *\<PanelSettings>*; (*[Details](Samples/PanelSettings.md)*)

#### Removed
* `likePanel` - displaying the bottom bar with likes (should be enabled in the console) *\<Bool>*; 
* `favoritePanel` - displaying the bottom bar with favorites (should be enabled in the console) *\<Bool>*; 
* `sharePanel` - displaying the bottom panel with sharing (should be enabled in the console) *\<Bool>*; 

## NotificationCenter

Add new NotificationCenter event `StoryWidgetEvent`

`StoryWidgetEvent` - action in widget with parameters:

* `index` - the index of the slide where the widget is located,
* `widgetName` - name of widget,
* `data<Dictionary<String, Any>?>` - activated widget data;

Detatil widget data filds in [Docs/StoryWidgetEvent.md](https://github.com/inappstory/ios-sdk/blob/main/Docs/StoryWidgetEvent.md)