# Getting Started

## Anki
AnkiCode is a fork of Anki.
>[Anki Getting Started](https://docs.ankiweb.net/getting-started.html)

## New "Programming Challenge" card type
AnkiCode extends Anki by adding the new card type "Programming Challenge". Its fields are listed below:

- Title
- Description
- Function name
- Solution (markdown format)
- Test-Cases (read more about their format [here](http://www.google.com))

<br>

Example:


| Field            | Value                                                      |
| ---------------- | ---------------------------------------------------------- | 
| `Title`          | Sum of two integers.                                       |
| `Decsription`    | Given two integers calculate their sum.                    |
| `Function name`  | sum                                                        |
| `Solution`       | \`\`\`js<br>function sum(a, b) { return a + b }<br>\`\`\`  |
| `Test-Cases`     | int[a];int[b];int<br>1;1;2<br>2;2;4<br>3;3;6               |

