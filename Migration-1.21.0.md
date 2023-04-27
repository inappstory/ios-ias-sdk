# Migration to the new list view (SDK v1.21.0)

## InAppStory limitations

For the [Settings](https://github.com/inappstory/ios-sdk/tree/SwiftUI#Settings) object, field size limits have been added, if this limit is exceeded, information will be displayed in the IDE console and the SDK will stop working:

* `userID` - 255 bytes;
* `tags` - 4000 bytes;

## Default cells view

Since version 1.21.0 the default cell shape is a square and the dimensions are based on the size of the list itself and the `direction` parameter. To change the aspect ratio and dimensions, you need to use methods of  the `StoryListView`.  
Also since version 1.21.0 the thickness of the cell stroke has changed, now it is 1pt. More details about customization of cells in the list can be found [here](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/CustomCell.md)

## Direction

In version 1.21.0 the parameter responsible for the direction of list scrolling was added.

#### It was:

* simple list - only horizontal scrolling in one line;
* favourites list - only vertical scrolling in 3 columns;

#### Now:

Since version 1.21.0, you can specify an arbitrary scrolling direction and number of rows/columns for lists, for this purpose must specify in `StoryListView` parameter `direction` *<[ListDirection](https://github.com/inappstory/ios-sdk/tree/SwiftUI#ListDirection)>*. By default, the list has a value of `horizontal(rows: 1)`, and the list of favorites has `vertical(colums: 3)`.  
>**Note**  
>The default cell size is calculated from the size of the list and the number of rows/columns. If you change `direction` cells can become very small or large, take this into account.

## Editor (UGC) cell

In version 1.21.0 the default display of the UGC editor cell has been changed.

#### It was:

The cell background is blue with a white icon in the center

#### Now:

In version 1.21.0, the background of the cell has changed to black and the size of the icon has changed slightly.
To slightly change the appearance of the cell, you don't need to create a custom cell that implements the `EditorCellProtocol` protocol. Now it's enough to create an instance of `EditorCellSettings` and specify it in `InAppStory.shared.editorCellSettings`.

With `EditorCellSettings` you can change:

* `backgroundColor` - the color of the cell background;
* `iconColor` - the tint color of the icon in the cell;
* `iconImage` - set your own icon;

>####Note
>1. Cell settings are set for the whole project in one place and are used in all lists. If you need to set different UGC cells for different lists, you need to use a custom cell implementing `EditorCellProtocol`.
>2. The `iconColor` in `EditorCellSettings` overlaps the icon only if `iconImage.renderingMode == .alwaysTemplate`. Please keep an eye on this.

## NotificationCenter

1. Since version 1.21.0 in [NotificationCenter](https://github.com/inappstory/ios-sdk/tree/SwiftUI#NotificationCenter) the `title` field will come regardless of whether it is displayed in a cell or not (if `title` is set for stories in the console)
2. Since version 1.21.0, the `action` field has been added to the ShowStory notification, showing how a particular stories was shown. `action` - how the stories was shown (`open`, `auto`, `list`, `swipe`, `tap` or `custom`);