# Getting Started

## Anki
AnkiCode is a fork of Anki.
>[Anki Getting Started](https://docs.ankiweb.net/getting-started.html)

<br/>

## New card type - "Programming Challenge"
AnkiCode extends Anki by adding the new card type "Programming Challenge". Its fields are listed below:

- Title
- Description
- Function name
- Solution (markdown format)
- Test-Cases (read more about their format [here](http://www.google.com))

<br/>

Example:


| Field          | Value                                                      |
| -------------- | ---------------------------------------------------------- | 
| `Title`        | Sum of two integers.                                       |
| `Decsription`  | Given two integers calculate their sum.                    |
| `Function name`| sum                                                        |
| `Solution`     | \`\`\`js<br>function sum(a, b) { return a + b }<br>\`\`\`  |
| `Test-Cases`   | int;int;int<br>  1;  1;  2<br>  2;  2;  4<br>  3;  3;  6   |

<br/>

## "Programming Challenge" card
<br/>
![](images/programming_challenge.png)

User can select a Programming Language and Theme using `Language` and `Skin` selectboxes.

### "Programming Challenge" card hotkeys

| OS X   | Windows | Hotkey |
| --------- | ---------- | -------------------- | 
| `Cmd + R` | `Ctrl + R` | Execute code         |
| `Cmd + J` | `Ctrl + J` | Switch to Java       |
| `Alt + J` | `Alt + J`  | Switch to JavaScript |
| `Alt + P` | `Alt + P`  | Switch to Python     |
| `Alt + C` | `Alt + C`  | Switch to C++        |


