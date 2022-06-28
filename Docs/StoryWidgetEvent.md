## StoryWidgetEvent Data

Here describes **StoryWidgetEvent** userInfo data field (`data<Dictionary<String, Any>?>`).

### w-link
Click on link/button in story's slide

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | button's text |
| widget_value          | String    | button's url |

### w-quiz-answer
Click on any point in "quiz" widget 

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | quiz question |
| widget_answer         | Int       | answer's index. For example A = 0, B = 1 etc. |
| widget_answer_label   | String    | answer's text |
| duration_ms           | Int       | how much time did it take to answer |


### w-quiz-grouped-answer
Click on any point in "quiz category grouped" widget

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | quiz question |
| widget_answer         | Int       | answer's index. For example A = 0, B = 1 etc. |
| widget_answer_label   | String    | answer's text |
| duration_ms           | Int       | how much time did it take to answer |

### w-data-input-focus
Click input field in "ask question" widget (show dialog)

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | question text |

### w-data-input-save
Send data in "ask question" widget (close dialog)

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | question text |
| widget_value          | String    | sent text from dialog |

### w-range-slider-answer
Send slider value in "feedback" widget. Can be called on click or slider changes (optionally)

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | question text |
| widget_answer         | Int       | sent value (from 0 to 100) |

### w-poll-answer
Click on any point in "poll" widget (yes/no)

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | poll's question text |
| widget_answer         | Int       | answer index (0 to left or 1 to right button) |
| widget_answer_label   | String    | answer text |
| duration_ms           | Int       | how much time did it take to answer |

### w-poll-clarification
Send data from dialog in "poll" widget after choosing answer (if set)

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | poll's question text |
| widget_answer         | Int       | answer index (0 to left or 1 to right button) |
| widget_answer_label   | String    | answer text |
| duration_ms           | Int       | how much time did it take to answer |
| widget_value          | String    | sent text from dialog |

### w-poll-layers-answer
Click on any point in "poll with layers" widget (yes/no)

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | poll's question text |
| widget_answer         | Int       | answer's index (0 to left or 1 to right button) |
| duration_ms           | Int       | how much time did it take to answer |

### w-vote-answer
Click on any point in "vote" widget

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | vote's question text |
| widget_answer         | Int       | answer index (0 to N-1 where N - num of answer points) |
| widget_value          | String    | answer text  |
| duration_ms           | Int       | how much time did it take to answer |

### w-rate-answer
Click on "rate us" widget

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | widget text |
| widget_answer         | Int       | answer index (0 to 5) |
| widget_value          | String    | user input text  |
| duration_ms           | Int       | how much time did it take to answer |

### w-test-answer
Click on any point in "test" widget

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | test's question text |
| widget_answer         | Int       | answer index (0 to N-1 where N - num of answer points) |
| widget_answer_label   | String    | answer text |
| widget_answer_score   | Int       | how much points user get for this answer |
| duration_ms           | Int       | how much time did it take to answer |

### w-copy
Click on "copy" widget

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | button's text |
| widget_value          | String    | copied text |

### w-share
Click on "share" widget

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_label          | String    | button's text |
| widget_value          | String    | shared text |
| widget_answer         | Int       | 0 - share successful, 1 - share canceled |
| widget_answer_label   | String    | sharing application package |

### w-goods-open
Opens goods list in SDK

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |

### w-goods-click
Click on any good in list

| Key                   | Type      | Description                                                   |
|-----------------------|-----------|---------------------------------------------------------------|
| story_id              | Int       | unique story id |
| feed_id               | Int?      | unique feed id where stories was opened. Null if it's single. |
| slide_index           | Int       | index of story's slide where callback was called |
| widget_id             | String    | unique widget id |
| widget_value          | String    | good's sku |